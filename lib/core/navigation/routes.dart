import 'package:flutter/material.dart';
import 'package:trucki/features/account/presentation/pages/account.dart';
import 'package:trucki/features/authentication/presentation/pages/allication_submited_screen.dart';
import 'package:trucki/features/authentication/presentation/pages/forgot_password_screen.dart';
import 'package:trucki/features/authentication/presentation/pages/login_screen.dart';
import 'package:trucki/features/authentication/presentation/pages/reset_password_screen.dart';
import 'package:trucki/features/authentication/presentation/pages/transporter_details_screen.dart';
import 'package:trucki/features/authentication/presentation/pages/trucks_details_screen.dart';
import 'package:trucki/features/dashboard/presentation/dashboard.dart';
import 'package:trucki/features/drivers/presentation/pages/add_edit_driver_screen.dart';
import 'package:trucki/features/drivers/presentation/pages/driver.dart';
import 'package:trucki/features/home/presentation/pages/home.dart';
import 'package:trucki/features/logs/presentation/pages/log_screen.dart';
import 'package:trucki/features/onboarding/presentation/pages/onboarding_screen.dart';
import 'package:trucki/features/orders/presentation/pages/order_detail_screen.dart';
import 'package:trucki/features/orders/presentation/pages/order_screen.dart';
import 'package:trucki/features/splash/presentation/pages/splash_screen.dart';
import 'package:trucki/features/trucks/presentation/pages/truckes_screen.dart';

var customRoutes = <String, WidgetBuilder>{
  //introduction screen routes
  SplashScreen.route: (context) => const SplashScreen(),
  IntroductionScreen.route: (context) => const IntroductionScreen(),
  TransporterDetailsScreen.route: (context) => const TransporterDetailsScreen(),
  TruckDetailScreen.route: (context) => const TruckDetailScreen(),
  ForgotPasswordScreen.route: (context) => const ForgotPasswordScreen(),
  ResetPasswordScreen.route: (context) => const ResetPasswordScreen(),
  LoginScreen.route: (context) => const LoginScreen(),
  ApplicationSubmitedScreen.route: (context) =>
      const ApplicationSubmitedScreen(),

  AccountScreen.route: (context) => const AccountScreen(),
  HomeScreen.route: (context) => const HomeScreen(),
  OrderScreen.route: (context) => const OrderScreen(),
  OrderDetailsScreen.route: (context) => const OrderDetailsScreen(),
  DriverScreen.route: (context) => const DriverScreen(),
  AddEditDriverScreen.route: (context) => const AddEditDriverScreen(),
  DashboardScreen.route: (context) => const DashboardScreen(),
  TruckScreen.route: (context) => const TruckScreen(),
  LogScreen.route: (context) => const LogScreen(),
};
