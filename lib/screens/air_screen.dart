import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:relaks_media/controller/otherservice_controller.dart';
import 'package:relaks_media/screens/air_tickets_screen.dart';

import '../controller/home_controller.dart';
import '../utils/glass_box.dart';

class AirScreen extends StatelessWidget {
  static const String routeName='/air_Screen';
  const AirScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    OtherServiceController otherServiceController = Get.put(OtherServiceController());
    return Obx(()=>homeController.airstate==1?AirTicketScreen():SafeArea(
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
                          padding: const EdgeInsets.all(16.0),
                          child: SizedBox(
                              height: MediaQuery.of(context).size.height-450,
                              width:MediaQuery.of(context).size.width-80,
                              child: Column(
                                children: [
                                  Text('Air',style: TextStyle(color: Colors.white,fontSize: 30.sp),),
                                  GestureDetector(
                                    onTap: (){
                                      otherServiceController.airSite=0;
                                      homeController.airstate.value=1;
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Row(
                                        children: [
                                          Image.asset('images/bimanbdair.png'),
                                          SizedBox(width: 5.w,),
                                          Text('Biman Bangladesh Airlines',style: TextStyle(color: Colors.white,fontSize: 17.sp),)
                                        ],
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: (){
                                      otherServiceController.airSite=1;
                                      homeController.airstate.value=1;
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Row(
                                        children: [
                                          Image.asset('images/usbdair.png'),
                                          SizedBox(width: 5.w,),
                                          Text('US-Bangla Airlines',style: TextStyle(color: Colors.white,fontSize: 17.sp),)
                                        ],
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: (){
                                      otherServiceController.airSite=2;
                                      homeController.airstate.value=1;
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Row(
                                        children: [
                                          Image.asset('images/novoair.png'),
                                          SizedBox(width: 5.w,),
                                          Text('Novoair',style: TextStyle(color: Colors.white,fontSize: 17.sp),)
                                        ],
                                      ),
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
