import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:sync_shop/config.dart';

class RealService {
  // Initialize service environment
  void load() async {
    await Supabase.initialize(
      url: supabaseUrl,
      anonKey: supabaseKey,
    );
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
