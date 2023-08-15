import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/home_controller.dart';

class FundRaisingScreen extends StatelessWidget {
  const FundRaisingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    return Scaffold(
      body: Center(
          child: Container(
             child: Text('Fund Rainsing'),
      )),
    );
  }
}
