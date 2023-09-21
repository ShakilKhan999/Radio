import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';
import 'package:relaks_media/demo.dart';
import 'package:relaks_media/provider/home_page_provider.dart';
import 'package:relaks_media/provider/news_api_provider.dart';
import 'package:relaks_media/screens/air_screen.dart';
import 'package:relaks_media/screens/air_tickets_screen.dart';
import 'package:relaks_media/screens/bottomnevigation.dart';
import 'package:relaks_media/screens/bus_service_screen.dart';
import 'package:relaks_media/screens/bus_ticket_screen.dart';
import 'package:relaks_media/screens/career_screen.dart';
import 'package:relaks_media/screens/Chat/view/chat_screen.dart';
import 'package:relaks_media/screens/Chat/view/conversation_screen.dart';
import 'package:relaks_media/screens/even_ticket_booking_screen.dart';
import 'package:relaks_media/screens/event_booking_screen.dart';
import 'package:relaks_media/screens/event_success_payment_screen.dart';
import 'package:relaks_media/screens/event_ticket_payment_screen.dart';
import 'package:relaks_media/screens/forgot_password_screen.dart';
import 'package:relaks_media/screens/home_screen.dart';
import 'package:relaks_media/screens/launcherpage.dart';
import 'package:relaks_media/screens/login/view/login_screen.dart';
import 'package:relaks_media/screens/maintaince_screen.dart';
import 'package:relaks_media/screens/message_request_screen.dart';
import 'package:relaks_media/screens/my_store_screen.dart';
import 'package:relaks_media/screens/news_screen.dart';
import 'package:relaks_media/screens/others_services_screen.dart';
import 'package:relaks_media/screens/otp/view/otp_screen.dart';
import 'package:relaks_media/screens/reset_password_screen.dart';
import 'package:relaks_media/screens/singup/view/signup_screen.dart';
import 'package:relaks_media/screens/splash_screen.dart';
import 'package:relaks_media/screens/station_screen.dart';
import 'package:relaks_media/screens/train_screen.dart';
import 'package:relaks_media/screens/train_ticekets_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<UpcomingShowProvider>(create: (_) => UpcomingShowProvider()),
          ChangeNotifierProvider<ApiProvider>(create: (_) => ApiProvider()),
          ChangeNotifierProvider<NewsApiProvider>(create: (_) => NewsApiProvider()),

          // Add other providers if needed
        ],
        child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  // This widget is the root of your application. 
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(392, 860),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(),
          initialRoute: OtpScreen.routeName,
          routes: {
            LauncherPage.routeName:(context) => LauncherPage(),
            SplashScreen.routeName:(context) => SplashScreen(),
            LoginScreen.routeName:(context) => LoginScreen(),
            AirScreen.routeName:(context) => AirScreen(),
            AirTicketScreen.routeName:(context) => AirTicketScreen(),
            BottomNavigation.routeName:(context) => BottomNavigation(),
            BusServiceScreen.routeName:(context) => BusServiceScreen(),
            BusTicketScreen.routeName:(context) => BusTicketScreen(),
            CareerScreen.routeName:(context) => CareerScreen(),
            ChatScreen.routeName:(context) => ChatScreen(),
            ConversationScreen.routeName: (context) => ConversationScreen(),
            MessageRequestScreen.routeName: (context) => MessageRequestScreen(),
            EventTicketBooking.routeName:(context) => EventTicketBooking(),
            EventBookingScreen.routeName:(context) => EventBookingScreen(),
            EventSuccessPaymentScreen.routeName:(context) => EventSuccessPaymentScreen(),
            EventTicketPayment.routeName:(context) => EventTicketPayment(),
            ForgotPass.routeName:(context) => ForgotPass(),
            HomeScreen.routeName:(context) => HomeScreen(),
            MaintainceScreen.routeName:(context) => MaintainceScreen(),
            MyStoreScreen.routeName:(context) => MyStoreScreen(),
            NewsScreen.routeName:(context) => NewsScreen(),
            OtpScreen.routeName:(context) => OtpScreen(),
            ResetPassword.routeName:(context) => ResetPassword(),
            SignupScreen.routeName:(context) => SignupScreen(),
            StationScreen.routeName:(context) => StationScreen(),
            TrainScreen.routeName:(context) => TrainScreen(),
            TrainTicketsScreen.routeName:(context) => TrainTicketsScreen(),
            Demo.routeName:(context) => Demo(),
          },
      builder: EasyLoading.init(),
        );
      },
    );
  }
}
