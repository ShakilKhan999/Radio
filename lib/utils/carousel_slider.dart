import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:relaks_media/models/upcoming_show_model.dart';

class CarouselSliderWidget extends StatelessWidget {
  final List<UpcomingShow> objects;

  const CarouselSliderWidget({super.key, required this.objects});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: objects.map((object) {
        return ClipRRect(
          borderRadius:
          BorderRadius.circular(30),
          child: SizedBox(
            child: Card(
              color: Colors.grey.shade900,
              child: Column(
                children: [
                  Image.network(
                    object.image,
                    fit: BoxFit.cover,
                    height: 110.0, // Set your desired height
                    width: 328.0,  // Set your desired width
                  ),
                  SizedBox(height: 10.h,),
                  Row(
                    children: [
                      Padding(
                        padding:
                        EdgeInsets.only(
                            left: 8.0),
                        child: Text(
                          object.title,
                          style: TextStyle(
                            fontSize: 20.sp,
                            color: Colors.white,
                            fontWeight:
                            FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 10.0.sp),
                    child: Row(
                      children: [
                        Text(
                          'Friday',
                          style: TextStyle(
                              fontSize: 15.sp,
                              color:
                              Colors.white),
                        ),
                        Text(
                          ' | ',
                          style: TextStyle(
                              fontSize: 15.sp,
                              color:
                              Colors.white),
                        ),
                        Container(
                          child: Image.asset(
                            'images/bdflag.png',
                            height: 8.h,
                            width: 12.w,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Text(
                          ' 9:00 AM ',
                          style: TextStyle(
                              fontSize: 15.sp,
                              color:
                              Colors.white),
                        ),
                        Container(
                          child: Image.asset(
                            'images/usflag.png',
                            height: 8.h,
                            width: 12.w,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Text(
                          ' 4:00 AM',
                          style: TextStyle(
                              fontSize: 15.sp,
                              color:
                              Colors.white),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      }).toList(),
      options: CarouselOptions(
        enlargeCenterPage: true,
        autoPlay: true,
        aspectRatio: 16 / 9,
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        viewportFraction: 0.8,
      ),
    );
  }
}