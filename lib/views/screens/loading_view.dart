import 'package:flutter/material.dart';
import 'package:tt9_betweener_challenge/controllers/pref_controller.dart';
import 'package:tt9_betweener_challenge/views/screens/authScreens/login_view.dart';
import 'package:tt9_betweener_challenge/views/screens/main_app_view.dart';

class LoadingView extends StatefulWidget {
  static const id = '/loadingView';

  const LoadingView({super.key});

  @override
  State<LoadingView> createState() => _LoadingViewState();
}

class _LoadingViewState extends State<LoadingView> {
  void checkLogin() async {
    if (SharedPrefController.instance.loggedIn && mounted) {
      Navigator.pushReplacementNamed(context, MainAppView.id);
    } else {
      Navigator.pushReplacementNamed(context, LoginView.id);
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      checkLogin();
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
