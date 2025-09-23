import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginPassword = StateProvider<bool>((_)=>false);
final registerPassword = StateProvider<bool>((_)=>false);
final registerConfirmPassword = StateProvider<bool>((_)=>false);