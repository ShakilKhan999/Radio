import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:relaks_media/controller/profile_Controller.dart';

import '../controller/home_controller.dart';
import 'glass_box.dart';

class ProfileEditWidget extends StatefulWidget {
  @override
  State<ProfileEditWidget> createState() => _ProfileEditWidgetState();
}

class _ProfileEditWidgetState extends State<ProfileEditWidget> {
  final nameController = TextEditingController();
  final roleController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();
  File? _selectedImage;
  @override
  void dispose() {
    nameController.dispose();
    roleController.dispose();
    emailController.dispose();
    passwordController.dispose();
    phoneController.dispose();
    addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    ProfileController profileController = Get.put(ProfileController());
    return SingleChildScrollView(
      child: Container(
        color: Colors.black,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Row(
                children: [
                  SizedBox(
                    width: 10.w,
                  ),
                  IconButton(
                    color: Colors.white,
                    onPressed: () {
                      homeController.mystorepagestate.value = 0;
                    },
                    icon: const Icon(Icons.arrow_back),
                  ),
                  SizedBox(
                    width: 75.w,
                  ),
                  Text(
                    'Edit Profile',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.sp,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 5.h,
              ),
              GestureDetector(
                onTap: () async {
                  final ImagePicker _picker = ImagePicker();
                  final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
                  if (image != null) {
                    setState(() {
                      _selectedImage = File(image.path);
                    });
                  }
                },
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      // backgroundImage: _selectedImage != null? FileImage(_selectedImage!.path):AssetImage('images/profile.png'),
                      child: _selectedImage != null ? ClipRRect(
                          borderRadius:
                          BorderRadius.circular(90),
                          child: Image.file(File(_selectedImage!.path),width: 100.w,
                            height: 120.h,
                            fit: BoxFit.cover,)): Image.asset('images/profile.png'),

                    ),
                    const Positioned(
                      bottom: 7,
                      right: 13,
                      child: CircleAvatar(
                        radius: 13,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.add,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20.h),
              Text('Edward Larry',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.sp,
                      fontWeight: FontWeight.bold)),
              SizedBox(height: 5.h,),
              Text('Reporter',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15.sp,
                      )),
              SizedBox(height: 5.h,),
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15.sp),
                    child: GlassBox(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height-240.h,
                          width: MediaQuery.of(context).size.width - 80,
                          child: Column(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Enter Name',
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  SizedBox(
                                    height: 50.h,
                                    child: TextFormField(
                                      controller: nameController,
                                      decoration: const InputDecoration(
                                        hintText: 'Sagor Roy',
                                        hintStyle:
                                        TextStyle(color: Colors.grey),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.grey,
                                                width: 1.2)),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.grey,
                                                width: 1.2)),
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.grey,
                                                width: 1.2)),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Role',
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  SizedBox(
                                    height: 50.h,
                                    child: TextFormField(
                                      controller: roleController,
                                      decoration: const InputDecoration(
                                        hintText: 'Reporter',
                                        hintStyle:
                                        TextStyle(color: Colors.grey),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.grey,
                                                width: 1.2)),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.grey,
                                                width: 1.2)),
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.grey,
                                                width: 1.2)),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Email Address',
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  SizedBox(
                                    height: 50.h,
                                    child: TextFormField(
                                      controller: emailController,
                                      decoration: const InputDecoration(
                                        hintText: 'sagorroy@gmail.com',
                                        hintStyle:
                                        TextStyle(color: Colors.grey),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.grey,
                                                width: 1.2)),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.grey,
                                                width: 1.2)),
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.grey,
                                                width: 1.2)),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Password',
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  SizedBox(
                                    height: 50.h,
                                    child: TextFormField(
                                      controller: passwordController,
                                      decoration: const InputDecoration(
                                        hintText: '**********',
                                        hintStyle:
                                        TextStyle(color: Colors.grey),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.grey,
                                                width: 1.2)),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.grey,
                                                width: 1.2)),
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.grey,
                                                width: 1.2)),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Phone Number',
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  SizedBox(
                                    height: 50.h,
                                    child: TextFormField(
                                      controller: phoneController,
                                      decoration: const InputDecoration(
                                        hintText:
                                        '+880132698405',
                                        hintStyle:
                                        TextStyle(color: Colors.grey),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.grey,
                                                width: 1.2)),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.grey,
                                                width: 1.2)),
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.grey,
                                                width: 1.2)),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Address',
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  SizedBox(
                                    height: 50.h,
                                    child: TextFormField(
                                      controller: addressController,
                                      decoration: const InputDecoration(
                                        hintText:
                                        'Panchlaish, Chittagong',
                                        hintStyle:
                                        TextStyle(color: Colors.grey),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.grey,
                                                width: 1.2)),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.grey,
                                                width: 1.2)),
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.grey,
                                                width: 1.2)),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                ],
                              ),

                              Container(
                                width:
                                MediaQuery.of(context).size.width - 120.w,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.transparent),
                                    borderRadius:
                                    BorderRadius.circular(20)),
                                child: ElevatedButton(
                                  onPressed: () {
                                    profileController.updateProfile(name: nameController.text.trim(), file: _selectedImage!.path);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    backgroundColor: const Color(0xffffEA1C24),
                                  ),
                                  child: Text(
                                    'Save Changes',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 40.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
