import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:relaks_media/controller/home_controller.dart';

class NewsDetailsScreen extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;
  final String subtitle1;
  final String description;

  NewsDetailsScreen({
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.subtitle1,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Card(
              color: Colors.grey.shade900,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: MediaQuery.of(context).padding.top), // Ensure content starts below the status bar
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            IconButton(

                              onPressed: () {
                                homeController.newsCurrentPage.value = 0;
                              },
                              icon: Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              ),
                            ),
                            Padding(
                              padding:  EdgeInsets.only(left: 100.0.sp),
                              child: Text('News',style: TextStyle(color: Colors.white,fontSize: 25.sp,fontWeight: FontWeight.bold),),
                            )
                          ],
                        ),
                        SizedBox(height: 16.0.h),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15.sp),
                          child: Image.asset(
                            imageUrl,
                            fit: BoxFit.cover,
                            height: 200.0,
                            width: double.infinity,
                          ),
                        ),
                        SizedBox(height: 16.0),
                        Text(
                          title,
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Row(
                          children: [
                            ElevatedButton(onPressed: (){},
                                style: ElevatedButton
                                    .styleFrom(
                                    shape:
                                    RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius
                                          .circular(
                                          15),
                                    ),
                                    backgroundColor:
                                    Colors.grey.shade800),
                                child: Text(subtitle,style: TextStyle(color: Colors.grey,fontSize: 8.sp),)),
                            SizedBox(width: 5.0.sp),
                            ElevatedButton(onPressed: (){},
                                style: ElevatedButton
                                    .styleFrom(
                                    shape:
                                    RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius
                                          .circular(
                                          15),
                                    ),
                                    backgroundColor:
                                    Colors.grey.shade800),
                                child: Text(subtitle1,style: TextStyle(color: Colors.grey,fontSize: 8.sp),)),
                          ],
                        ),



                        SizedBox(height: 16.0),


                        Text(
                          description,
                          style: TextStyle(color:Colors.grey.shade400,fontSize: 18.0),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
