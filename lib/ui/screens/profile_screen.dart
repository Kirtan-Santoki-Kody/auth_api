import 'dart:io';

import 'package:auth_api/framework/providers/image_provider.dart';
import 'package:auth_api/framework/providers/logout_provider.dart';
import 'package:auth_api/framework/providers/profile_provider.dart';
import 'package:auth_api/framework/providers/register_provider.dart';
import 'package:auth_api/main.dart';
import 'package:auth_api/ui/screens/login_screen.dart';
import 'package:auth_api/ui/screens/update_profile_screen.dart';
import 'package:auth_api/ui/utils/common_widgets/common_button.dart';
import 'package:auth_api/ui/utils/themes/app_colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var data = ref.watch(profileProvider);
    return data.when(
      data: (data) {
        return Scaffold(
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                shrinkWrap: true,
                children: [
                  CircleAvatar(
                    radius: 80,
                    backgroundImage: (data.data?.user?.profileImage != null)
                        ? CachedNetworkImageProvider(
                            data.data?.user?.profileImage,
                          )
                        : null,
                    child: (data.data?.user?.profileImage == null)
                        ? Center(child: Text('No image found'))
                        : null,
                  ),
                  Text('First Name: ${data.data?.user?.firstName ?? ''}'),
                  Text('Last Name: ${data.data?.user?.lastName ?? ''}'),
                  Text('User Name: ${data.data?.user?.username ?? ''}'),
                  Text('Email: ${data.data?.user?.email ?? ''}'),
                  Text('Phone No.: ${data.data?.user?.phone ?? ''}'),
                  Text(
                    'Birth date: ${data.data?.user?.dateOfBirth.toString().substring(0, 11) ?? ''}',
                  ),
                  Text('Last Login: ${data.data?.user?.lastLogin ?? ''}'),
                  Align(
                    alignment: Alignment.center,
                    child: CommonButton(
                      onPressed: () {
                        ref
                            .watch(registerProvider.notifier)
                            .updateDate(
                              data.data?.user?.dateOfBirth ?? DateTime.now(),
                            );
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UpdateProfileScreen(
                              firstName: data.data?.user?.firstName ?? '',
                              lastName: data.data?.user?.lastName ?? '',
                              phoneNo: data.data?.user?.phone ?? '',
                            ),
                          ),
                        );
                      },
                      child: Text(
                        'Update Profile',
                        style: TextStyle(color: AppColors.white),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: CommonButton(
                      onPressed: () async {
                        await ref.read(logOutProvider.notifier).logout();
                        if (ref.watch(logOutProvider).value?.message != null) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ),
                          );
                        }
                      },
                      child: Text(
                        'Logout',
                        style: TextStyle(color: AppColors.white),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  ref
                      .watch(logOutProvider)
                      .when(
                        data: (data) {
                          return Container();
                        },
                        error: (err, stack) {
                          ScaffoldMessenger.of(
                            context,
                          ).showSnackBar(SnackBar(content: Text('Error')));
                          return Container();
                        },
                        loading: () {
                          return Align(
                            alignment: Alignment.center,
                            child: CircularProgressIndicator(),
                          );
                        },
                      ),
                ],
              ),
            ),
          ),
        );
      },
      error: (err, stack) {
        return Scaffold(body: Center(child: Text(err.toString())));
      },
      loading: () {
        return Scaffold(body: Center(child: CircularProgressIndicator()));
      },
    );
  }
}
