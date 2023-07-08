import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              color: Colors.black,
              child: Column(

                children: [
                  CarouselSlider(
                    items: images.map((imageUrl) {
                      return Column(
                        children: [
                          Card(
                              child: Column(
                            children: [
                              Image.asset(imageUrl, fit: BoxFit.cover,height: 150,),
                              Column(

                                children: [
                                  Padding(
                                    padding:  EdgeInsets.only(right: 120.0.sp),
                                    child: Text('Upcoming Show',style: TextStyle(fontSize: 20.sp),),
                                  ),
                                  Text('Friday',style: TextStyle(fontSize: 15.sp),),
                                ],
                              )
                            ],
                          )),
                          // SizedBox(height: 10),
                        ],
                      );
                    }).toList(),
                    options: CarouselOptions(
                      height: 250,
                      enlargeCenterPage: true,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 3),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      pauseAutoPlayOnTouch: true,
                      viewportFraction: 0.8,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
