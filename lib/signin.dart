import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegistrationForm extends StatefulWidget {
  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
 final TextEditingController emailController = TextEditingController();
 final TextEditingController passwordController = TextEditingController();
 final TextEditingController confirmPasswordController = TextEditingController();

  void CreateAccount()async{
    String email=emailController.text.trim();
    String password=passwordController.text.trim();
    String confpass=confirmPasswordController.text.trim();
    if (email=="" || password=="" || confpass=="")
      {
        log("Please fill all detail");
      }
    else if(password!=confpass){
      log("Please enter write password");
    }
    else{
     UserCredential userCredential=await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
     log("user created");
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
      padding:EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: 'Email',
            ),
          ),
          SizedBox(height: 16),
          TextField(
            controller: passwordController,
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Password',
            ),
          ),
          SizedBox(height: 16),
          TextField(
            controller: confirmPasswordController,
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Confirm Password',
            ),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              // Validate and handle the form submission here
              String email = emailController.text;
              String password = passwordController.text;
              String confirmPassword = confirmPasswordController.text;

              // Add your logic for handling form submission, validation, etc.
              // For example, you can check if the passwords match, or if the email is in a valid format.
              print('Email: $email');
              print('Password: $password');
              print('Confirm Password: $confirmPassword');
            },
            child: Text('Register'),
          ),
        ],
      ),
    ),
    );
  }
}
