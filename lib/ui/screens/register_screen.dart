import 'package:auth_api/framework/providers/hide_show_password_provider.dart';
import 'package:auth_api/framework/providers/register_async_provider.dart';
import 'package:auth_api/framework/providers/register_provider.dart';
import 'package:auth_api/ui/screens/profile_screen.dart';
import 'package:auth_api/ui/utils/common_widgets/common_button.dart';
import 'package:auth_api/ui/utils/common_widgets/common_text_filed.dart';
import 'package:auth_api/ui/utils/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegisterScreen extends ConsumerWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();
    var register = ref.read(registerProvider.notifier);
    var registerAsyncWatch = ref.watch(registerAsyncProvider);
    var registerAsyncRead = ref.read(registerAsyncProvider.notifier);
    return Scaffold(
      appBar: AppBar(title: Text('Register Screen')),
      body: Container(
        color: AppColors.background,
        child: Center(
          child: ListView(
            shrinkWrap: true,
            children: [
              Center(
                child: Text(
                  'Register',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          CommonTextField(
                            prefixIcon: Icon(Icons.abc),
                            controller: register.userName,
                            labelText: 'User Name',
                            hintText: 'Enter user name',
                            textInputAction: TextInputAction.next,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter user name';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 15),
                          CommonTextField(
                            prefixIcon: Icon(Icons.abc),
                            controller: register.firstName,
                            labelText: 'First Name',
                            hintText: 'Enter your first name',
                            textInputAction: TextInputAction.next,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter first name';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 15),
                          CommonTextField(
                            prefixIcon: Icon(Icons.abc),
                            controller: register.lastName,
                            labelText: 'Last Name',
                            hintText: 'Enter your last name',
                            textInputAction: TextInputAction.next,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter last name';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 15),
                          CommonTextField(
                            prefixIcon: Icon(Icons.email_outlined),
                            controller: register.email,
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
                          SizedBox(height: 15),
                          CommonTextField(
                            prefixIcon: Icon(Icons.password),
                            controller: register.password,
                            labelText: 'Password',
                            hintText: 'Enter your password',
                            helperText:
                                'Password must be at least 8 characters long and Password must contain at least one lowercase letter, one uppercase letter, one number, and one special character',
                            textInputAction: TextInputAction.next,
                            suffixIcon: IconButton(
                              onPressed: () {
                                if (ref.watch(registerPassword)) {
                                  ref.read(registerPassword.notifier).state =
                                  false;
                                } else {
                                  ref.read(registerPassword.notifier).state = true;
                                }
                              },
                              icon: Icon(
                                (ref.watch(loginPassword))
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                            ),
                            obscureText: (ref.watch(registerPassword))?true:false,
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
                          SizedBox(height: 15),
                          CommonTextField(
                            prefixIcon: Icon(Icons.password),
                            controller: register.confirmPassword,
                            labelText: 'Confirm Password',
                            hintText: 'Re-enter your password',
                            obscureText: (ref.watch(registerConfirmPassword))?true:false,
                            textInputAction: TextInputAction.next,
                            suffixIcon: IconButton(
                              onPressed: () {
                                if (ref.watch(registerConfirmPassword)) {
                                  ref.read(registerConfirmPassword.notifier).state =
                                  false;
                                } else {
                                  ref.read(registerConfirmPassword.notifier).state = true;
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
                                return 'Please enter confirm password';
                              } else if (value != register.password.text) {
                                return 'Password and confirm password are not same';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 15),
                          CommonTextField(
                            prefixIcon: Icon(Icons.phone_outlined),
                            controller: register.phone,
                            labelText: 'Phone No',
                            hintText: 'Enter your Phone no.',
                            keyboardType: TextInputType.phone,
                            textInputAction: TextInputAction.done,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter phone no';
                              } else if (value.length != 10) {
                                return 'Please enter proper phone no';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'Birth date: ${ref.watch(registerProvider).toString().substring(0, 11)}',
                              ),
                              CommonButton(
                                onPressed: () async {
                                  register.updateDate(
                                    (await showDatePicker(
                                      context: context,
                                      firstDate: DateTime(1900),
                                      lastDate: DateTime.now(),
                                    ))!,
                                  );
                                },
                                child: Text(
                                  'Pick date',
                                  style: TextStyle(color: AppColors.white),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          Visibility(
                            visible: (registerAsyncWatch.isLoading)
                                ? false
                                : true,
                            child: CommonButton(
                              onPressed: () async {
                                if (formKey.currentState!.validate()) {
                                  await registerAsyncRead.register();
                                  if(registerAsyncWatch.hasError){
                                    Center(child: Text(registerAsyncWatch.error.toString()));
                                  }else{
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ProfileScreen(),
                                      ),
                                    );
                                    register.userName.clear();
                                    register.firstName.clear();
                                    register.lastName.clear();
                                    register.phone.clear();
                                    register.email.clear();
                                    register.password.clear();
                                    register.confirmPassword.clear();
                                  }
                                }
                              },
                              child: Text(
                                'Register',
                                style: TextStyle(color: AppColors.white),
                              ),
                            ),
                          ),
                          registerAsyncWatch.when(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
