import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../controller/home_controller.dart';
import '../utils/glass_box.dart';

class TrainTicketsScreen extends StatefulWidget {
  static const String routeName='/traintickets';
  const TrainTicketsScreen({super.key});

  @override
  State<TrainTicketsScreen> createState() => _TrainTicketsScreenState();
}

class _TrainTicketsScreenState extends State<TrainTicketsScreen> {

  final controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(const Color(0x00000000))
    ..setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {
          // Update loading bar.
        },
        onPageStarted: (String url) {},
        onPageFinished: (String url) {},
        onWebResourceError: (WebResourceError error) {},
        onNavigationRequest: (NavigationRequest request) {
          if (request.url.startsWith('https://www.youtube.com/')) {
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      ),
    )
    ..loadRequest(Uri.parse('https://eticket.railway.gov.bd/'));

  late WebViewController controllerGlobal;

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.black,
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 25.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(left: 15.0),
                      child: IconButton( onPressed: () {
                        homeController.trainstate.value=0;
                      }, icon:Icon(Icons.arrow_back,color: Colors.white,)),
                    ),
                    Padding(
                      padding:  EdgeInsets.only(left: 110.0.sp),
                      child: Text('Train',style: TextStyle(color: Colors.white,fontSize: 30.sp),),
                    ),
                  ],
                ),
                SizedBox(height: 15.h,),
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15.sp),
                      child: GlassBox(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: SizedBox(
                              height: MediaQuery.of(context).size.height-340.h,
                              width:MediaQuery.of(context).size.width-80.w,
                              child: WebViewWidget(controller: controller)),
                        ),

                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
