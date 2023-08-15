
import 'dart:developer';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:relaks_media/screens/fund_raising.dart';
import 'package:relaks_media/screens/news_screen.dart';

import '../controller/home_controller.dart';

class MainDrawer extends StatefulWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  State<MainDrawer> createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  Map<String, dynamic>? paymentIntent;

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    return Drawer(
      backgroundColor: Colors.transparent,
      child: GlassBox(
        child: ListView(
          children: [
            ListTile(
              onTap: () async {
                Navigator.pop(context);
              },
              leading: const Icon(Icons.cancel_sharp,color: Colors.white),
            ),
            ListTile(
              onTap: ()  {
                homeController.homestate.value=0;
                Navigator.pop(context);
              },
              leading: Image.asset('images/menu_top_image.png',height: 50.h,width: 30.w,),
              title: const Text('Relaks Radio',style: TextStyle(color: Colors.white),),
            ),
            ListTile(
              onTap: ()  {
                homeController.homestate.value=1;
                Navigator.pop(context);
              },
              leading: Icon(Icons.newspaper,color: Colors.white),
              title: const Text('News',style: TextStyle(color: Colors.white),),
            ),
            ListTile(
              onTap: ()  {
                Navigator.pop(context);
              },
              leading: Icon(Icons.chat,color: Colors.white),
              title: const Text('Chat',style: TextStyle(color: Colors.white),),
            ),
            ListTile(
              onTap: ()  {
                Navigator.pop(context);
              },
              leading:  Icon(Icons.storefront,color: Colors.white),
              title: const Text('My Store',style: TextStyle(color: Colors.white),),
            ),
            ListTile(
              onTap: ()  {
                // Get.to(()=>FundRaising());
                log('clicked');
                Navigator.pop(context);
              },
              leading:  Icon(Icons.attach_money,color: Colors.white),
              title: const Text('Fun Raising',style: TextStyle(color: Colors.white),),
            ),
            ListTile(
              onTap: ()  {
                homeController.homestate.value=5;
                Navigator.pop(context);
              },
              leading: Icon(Icons.work,color: Colors.white),
              title: const Text('Career',style: TextStyle(color: Colors.white),),
            ),
            ListTile(
              onTap: ()  {
                homeController.homestate.value=6;
                Navigator.pop(context);
              },
              leading: Icon(Icons.settings,color: Colors.white),
              title: const Text('Other Service',style: TextStyle(color: Colors.white),),
            ),
            ListTile(
              onTap: ()  {
                Navigator.pop(context);
              },
              leading: Icon(Icons.download,color: Colors.white),
              title: const Text('Download',style: TextStyle(color: Colors.white),),
            ),
            ListTile(
              onTap: ()  {
                homeController.homestate.value=0;
                Navigator.pop(context);
              },
              leading:Icon(Icons.info_rounded,color: Colors.white),
              title: const Text('Relaks Radio',style: TextStyle(color: Colors.white),),
            ),
            // Add more list items as needed
          ],
        ),
      ),
    );
  }
}

class GlassBox extends StatelessWidget {
  final Widget child;

  const GlassBox({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(5),
          ),
          child: child,
        ),
      ),
    );
  }
}
