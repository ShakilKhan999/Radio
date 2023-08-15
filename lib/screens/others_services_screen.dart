import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:relaks_media/screens/air_screen.dart';
import 'package:relaks_media/screens/bus_service_screen.dart';
import 'package:relaks_media/screens/bus_ticket_screen.dart';
import 'package:relaks_media/screens/event_booking_screen.dart';
import 'package:relaks_media/screens/train_screen.dart';

import '../controller/home_controller.dart';
import '../utils/glass_box.dart';

class OtherServicesScreen extends StatelessWidget {
  static const String routeName='/otherservice';
  const OtherServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    return Obx(()=>homeController.otherservicesubs.value==1?TrainScreen():
    homeController.otherservicesubs.value==2?AirScreen():
    homeController.otherservicesubs.value==3?EventBookingScreen():
    homeController.otherservicesubs.value==0?BusServiceScreen():
    SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.black,
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 50.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(left: 15.0),
                      child: IconButton( onPressed: () {
                        homeController.homestate.value=0;
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
                          padding: const EdgeInsets.all(16.0),
                          child: SizedBox(
                              height: MediaQuery.of(context).size.height-500,
                              width:MediaQuery.of(context).size.width-80,
                              child: Column(
                                children: [
                                  Text('Ticket',style: TextStyle(color: Colors.white,fontSize: 30.sp),),
                                  Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Row(
                                      children: [
                                        Icon(Icons.directions_bus,color: Colors.white,),
                                        SizedBox(width: 5.w,),
                                        TextButton(
                                            style: TextButton.styleFrom(
                                              minimumSize: Size.zero,
                                              padding: EdgeInsets.zero,
                                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                            ),
                                          onPressed: (){
                                            homeController.otherservicesubs.value=0;
                                          },
                                            child: Text('Bus',style: TextStyle(color: Colors.white,fontSize: 15.sp),))
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Row(
                                      children: [
                                        Icon(Icons.train_outlined,color: Colors.white,),
                                        SizedBox(width: 5.w,),
                                        TextButton(
                                            style: TextButton.styleFrom(
                                              minimumSize: Size.zero,
                                              padding: EdgeInsets.zero,
                                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                            ),
                                            onPressed: (){
                                              homeController.otherservicesubs.value=1;
                                            },
                                            child: Text('Train',style: TextStyle(color: Colors.white,fontSize: 15.sp),))

                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Row(
                                      children: [
                                        Icon(Icons.airplane_ticket_outlined,color: Colors.white,),
                                        SizedBox(width: 5.w,),
                                        TextButton(
                                            style: TextButton.styleFrom(
                                              minimumSize: Size.zero,
                                              padding: EdgeInsets.zero,
                                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                            ),
                                            onPressed: (){
                                              homeController.otherservicesubs.value=2;
                                            },
                                            child: Text('Air',style: TextStyle(color: Colors.white,fontSize: 15.sp),))

                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Row(
                                      children: [
                                        Icon(Icons.event_available_outlined,color: Colors.white,),
                                        SizedBox(width: 5.w,),
                                        TextButton(
                                            style: TextButton.styleFrom(
                                              minimumSize: Size.zero,
                                              padding: EdgeInsets.zero,
                                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                            ),
                                            onPressed: (){
                                              homeController.otherservicesubs.value=3;
                                            },
                                            child: Text('Event',style: TextStyle(color: Colors.white,fontSize: 15.sp),))

                                      ],
                                    ),
                                  ),
                                ],
                              )),
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
    ));
  }
}
