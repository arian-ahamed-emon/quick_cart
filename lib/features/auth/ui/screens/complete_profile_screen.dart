import 'package:e_commerce_app/features/auth/ui/widgets/app_logo_widget.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key});

  static const String name = '/email-varification';

  @override
  State<CompleteProfileScreen> createState() =>
      _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  TextEditingController _firstNameTEController = TextEditingController();
  TextEditingController _lastNameTEController = TextEditingController();
  TextEditingController _mobileTEController = TextEditingController();
  TextEditingController _cityTEController = TextEditingController();
  TextEditingController _shoppingAddressTEController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: 20),
                AppLogoWidget(),
                SizedBox(height: 10),
                Text(
                  'Complete Profile',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  'Get started with us with your details',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                SizedBox(height: 30),
                TextFormField(
                  keyboardType: TextInputType.name,
                  autovalidateMode: AutovalidateMode.onUserInteraction ,
                  controller: _firstNameTEController,
                  decoration: InputDecoration(hintText: 'First Name'),
                  validator: (String?value){
                    if(value?.trim().isEmpty ?? true){
                      return 'Please enter your name ';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20,),
                TextFormField(
                  keyboardType: TextInputType.name,
                  autovalidateMode: AutovalidateMode.onUserInteraction ,
                  controller: _lastNameTEController,
                  decoration: InputDecoration(hintText: 'Last Name'),
                  validator: (String?value){
                    if(value?.trim().isEmpty ?? true){
                      return 'Please enter your name ';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20,),
                TextFormField(
                  keyboardType: TextInputType.number,
                  autovalidateMode: AutovalidateMode.onUserInteraction ,
                  controller: _mobileTEController,
                  decoration: InputDecoration(hintText: 'Mobile'),
                  validator: (String?value){
                    if(value?.trim().isEmpty ?? true){
                      return 'Please enter your mobile number ';
                    }
                    if(EmailValidator.validate(value!) == false){
                      return 'Please enter a valid number';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20,),
                TextFormField(
                  keyboardType: TextInputType.name,
                  autovalidateMode: AutovalidateMode.onUserInteraction ,
                  controller: _cityTEController,
                  decoration: InputDecoration(hintText: 'City'),
                ),
                SizedBox(height: 20,),
                TextFormField(
                  keyboardType: TextInputType.name,
                  autovalidateMode: AutovalidateMode.onUserInteraction ,
                  controller: _shoppingAddressTEController,
                  maxLines: 4,
                  decoration: InputDecoration(
                      hintText: 'Shopping Address'),
                ),
                SizedBox(height: 26),
                ElevatedButton(
                    onPressed: () {
                      // if(_formKey.currentState!.validate()){
                      Navigator.pushReplacementNamed(context, '/otp-varification');

                    },child: Text('Next')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
