import 'package:flutter/material.dart';
import 'package:tt9_betweener_challenge/controllers/pref_controller.dart';
import 'package:tt9_betweener_challenge/views/screens/authScreens/login_view.dart';
import 'package:tt9_betweener_challenge/views/screens/authScreens/register_view.dart';
import 'package:tt9_betweener_challenge/views/screens/linkScreens/add_link.dart';
import 'package:tt9_betweener_challenge/views/screens/loading_view.dart';
import 'package:tt9_betweener_challenge/views/screens/mainScreens/home_view.dart';
import 'package:tt9_betweener_challenge/views/screens/mainScreens/profile_view.dart';
import 'package:tt9_betweener_challenge/views/screens/mainScreens/receive_view.dart';
import 'package:tt9_betweener_challenge/views/screens/main_app_view.dart';
import 'package:tt9_betweener_challenge/views/screens/searchScreens/search_screen.dart';

import 'utilis/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefController().initSharePrefs();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Betweener',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: AppColors.kPrimaryColor,
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppColors.kPrimaryColor,
          ),
        ),
        scaffoldBackgroundColor: AppColors.kScaffoldColor,
      ),
      home: const LoadingView(),
      initialRoute: LoadingView.id,
      routes: {
        LoadingView.id: (context) => const LoadingView(),
        SearchScreen.id: (context) => const SearchScreen(),
        AddLink.id: (context) => const AddLink(),
        LoginView.id: (context) => const LoginView(),
        RegisterView.id: (context) => const RegisterView(),
        HomeView.id: (context) => const HomeView(),
        MainAppView.id: (context) => const MainAppView(),
        ProfileView.id: (context) => const ProfileView(),
        ReceiveView.id: (context) => const ReceiveView(),
      },
    );
  }
}
