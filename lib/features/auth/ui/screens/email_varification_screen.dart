import 'package:e_commerce_app/features/auth/ui/widgets/centerd_circular_progress_indicator.dart';
import 'package:e_commerce_app/features/auth/ui/widgets/app_logo_widget.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class EmailVarificationScreen extends StatefulWidget {
  const EmailVarificationScreen({super.key});

  static const String name = '/email-varification';

  @override
  State<EmailVarificationScreen> createState() =>
      _EmailVarificationScreenState();
}

class _EmailVarificationScreenState extends State<EmailVarificationScreen> {
  TextEditingController _emailTEController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _inProgress = false;

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
                SizedBox(height: 80),
                AppLogoWidget(),
                SizedBox(height: 10),
                Text(
                  'Welcome Back',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  'Please Enter Your Email Address',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                SizedBox(height: 30),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  autovalidateMode: AutovalidateMode.onUserInteraction ,
                  controller: _emailTEController,
                  decoration: InputDecoration(hintText: 'Email Address'),
                  validator: (String?value){
                    if(value?.trim().isEmpty ?? true){
                      return 'Please enter your email ';
                    }
                    if(EmailValidator.validate(value!) == false){
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 26),
                Visibility(
                  visible: !_inProgress,
                  replacement: CenterdCircularProgressIndicator(),
                  child: ElevatedButton(
                      onPressed: () {
                       setState(() {
                         _inProgress = true;
                       });
                        Navigator.pushReplacementNamed(context, '/Otp-Varification');
                      setState(() {
                        _inProgress = false;
                      });
                        },child: Text('Next')),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
