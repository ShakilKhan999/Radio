import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:relaks_media/utils/earn_coin.dart';

import '../controller/radio_controller.dart';
import '../screens/station_screen.dart';

AppBar myAppBar(BuildContext context, RadioController radioController) {
  return AppBar(
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
                    hintText: 'Search for audio content,radio chanel,news..',
                    hintStyle: TextStyle(color: Colors.grey[700]),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return EarCoins();
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
                  icon: Image.network(radioController.stations[radioController.selectedstationIndex.value].channelImage)),
            )
          ],
        ),
      ),
    ),
  );
}
