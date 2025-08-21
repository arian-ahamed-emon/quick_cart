import 'package:e_commerce_app/features/product/ui/screens/product_details_screen.dart';
import 'package:flutter/material.dart';

class CreateReviewsScreen extends StatefulWidget {
  const CreateReviewsScreen({super.key});

  static const String name = '/create-reviews';

  @override
  State<CreateReviewsScreen> createState() =>
      _CreateReviewsScreenState();
}

class _CreateReviewsScreenState extends State<CreateReviewsScreen> {
  TextEditingController _firstNameTEController = TextEditingController();
  TextEditingController _lastNameTEController = TextEditingController();
  TextEditingController _writeReviewTEController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Create Review',
          style: TextStyle(fontSize: 20, color: Colors.black87),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, size: 20, color: Colors.black87),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
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
                  keyboardType: TextInputType.name,
                  autovalidateMode: AutovalidateMode.onUserInteraction ,
                  controller: _writeReviewTEController,
                  maxLines: 8,
                  decoration: InputDecoration(
                      hintText: 'Write Review'),
                ),
                SizedBox(height: 26),
                ElevatedButton(
                    onPressed: () {
                      // if(_formKey.currentState!.validate()){
                      Navigator.pushReplacementNamed(context, ProductDetailsScreen.name);

                    },child: Text('Submit')),
              ],
            ),
          ),
        ),
      ),
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
