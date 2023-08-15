import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context); // Navigate back when the content is tapped
                          },
                          child: Row(
                            children: [
                              Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              ),
                              Padding(
                                padding:  EdgeInsets.only(left: 130.0.sp),
                                child: Text('News',style: TextStyle(color: Colors.white,fontSize: 25.sp,fontWeight: FontWeight.bold),),
                              )
                            ],
                          ),

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
                                child: Text(subtitle,style: TextStyle(color: Colors.grey),)),
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
                                child: Text(subtitle1,style: TextStyle(color: Colors.grey),)),
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
