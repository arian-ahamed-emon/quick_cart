import 'dart:async';
import 'package:e_commerce_app/app/app_colors.dart';
import 'package:e_commerce_app/features/auth/ui/widgets/app_logo_widget.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpVarificationScreen extends StatefulWidget {
  const OtpVarificationScreen({super.key});

  static const String name = '/Otp-Varification';

  @override
  State<OtpVarificationScreen> createState() => _OtpVarificationScreenState();
}

class _OtpVarificationScreenState extends State<OtpVarificationScreen> {
  final TextEditingController _otpTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  int _seconds = 120;
  Timer? _timer;
  bool _isButtonActive = false;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    setState(() {
      _seconds = 20;
      _isButtonActive = false;
    });

    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_seconds == 0) {
        timer.cancel();
        setState(() {
          _isButtonActive = true;
        });
      } else {
        setState(() {
          _seconds--;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _otpTEController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 80),
                const AppLogoWidget(),
                const SizedBox(height: 10),
                Text(
                  'Enter OTP Code',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  'A 4 digit OTP code has been sent',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(height: 30),
                PinCodeTextField(
                  keyboardType: TextInputType.number,
                  length: 4,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(5),
                    fieldHeight: 50,
                    fieldWidth: 40,
                    activeFillColor: Colors.white,
                    inactiveColor: AppColors.themeColor,
                  ),
                  animationDuration: const Duration(milliseconds: 300),
                  controller: _otpTEController,
                  onCompleted: (v) {
                    debugPrint("Completed");
                  },
                  beforeTextPaste: (text) {
                    debugPrint("Allowing to paste $text");
                    return true;
                  },
                  appContext: context,
                ),
                const SizedBox(height: 26),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      '/complete-profile',
                      (_) => false,
                    );
                  },
                  child: const Text('Next'),
                ),
                const SizedBox(height: 20),
                if (_seconds > 0)
                  RichText(
                    text: TextSpan(
                      text: 'This code will expire in ',
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                      children: [
                        TextSpan(
                          text: '$_seconds s',
                          style: const TextStyle(
                            color: AppColors.themeColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),

                const SizedBox(height: 5),

                TextButton(
                  onPressed: _isButtonActive
                      ? () {
                          _startTimer();
                        }
                      : null,
                  child: Text(
                    'Resend Code',
                    style: TextStyle(
                      fontSize: 16,
                      color: _isButtonActive
                          ? AppColors.themeColor
                          : Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
