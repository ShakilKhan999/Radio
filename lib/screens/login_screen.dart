import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:relaks_media/screens/forgot_password_screen.dart';

import '../utils/glass_box.dart';
import 'bottomnevigation.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName='/login';

   LoginScreen({Key? key,}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();
  bool visiblepass = false;
  @override
  void dispose() {
  emailController.dispose();
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
                                height: MediaQuery.of(context).size.height-420,
                                width:MediaQuery.of(context).size.width-80,
                                child: Column(
                                  children: [
                                    Text('Welcome Back',style: TextStyle(color: Colors.white,fontSize: 30.sp),),
                                    SizedBox(height: 10.h,),
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
                                        Center(child: TextButton(
                                          style: TextButton.styleFrom(
                                            minimumSize: Size.zero,
                                            padding: EdgeInsets.zero,
                                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                          ),
                                          onPressed: (){
                                            Navigator.pushNamed(context, ForgotPass.routeName);
                                          },
                                            child: Text('Forgot Password?',style: TextStyle(fontSize: 18.sp,color: Colors.white),))),
                                        SizedBox(height: 20.h,),
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
                                              onPressed: () {
                                                Navigator.pushReplacementNamed(context, BottomNavigation.routeName);
                                              },
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.transparent,
                                                elevation: 0,
                                              ),
                                              child: Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 80.0.sp, vertical: 6.0.sp),
                                                child: Text(
                                                  'Login',
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
    );
  }
}
