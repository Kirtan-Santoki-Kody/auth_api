import 'package:auth_api/framework/repository/register/model/token_model.dart';
import 'package:hive_flutter/adapters.dart';

class HiveInitialise {
  static Future<void> initHive() async {
    await Hive.initFlutter();
  }

  static void registerAdaptors() {
    Hive.registerAdapter(TokensModelAdapter());
  }

  static Future<void> hiveOpenbox() async {
    await Hive.openBox<TokensModel>('auth_tokens');
  }
}
