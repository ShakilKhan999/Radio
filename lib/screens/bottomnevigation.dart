import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:relaks_media/controller/home_controller.dart';
import 'package:relaks_media/controller/radio_controller.dart';
import 'package:relaks_media/screens/Chat/view/chat_screen.dart';
import 'package:relaks_media/screens/fund_raising.dart';
import 'package:relaks_media/screens/home_screen.dart';
import 'package:relaks_media/screens/news_screen.dart';
import 'package:relaks_media/screens/station_screen.dart';
import '../demo.dart';
import '../utils/earn_coin.dart';
import '../utils/main_drawer.dart';
import 'maintaince_screen.dart';
import 'my_store_screen.dart';

class BottomNavigation extends StatefulWidget {
  static const String routeName = '/bottomnav';

  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

int homescreenindex = 0;

class _BottomNavigationState extends State<BottomNavigation> {
  int pageIndex = 0;
  List<Widget> homescreens = [
    HomeScreen(),
    MaintainceScreen(),
    StationScreen()
  ];
  List<Widget> widgetList = [
    HomeScreen(),
    NewsScreen(),
    ChatScreen(),
    MyStoreScreen()
  ];
  GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    RadioController radioController = Get.put(RadioController());
    return Scaffold(
      backgroundColor: Colors.black,
      drawer: const MainDrawer(),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.black,
        elevation: 0,
        flexibleSpace: Center(
          child: Column(
            children: [
              SizedBox(height: 30.h,),
              Container(
                height: 60.h,
                width: MediaQuery.of(context).size.width - 10.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: 30.w,),
                    Container(
                      height: 45.h,
                      width: MediaQuery.of(context).size.width - 150.w,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade900,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: TextField(
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          prefixIcon: Padding(
                            padding: EdgeInsets.zero,
                            child: Icon(Icons.search, color: Colors.grey),
                          ),
                          hintText:
                          'Search for audio content,radio chanel,news..',
                          hintStyle: TextStyle(color: Colors.grey[700]),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return EarCoins();
                              // return RelaksPremium();
                            },
                          );
                        },
                        icon: Image.asset(
                          'images/Referral Icon.png',
                        )),
                    Obx(
                          () => IconButton(
                          onPressed: () {

                            Navigator.pushNamed(context, StationScreen.routeName);
                          },
                          icon: Image.asset(radioController.getSelectedChImg())),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: Center(
        child: widgetList[pageIndex],
      ),
    );
  }
}
