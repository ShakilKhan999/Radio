import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:relaks_media/controller/home_controller.dart';
import 'package:relaks_media/screens/chat_screen.dart';
import 'package:relaks_media/screens/home_screen.dart';
import 'package:relaks_media/screens/news_screen.dart';
import 'package:relaks_media/screens/station_screen.dart';
import 'package:relaks_media/screens/train_screen.dart';
import 'package:relaks_media/screens/train_ticekets_screen.dart';

import '../utils/main_drawer.dart';
import 'air_screen.dart';
import 'air_tickets_screen.dart';
import 'bus_service_screen.dart';
import 'bus_ticket_screen.dart';
import 'career_screen.dart';

import 'even_ticket_booking_screen.dart';
import 'event_booking_screen.dart';
import 'event_success_payment_screen.dart';
import 'maintaince_screen.dart';
import 'my_store_screen.dart';
import 'others_services_screen.dart';

class BottomNavigation extends StatefulWidget {
  static const String routeName='/bottomnav';
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}
int homescreenindex=0;
class _BottomNavigationState extends State<BottomNavigation> {
  int pageIndex = 0;
  List<Widget> homescreens =  [HomeScreen(), MaintainceScreen(), StationScreen()];
  List<Widget> widgetList =  [HomeScreen(),
    NewsScreen(), ChatScreen(),MyStoreScreen()];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: Colors.black,
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                  width: MediaQuery.of(context).size.width-185,
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

              IconButton(onPressed: (){}, icon: Image.asset('images/Referral Icon.png',)),

              IconButton(onPressed: (){
                Navigator.pushNamed(context, StationScreen.routeName);
              }, icon: Image.asset('images/Switch Station.png')),
            ],
          ),
        ),
        drawer: const MainDrawer(),
        bottomNavigationBar: CurvedNavigationBar(
          animationDuration: Duration(),
          color: Colors.blue.withOpacity(.5),
          backgroundColor: Colors.black,
          onTap: (index) {
            setState(() {
              pageIndex = index;
            });
          },
          items: [
            Icon(Icons.home,color: Colors.white,),
            Icon(Icons.newspaper,color: Colors.white),
            Icon(Icons.chat,color: Colors.white),
            Icon(Icons.storefront,color: Colors.white),
          ],

        ),

        body: Center(
          child: widgetList[pageIndex],
        ));
  }
}
