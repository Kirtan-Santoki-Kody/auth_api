import 'package:auth_api/ui/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
      home: RegisterScreen(),
    );
  }
}
