import 'package:bcrypt/bcrypt.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';

import '../domain/household.dart';
import '../providers/user_storage.dart';

class RealService {
  final UserStorage userStorage;
  final client = Supabase.instance.client;

  RealService({required this.userStorage});

  bool isSignUpValid(String email, String name, String password) =>
      email.isNotEmpty && name.isNotEmpty && password.isNotEmpty;

  bool isLogInValid(String email, String password) =>
      email.isNotEmpty && password.isNotEmpty;

  Future<bool> signUp(String email, String name, String password) async {
    if (!isSignUpValid(email, name, password))
      return false; //invalid parameters

    if (await doesUserExist(email, name, password) == false) {
      final response = await client.from('users').insert(
        {
          'email': email,
          'name': name,
          'password': hashPassword(password),
        },
      ).select('id');

      print(response);

      final createdId = response[0]['id'];
      userStorage.setUser(createdId.toString(), name, email);

      return true;
    }
    print("user already exists");
    // TODO add errors
    return false;
  }

  Future<bool> doesUserExist(String email, String name, String password) async {
    if (!isSignUpValid(email, name, password))
      return false; //invalid parameters

    dynamic response =
        await client.from('users').select('email').eq('email', email);
    if (response.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  String hashPassword(String password) {
    String salt = BCrypt.gensalt();

    String hashedPassword = BCrypt.hashpw(password, salt);

    return hashedPassword;
  }

  //TODO returning boolean cause im lazy and dont wanna create a better solution
  Future<bool> logIn(String email, String password) async {
    if (!isLogInValid(email, password)) return false; //invalid parameters

    dynamic response = await client.from('users').select().eq('email', email);
    userStorage.setUser(response[0]['id'].toString(), response[0]['name'],
        response[0]['email']);

    if (response.isNotEmpty) {
      String storedPassword = response[0]['password'] as String;
      if (BCrypt.checkpw(password, storedPassword)) {
        print('Authentication successful');
        return true;
      } else {
        // Passwords do not match
        print('Authentication failed: Incorrect password');
        return false;
      }
    } else {
      // No user found with the specified email
      print('Authentication failed: User not found');
      return false;
    }
  }

  Future<void> insertProduct(
    int listId,
    String name,
    List<String> categories,
    int priority,
  ) async {
    await client.from('product').insert({
      "list_id": listId,
      "name": name,
      "bought": false,
      "categories": categories,
      "priority": priority,
    });
  }

  Future<List<dynamic>> getListsForUser() async {
    final user = await userStorage.getUser();
    if (user == null) {
      return []; // TODO: Make him return to the main page
    }
    final userId = user.id;

    final response =
        await client.from('list_user').select('list_id').eq('user_id', userId);
    if (response.isEmpty) return [];

    final listsResponse = await client.from('list').select().in_(
        'id',
        response
            .map((e) => e['list_id'])
            .toList()); // Use the 'in' filter to match 'id' with the list of 'list_id' values;
    if (listsResponse.isEmpty) return [];
    return listsResponse;
  }

  Future<String> getListName(int listId) async {
    final name =  await client.from('list').select('name').eq('id', listId).single();
    print(name['name']);
    return name['name'];
  }

  Future<bool> joinList(String code) async {
    final user = await userStorage.getUser();
    if (user == null) {
      return false; // TODO: Make him return to the main page
    }

    final response =
        await client.from('list').select('id').eq('code', code).single();

    final Map<String, dynamic> data = response as Map<String, dynamic>;

    if (data.isEmpty) {
      // no list found for that code
      return false;
    }

    await client.from('list_user').insert({
      "list_id": data['id'],
      "user_id": user.id,
    });
    return true;
  }

  Future<bool> leaveFromList(int id) async {
    final user = await userStorage.getUser();
    if (user == null) {
      return false;
    }

    final response = await client
        .from('list_user')
        .delete()
        .eq('list_id', id)
        .eq('user_id', user.id);

    return true;
  }

  Future<void> createList(String name) async {
    final user = await userStorage.getUser();
    if (user == null) {
      return;
    }

    const uuid = Uuid();
    String listCode = uuid.v4();

    final newListId = await client
        .from('list')
        .insert({"name": name, "picture": null, "code": listCode})
        .select('id')
        .single();

    await client.from('list_user').insert({
      "list_id": newListId['id'],
      "user_id": user.id,
    });
    return;
  }

  Future<void> updateList(int id, String name) async {
    final response =
        await client.from("list").update({"name": name}).eq("id", id);
    return;
  }

  Future<ShoppingList> getShoppingListInfo(int id) async {
    final response = await client.from("list").select().eq("id", id).single()
        as Map<String, dynamic>;
    debugPrint(response.toString());
    return ShoppingList(
        id: response["id"], name: response["name"], url: response["code"]);
  }

  Future<List<dynamic>> getShoppingList(int id, List<String> categories) async {
    if (categories.isEmpty) {
      return await client
          .from("product")
          .select()
          .eq("list_id", id)
          .eq("bought", false)
          .order("priority", ascending: false);
    }
    return await client
        .from("product")
        .select()
        .eq("list_id", id)
        .eq("bought", false)
        .containedBy("categories", categories)
        .order("priority", ascending: false);
  }

  Future<void> deleteProduct(int listId, int productId) async {
    await client
        .from("product")
        .delete()
        .eq("id", productId)
        .eq("list_id", listId);
  }

  Future<void> updateProduct(int listId, int productId, bool bought) async {
    await client
        .from("product")
        .update({"bought": bought})
        .eq("id", productId)
        .eq("list_id", listId);
  }

  Future<List<dynamic>> getBoughtList(int id) async {
    return await client
        .from("product")
        .select()
        .eq("list_id", id)
        .eq("bought", true)
        .order("date", ascending: true)
        .limit(10);
  }
}
