import 'package:auth_api/framework/providers/hide_show_password_provider.dart';
import 'package:auth_api/framework/providers/login_provider.dart';
import 'package:auth_api/ui/screens/register_screen.dart';
import 'package:auth_api/ui/utils/common_widgets/common_button.dart';
import 'package:auth_api/ui/utils/common_widgets/common_text_filed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../utils/themes/app_colors.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();
    var loginRead = ref.read(loginProvider.notifier);
    var loginWatch = ref.watch(loginProvider);
    return Scaffold(
      appBar: AppBar(title: Text('Login Screen')),
      body: Container(
        color: AppColors.background,
        child: Center(
          child: Form(
            key: formKey,
            child: ListView(
              shrinkWrap: true,
              children: [
                Center(
                  child: Text(
                    'Login',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          CommonTextField(
                            prefixIcon: Icon(Icons.email_outlined),
                            controller: loginRead.emailController,
                            labelText: 'Email',
                            hintText: 'Enter your email',
                            textInputAction: TextInputAction.next,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter email';
                              } else if (!RegExp(
                                r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""",
                              ).hasMatch(value)) {
                                return 'Please enter valid email';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 20),
                          CommonTextField(
                            prefixIcon: Icon(Icons.password),
                            controller: loginRead.passwordController,
                            labelText: 'Password',
                            hintText: 'Enter your password',
                            obscureText: (ref.watch(loginPassword))
                                ? true
                                : false,
                            textInputAction: TextInputAction.next,
                            suffixIcon: IconButton(
                              onPressed: () {
                                if (ref.watch(loginPassword)) {
                                  ref.read(loginPassword.notifier).state =
                                      false;
                                } else {
                                  ref.read(loginPassword.notifier).state = true;
                                }
                              },
                              icon: Icon(
                                (ref.watch(loginPassword))
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter password';
                              } else if (value.length < 8) {
                                return 'Password is not 8 characters long.';
                              } else if (!RegExp(
                                r'''^(?=.*[A-Z])''',
                              ).hasMatch(value)) {
                                return 'Password must contain at least one uppercase letter';
                              } else if (!RegExp(
                                r'''^(?=.*[a-z])''',
                              ).hasMatch(value)) {
                                return 'Password must contain at least one lower letter';
                              } else if (!RegExp(
                                r'''^(?=.*?[0-9])''',
                              ).hasMatch(value)) {
                                return 'Password must contain at least one number';
                              } else if (!RegExp(
                                r'''^(?=.*?[!@#\$&*~])''',
                              ).hasMatch(value)) {
                                return 'Password must contain at least one special character';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 20),
                          loginWatch.when(
                            data: (data) {
                              return Center();
                            },
                            error: (err, stack) {
                              return Column(
                                children: [
                                  Center(child: Text(err.toString())),
                                  SizedBox(height: 20,)
                                ],
                              );
                            },
                            loading: () {
                              return Center(child: CircularProgressIndicator());
                            },
                          ),
                          Visibility(
                            visible: (loginWatch.isLoading) ? false : true,
                            child: CommonButton(
                              onPressed: () async {
                                if (formKey.currentState!.validate()) {
                                  await loginRead.login();
                                }
                              },
                              child: Text(
                                'Login',
                                style: TextStyle(color: AppColors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterScreen()),
                    );
                    loginRead.emailController.clear();
                    loginRead.passwordController.clear();
                  },
                  child: Text('New User? Register here'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
