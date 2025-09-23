import 'dart:io';

import 'package:auth_api/framework/providers/register_provider.dart';
import 'package:auth_api/framework/providers/update_profile_provider.dart';
import 'package:auth_api/framework/providers/upload_image_provider.dart';
import 'package:auth_api/ui/utils/common_widgets/common_button.dart';
import 'package:auth_api/ui/utils/common_widgets/common_text_filed.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../../framework/providers/image_provider.dart';
import '../utils/themes/app_colors.dart';

class UpdateProfileScreen extends ConsumerWidget {
  final String? image;
  final String firstName;
  final String lastName;
  final String phoneNo;

  const UpdateProfileScreen({
    super.key,
    this.image,
    required this.firstName,
    required this.lastName,
    required this.phoneNo,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();
    var updateRead = ref.read(updateProfileProvider.notifier);
    var registerRead = ref.read(registerProvider.notifier);
    var updateWatch = ref.watch(updateProfileProvider);
    var uploadImageWatch = ref.watch(uploadImageProvider);
    return Scaffold(
      appBar: AppBar(title: Text('Update Profile')),
      body: Center(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              shrinkWrap: true,
              children: [
                GestureDetector(
                  onTap: () async {
                    var image = await ImagePicker().pickImage(
                      source: ImageSource.gallery,
                    );
                    ref.read(imageProvider.notifier).addImage(image!.path);
                  },
                  child: CircleAvatar(
                    radius: 80,
                    backgroundImage: (ref.watch(imageProvider).isEmpty)
                        ? null
                        : (image != null)
                        ? CachedNetworkImageProvider(image!)
                        : FileImage(File(ref.watch(imageProvider))),
                    child: (ref.watch(imageProvider).isEmpty)
                        ? Center(child: Text('No image found'))
                        : null,
                  ),
                ),
                SizedBox(height: 20),
                CommonTextField(
                  prefixIcon: Icon(Icons.abc),
                  controller: updateRead.firstNameController,
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
                SizedBox(height: 20),
                CommonTextField(
                  prefixIcon: Icon(Icons.abc),
                  controller: updateRead.lastNameController,
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
                SizedBox(height: 20),
                CommonTextField(
                  prefixIcon: Icon(Icons.phone_outlined),
                  controller: updateRead.phoneController,
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
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      ref
                                .watch(registerProvider)
                                .toString()
                                .substring(0, 11),
                    ),
                    CommonButton(
                      onPressed: () async {
                        registerRead.updateDate(
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
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.center,
                  child: CommonButton(
                    onPressed: () async {
                      if(formKey.currentState!.validate()){
                        await updateRead.updateProfile();
                        if(ref.watch(imageProvider).isNotEmpty){
                          await ref.read(uploadImageProvider.notifier).uploadImage();
                        }
                        print('value message');
                        print(updateWatch.value?.message);
                        // if(updateWatch.value?.message != null || uploadImageWatch.value?.message != null){
                          Navigator.pop(context);
                          ref.invalidate(updateProfileProvider);
                        // }
                      }
                    },
                    child: Text('Update', style: TextStyle(color: AppColors.white)),
                  ),
                ),
                SizedBox(height: 20,),
                updateWatch.when(data: (data){
                  return Container();
                }, error: (err, stack){
                  return Center(child: Text(err.toString()),);
                }, loading: (){
                  return Center(child: CircularProgressIndicator(),);
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
