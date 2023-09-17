import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:provider/provider.dart';
import '../controller/home_controller.dart';
import '../models/news_model.dart';
import '../provider/news_api_provider.dart';
import '../utils/image_picker.dart';

class PublishNewsScreen extends StatefulWidget {
  static const String routeName = '/publish_news';

  const PublishNewsScreen({Key? key}) : super(key: key);

  @override
  _PublishNewsScreenState createState() => _PublishNewsScreenState();
}

class _PublishNewsScreenState extends State<PublishNewsScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController tittleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  late DateTime selectedDate;

  String selectedImagePath = '';
  String? _userImage = '';

  File? imageFile;

  setProfileImageState(String value) {
    setState(() {
      selectedImagePath = value;
    });
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    selectedDate = DateTime.now();
  }


  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    color: Colors.white,
                    onPressed: () {
                      homeController.newsCurrentPage.value = 0;
                    },
                  ),
                  SizedBox(width: 8.0.w),
                  Padding(
                    padding:  EdgeInsets.only(left: 70.0.sp),
                    child: Text(
                      'Publish News',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22.0.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(16.0.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 16.0.h),
                    NewsImagePicker(
                      setImagePath: setProfileImageState,
                      imagePath: _userImage,
                    ),
                    SizedBox(height: 24.0.h),
                    Row(
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Card(
                              color: Colors.grey.shade900,
                              child: Padding(
                                padding:  EdgeInsets.only(left: 8.0.sp),
                                child: Row(
                                  children: [
                                    const Icon(Icons.person, color: Colors.white),
                                    SizedBox(width: 8.0.w),
                                    Expanded(
                                      child: TextField(
                                        controller: nameController,
                                        decoration: const InputDecoration(
                                          labelText: 'Name',
                                          labelStyle:
                                              TextStyle(color: Colors.white),
                                        ),
                                        style: const TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 16.0.w),
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Card(
                              color: Colors.grey.shade900,
                              child: Padding(
                                padding:  EdgeInsets.only(left: 8.0.sp),
                                child: Row(
                                  children: [
                                    const Icon(Icons.calendar_today,
                                        color: Colors.white),
                                    SizedBox(width: 8.0.w),
                                    Expanded(
                                      child: InkWell(
                                        onTap: () => _selectDate(context),
                                        child: InputDecorator(
                                          decoration: const InputDecoration(
                                            labelText: 'Date',
                                            labelStyle:
                                                TextStyle(color: Colors.white),
                                          ),
                                          child: Text(
                                            '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',
                                            style: const TextStyle(
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.0.h),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Card(
                        color: Colors.grey.shade900,
                        child: TextField(
                          controller: tittleController,
                          decoration: const InputDecoration(
                            labelText: 'Title',
                            prefixIcon: Icon(
                              Icons.text_format_outlined,
                              color: Colors.white,
                            ),
                            labelStyle: TextStyle(color: Colors.white),
                          ),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(height: 16.0.h),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Card(
                        color: Colors.grey.shade900,
                        child: TextField(
                          controller: descriptionController,
                          maxLines: 10,
                          decoration: const InputDecoration(
                            labelText: 'Description',
                            prefixIcon: Icon(
                              Icons.description_outlined,
                              color: Colors.white,
                            ),
                            labelStyle: TextStyle(color: Colors.white),
                          ),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(height: 24.0.h),
                   
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Consumer<NewsApiProvider>(
        builder: (context, formDataProvider, child) {
          return ElevatedButton(
            onPressed: () async {
              if (selectedImagePath != '') {
                setState(() {
                  imageFile =
                      File(selectedImagePath);
                });
              }
              final formData = CreateNewsModel(
                category: '2',
                user: '1',
                title: nameController.text.toString(),
                subtitle: tittleController.text.toString(),
                description: descriptionController.text.toString(),
                image: imageFile!,

              );

              await formDataProvider.sendDataToApi(formData);
            },
            child: Text('Send Data to API'),
          );
        },
      )
    );
  }
}
