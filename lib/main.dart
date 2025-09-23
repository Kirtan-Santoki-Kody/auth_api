import 'package:auth_api/ui/screens/login_screen.dart';
import 'package:auth_api/ui/screens/profile_screen.dart';
import 'package:auth_api/ui/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

import 'framework/repository/register/model/token_model.dart';
import 'framework/utils/hive/hive_initialise.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveInitialise.initHive();
  HiveInitialise.registerAdaptors();
  await HiveInitialise.hiveOpenbox();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: (Hive.box<TokensModel>('auth_tokens').isEmpty)?LoginScreen():ProfileScreen(),
    );
  }
}
