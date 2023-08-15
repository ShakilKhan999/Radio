import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controller/home_controller.dart';
import '../utils/glass_box.dart';

class EventSuccessPaymentScreen extends StatelessWidget {
  static const String routeName='/eventsuccesspayment';
  const EventSuccessPaymentScreen({super.key});

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
                            homeController.eventticketBookstate.value=0;
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
                Text(
                  'Event',
                  style: TextStyle(color: Colors.white, fontSize: 30.sp),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15.sp),
                      child: Stack(children: [
                        Container(

                          child: Padding(
                            padding: EdgeInsets.all(10.0.sp),
                            child: Column(
                              children: [
                                SizedBox(
                                  height:
                                  MediaQuery.of(context).size.height-300,
                                  width: MediaQuery.of(context).size.width - 80,
                                  child: Column(
                                    children: [
                                      Text(
                                        'Event',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 30.sp),
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Image.asset('images/event1.png'),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(right: 40.sp),
                                        child: Text(
                                          'Premiere Show of "The Big Bang”',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20.sp,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 8.sp),
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              // height: 10,
                                              // width: 10,
                                                child: Icon(
                                                  Icons.calendar_month,
                                                  color: Colors.grey,
                                                  size: 15.sp,
                                                )),
                                            Text(
                                              ' 5 Aug 2023 ',
                                              style: TextStyle(
                                                  fontSize: 15.sp,
                                                  color: Colors.grey),
                                            ),
                                            Container(
                                                child: Icon(
                                                    Icons.location_on_outlined,
                                                    color: Colors.grey,
                                                    size: 15.sp)),
                                            Text(
                                              ' Dhaka Bangladesh',
                                              style: TextStyle(
                                                  fontSize: 15.sp,
                                                  color: Colors.grey),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(right: 190.sp),
                                        child: Text(
                                          'About Event”',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20.sp,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 60.h,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(right: 230.sp),
                                        child: Text(
                                          'Location',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20.sp,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(right: 60.sp),
                                        child: Text(
                                          "Road 1, Dhanmondi, Dhaka Bangladesh ",
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 15.sp),
                                          textAlign: TextAlign.start,
                                          maxLines: 4,
                                        ),
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
                                            onPressed: () {},
                                            style: ElevatedButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(15),
                                                ),
                                                backgroundColor:
                                                Color(0xffffEA1C24)),
                                            child: Text(
                                              'Book Ticket - BDT 200',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20.sp),
                                            )),
                                      ),

                                    ],
                                  ),
                                ),

                              ],
                            ),
                          ),
                        ),
                        Container(
                            height: MediaQuery.of(context).size.height - 500,
                            width: MediaQuery.of(context).size.width - 40,
                            child: GlassBox(
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 10.h,
                                    ),

                                    SizedBox(
                                      height: 10.h,
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
                                                        600,
                                                    width:
                                                    MediaQuery.of(context)
                                                        .size
                                                        .width -
                                                        80,
                                                    child: Column(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .center,
                                                      children: [
                                                       Image.asset('images/done.png'),
                                                        Text(
                                                          'Great',
                                                          style: TextStyle(
                                                              color: Colors.green,
                                                              fontSize: 20.sp),
                                                        ),
                                                        Text(
                                                          'Payment Confirmed!',
                                                          style: TextStyle(
                                                              color:
                                                              Colors.white,
                                                              fontSize: 20.sp),
                                                        ),
                                                        Text(
                                                          ' Thank you for your payment.',
                                                          style: TextStyle(
                                                              color:
                                                              Colors.white,
                                                              fontSize: 20.sp),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                  ],
                                ),
                              ),
                            )),

                      ]),
                    ),
                  ],
                ),

                SizedBox(
                  height: 20.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
