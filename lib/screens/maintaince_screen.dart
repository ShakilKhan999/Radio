import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controller/home_controller.dart';
import '../utils/glass_box.dart';

class MaintainceScreen extends StatelessWidget {
  static const String routeName='/maintaince';
  const MaintainceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    homeController.getImageUrl();
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(homeController.bgImage.value==''?'https://upload.wikimedia.org/wikipedia/commons/thumb/5/50/Black_colour.jpg/640px-Black_colour.jpg'
                  :homeController.bgImage.value),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            color: Colors.black.withOpacity(0.8),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15.sp),
                        child: Container(
                          color: Colors.black.withOpacity(0.7),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Container(
                                height:
                                MediaQuery.of(context).size.height - 520,
                                width: MediaQuery.of(context).size.width - 80,
                                child: Column(
                                  children: [
                                   Row(
                                     mainAxisAlignment: MainAxisAlignment.spaceAround,
                                     children: [
                                       Text(''),
                                       Padding(
                                         padding:  EdgeInsets.only(left:210.sp),
                                         child: Icon(Icons.cancel_outlined,color: Colors.white,),
                                       )
                                     ],
                                   ),
                                    SizedBox(
                                      height: 30.h,
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,

                                      children: [
                                        Image.asset('images/alert.png',height: 70.h,width: 70.w,),
                                        Text('Under',style: TextStyle(fontSize: 28.sp,color: Colors.white,fontWeight: FontWeight.bold),),
                                        Text('Maintenance',style: TextStyle(fontSize: 28.sp,color: Colors.white,fontWeight: FontWeight.bold),),
                                        Center(child: Text('The station you are currently observing is undergoing maintenance and will be operational again shortly.',textAlign: TextAlign.center,style: TextStyle(fontSize: 18.sp,color: Colors.grey,fontWeight: FontWeight.bold),)),

                                      ],
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
      ),
    );
  }
}
