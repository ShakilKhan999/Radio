import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:relaks_media/screens/job/controller/job_controller.dart';

import '../../../utils/glass_box.dart';

class CareerScreen extends StatefulWidget {
  static const String routeName='/career';
  const CareerScreen({super.key});

  @override
  State<CareerScreen> createState() => _CareerScreenState();
}

class _CareerScreenState extends State<CareerScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final educationController = TextEditingController();
  final workController = TextEditingController();
  final noteController = TextEditingController();
  final skillController = TextEditingController();
  final officialMailController = TextEditingController();
  String applyAs = '';
  @override
  void dispose() {
    emailController.dispose();
    phoneController.dispose();
    educationController.dispose();
    workController.dispose();
    noteController.dispose();
    skillController.dispose();
    officialMailController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.black,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 10.h,),
                Row(
                  children: [
                    SizedBox(width: 10.w,),
                    IconButton( onPressed: () {  }, icon: const Icon(Icons.arrow_back,color: Colors.white,)),
                    SizedBox(width: 75.w,),
                    Text('Apply to be a Career',style: TextStyle(color: Colors.white,fontSize: 25.sp,fontWeight: FontWeight.bold),),
                  ],
                ),
                SizedBox(height: 15.h,),
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15.sp),
                      child: GlassBox(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: SizedBox(

                              width: MediaQuery.of(context).size.width - 80.w,
                              child: Column(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Enter your Name',
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
                                          controller: nameController,style: TextStyle(color: Colors.grey),
                                          decoration: const InputDecoration(
                                            hintText: 'Sagor Roy',hintStyle: TextStyle(color: Colors.grey),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Email',
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
                                            hintText: 'sagorroy@gmail.com',hintStyle: TextStyle(color: Colors.grey),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                            hintText: '+8801369587402',hintStyle: TextStyle(color: Colors.grey),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Education',
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
                                          controller: educationController,
                                          decoration: const InputDecoration(
                                            hintText: 'HSC -K.M Latif Institution',hintStyle: TextStyle(color: Colors.grey),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Work Experience',
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
                                          controller: workController,
                                          decoration: const InputDecoration(
                                            hintText: 'Working on News 24 as a Reporter',hintStyle: TextStyle(color: Colors.grey),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            'Note',
                                            style: TextStyle(
                                              fontSize: 16.sp,
                                              color: Colors.white,
                                            ),
                                          ),
                                          Text(
                                            '(Optional)',
                                            style: TextStyle(
                                              fontSize: 16.sp,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5.h,
                                      ),
                                      SizedBox(
                                        height: 50.h,
                                        child: TextFormField(
                                          controller: noteController,
                                          decoration: const InputDecoration(
                                            hintText: 'Working on News 24 as a Reporter',hintStyle: TextStyle(color: Colors.grey),
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
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Skill',
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
                                          controller: skillController,
                                          decoration: const InputDecoration(
                                            hintText: 'Rj & Reporting',hintStyle: TextStyle(color: Colors.grey),
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
                                        'Apply as a',
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          color: Colors.white,
                                        ),
                                      ),
                                      SizedBox(height: 5.h),
                                      Container(
                                        height: 50.h,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.grey,
                                            width: 1.2,
                                          ),
                                          borderRadius: BorderRadius.circular(8.0),
                                        ),
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: DropdownButton<String>(
                                                value: 'As a Rj',
                                                items: const [
                                                  DropdownMenuItem<String>(
                                                    value: 'As a Rj',
                                                    child: Text('As a Rj'),
                                                  ),
                                                  DropdownMenuItem<String>(
                                                    value: 'As a News Reporter',
                                                    child: Text('As a News Reporter'),
                                                  ),
                                                  DropdownMenuItem<String>(
                                                    value: 'As a Voice Artist',
                                                    child: Text('As a Voice Artist'),
                                                  ),
                                                  DropdownMenuItem<String>(
                                                    value: 'As a Script Writer',
                                                    child: Text('As a Script Writer'),
                                                  ),

                                                ],
                                                onChanged: (value) {
                                                  // Handle the dropdown value change
                                                  applyAs = value.toString();
                                                },
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16.sp,
                                                ),
                                                underline: Container(), // Remove the underline

                                              ),
                                            ),

                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 20.h),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Official Mail',
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
                                          controller: officialMailController,
                                          decoration: const InputDecoration(
                                            hintText: 'career@relaksmedia.com',hintStyle: TextStyle(color: Colors.grey),
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
                                    height: 40.h,
                                    width: MediaQuery.of(context).size.width-120.w,
                                    decoration: BoxDecoration(border: Border.all(),borderRadius: BorderRadius.circular(20)),
                                    child: ElevatedButton(onPressed: (){
                                      JobController jobController = Get.put(JobController());
                                      jobController.postJob(
                                        name: nameController.text.trim(),
                                        email: emailController.text.trim(),
                                        phone: phoneController.text.trim(),
                                        education: educationController.text.trim(),
                                        experience: workController.text.trim(),
                                        skill: skillController.text.trim(),
                                        note: noteController.text.trim(),
                                        applyAs: applyAs,
                                        officialEmail: officialMailController.text.trim(),
                                      );
                                    },
                                        style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(15),
                                            ),
                                            backgroundColor: const Color(0xffffEA1C24)
                                        ),
                                        child: Text('Apply',style: TextStyle(color: Colors.white,fontSize: 20.sp),)),
                                  )
                                ],
                              )),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 40.h,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}





