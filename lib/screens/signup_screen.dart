import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/glass_box.dart';

class SignupScreen extends StatefulWidget {

  SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final conPasswordController = TextEditingController();
  final passwordController = TextEditingController();
  bool visiblepass = false;
  @override
  void dispose() {
    emailController.dispose();
    phoneController.dispose();
    conPasswordController.dispose();
    passwordController.dispose();
    super.dispose();
  }

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
              child: SingleChildScrollView(
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
                                  height: MediaQuery.of(context).size.height-270,
                                  width:MediaQuery.of(context).size.width-80,
                                  child: Column(
                                    children: [
                                      Text('Signup',style: TextStyle(color: Colors.white,fontSize: 30.sp),),
                                      SizedBox(height: 20.h,),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Email',
                                            style: TextStyle(
                                              fontSize: 16.sp,
                                              color: Colors.white,
                                            ),
                                          ),
                                          SizedBox(height: 5.h,),
                                          SizedBox(
                                            height: 50.h,
                                            child: TextFormField(
                                              controller: emailController,
                                              decoration: const InputDecoration(

                                                focusedBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.grey,
                                                        width: 1.2)),
                                                enabledBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.grey, width: 1.2)),
                                                border: OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.grey, width: 1.2)),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 20.h,
                                          ),
                                          Text(
                                            'Phone',
                                            style: TextStyle(
                                              fontSize: 16.sp,
                                              color: Colors.white,
                                            ),
                                          ),
                                          SizedBox(height: 5.h,),
                                          SizedBox(
                                            height: 50.h,
                                            child: TextFormField(
                                              controller: phoneController,
                                              decoration: const InputDecoration(

                                                focusedBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.grey,
                                                        width: 1.2)),
                                                enabledBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.grey, width: 1.2)),
                                                border: OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.grey, width: 1.2)),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 20.h,
                                          ),
                                          Text(
                                            'Password',
                                            style: TextStyle(
                                              fontSize: 16.sp,
                                              color: Colors.white,
                                            ),
                                          ),
                                          SizedBox(height: 5.h,),
                                          SizedBox(
                                            height: 50.h,
                                            child: TextFormField(
                                              controller: passwordController,
                                              obscureText: !visiblepass,
                                              decoration: InputDecoration(

                                                focusedBorder: const OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.grey,
                                                        width: 1.2)),
                                                enabledBorder: const OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.grey, width: 1.2)),
                                                border: const OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.grey, width: 1.2)),
                                                suffixIcon: visiblepass
                                                    ? IconButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        visiblepass
                                                            ? visiblepass = false
                                                            : visiblepass = true;
                                                      });
                                                    },
                                                    icon: const Icon(Icons.visibility,
                                                        color:Colors.grey))
                                                    : IconButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        visiblepass
                                                            ? visiblepass = false
                                                            : visiblepass = true;
                                                      });
                                                    },
                                                    icon: const Icon(
                                                      Icons.visibility_off,
                                                      color: Colors.grey,
                                                    )),
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 20.h),
                                          Text(
                                            'Confirm Password',
                                            style: TextStyle(
                                              fontSize: 16.sp,
                                              color: Colors.white,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5.h,
                                          ),
                                          SizedBox(
                                            height: 50.h,
                                            child: TextFormField(
                                              controller: conPasswordController,
                                              obscureText: !visiblepass,
                                              decoration: InputDecoration(
                                                focusedBorder:
                                                const OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.grey,
                                                        width: 1.2)),
                                                enabledBorder:
                                                const OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.grey,
                                                        width: 1.2)),
                                                border: const OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.grey,
                                                        width: 1.2)),
                                                suffixIcon: visiblepass
                                                    ? IconButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        visiblepass
                                                            ? visiblepass =
                                                        false
                                                            : visiblepass =
                                                        true;
                                                      });
                                                    },
                                                    icon: const Icon(
                                                        Icons.visibility,
                                                        color: Colors.grey))
                                                    : IconButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        visiblepass
                                                            ? visiblepass =
                                                        false
                                                            : visiblepass =
                                                        true;
                                                      });
                                                    },
                                                    icon: const Icon(
                                                      Icons.visibility_off,
                                                      color: Colors.grey,
                                                    )),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 20.h,
                                          ),
                                          Center(
                                            child: Container(
                                              decoration: BoxDecoration(
                                                gradient: LinearGradient(
                                                  colors: [
                                                    Colors.grey.shade500,

                                                    Colors.grey,
                                                  ],
                                                  stops: [0.3, 1.0],
                                                  begin: Alignment.topLeft,
                                                  end: Alignment.bottomRight,
                                                ),
                                                borderRadius: BorderRadius.circular(9.0),
                                              ),
                                              child: ElevatedButton(
                                                onPressed: () {},
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor: Colors.transparent,
                                                  elevation: 0,
                                                ),
                                                child: Container(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 80.0.sp, vertical: 6.0.sp),
                                                  child: Text(
                                                    'Signup',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 16.0.sp,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 20.h,),
                                          Center(child: Text('or',style: TextStyle(fontSize: 15.sp,color: Colors.white),)),
                                          SizedBox(height: 20.h,),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    border: Border.all(color: Colors.grey),
                                                    color: Colors.transparent,
                                                    borderRadius: BorderRadius.circular(9.0),
                                                  ),
                                                  child: ElevatedButton(
                                                      onPressed: () {},
                                                      style: ElevatedButton.styleFrom(
                                                        backgroundColor: Colors.transparent,
                                                        elevation: 0,
                                                      ),
                                                      child: Row(
                                                        children: [
                                                          Image.asset('images/Google.png',width: 30.w),
                                                          Text(
                                                            'Google',
                                                            style: TextStyle(
                                                              color: Colors.white,
                                                              fontSize: 16.0.sp,
                                                              fontWeight: FontWeight.bold,
                                                            ),
                                                          ),
                                                        ],
                                                      )
                                                  ),
                                                ),
                                              ),
                                              SizedBox(width: 10.w,),
                                              Expanded(
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    border: Border.all(color: Colors.grey),
                                                    color: Colors.transparent,
                                                    borderRadius: BorderRadius.circular(9.0),
                                                  ),
                                                  child: ElevatedButton(
                                                      onPressed: () {},
                                                      style: ElevatedButton.styleFrom(
                                                        backgroundColor: Colors.transparent,
                                                        elevation: 0,
                                                      ),
                                                      child: Row(
                                                        children: [
                                                          Image.asset('images/Facebook.png',width: 30.w),
                                                          Text(
                                                            'Facebook',
                                                            style: TextStyle(
                                                              color: Colors.white,
                                                              fontSize: 16.0.sp,
                                                              fontWeight: FontWeight.bold,
                                                            ),
                                                          ),
                                                        ],
                                                      )
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
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
      ),
    );
  }
}
