import 'package:auth_api/framework/providers/login_provider.dart';
import 'package:auth_api/ui/screens/profile_screen.dart';
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
                            obscureText: true,
                            textInputAction: TextInputAction.next,
                            suffixIcon: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.visibility),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter password';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 20),
                          Visibility(
                            visible: (loginWatch.isLoading)?false:true,
                            child: CommonButton(
                              onPressed: () async {
                                if (formKey.currentState!.validate()) {
                                  await loginRead.login();
                                  if(loginWatch.value?.data == null){
                                    Center(child: Text(loginWatch.value!.message.toString()));
                                  }else{
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ProfileScreen(),
                                      ),
                                    );
                                    loginRead.emailController.clear();
                                    loginRead.passwordController.clear();
                                  }
                                }
                              },
                              child: Text(
                                'Login',
                                style: TextStyle(color: AppColors.white),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          loginWatch.when(
                            data: (data) {
                              return Container();
                            },
                            error: (err, stack) {
                              return Center(child: Text(err.toString()));
                            },
                            loading: () {
                              return Center(child: CircularProgressIndicator());
                            },
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
