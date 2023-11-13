
import 'package:supabase_flutter/supabase_flutter.dart';

class RealService {

  ///´Initialize service environment
  void load() async {
    await Supabase.initialize(
      url: supabaseUrl,
      anonKey: supabaseKey,
    );
  }

  



}