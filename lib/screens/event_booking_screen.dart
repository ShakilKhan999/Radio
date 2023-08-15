import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:relaks_media/screens/even_ticket_booking_screen.dart';
import 'package:relaks_media/screens/event_ticket_payment_screen.dart';

import '../controller/home_controller.dart';
import '../utils/glass_box.dart';

class EventBookingScreen extends StatelessWidget {
  static const String routeName='/eventboking';
  const EventBookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    return Obx(()=>homeController.eventstate.value==1?EventTicketPayment():
    homeController.eventstate.value==2?EventTicketBooking():
    SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            color: Colors.black,
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: 30.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding:  EdgeInsets.only(left: 15.0),
                        child: IconButton( onPressed: () {
                          homeController.otherservicesubs.value=100;
                        }, icon:Icon(Icons.arrow_back,color: Colors.white,)),
                      ),
                      Padding(
                        padding:  EdgeInsets.only(left: 70.0.sp),
                        child: Text('Other Services',style: TextStyle(color: Colors.white,fontSize: 30.sp),),
                      ),
                    ],
                  ),
                  SizedBox(height: 15.h,),
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15.sp),
                        child: GlassBox(
                          child: Padding(
                            padding:  EdgeInsets.all(10.0.sp),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: MediaQuery.of(context).size.height-450,
                                  width:MediaQuery.of(context).size.width-80,
                                  child: Column(
                                    children: [
                                      Text('Event',style: TextStyle(color: Colors.white,fontSize: 30.sp),),
                                      SizedBox(height: 10.h,),
                                      Image.asset('images/event1.png'),
                                      SizedBox(height: 10.h,),
                                      Padding(
                                        padding:  EdgeInsets.only(right: 40.sp),
                                        child: Text('Premiere Show of "The Big Bang”',style: TextStyle(color: Colors.white,fontSize: 20.sp),),
                                      ),
                                      SizedBox(height: 10.h,),
                                      Padding(
                                        padding:  EdgeInsets.only(left: 8.sp),
                                        child: Text("Event Activities means performing or partici-pating in any capacity,in the Event.Conference is typically a large.",
                                          style: TextStyle(color: Colors.white,fontSize: 15.sp),textAlign: TextAlign.start,),
                                      ),
                                      SizedBox(height: 10.h,),
                                      Padding(
                                        padding:EdgeInsets.only(left: 8.sp),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              // height: 10,
                                              // width: 10,
                                                child: Icon(Icons.calendar_month,color: Colors.grey,size: 15.sp,)
                                            ),
                                            Text(
                                              ' 5 Aug 2023 ',
                                              style: TextStyle(fontSize: 15.sp,color: Colors.grey),
                                            ),
                                            Container(
                                                child: Icon(Icons.location_on_outlined,color: Colors.grey,size: 15.sp)
                                            ),
                                            Text(
                                              ' Dhaka Bangladesh',
                                              style: TextStyle(fontSize: 15.sp,color: Colors.grey),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 10.h,),
                                      Container(
                                        width: MediaQuery.of(context).size.width-120,
                                        decoration: BoxDecoration(border: Border.all(color: Colors.transparent),borderRadius: BorderRadius.circular(20)),
                                        child: ElevatedButton(onPressed: (){
                                          homeController.eventstate.value=1;
                                        },
                                            style: ElevatedButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(15),
                                                ),
                                                backgroundColor: Color(0xffffEA1C24)
                                            ),
                                            child: Text('Book your Ticket',style: TextStyle(color: Colors.white,fontSize: 20.sp),)),
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
                  SizedBox(height: 20.h,),
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15.sp),
                        child: GlassBox(
                          child: Padding(
                            padding:  EdgeInsets.all(10.0.sp),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: MediaQuery.of(context).size.height-450,
                                  width:MediaQuery.of(context).size.width-80,
                                  child: Column(
                                    children: [
                                      Text('Event',style: TextStyle(color: Colors.white,fontSize: 30.sp),),
                                      SizedBox(height: 10.h,),
                                      Image.asset('images/event2.png'),
                                      SizedBox(height: 10.h,),
                                      Padding(
                                        padding:  EdgeInsets.only(right: 40.sp),
                                        child: Text('Speed Reading Crash Course”',style: TextStyle(color: Colors.white,fontSize: 20.sp),),
                                      ),
                                      SizedBox(height: 10.h,),
                                      Padding(
                                        padding:  EdgeInsets.only(left: 8.sp),
                                        child: Text("The same speed-reading workshop that has helped employees at NASA, Amazon, and Microsoft improve.",
                                          style: TextStyle(color: Colors.white,fontSize: 15.sp),textAlign: TextAlign.start,),
                                      ),
                                      SizedBox(height: 10.h,),
                                      Padding(
                                        padding:EdgeInsets.only(left: 8.sp),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              // height: 10,
                                              // width: 10,
                                                child: Icon(Icons.calendar_month,color: Colors.grey,size: 15.sp,)
                                            ),
                                            Text(
                                              ' 12 Dec 2023 ',
                                              style: TextStyle(fontSize: 15.sp,color: Colors.grey),
                                            ),
                                            Container(
                                                child: Icon(Icons.location_on_outlined,color: Colors.grey,size: 15.sp)
                                            ),
                                            Text(
                                              ' Sylhet Bangladesh',
                                              style: TextStyle(fontSize: 15.sp,color: Colors.grey),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 10.h,),
                                      Container(
                                        width: MediaQuery.of(context).size.width-120,
                                        decoration: BoxDecoration(border: Border.all(color: Colors.transparent),borderRadius: BorderRadius.circular(20)),
                                        child: ElevatedButton(onPressed: (){},
                                            style: ElevatedButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(15),
                                                ),
                                                backgroundColor: Color(0xffffEA1C24)
                                            ),
                                            child: Text('Book your Ticket',style: TextStyle(color: Colors.white,fontSize: 20.sp),)),
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
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
