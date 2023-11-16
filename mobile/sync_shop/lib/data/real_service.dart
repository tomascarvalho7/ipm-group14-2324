import 'package:bcrypt/bcrypt.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../domain/household.dart';
import '../providers/user_storage.dart';

class RealService {
  final UserStorage userStorage;

  RealService({required this.userStorage});

  bool isSignUpValid(String email, String name, String password) =>
    email.isNotEmpty && name.isNotEmpty && password.isNotEmpty;

  bool isLogInValid(String email, String password) =>
      email.isNotEmpty && password.isNotEmpty;

  Future<bool> signUp(String email, String name, String password) async {
    if(!isSignUpValid(email, name, password)) return false; //invalid parameters

    if(await doesUserExist(email, name, password) == false) {
      final response = await Supabase.instance.client.from('users').insert(
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
    if(!isSignUpValid(email, name, password)) return false; //invalid parameters

    dynamic response = await Supabase.instance.client.from('users').select('email').eq('email', email);
    if(response.isNotEmpty) {
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
    if(!isLogInValid(email, password)) return false; //invalid parameters

    dynamic response = await Supabase.instance.client.from('users').select('password').eq('email', email);

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
    final SupabaseClient client = Supabase.instance.client;

    await client.from('product').insert({
      "list_id": 1,
      "name": name,
      "bought": false,
      "categories": categories,
      "priority": priority,
    });
  }

  Future<void> getListsForUser(String userId) async {
    final client = Supabase.instance.client;

    final response = await client
        .from('list_user')
        .select()
        .eq('user_id', userId);

    if (response.error != null) {
      print('Error fetching lists: ${response.error?.message}');
      return;
    }

    final List<Map<String, dynamic>> lists = response.data as List<Map<String, dynamic>>;

    if (lists.isNotEmpty) {
      print('Lists for user $userId: $lists');
    } else {
      print('No lists found for user $userId');
    }
  }

  Future<Household?> getHousehold(String id) async {
    final client = Supabase.instance.client;

    final response = await client
        .from("Household")
        .select()
        .eq("id", id);

    if (response.error != null) return null;

    return response.data as Household;
  }

  Future<void> updateHousehold(String id, String name) async {
    final client = Supabase.instance.client;

    final response = await client
        .from("Household")
        .update({"name": name})
        .match({"id": id});

    return;
  }
}
