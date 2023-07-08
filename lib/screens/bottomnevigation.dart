import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:relaks_media/screens/chat_screen.dart';
import 'package:relaks_media/screens/home_screen.dart';
import 'package:relaks_media/screens/news_screen.dart';

import 'my_store_screen.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int pageIndex = 0;

  List<Widget> widgetList = const [HomeScreen(), NewsScreen(), ChatScreen(),MyStoreScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        bottomNavigationBar: SizedBox(
          height: 10,
          width: MediaQuery.of(context).size.width-20,
          child: CurvedNavigationBar(
            animationDuration: Duration(),
            color: Colors.blue.withOpacity(.5),
            backgroundColor: Colors.transparent,
            onTap: (index) {
              setState(() {
                pageIndex = index;
              });
            },
            items: [
              Icon(Icons.home),
              Icon(Icons.newspaper),
              Icon(Icons.chat),
              Icon(Icons.storefront),
            ],

          ),
        ),

        body: Center(
          child: widgetList[pageIndex],
        ));
  }
}
