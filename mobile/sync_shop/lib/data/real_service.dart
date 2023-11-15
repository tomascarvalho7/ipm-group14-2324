import 'package:bcrypt/bcrypt.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:sync_shop/config.dart';

class RealService {
  // Initialize service environment
  Future<void> load() async {
    await Supabase.initialize(
      url: supabaseUrl,
      anonKey: supabaseKey,
    );
  }

  Future<void> signUp(String email, String name, String password) async =>
      await Supabase.instance.client.from('users').insert(
        {
          'email': email,
          'name': name,
          'password': hashPassword(password),
        },
      );


  String hashPassword(String password) {
    String salt = BCrypt.gensalt();

    String hashedPassword = BCrypt.hashpw(password, salt);

    return hashedPassword;
  }

  //TODO returning boolean cause im lazy and dont wanna create a better solution
  Future<bool> logIn(String email, String password) async {
    dynamic response = await Supabase.instance.client.from('users').select('password').eq('email', email);
    print(response);

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
}
