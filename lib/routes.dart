import 'package:flutter/widgets.dart';

import 'package:work/screens/messagePage.dart';
// import 'package:work/screens/cart/cart_screen.dart';
// import 'package:work/screens/complete_profile/complete_profile_screen.dart';
// import 'package:work/screens/details/details_screen.dart';
// import 'package:work/screens/forgot_password/forgot_password_screen.dart';
import 'package:work/screens/homepage.dart';
import 'package:work/screens/notification.dart';
// import 'package:work/screens/login_success/login_success_screen.dart';
// import 'package:work/screens/otp/otp_screen.dart';
import 'package:work/screens/profile/profile.dart';

// import 'package:work/screens/splash/splash_screen.dart';

// import 'screens/sign_up/sign_up_screen.dart';

// We use name route
// All our routes will be available here 
final Map<String, WidgetBuilder> routes = {
  // SplashScreen.routeName: (context) => SplashScreen(),
  Notifications.routeName: (context) => Notifications(),
  
  viewMessageIcon.routeName: (context) => viewMessageIcon(),
  // ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  // LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
  // SignUpScreen.routeName: (context) => SignUpScreen(),
  // CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  // OtpScreen.routeName: (context) => OtpScreen(),
   Home.routeName: (context) => const Home(),
  // DetailsScreen.routeName: (context) => DetailsScreen(),
  // CartScreen.routeName: (context) => CartScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
};
