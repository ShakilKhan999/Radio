import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:relaks_media/screens/maintaince_screen.dart';

import '../utils/glass_box.dart';

class StationScreen extends StatelessWidget {
  static const String routeName='/station';
  const StationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/splash.png'),
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
                                MediaQuery.of(context).size.height - 400,
                                width: MediaQuery.of(context).size.width - 80,
                                child: Column(
                                  children: [
                                    Text(
                                      'Reset Password',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 30.sp),
                                    ),
                                    SizedBox(
                                      height: 30.h,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          width:
                                          MediaQuery.of(context).size.width -
                                              240.w,

                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.transparent),
                                              borderRadius:
                                              BorderRadius.circular(20)),
                                          child: ElevatedButton(
                                              onPressed: () {},
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.transparent,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(15),
                                                ),
                                              ),
                                              child: Row(
                                                children: [
                                                  Image.asset('images/Relaks Radio EU.png',height: 20,width: 25,),
                                                  Text('Relaks Radio',style: TextStyle(color: Colors.white),)
                                                ],
                                              )
                                          ),
                                        ),
                                        Container(
                                          width:
                                          MediaQuery.of(context).size.width -
                                              240.w,

                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.transparent),
                                              borderRadius:
                                              BorderRadius.circular(20)),
                                          child: ElevatedButton(
                                              onPressed: () {},
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.transparent,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(15),
                                                ),
                                              ),
                                              child: Row(
                                                children: [
                                                  Image.asset('images/Relaks Radio Bangla Logo Png.png',height: 20,width: 25,),
                                                  Text('Relaks Radio \nBangla',style: TextStyle(color: Colors.white),)
                                                ],
                                              )
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          width:
                                          MediaQuery.of(context).size.width -
                                              240.w,

                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.transparent),
                                              borderRadius:
                                              BorderRadius.circular(20)),
                                          child: ElevatedButton(
                                              onPressed: () {},
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.transparent,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(15),
                                                ),
                                              ),
                                              child: Row(
                                                children: [
                                                  Image.asset('images/Relaks Radio Lanka.png',height: 20,width: 25,),
                                                  Text('Relaks Radio \nLanka',style: TextStyle(color: Colors.white),)
                                                ],
                                              )
                                          ),
                                        ),
                                        Container(
                                          width:
                                          MediaQuery.of(context).size.width -
                                              240.w,

                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.transparent),
                                              borderRadius:
                                              BorderRadius.circular(20)),
                                          child: ElevatedButton(
                                              onPressed: () {},
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.transparent,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(15),
                                                ),
                                              ),
                                              child: Row(
                                                children: [
                                                  Image.asset('images/Relaks Radio EU.png',height: 20,width: 25,),
                                                  Text('Relaks Radio \nEU',style: TextStyle(color: Colors.white),)
                                                ],
                                              )
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          width:
                                          MediaQuery.of(context).size.width -
                                              240.w,

                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.transparent),
                                              borderRadius:
                                              BorderRadius.circular(20)),
                                          child: ElevatedButton(
                                              onPressed: () {},
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.transparent,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(15),
                                                ),
                                              ),
                                              child: Row(
                                                children: [
                                                  Image.asset('images/Relaks Radio EU.png',height: 20,width: 25,),
                                                  Text('Relaks Radio \nTamil',style: TextStyle(color: Colors.white),)
                                                ],
                                              )
                                          ),
                                        ),
                                        Container(
                                          width:
                                          MediaQuery.of(context).size.width -
                                              240.w,

                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.transparent),
                                              borderRadius:
                                              BorderRadius.circular(20)),
                                          child: ElevatedButton(
                                              onPressed: () {},
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.transparent,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(15),
                                                ),
                                              ),
                                              child: Row(
                                                children: [
                                                  Image.asset('images/Relaks Radio India Png.png',height: 20,width: 25,),
                                                  Text('Relaks Radio \nIndia',style: TextStyle(color: Colors.white),)
                                                ],
                                              )
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          width:
                                          MediaQuery.of(context).size.width -
                                              240.w,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.transparent),
                                              borderRadius:
                                              BorderRadius.circular(20)),
                                          child: ElevatedButton(
                                              onPressed: () {},
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.transparent,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(15),
                                                ),
                                              ),
                                              child: Row(
                                                children: [
                                                  Image.asset('images/Relaks Radio Pakistan.png',height: 20,width: 25,),
                                                  Text("Relaks Radio \nPakistan",style: TextStyle(color: Colors.white),)
                                                ],
                                              )
                                          ),
                                        ),
                                        Container(
                                          width:
                                          MediaQuery.of(context).size.width -
                                              240.w,

                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.transparent),
                                              borderRadius:
                                              BorderRadius.circular(20)),
                                          child: ElevatedButton(
                                              onPressed: () {},
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.transparent,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(15),
                                                ),
                                              ),
                                              child: Row(
                                                children: [
                                                  Image.asset('images/Relaks tv.png',height: 20,width: 25,),
                                                  Text('Relaks Radio TV',style: TextStyle(color: Colors.white),)
                                                ],
                                              )
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          width:
                                          MediaQuery.of(context).size.width -
                                              240.w,

                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.transparent),
                                              borderRadius:
                                              BorderRadius.circular(20)),
                                          child: ElevatedButton(
                                              onPressed: () {},
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.transparent,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(15),
                                                ),
                                              ),
                                              child: Row(
                                                children: [
                                                  Image.asset('images/Relaks Radio Music.png',height: 20,width: 25,),
                                                  Text('Relaks Radio \nMusic',style: TextStyle(color: Colors.white),)
                                                ],
                                              )
                                          ),
                                        ),
                                        Container(
                                          width:
                                          MediaQuery.of(context).size.width -
                                              240.w,

                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.transparent),
                                              borderRadius:
                                              BorderRadius.circular(20)),
                                          child: ElevatedButton(
                                              onPressed: () {},
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.transparent,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(15),
                                                ),
                                              ),
                                              child: Row(
                                                children: [
                                                  Image.asset('images/Relaks News 24.png',height: 20,width: 25,),
                                                  Text('Relaks News 24',style: TextStyle(color: Colors.white),)
                                                ],
                                              )
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          width:
                                          MediaQuery.of(context).size.width -
                                              240.w,

                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.transparent),
                                              borderRadius:
                                              BorderRadius.circular(20)),
                                          child: ElevatedButton(
                                              onPressed: () {},
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.transparent,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(15),
                                                ),
                                              ),
                                              child: Row(
                                                children: [
                                                  Image.asset('images/Relaks Radio EU.png',height: 20,width: 25,),
                                                  Text('Relaks Star',style: TextStyle(color: Colors.white),)
                                                ],
                                              )
                                          ),
                                        ),

                                      ],
                                    ),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    Container(
                                      width:
                                      MediaQuery.of(context).size.width -
                                          120,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.transparent),
                                          borderRadius:
                                          BorderRadius.circular(20)),
                                      child: ElevatedButton(
                                          onPressed: () {
                                            Navigator.pushNamed(context, MaintainceScreen.routeName);
                                          },
                                          style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                BorderRadius.circular(15),
                                              ),
                                              backgroundColor:
                                              Color(0xffffEA1C24)),
                                          child: Text(
                                            'Switch your Station',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20.sp),
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
