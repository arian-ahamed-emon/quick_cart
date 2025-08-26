import 'package:e_commerce_app/common/ui/screens/main_bottom_nav_bar_screen.dart';
import 'package:e_commerce_app/features/auth/ui/screens/email_varification_screen.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import '../widgets/app_logo_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const String name = '/splash-screen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String _version = "";

  void _moveToNextScreen() async {
    await Future.delayed(Duration(seconds: 4));
    Navigator.pushReplacementNamed(context, EmailVarificationScreen.name);
  }

  @override
  void initState() {
    super.initState();
    _moveToNextScreen();
    _loadAppVersion();
  }

  Future<void> _loadAppVersion() async {
    final info = await PackageInfo.fromPlatform();
    setState(() {
      _version = "Version ${info.version} (${info.buildNumber})";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                const AppLogoWidget(),
                const Spacer(),
                const CircularProgressIndicator(),
                const SizedBox(height: 10),
                Text(
                  _version.isNotEmpty ? _version : "Loading version...",
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
