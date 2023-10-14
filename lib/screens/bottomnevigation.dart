import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:relaks_media/controller/fund_rise_controller.dart';
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
    FundRiseController fundRiseController = Get.put(FundRiseController());
    fundRiseController.getallfundriser();
    radioController.getstations();
    homeController.getUserData();
    return Obx(
      () => Scaffold(
          // key: _key,
          backgroundColor: Colors.black,
          drawer: const MainDrawer(),
          appBar: AppBar(
            toolbarHeight: 60,
            iconTheme: const IconThemeData(color: Colors.white),
            backgroundColor: Colors.black,
            elevation: 0,
            flexibleSpace: SafeArea(
              child: Container(
                height: 60.h,
                width: MediaQuery.of(context).size.width - 10.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 50.w,
                    ),
                    Expanded(
                      child: Container(
                        height: 45.h,
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
                    ),
                    IconButton(
                        onPressed: () {
                          showDialog(context: context, builder: (context) {
                            return EarCoins();
                          },);
                        },
                        icon: Image.asset(
                          'images/Referral Icon.png',
                        )),
                    Obx(
                      () => IconButton(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, StationScreen.routeName);
                          },
                          icon:
                              Image.asset(radioController.getSelectedChImg())),
                    )
                  ],
                ),
              ),
            ),
          ),

          // bottomNavigationBar: Padding(
          //   padding: EdgeInsets.all(8.sp),
          //   child: ClipRRect(
          //     borderRadius: BorderRadius.circular(15),
          //     child: Container(
          //       height: 80.h,
          //       child: CurvedNavigationBar(
          //         index: radioController.bottomNavigationSelectedIndex.value,
          //         height: 70.h,
          //         animationDuration: Duration(),
          //         color: Colors.grey,
          //         backgroundColor: Colors.black,
          //         onTap: (index) {
          //           radioController.bottomNavigationSelectedIndex.value = index;
          //           // setState(() {
          //           //   pageIndex = index;
          //           // });
          //         },
          //         items: const [
          //           Icon(
          //             Icons.home,
          //             color: Colors.white,
          //           ),
          //           ImageIcon(
          //             AssetImage('images/news.png'),
          //             color: Colors.white,
          //           ),
          //           ImageIcon(
          //             AssetImage('images/msg.png'),
          //             color: Colors.white,
          //           ),
          //           ImageIcon(
          //             AssetImage('images/store.png'),
          //             color: Colors.white,
          //           ),
          //         ],
          //       ),
          //     ),
          //   ),
          // ),

          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: Colors.transparent,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.grey,
                      Colors.black
                    ], // Replace with your desired gradient colors
                  ),
                ),
                child: BottomNavigationBar(
                  // backgroundColor: Colors.yellow,
                  showUnselectedLabels: true,
                  selectedItemColor: Colors.white,
                  unselectedItemColor: Colors.grey,
                  currentIndex:
                      radioController.bottomNavigationSelectedIndex.value,
                  onTap: (index) {
                    setState(() {
                      radioController.bottomNavigationSelectedIndex.value =
                          index;
                    });
                  },
                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: ImageIcon(AssetImage('images/news.png')),
                      label: 'News',
                    ),
                    BottomNavigationBarItem(
                      icon: ImageIcon(AssetImage('images/msg.png')),
                      label: 'Chat',
                    ),
                    BottomNavigationBarItem(
                      icon: ImageIcon(AssetImage('images/store.png')),
                      label: 'Store',
                    ),
                  ],
                ),
              ),
            ),
          ),
          body: Center(
            child:
                widgetList[radioController.bottomNavigationSelectedIndex.value],
          )),
    );
  }
}
