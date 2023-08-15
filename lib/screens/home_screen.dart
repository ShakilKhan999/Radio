import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:relaks_media/screens/career_screen.dart';
import 'package:relaks_media/screens/others_services_screen.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../controller/home_controller.dart';
import 'news_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName='/home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> images = [
    'images/image1.png',
    'images/image1.png',
    'images/image1.png',
  ];

  final List<String> imageList = [
    'images/Rectangle 119.png',
    'images/Rectangle 120.png',
    'images/Rectangle 121.png',
    'images/Rectangle 122.png',

  ];
  final List<String> buttonList = [
    'Suspense',
    'Romance',
    'System',
    'Fantasy',
    'Drama',
    'Drama',
    'Drama',
  ];

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    return Obx(()=>homeController.homestate.value==1?NewsScreen():homeController.homestate.value==6?
      OtherServicesScreen():homeController.homestate.value==5?CareerScreen():
      homeController.homestate.value==0?
      Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            CarouselSlider(
              items: images.map((imageUrl) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Card(
                    color:  Colors.grey.shade900,
                    child: Column(
                      children: [
                        Image.asset(
                          'images/image1.png',
                          fit: BoxFit.cover,
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: Text(
                                'Upcoming Show',
                                style: TextStyle(
                                  fontSize: 20.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 5.h,),
                        Padding(
                          padding: EdgeInsets.only(left: 8.0.sp),
                          child: Row(
                            children: [
                              Text(
                                'Friday',
                                style: TextStyle(fontSize: 20.sp,color: Colors.white),
                              ),
                              Text(
                                ' | ',
                                style: TextStyle(fontSize: 20.sp,color: Colors.white),
                              ),
                              Container(
                                child: Image.asset(
                                  'images/bdflag.png',
                                  height: 20.h,
                                  width: 20.w,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Text(
                                ' 9:00 AM ',
                                style: TextStyle(fontSize: 20.sp,color: Colors.white),
                              ),
                              Container(
                                child: Image.asset(
                                  'images/usflag.png',
                                  height: 20.h,
                                  width: 20.w,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Text(
                                ' 4:00 AM',
                                style: TextStyle(fontSize: 20.sp,color: Colors.white),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }).toList(),
              options: CarouselOptions(
                height: 240.h,
                enlargeCenterPage: true,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                pauseAutoPlayOnTouch: true,
                viewportFraction: 0.8,
              ),
            ),
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: Row(
                    children: [
                      Image.asset(
                        'images/live.png',
                        fit: BoxFit.cover,
                      ),
                      SizedBox(width: 3.w),
                      Text('Live Radio'),
                    ],
                  ),
                ),
                SizedBox(width: 5.w),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                  child: Row(
                    children: [
                      Image.asset(
                        'images/info.png',
                        fit: BoxFit.cover,
                      ),
                      SizedBox(width: 3.w),
                      Text(
                        'More Info',
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Card(
                  color: Colors.grey.shade900,
                  child: Column(
                    children: [
                      SizedBox(height: 15.h,),
                      Padding(
                        padding:  EdgeInsets.only(right: 250.sp),
                        child: Text('Relaks Top 50',style: TextStyle(color: Colors.white,fontSize: 20.sp),),
                      ),
                      Container(
                        height: 165.h,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: imageList.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.all(5),
                              child: Column(
                                children: [
                                  Image.asset(imageList[index],fit: BoxFit.cover,height: 100.h,width: 150.w,),
                                  SizedBox(height: 10.h,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Eajdiger Hero',style: TextStyle(fontSize: 17.sp,color: Colors.white),),
                                      Padding(
                                        padding: EdgeInsets.only(left: 8.0.sp),
                                        child: Row(
                                          crossAxisAlignment:CrossAxisAlignment.start ,
                                          children: [
                                            Icon(Icons.play_circle_fill_outlined),
                                            Text(
                                              '1.4K Play',
                                              style: TextStyle(fontSize: 15.sp,color: Colors.white.withOpacity(0.4)),
                                            ),

                                          ],
                                        ),
                                      )
                                    ],
                                  )

                                ],
                              ),
                            );
                          },
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Card(
                  color: Colors.grey.shade900,
                  child: Column(
                    children: [
                      SizedBox(height: 15.h,),
                      Padding(
                        padding:  EdgeInsets.only(right: 250.sp),
                        child: Text('Trending',style: TextStyle(color: Colors.white,fontSize: 20.sp),),
                      ),
                      Container(
                        height: 165.h,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: imageList.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.all(5),
                              child: Column(
                                children: [
                                  Image.asset(imageList[index],fit: BoxFit.cover,height: 100.h,width: 150.w,),
                                  SizedBox(height: 10.h,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Eajdiger Hero',style: TextStyle(fontSize: 17.sp,color: Colors.white),),
                                      Padding(
                                        padding: EdgeInsets.only(left: 8.0.sp),
                                        child: Row(
                                          crossAxisAlignment:CrossAxisAlignment.start ,
                                          children: [
                                            Icon(Icons.play_circle_fill_outlined),
                                            Text(
                                              '1.4K Play',
                                              style: TextStyle(fontSize: 15.sp,color: Colors.white.withOpacity(0.4)),
                                            ),

                                          ],
                                        ),
                                      )
                                    ],
                                  )

                                ],
                              ),
                            );
                          },
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                  color: Colors.grey.shade900,
                  child: Column(
                    children: [
                      SizedBox(height: 15.h,),
                      Padding(
                        padding:  EdgeInsets.only(right: 200.sp),
                        child: Text('Relaks Radio Live',style: TextStyle(color: Colors.white,fontSize: 20.sp),),
                      ),
                      SizedBox(height: 10.h,),
                      Container(
                        height: 150.h,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(border: Border.all(),borderRadius: BorderRadius.circular(15)),
                        child: YoutubePlayerBuilder(
                          player: YoutubePlayer(
                            controller: YoutubePlayerController(
                              initialVideoId: 'G9F8VtqNhzo',
                              flags: YoutubePlayerFlags(
                                autoPlay: true,
                                mute: false,
                              ),
                            ),
                          ),
                          builder: (context, player) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                player,
                                SizedBox(height: 16.0),
                                Text(
                                  '',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 30.h,)
                    ],
                  )
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Card(
                  color: Colors.grey.shade900,
                  child: Column(
                    children: [
                      SizedBox(height: 15.h,),
                      Container(
                        height: 40.h,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: buttonList.length,
                          itemBuilder: (context, index) {
                            // Define individual gradients for each button
                            List<Gradient> buttonGradients = [
                              LinearGradient(
                                colors: [Colors.lightBlueAccent, Colors.purpleAccent],
                                stops: [0.0, 1.0],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                              LinearGradient(
                                colors: [Colors.green, Colors.blue],
                                stops: [0.0, 1.0],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                              LinearGradient(
                                colors: [Colors.green, Colors.blue],
                                stops: [0.0, 1.0],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                              LinearGradient(
                                colors: [Colors.green, Colors.blue],
                                stops: [0.0, 1.0],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                              // Add more gradients for additional buttons if needed
                            ];

                            // Ensure the index is within the range of buttonGradients list
                            final gradientIndex = index % buttonGradients.length;

                            return Container(
                              margin: EdgeInsets.symmetric(horizontal: 5.w),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Container(
                                  decoration: BoxDecoration(
                                    gradient: buttonGradients[gradientIndex], // Use individual gradient for each button
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.transparent,
                                      elevation: 0,
                                      padding: EdgeInsets.all(10),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      textStyle: TextStyle(fontSize: 16.sp),
                                    ),
                                    child: Text(
                                      buttonList[index],
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),

                      // Rest of the code...
                    ],
                  ),
                ),
              ),
            ),




          ],
        ),
      ),
    ):

      Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            CarouselSlider(
              items: images.map((imageUrl) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Card(
                    color:  Colors.grey.shade900,
                    child: Column(
                      children: [
                        Image.asset(
                          'images/image1.png',
                          fit: BoxFit.cover,
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: Text(
                                'Upcoming Show',
                                style: TextStyle(
                                  fontSize: 20.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 5.h,),
                        Padding(
                          padding: EdgeInsets.only(left: 8.0.sp),
                          child: Row(
                            children: [
                              Text(
                                'Friday',
                                style: TextStyle(fontSize: 20.sp,color: Colors.white),
                              ),
                              Text(
                                ' | ',
                                style: TextStyle(fontSize: 20.sp,color: Colors.white),
                              ),
                              Container(
                                child: Image.asset(
                                  'images/bdflag.png',
                                  height: 20.h,
                                  width: 20.w,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Text(
                                ' 9:00 AM ',
                                style: TextStyle(fontSize: 20.sp,color: Colors.white),
                              ),
                              Container(
                                child: Image.asset(
                                  'images/usflag.png',
                                  height: 20.h,
                                  width: 20.w,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Text(
                                ' 4:00 AM',
                                style: TextStyle(fontSize: 20.sp,color: Colors.white),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }).toList(),
              options: CarouselOptions(
                height: 240.h,
                enlargeCenterPage: true,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                pauseAutoPlayOnTouch: true,
                viewportFraction: 0.8,
              ),
            ),
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: Row(
                    children: [
                      Image.asset(
                        'images/live.png',
                        fit: BoxFit.cover,
                      ),
                      SizedBox(width: 3.w),
                      Text('Live Radio'),
                    ],
                  ),
                ),
                SizedBox(width: 5.w),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                  child: Row(
                    children: [
                      Image.asset(
                        'images/info.png',
                        fit: BoxFit.cover,
                      ),
                      SizedBox(width: 3.w),
                      Text(
                        'More Info',
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Card(
                  color: Colors.grey.shade900,
                  child: Column(
                    children: [
                      SizedBox(height: 15.h,),
                      Padding(
                        padding:  EdgeInsets.only(right: 250.sp),
                        child: Text('Relaks Top 50',style: TextStyle(color: Colors.white,fontSize: 20.sp),),
                      ),
                      Container(
                        height: 165.h,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: imageList.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.all(5),
                              child: Column(
                                children: [
                                  Image.asset(imageList[index],fit: BoxFit.cover,height: 100.h,width: 150.w,),
                                  SizedBox(height: 10.h,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Eajdiger Hero',style: TextStyle(fontSize: 17.sp,color: Colors.white),),
                                      Padding(
                                        padding: EdgeInsets.only(left: 8.0.sp),
                                        child: Row(
                                          crossAxisAlignment:CrossAxisAlignment.start ,
                                          children: [
                                            Icon(Icons.play_circle_fill_outlined),
                                            Text(
                                              '1.4K Play',
                                              style: TextStyle(fontSize: 15.sp,color: Colors.white.withOpacity(0.4)),
                                            ),

                                          ],
                                        ),
                                      )
                                    ],
                                  )

                                ],
                              ),
                            );
                          },
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Card(
                  color: Colors.grey.shade900,
                  child: Column(
                    children: [
                      SizedBox(height: 15.h,),
                      Padding(
                        padding:  EdgeInsets.only(right: 250.sp),
                        child: Text('Trending',style: TextStyle(color: Colors.white,fontSize: 20.sp),),
                      ),
                      Container(
                        height: 165.h,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: imageList.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.all(5),
                              child: Column(
                                children: [
                                  Image.asset(imageList[index],fit: BoxFit.cover,height: 100.h,width: 150.w,),
                                  SizedBox(height: 10.h,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Eajdiger Hero',style: TextStyle(fontSize: 17.sp,color: Colors.white),),
                                      Padding(
                                        padding: EdgeInsets.only(left: 8.0.sp),
                                        child: Row(
                                          crossAxisAlignment:CrossAxisAlignment.start ,
                                          children: [
                                            Icon(Icons.play_circle_fill_outlined),
                                            Text(
                                              '1.4K Play',
                                              style: TextStyle(fontSize: 15.sp,color: Colors.white.withOpacity(0.4)),
                                            ),

                                          ],
                                        ),
                                      )
                                    ],
                                  )

                                ],
                              ),
                            );
                          },
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                  color: Colors.grey.shade900,
                  child: Column(
                    children: [
                      SizedBox(height: 15.h,),
                      Padding(
                        padding:  EdgeInsets.only(right: 200.sp),
                        child: Text('Relaks Radio Live',style: TextStyle(color: Colors.white,fontSize: 20.sp),),
                      ),
                      SizedBox(height: 10.h,),
                      Container(
                        height: 150.h,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(border: Border.all(),borderRadius: BorderRadius.circular(15)),
                        child: YoutubePlayerBuilder(
                          player: YoutubePlayer(
                            controller: YoutubePlayerController(
                              initialVideoId: 'G9F8VtqNhzo',
                              flags: YoutubePlayerFlags(
                                autoPlay: true,
                                mute: false,
                              ),
                            ),
                          ),
                          builder: (context, player) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                player,
                                SizedBox(height: 16.0),
                                Text(
                                  '',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 30.h,)
                    ],
                  )
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Card(
                  color: Colors.grey.shade900,
                  child: Column(
                    children: [
                      SizedBox(height: 15.h,),
                      Container(
                        height: 40.h,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: buttonList.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.symmetric(horizontal: 5.w),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Container(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Colors.blue,
                                        Colors.green,
                                      ],
                                      stops: [0.0, 1.0],
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                    ),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.transparent,
                                      elevation: 0,
                                      padding: EdgeInsets.all(10),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      textStyle: TextStyle(fontSize: 16.sp),
                                    ),
                                    child: Text(
                                      buttonList[index],
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),


                      SizedBox(height: 10.h,),
                      Container(
                        height: 165.h,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: imageList.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.all(5),
                              child: Column(
                                children: [
                                  Image.asset(imageList[index],fit: BoxFit.cover,height: 100.h,width: 150.w,),
                                  SizedBox(height: 10.h,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Eajdiger Hero',style: TextStyle(fontSize: 17.sp,color: Colors.white),),
                                      Padding(
                                        padding: EdgeInsets.only(left: 8.0.sp),
                                        child: Row(
                                          crossAxisAlignment:CrossAxisAlignment.start ,
                                          children: [
                                            Icon(Icons.play_circle_fill_outlined),
                                            Text(
                                              '1.4K Play',
                                              style: TextStyle(fontSize: 15.sp,color: Colors.white.withOpacity(0.4)),
                                            ),

                                          ],
                                        ),
                                      )
                                    ],
                                  )

                                ],
                              ),
                            );
                          },
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    ));
  }
}
