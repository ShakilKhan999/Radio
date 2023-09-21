import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:relaks_media/screens/publish_news_success_screen.dart';

import '../controller/home_controller.dart';

class PublishNewsScreen extends StatefulWidget {
  static const String routeName = '/publish_news';

  const PublishNewsScreen({Key? key}) : super(key: key);

  @override
  _PublishNewsScreenState createState() => _PublishNewsScreenState();
}

class _PublishNewsScreenState extends State<PublishNewsScreen> {
  late DateTime selectedDate;

  @override
  void initState() {
    super.initState();
    selectedDate = DateTime.now();
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
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:  EdgeInsets.only(left: 8.0.sp,right: 8.sp),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    color: Colors.white,
                    onPressed: () {
                      homeController.newsCurrentPage.value = 0;
                    },
                  ),
                  Text(
                    'Publish News',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22.0.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 10.w,),
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
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Card(
                        color: Colors.grey.shade900,
                        child: Container(
                          width: double.infinity,
                          height: 200.0,
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ImageIcon(
                                AssetImage('images/upload.png'),
                                size: 30.0.sp,
                                color: Colors.white,
                              ),
                              SizedBox(
                                height: 5.sp,
                              ),
                              Text(
                                'Upload thumbnail',
                                style: TextStyle(
                                    color: Colors.grey.shade300, fontSize: 15.sp),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    // SizedBox(height: 5.0.h),
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
                                    const Icon(Icons.person_outlined, color: Colors.white),
                                    SizedBox(width: 8.0.w),
                                    const Expanded(
                                      child: TextField(
                                        decoration: InputDecoration(
                                          labelText: 'Enter your name',
                                          labelStyle:
                                              TextStyle(color: Colors.grey),
                                        ),
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        // SizedBox(width: 2.0.w),
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
                                            labelText: 'Update Date',
                                            labelStyle:
                                                TextStyle(color: Colors.white),
                                          ),
                                          child: Text(
                                            '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',
                                            style: const TextStyle(
                                                color: Colors.grey),
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
                    // SizedBox(height: 5.0.h),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Card(
                        color: Colors.grey.shade900,
                        child: const TextField(
                          decoration: InputDecoration(
                            labelText: 'Enter news titile',
                            prefixIcon: Icon(
                              Icons.text_format_outlined,
                              color: Colors.white,
                            ),
                            labelStyle: TextStyle(color: Colors.grey),
                          ),
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(height: 16.0.h),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Card(
                        color: Colors.grey.shade900,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ImageIcon(
                                AssetImage('images/text.png'),
                                color: Colors.white,
                                size: 20.0, // Adjust the size as needed
                              ),
                              SizedBox(width: 8.0), // Add some spacing between icon and hintText
                              Container(
                                width: 200.0, // Adjust the width as needed
                                child: const TextField(
                                  maxLines: 10,
                                  decoration: InputDecoration(
                                    hintText: 'Description',
                                    hintStyle: TextStyle(color: Colors.grey),
                                    border: InputBorder.none, // Remove the border
                                  ),
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )





                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: FloatingActionButton.extended(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PublishSuccessNews(),
                ),
              );
            },
            label: const Text('Publish your News'),
            backgroundColor: const Color(0xffffEA1C24),
          ),
        ),
      ),
    );
  }
}
