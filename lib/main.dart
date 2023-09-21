import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:relaks_media/screens/air_screen.dart';
import 'package:relaks_media/screens/air_tickets_screen.dart';
import 'package:relaks_media/screens/bottomnevigation.dart';
import 'package:relaks_media/screens/bus_service_screen.dart';
import 'package:relaks_media/screens/bus_ticket_screen.dart';
import 'package:relaks_media/screens/career_screen.dart';
import 'package:relaks_media/screens/chat_screen.dart';
import 'package:relaks_media/screens/conversation_screen.dart';
import 'package:relaks_media/screens/even_ticket_booking_screen.dart';
import 'package:relaks_media/screens/event_booking_screen.dart';
import 'package:relaks_media/screens/event_success_payment_screen.dart';
import 'package:relaks_media/screens/event_ticket_payment_screen.dart';
import 'package:relaks_media/screens/forgot_password_screen.dart';
import 'package:relaks_media/screens/home_screen.dart';
import 'package:relaks_media/screens/launcherpage.dart';
import 'package:relaks_media/screens/login_screen.dart';
import 'package:relaks_media/screens/maintaince_screen.dart';
import 'package:relaks_media/screens/message_request_screen.dart';
import 'package:relaks_media/screens/my_store_screen.dart';
import 'package:relaks_media/screens/news_screen.dart';
import 'package:relaks_media/screens/otp_screen.dart';
import 'package:relaks_media/screens/reset_password_screen.dart';
import 'package:relaks_media/screens/signup_screen.dart';
import 'package:relaks_media/screens/splash_screen.dart';
import 'package:relaks_media/screens/station_screen.dart';
import 'package:relaks_media/screens/train_screen.dart';
import 'package:relaks_media/screens/train_ticekets_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
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
          initialRoute: LauncherPage.routeName,
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
            LoginScreen.routeName:(context) => LoginScreen(),
            MaintainceScreen.routeName:(context) => MaintainceScreen(),
            MyStoreScreen.routeName:(context) => MyStoreScreen(),
            NewsScreen.routeName:(context) => NewsScreen(),
            OtpScreen.routeName:(context) => OtpScreen(),
            ResetPassword.routeName:(context) => ResetPassword(),
            SignupScreen.routeName:(context) => SignupScreen(),
            StationScreen.routeName:(context) => StationScreen(),
            TrainScreen.routeName:(context) => TrainScreen(),
            TrainTicketsScreen.routeName:(context) => TrainTicketsScreen(),
          },
        );
      },
    );
  }
}
