import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:relaks_media/controller/otherservice_controller.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../controller/home_controller.dart';
import '../utils/glass_box.dart';

class BusTicketScreen extends StatefulWidget {
  static const String routeName='/busticket';
  const BusTicketScreen({super.key});

  @override
  State<BusTicketScreen> createState() => _BusTicketScreenState();
}

class _BusTicketScreenState extends State<BusTicketScreen> {
  OtherServiceController otherServiceController = Get.put(OtherServiceController());
int siteno=0;
  String link='https://www.shohoz.com/bus-tickets';

  @override
  void initState() {
    link=otherServiceController.busSite==0?'https://bdtickets.com/':
    otherServiceController.busSite==1?'https://www.shohoz.com/bus-tickets':
    otherServiceController.busSite==2?'https://paribahan.com/':'https://www.shohoz.com/bus-tickets';
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
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
      ..loadRequest(Uri.parse(link));

    HomeController homeController = Get.put(HomeController());
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.black,
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 50.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(left: 15.0),
                      child: IconButton( onPressed: () {
                        homeController.busstate.value=0;
                      }, icon:Icon(Icons.arrow_back,color: Colors.white,)),
                    ),
                    Padding(
                      padding:  EdgeInsets.only(left: 130.0.sp),
                      child: Text('Bus',style: TextStyle(color: Colors.white,fontSize: 30.sp),),
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
                              height: MediaQuery.of(context).size.height-350.h,
                              width:MediaQuery.of(context).size.width-80.w,
                              child: WebViewWidget(controller: controller,)),
                        ),

                      ),
                    ),
                  ],
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
