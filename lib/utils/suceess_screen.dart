import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'glass_box.dart';

class SucessScreen extends StatelessWidget {
  const SucessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left: 40.0.sp,top: 180.h),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15.sp),
            child: GlassBox(
              child: Container(
                height: 370.h,
                width: MediaQuery.of(context).size.width-70.w,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('images/done.png'),
                        SizedBox(height: 10.h,),
                        Text(
                          'Thanks',
                          style:
                              TextStyle(color: Colors.green, fontSize: 20.sp,fontFamily: 'Poppins'),
                        ),
                        SizedBox(height: 10.h,),
                        Text(
                          ' We received your payment \nrequest, money will transfer \nwithin 3-7 working days.',
                          style:
                              TextStyle(color: Colors.white, fontSize: 20.sp,fontFamily: 'Poppins'),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
