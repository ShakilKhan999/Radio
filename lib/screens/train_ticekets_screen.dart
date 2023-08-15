import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controller/home_controller.dart';
import '../utils/glass_box.dart';

class TrainTicketsScreen extends StatelessWidget {
  static const String routeName='/traintickets';
  const TrainTicketsScreen({super.key});

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
                  SizedBox(height: 50.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding:  EdgeInsets.only(left: 15.0),
                        child: IconButton( onPressed: () {
                          homeController.trainstate.value=0;
                        }, icon:Icon(Icons.arrow_back,color: Colors.white,)),
                      ),
                      Padding(
                        padding:  EdgeInsets.only(left: 110.0.sp),
                        child: Text('Train',style: TextStyle(color: Colors.white,fontSize: 30.sp),),
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
                                height: MediaQuery.of(context).size.height-300.h,
                                width:MediaQuery.of(context).size.width-80.w,
                                child: Column(
                                  children: [
                                    Image.asset('images/train_tickets.png')
                                  ],
                                )),
                          ),

                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 40.h,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
