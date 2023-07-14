import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:relaks_media/screens/train_ticekets_screen.dart';

import '../controller/home_controller.dart';
import '../utils/glass_box.dart';

class TrainScreen extends StatelessWidget {
  static const String routeName='/train';
  const TrainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    return Obx(()=>homeController.trainstate.value==1?TrainTicketsScreen():SafeArea(
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
                              height: MediaQuery.of(context).size.height-600,
                              width:MediaQuery.of(context).size.width-80,
                              child: Column(
                                children: [
                                  Text('Train',style: TextStyle(color: Colors.white,fontSize: 30.sp),),
                                  GestureDetector(
                                    onTap: (){
                                      homeController.trainstate.value=1;
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Row(
                                        children: [
                                          Image.asset('images/train.png'),
                                          SizedBox(width: 5.w,),
                                          Text('Bangladesh Railway',style: TextStyle(color: Colors.white,fontSize: 17.sp),)
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
