import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:relaks_media/controller/home_controller.dart';

import '../utils/glass_box.dart';

class PublishSuccessNews extends StatelessWidget {
  const PublishSuccessNews({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            color: Colors.black,
            child: Column(
              children: [
                SizedBox(
                  height: 30.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child: IconButton(
                          onPressed: () {
                            homeController.newsCurrentPage.value=0;
                          },
                          icon: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 70.0.sp),
                      child: Text(
                        'Other Services',
                        style: TextStyle(color: Colors.white, fontSize: 30.sp),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15.h,
                ),
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15.sp),
                      child: Stack(
                          children: [
                        Container(
                            height: MediaQuery.of(context).size.height - 315,
                            width: MediaQuery.of(context).size.width - 40,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Card(
                                color: Colors.grey.shade900,
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: 30.h,
                                      ),

                                      Stack(
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                            BorderRadius.circular(15.sp),
                                            child: GlassBox(
                                              child: Padding(
                                                padding: EdgeInsets.all(10.0.sp),
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    SizedBox(
                                                      height:
                                                      MediaQuery.of(context)
                                                          .size
                                                          .height -
                                                          480.h,
                                                      width:
                                                      MediaQuery.of(context)
                                                          .size
                                                          .width -
                                                          100.w,
                                                      child: Column(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                        children: [

                                                          Image.asset('images/love.png',height: 150.h,width: 180.w,),
                                                          Text(
                                                            'Thanks',
                                                            style: TextStyle(
                                                                color: Colors.white,fontWeight: FontWeight.bold,
                                                                fontSize: 23.sp),
                                                          ),
                                                          SizedBox(height: 5.h,),
                                                          Text(
                                                            "For submitting your news content! \nIf everything checks out, we will \nproceed with its publication.",
                                                            style: TextStyle(
                                                                color:
                                                                Colors.white,
                                                                fontSize: 20.sp),
                                                            textAlign: TextAlign.center,
                                                          ),


                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                              top:10,
                                              right: 10,
                                              child: Icon(Icons.cancel_presentation,size: 25.spMax,color: Colors.white,))
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20.h,
                                      ),
                                      Container(
                                        width:
                                        MediaQuery.of(context).size.width -
                                            120,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.transparent),
                                            borderRadius:
                                            BorderRadius.circular(20)),
                                        child: ElevatedButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            style: ElevatedButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(15),
                                                ),
                                                backgroundColor:
                                                Color(0xffffEA1C24)),
                                            child: Text(
                                              'Go Back',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20.sp),
                                            )),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )),

                      ]),
                    ),
                  ],
                ),

                SizedBox(
                  height: 220.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
