import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controller/home_controller.dart';
import '../utils/glass_box.dart';

class EventTicketPayment extends StatelessWidget {
  static const String routeName='/eventticketpayment';
  const EventTicketPayment({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    return SafeArea(
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
                          homeController.eventstate.value=0;
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
                      Positioned(child: GlassBox(
                        child: Column(
                          children: [
                            Text('data')
                          ],
                        ),
                      )),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15.sp),
                        child: GlassBox(
                          child: Padding(
                            padding:  EdgeInsets.all(10.0.sp),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: MediaQuery.of(context).size.height-250,
                                  width:MediaQuery.of(context).size.width-80,
                                  child: Column(
                                    children: [
                                      Text('Event',style: TextStyle(color: Colors.white,fontSize: 30.sp),),
                                      SizedBox(height: 10.h,),
                                      Image.asset('images/event1.png'),
                                      SizedBox(height: 10.h,),
                                      Padding(
                                        padding:  EdgeInsets.only(right: 40.sp),
                                        child: Text('Premiere Show of "The Big Bang”',style: TextStyle(color: Colors.white,fontSize: 20.sp,fontWeight: FontWeight.bold),),
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
                                      Padding(
                                        padding:  EdgeInsets.only(right: 190.sp),
                                        child: Text('About Event”',style: TextStyle(color: Colors.white,fontSize: 20.sp,fontWeight: FontWeight.bold),),
                                      ),
                                      SizedBox(height: 10.h,),
                                      Padding(
                                        padding:  EdgeInsets.only(left: 8.sp),
                                        child: Text(" An event checklist is a document that outlines all the tasks and activities that need to be completed before, during, and after an event. It is a crucial tool for event planning experts as it ensures that all aspects of the event are covered, from the venue and vendors to the guest list",
                                          style: TextStyle(color: Colors.white,fontSize: 15.sp),textAlign: TextAlign.start,maxLines: 4,),
                                      ),
                                      SizedBox(height: 10.h,),
                                      Padding(
                                        padding:  EdgeInsets.only(right: 230.sp),
                                        child: Text('Location',style: TextStyle(color: Colors.white,fontSize: 20.sp,fontWeight: FontWeight.bold),),
                                      ),
                                      SizedBox(height: 10.h,),
                                      Padding(
                                        padding:  EdgeInsets.only(right: 60.sp),
                                        child: Text("Road 1, Dhanmondi, Dhaka Bangladesh ",
                                          style: TextStyle(color: Colors.grey,fontSize: 15.sp),textAlign: TextAlign.start,maxLines: 4,),
                                      ),
                                      SizedBox(height: 10.h,),
                                      Container(
                                        width: MediaQuery.of(context).size.width-120,
                                        decoration: BoxDecoration(border: Border.all(color: Colors.transparent),borderRadius: BorderRadius.circular(20)),
                                        child: ElevatedButton(onPressed: (){
                                          homeController.eventstate.value=2;
                                        },
                                            style: ElevatedButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(15),
                                                ),
                                                backgroundColor: Color(0xffffEA1C24)
                                            ),
                                            child: Text('Book Ticket - BDT 200',style: TextStyle(color: Colors.white,fontSize: 20.sp),)),
                                      ),
                                      SizedBox(height: 30.h,),
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

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
