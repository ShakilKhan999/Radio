import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:relaks_media/screens/chat_screen.dart';
import 'package:relaks_media/screens/home_screen.dart';
import 'package:relaks_media/screens/news_screen.dart';

import '../utils/main_drawer.dart';
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

        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: Colors.black,
          centerTitle: true,
          elevation: 0,
          title: Row(
            children: [
              Container(
                  width: MediaQuery.of(context).size.width-200,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade900,
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: const TextField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search, color: Colors.white),
                      hintText: 'Search for audio content,radio chanel,news..',
                      hintStyle: TextStyle(color: Colors.white),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              SizedBox(width: 5.w),
              IconButton(onPressed: (){}, icon: Image.asset('images/Referral Icon.png',)),
              SizedBox(width: 5.w),
              IconButton(onPressed: (){}, icon: Image.asset('images/Switch Station.png')),
            ],
          ),
        ),
        drawer: const MainDrawer(),
        bottomNavigationBar: CurvedNavigationBar(
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

        body: Center(
          child: widgetList[pageIndex],
        ));
  }
}
