import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:relaks_media/controller/radio_controller.dart';
import 'package:relaks_media/global/my_app_bar.dart';
import 'package:relaks_media/global/my_bottom_nav_bat.dart';
import 'package:relaks_media/screens/bottomnevigation.dart';
import 'package:relaks_media/utils/main_drawer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../controller/home_controller.dart';
// import '../utils/glass_box.dart';

class LiveRadioScreen extends StatelessWidget {
  const LiveRadioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    RadioController radioController = Get.put(RadioController());
    final AudioPlayer _audioPlayer = AudioPlayer();
    return WillPopScope(
      onWillPop: () async {
        Get.offAll(BottomNavigation());
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        drawer: const MainDrawer(),
        appBar: myAppBar(context, radioController),
        body: Container(
          color: Colors.black,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child: IconButton(
                        onPressed: () {
                          // homeController.homestate.value = 0;
                          Get.offAll(BottomNavigation(),
                                  transition: Transition.noTransition);
                        },
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 40.0.sp),
                      child: Row(
                        children: [
                          Obx(()=>Text(
                            radioController.stations[radioController.selectedstationIndex.value].name.length>21?
                            radioController.stations[radioController.selectedstationIndex.value].name.substring(0,21)+'..':
                            radioController.stations[radioController.selectedstationIndex.value].name,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.sp,
                                fontFamily: 'Poppins'),
                          )),
                          IconButton(
                              onPressed: () {
                                homeController.liveRadio.value = 1;
                                homeController.homestate.value = 0;
                              },
                              icon: Icon(
                                Icons.keyboard_arrow_down_outlined,
                                color: Colors.white,
                                size: 30.sp,
                              ))
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15.h,
                ),
                Stack(
                  children: [
                    // Main image
                    Container(
                      height: 220.h,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Image.network(radioController.stations[radioController.selectedstationIndex.value].channelLiveImage),
                    ),
                    // Small image overlay - Positioned 1
                    Positioned(
                      top: 0,
                      left: 30,
                      child: ElevatedButton(
                        onPressed: () {
                          homeController.homestate.value = 8;
                        },
                        style:
                            ElevatedButton.styleFrom(backgroundColor: Colors.red),
                        child: Row(
                          children: [
                            Image.asset(
                              'images/live.png',
                              fit: BoxFit.cover,
                            ),
                            SizedBox(width: 3.w),
                            Text('Live'),
                          ],
                        ),
                      ),
                    ),
                    // Small image overlay - Positioned 2 (centered)
                    Positioned(
                      top: MediaQuery.of(context).size.width / 2 - 110.w,
                      left: MediaQuery.of(context).size.width / 2 - 40.w,
                      child: InkWell(
                        onTap:() async {
                          // radioController.playing.value=radioController.playing.value?
                          // radioController.playing.value==false:radioController.playing.value=true;
                          // await _audioPlayer.setUrl(
                          //   '${radioController.selectedRadioLink.value}',
                          // );
                          // await _audioPlayer.stop();
                          // radioController.playing.value==false? await _audioPlayer.stop():
                          // await _audioPlayer.stop().then((value) async => await _audioPlayer.play());
    
                          radioController.playRadio();
                        },
                        child: GlassBox(
                          radius: 100.0,
                          child: Container(
                              height: 80.h,
                              width: 80.w,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.transparent),
                                  borderRadius: BorderRadius.circular(100)),
                              child: Obx((){
                                return Center(
                                    child: Icon(
                                      radioController.playing.value?Icons.pause:Icons.play_arrow,
                                      color: Colors.white,
                                      size: 50,
                                    ));
                              })
                          ),
                        ),
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
                      child: GlassBox(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: SingleChildScrollView(
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height - 520.h,
                              width: MediaQuery.of(context).size.width - 80.w,
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            'images/radio_screen_chat_image.png',
                                            height: 45.h,
                                            width: 45.w,
                                          ),
                                          SizedBox(
                                            width: 5.w,
                                          ),
                                          Expanded(
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    height: 30.h,
                                                    width: 90.w,
                                                    decoration: BoxDecoration(
                                                      gradient: LinearGradient(
                                                        colors: [
                                                          Colors.grey,
                                                          Colors.black
                                                        ],
                                                        begin: Alignment.centerLeft,
                                                        end: Alignment.centerRight,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(15),
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        'John Pierce',
                                                        style: TextStyle(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 15.sp,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.all(5.0),
                                                    child: FittedBox(
                                                      child: Text(
                                                        'Thanks for being so awesome. High',
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 15.sp,
                                                           ),
                                                        maxLines: 2,
                                                        overflow: TextOverflow.ellipsis,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            'images/radio_screen_chat_image.png',
                                            height: 45.h,
                                            width: 45.w,
                                          ),
                                          SizedBox(
                                            width: 5.w,
                                          ),
                                          Expanded(
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    height: 30.h,
                                                    width: 90.w,
                                                    decoration: BoxDecoration(
                                                      gradient: LinearGradient(
                                                        colors: [
                                                          Colors.grey,
                                                          Colors.black
                                                        ],
                                                        begin: Alignment.centerLeft,
                                                        end: Alignment.centerRight,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(15),
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        'John Pierce',
                                                        style: TextStyle(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 15.sp,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.all(5.0),
                                                    child: FittedBox(
                                                      child: Text(
                                                        'Thanks for being so awesome. High',
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 15.sp,
                                                            fontWeight: FontWeight.bold),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            'images/radio_screen_chat_image.png',
                                            height: 45.h,
                                            width: 45.w,
                                          ),
                                          SizedBox(
                                            width: 5.w,
                                          ),
                                          Expanded(
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    height: 30.h,
                                                    width: 90.w,
                                                    decoration: BoxDecoration(
                                                      gradient: LinearGradient(
                                                        colors: [
                                                          Colors.grey,
                                                          Colors.black
                                                        ],
                                                        begin: Alignment.centerLeft,
                                                        end: Alignment.centerRight,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(15),
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        'John Pierce',
                                                        style: TextStyle(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 15.sp,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.all(5.0),
                                                    child: FittedBox(
                                                      child: Text(
                                                        'Thanks for being so awesome. High',
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 15.sp,
                                                            fontWeight: FontWeight.bold),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 10.h,),
                                    Container(
                                      padding: EdgeInsets.symmetric(horizontal: 16),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: TextField(
                                              decoration: InputDecoration(
                                                hintText: 'Type your comment...',
                                                hintStyle: TextStyle(
                                                  color: Colors.white,
                                                ),
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(25),
                                                  borderSide: BorderSide.none,
                                                ),
                                                filled: true,
                                                fillColor: Colors.grey[800],
                                                contentPadding: EdgeInsets.symmetric(
                                                  vertical: 12,
                                                  horizontal: 20,
                                                ),
                                                suffixIcon: Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Container(
                                                    height: 8,
                                                    width: 8,
                                                    decoration: BoxDecoration(
                                                      gradient: LinearGradient(
                                                        colors: [
                                                          Colors.grey,
                                                          Colors.black
                                                        ],
                                                        begin: Alignment.centerLeft,
                                                        end: Alignment.centerRight,
                                                      ),
                                                      border: Border.all(
                                                          color: Colors.transparent),
                                                      borderRadius:
                                                          BorderRadius.circular(10),
                                                    ),
                                                    child: Icon(
                                                      Icons.send,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 5.w),

                                          Container(
                                            padding: EdgeInsets.all(4),
                                            height: 35,
                                              width: 35,
                                            decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                colors: [
                                                  Colors.grey,
                                                  Colors.black.withOpacity(0.7)
                                                ],
                                                begin: Alignment.centerLeft,
                                                end: Alignment.centerRight,
                                              ),
                                              border: Border.all(
                                                  color: Colors.transparent),
                                              borderRadius:
                                              BorderRadius.circular(15),
                                            ),
                                            child: GestureDetector(
                                              onTap: () {
                                                launch("tel://123456789");
                                              },
                                              child: const ImageIcon(
                                                  AssetImage('images/call.png'),
                                                  size: 5,color: Colors.white),
                                            ),
                                          ),
                                          SizedBox(width: 5.w),
                                          Container(
                                            padding: EdgeInsets.all(4),
                                            height: 35,
                                            width: 35,
                                            decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                colors: [
                                                  Colors.grey,
                                                  Colors.black
                                                ],
                                                begin: Alignment.centerLeft,
                                                end: Alignment.centerRight,
                                              ),
                                              border: Border.all(
                                                  color: Colors.transparent),
                                              borderRadius:
                                              BorderRadius.circular(15),
                                            ),
                                            child: GestureDetector(
                                              onTap: () {
                                                launch("https://wa.me/123456789");
                                              },
                                              child: ImageIcon(
                                                  AssetImage('images/whatsapp.png'),
                                                  size: 5.sp,color: Colors.white,),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
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
        bottomNavigationBar: myBottomNavBar(radioController),
      ),
    );
  }
}
