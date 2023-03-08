// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/pages/home_page.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatefulWidget {
  @override
  const LoginPage({super.key});
  State<LoginPage> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  var formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xff955cd1),
              Color(0xff3fa2fa),
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            stops: [0.2, 0.85],
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(60),
                        child: Image.asset(
                          'assets/weather.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Text(
                        'Login',
                        style: TextStyle(
                          fontFamily: 'RobotoMono',
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 40.0,
                      ),
                      TextFormField(
                        controller: emailController,
                        validator: (value) {
                          if ((value == null || value.isEmpty)) {
                            {
                              return 'Please, Enter Your Email';
                            }
                          }
                          if (!(value.contains('.') && value.contains('@'))) {
                            return 'Email Must Be Contain "." and "@" ';
                          } else {
                            return null;
                          }
                        },
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: 'Email Address',
                          prefixIcon: Icon(Icons.email),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(
                        height: 25.0,
                      ),
                      TextFormField(
                        validator: (input) {
                          if (input!.length < 6) {
                            return 'Password Is Too Short';
                          }
                        },
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Passwprd',
                          prefixIcon: Icon(Icons.lock),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(
                        height: 40.0,
                      ),
                      MaterialButton(
                        onPressed: () {
                          setState(() {
                            if (formKey.currentState!.validate()) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HomePage(),
                                  ));
                            }
                          });
                        },
                        child: Text(
                          'LOGIN',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        color: Color.fromARGB(255, 0, 89, 243),
                      ),
                    ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
