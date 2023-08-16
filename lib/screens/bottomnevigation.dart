import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:relaks_media/controller/home_controller.dart';
import 'package:relaks_media/controller/radio_controller.dart';
import 'package:relaks_media/screens/chat_screen.dart';
import 'package:relaks_media/screens/home_screen.dart';
import 'package:relaks_media/screens/news_screen.dart';
import 'package:relaks_media/screens/station_screen.dart';
import '../utils/main_drawer.dart';
import 'maintaince_screen.dart';
import 'my_store_screen.dart';

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
    RadioController radioController = Get.put(RadioController());
    return Scaffold(
      backgroundColor: Colors.black,
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
            Obx(()=>IconButton(onPressed: (){
  Navigator.pushNamed(context, StationScreen.routeName);
}, icon: Image.asset(radioController.getSelectedChImg())),
             )
              ],
          ),
        ),
        drawer: const MainDrawer(),
        bottomNavigationBar: Padding(
          padding:  EdgeInsets.all(8.sp),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Container(
              height: 80.h,
              child: CurvedNavigationBar(
                height: 70.h,
                animationDuration: Duration(),
                color: Colors.grey,
                backgroundColor: Colors.black,
                onTap: (index) {
                  setState(() {
                    pageIndex = index;
                  });
                },
                items:  [
                  Icon(Icons.home,color: Colors.white,),
                  Icon(Icons.newspaper,color: Colors.white),
                  Icon(Icons.chat,color: Colors.white),
                  Icon(Icons.storefront,color: Colors.white),
                ],

              ),
            ),
          ),
        ),

        body: Center(
          child: widgetList[pageIndex],
        ));
  }
}
