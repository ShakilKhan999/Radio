import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:relaks_media/screens/live_radio_screen.dart';
import 'package:relaks_media/screens/maintaince_screen.dart';

import '../controller/home_controller.dart';
import '../controller/radio_controller.dart';
import '../utils/glass_box.dart';

class StationScreen extends StatelessWidget {
  static const String routeName = '/station';

  const StationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    homeController.getImageUrl();
    RadioController radioController = Get.put(RadioController());
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration:  BoxDecoration(
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
                        child: GlassBox(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: SizedBox(
                                height:
                                    MediaQuery.of(context).size.height - 380.h,
                                width: MediaQuery.of(context).size.width - 70.w,
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          'Switch Your Station',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'Poppins',
                                              fontSize: 25.sp),
                                        ),
                                        SizedBox(
                                          width: 15.w,
                                        ),
                                        Container(
                                          height: 30.h,
                                          width: 30.w,
                                          decoration: BoxDecoration(
                                            color: Colors.grey.shade700,
                                              border: Border.all(
                                                  color: Colors.transparent),
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: IconButton(
                                            icon: ImageIcon(
                                              AssetImage('images/close.png'),
                                              color: Colors.white,
                                              size: 20.sp,
                                            ),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 30.h,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width -
                                              240.w,
                                          height: 50.h,
                                          decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                colors: [
                                                  Colors.grey.shade500,
                                                  Colors.grey.shade700,
                                                ],
                                                stops: [0.3, 1.0],
                                                begin: Alignment.topLeft,
                                                end: Alignment.bottomRight,
                                              ),
                                              border: Border.all(
                                                  color: Colors.transparent),
                                              borderRadius:
                                                  BorderRadius.circular(25)),
                                          child: TextButton(
                                              onPressed: () {
                                                radioController.selectedChannel.value=0;
                                                radioController.selectedRadioLink.value='https://s3.voscast.com:9893/live';
                                                 Get.off(LiveRadioScreen(),
                                                transition:
                                                    Transition.noTransition);
                                              },
                                              child: Row(
                                                children: [
                                                  Image.asset(
                                                    'images/Relaks Radio.png',
                                                    height: 30.h,
                                                    width: 35.w,
                                                  ),
                                                  Text(
                                                    'Relaks Radio',
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  )
                                                ],
                                              )),
                                        ),
                                        SizedBox(
                                          width: 5.w,
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width -
                                              240.w,
                                          decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                colors: [
                                                  Colors.grey.shade500,
                                                  Colors.grey.shade700,
                                                ],
                                                stops: [0.3, 1.0],
                                                begin: Alignment.topLeft,
                                                end: Alignment.bottomRight,
                                              ),
                                              border: Border.all(
                                                  color: Colors.transparent),
                                              borderRadius:
                                                  BorderRadius.circular(25)),
                                          child: TextButton(
                                              onPressed: () {
                                                radioController.selectedChannel.value=1;
                                                radioController.selectedRadioLink.value='https://s3.voscast.com:9893/live';
                                                Get.off(LiveRadioScreen());
                                              },
                                              child: Row(
                                                children: [
                                                  Image.asset(
                                                    'images/Relaks Radio Bangla.png',
                                                    height: 30.h,
                                                    width: 35.w,
                                                  ),
                                                  Text(
                                                    'Relaks Radio \nBangla',
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  )
                                                ],
                                              )),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width -
                                              240.w,
                                          decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                colors: [
                                                  Colors.grey.shade500,
                                                  Colors.grey.shade700,
                                                ],
                                                stops: [0.3, 1.0],
                                                begin: Alignment.topLeft,
                                                end: Alignment.bottomRight,
                                              ),
                                              border: Border.all(
                                                  color: Colors.transparent),
                                              borderRadius:
                                                  BorderRadius.circular(25)),
                                          child: TextButton(
                                              onPressed: () {
                                                radioController.selectedChannel.value=2;
                                                radioController.selectedRadioLink.value='https://s1.voscast.com:11349/live';
                                                Get.off(LiveRadioScreen());
                                              },
                                              child: Row(
                                                children: [
                                                  Image.asset(
                                                    'images/Relaks Radio Lanka.png',
                                                    height: 30.h,
                                                    width: 35.w,
                                                  ),
                                                  Text(
                                                    'Relaks Radio \nLanka',
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  )
                                                ],
                                              )),
                                        ),
                                        SizedBox(
                                          width: 5.w,
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width -
                                              240.w,
                                          decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                colors: [
                                                  Colors.grey.shade500,
                                                  Colors.grey.shade700,
                                                ],
                                                stops: [0.3, 1.0],
                                                begin: Alignment.topLeft,
                                                end: Alignment.bottomRight,
                                              ),
                                              border: Border.all(
                                                  color: Colors.transparent),
                                              borderRadius:
                                                  BorderRadius.circular(25)),
                                          child: TextButton(
                                              onPressed: () {
                                                radioController.selectedChannel.value=3;
                                                radioController.selectedRadioLink.value='https://s3.voscast.com:10859/live';
                                                Get.off(LiveRadioScreen());
                                              },
                                              child: Row(
                                                children: [
                                                  Image.asset(
                                                    'images/Relaks Radio EU.png',
                                                    height: 30.h,
                                                    width: 35.w,
                                                  ),
                                                  Text(
                                                    'Relaks Radio \nEU',
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  )
                                                ],
                                              )),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width -
                                              240.w,
                                          decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                colors: [
                                                  Colors.grey.shade500,
                                                  Colors.grey.shade700,
                                                ],
                                                stops: [0.3, 1.0],
                                                begin: Alignment.topLeft,
                                                end: Alignment.bottomRight,
                                              ),
                                              border: Border.all(
                                                  color: Colors.transparent),
                                              borderRadius:
                                                  BorderRadius.circular(25)),
                                          child: TextButton(
                                              onPressed: () {
                                                radioController.selectedChannel.value=4;
                                                radioController.selectedRadioLink.value='https://s3.voscast.com:10885/live';
                                                Get.off(LiveRadioScreen());
                                              },
                                              child: Row(
                                                children: [
                                                  Image.asset(
                                                    'images/Relaks Radio Tamil.png',
                                                    height: 30.h,
                                                    width: 35.w,
                                                  ),
                                                  Text(
                                                    'Relaks Radio \nTamil',
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  )
                                                ],
                                              )),
                                        ),
                                        SizedBox(
                                          width: 5.w,
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width -
                                              240.w,
                                          decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                colors: [
                                                  Colors.grey.shade500,
                                                  Colors.grey.shade700,
                                                ],
                                                stops: [0.3, 1.0],
                                                begin: Alignment.topLeft,
                                                end: Alignment.bottomRight,
                                              ),
                                              border: Border.all(
                                                  color: Colors.transparent),
                                              borderRadius:
                                                  BorderRadius.circular(25)),
                                          child: TextButton(
                                              onPressed: () {
                                                radioController.selectedChannel.value=5;
                                                radioController.selectedRadioLink.value='https://s3.voscast.com:10769/live';
                                                Get.off(LiveRadioScreen());
                                              },
                                              child: Row(
                                                children: [
                                                  Image.asset(
                                                    'images/Relaks Radio India.png',
                                                    height: 30.h,
                                                    width: 35.w,
                                                  ),
                                                  Text(
                                                    'Relaks Radio \nIndia',
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  )
                                                ],
                                              )),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width -
                                              240.w,
                                          decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                colors: [
                                                  Colors.grey.shade500,
                                                  Colors.grey.shade700,
                                                ],
                                                stops: [0.3, 1.0],
                                                begin: Alignment.topLeft,
                                                end: Alignment.bottomRight,
                                              ),
                                              border: Border.all(
                                                  color: Colors.transparent),
                                              borderRadius:
                                                  BorderRadius.circular(25)),
                                          child: TextButton(
                                              onPressed: () {
                                                radioController.selectedChannel.value=6;
                                                radioController.selectedRadioLink.value='https://s3.voscast.com:10821/live';
                                                Get.off(LiveRadioScreen());
                                              },
                                              child: Row(
                                                children: [
                                                  Image.asset(
                                                    'images/Relaks Radio Pakistan.png',
                                                    height: 30.h,
                                                    width: 35.w,
                                                  ),
                                                  Text(
                                                    "Relaks Radio \nPakistan",
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  )
                                                ],
                                              )),
                                        ),
                                        SizedBox(
                                          width: 5.w,
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width -
                                              235.w,
                                          decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                colors: [
                                                  Colors.grey.shade500,
                                                  Colors.grey.shade700,
                                                ],
                                                stops: [0.3, 1.0],
                                                begin: Alignment.topLeft,
                                                end: Alignment.bottomRight,
                                              ),
                                              border: Border.all(
                                                  color: Colors.transparent),
                                              borderRadius:
                                                  BorderRadius.circular(25)),
                                          child: TextButton(
                                              onPressed: () {
                                                radioController.selectedChannel.value=7;
                                              },
                                              child: Row(
                                                children: [
                                                  Image.asset(
                                                    'images/Relaks Tv.png',
                                                    height: 30,
                                                    width: 35,
                                                  ),
                                                  Text(
                                                    'Relaks Radio \nTV',
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  )
                                                ],
                                              )),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width -
                                              240.w,
                                          decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                colors: [
                                                  Colors.grey.shade500,
                                                  Colors.grey.shade700,
                                                ],
                                                stops: [0.3, 1.0],
                                                begin: Alignment.topLeft,
                                                end: Alignment.bottomRight,
                                              ),
                                              border: Border.all(
                                                  color: Colors.transparent),
                                              borderRadius:
                                                  BorderRadius.circular(25)),
                                          child: TextButton(
                                              onPressed: () {
                                                radioController.selectedChannel.value=8;
                                                radioController.selectedRadioLink.value='https://s3.voscast.com:10071/live';
                                                Get.off(LiveRadioScreen());
                                              },
                                              child: Row(
                                                children: [
                                                  Image.asset(
                                                    'images/Relaks Radio Music.png',
                                                    height: 30,
                                                    width: 35,
                                                  ),
                                                  Text(
                                                    'Relaks Radio \nMusic',
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  )
                                                ],
                                              )),
                                        ),
                                        SizedBox(
                                          width: 5.w,
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width -
                                              235.w,
                                          decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                colors: [
                                                  Colors.grey.shade500,
                                                  Colors.grey.shade700,
                                                ],
                                                stops: [0.3, 1.0],
                                                begin: Alignment.topLeft,
                                                end: Alignment.bottomRight,
                                              ),
                                              border: Border.all(
                                                  color: Colors.transparent),
                                              borderRadius:
                                                  BorderRadius.circular(25)),
                                          child: TextButton(
                                              onPressed: () {
                                                radioController.selectedChannel.value=9;
                                              },
                                              child: Row(
                                                children: [
                                                  Image.asset(
                                                    'images/Relaks News 24.png',
                                                    height: 30.h,
                                                    width: 35.w,
                                                  ),
                                                  Text(
                                                    'Relaks News \n24',
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  )
                                                ],
                                              )),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width -
                                              240.w,
                                          decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                colors: [
                                                  Colors.grey.shade500,
                                                  Colors.grey.shade700,
                                                ],
                                                stops: [0.3, 1.0],
                                                begin: Alignment.topLeft,
                                                end: Alignment.bottomRight,
                                              ),
                                              border: Border.all(
                                                  color: Colors.transparent),
                                              borderRadius:
                                                  BorderRadius.circular(25)),
                                          child: TextButton(
                                              onPressed: () {
                                                radioController.selectedChannel.value=10;
                                              },
                                              child: Row(
                                                children: [
                                                  Image.asset(
                                                    'images/Relaks Star.png',
                                                    height: 30.h,
                                                    width: 35.w,
                                                  ),
                                                  Text(
                                                    'Relaks Star',
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  )
                                                ],
                                              )),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    Container(
                                      height: 40.h,
                                      width: 287.w,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.transparent),
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: ElevatedButton(
                                          onPressed: () {
                                            if(radioController.selectedChannel.value==0 ||radioController.selectedChannel.value==7
                                            || radioController.selectedChannel.value==9 || radioController.selectedChannel.value==10)
                                              {
                                                Navigator.pushNamed(context,
                                                    MaintainceScreen.routeName);
                                              }
                                            else{
                                              Get.back();
                                            }

                                          },
                                          style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(25),
                                              ),
                                              backgroundColor:
                                                  Color(0xffffEA1C24)),
                                          child: Text(
                                            'Switch your Station',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18.sp),
                                          )),
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
