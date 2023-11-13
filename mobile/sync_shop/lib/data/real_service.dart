import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:sync_shop/config.dart';

class RealService {
  ///´Initialize service environment
  void load() async {
    await Supabase.initialize(
      url: supabaseUrl,
      anonKey: supabaseKey,
    );
  }
}
