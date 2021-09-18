import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/homes/loginpage.dart';

class SignUpAccount extends StatefulWidget {
  const SignUpAccount({Key? key}) : super(key: key);

  @override
  _SignUpAccountState createState() => _SignUpAccountState();
}

class _SignUpAccountState extends State<SignUpAccount> {
  final _formKey = GlobalKey<FormState>();
  var _email = '';
  var _password = '';
  var _confirmPassword = '';
  var _emailController = TextEditingController();
  var _passwordController = TextEditingController();
  var _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
  }

  registration() async {
            if(_password == _confirmPassword) {
              try {
                  UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email, password: _password);
                  print(userCredential);
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          backgroundColor: Colors.blueAccent,
                          content: Text("Registered successfully",style: TextStyle(fontSize: 14,fontFamily:  "Ubuntu-Medium"),),
                      ),
                  );
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage(),),);
              }on FirebaseAuthException catch(error) {
                if(error.code == 'weak-password') {
                  print('password is too weak');
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.red[400],
                      content: Text("password is too weak",style: TextStyle(fontSize: 14,fontFamily:  "Ubuntu-Medium",color: Colors.white),
                      ),
                    ),
                  );
                }
                else if(error.code=='email-already-in-use') {
                  print('This email is already in user!');
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.red[400],
                        content: Text("This is email already in user",style: TextStyle(fontSize: 14,fontFamily:  "Ubuntu-Medium",color: Colors.white),
                        ),
                      ),
                  );
                }
              }
            }
            else {
              print('Password and Confirm password does not match');
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.redAccent[400],
                  content: Text("Password and Confirm password does not match",style: TextStyle(fontSize: 14,fontFamily:  "Ubuntu-Medium",color: Colors.white),
                  ),
                ),
              );
            }
        }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 60.0, horizontal: 20.0),
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: Image.network(
                  "https://cdn.dribbble.com/users/790111/screenshots/15027427/media/e8dc8cbbb22e997d0105043f01391153.png?compress=1&resize=400x300",
                  fit: BoxFit.contain,
                  height: 200,
                ),
              ),
              // Container(
              //   margin: EdgeInsets.symmetric(vertical: 10),
              //   child: TextFormField(
              //     autofocus: false,
              //     decoration: InputDecoration(
              //       labelText: 'Name',
              //       labelStyle:
              //           TextStyle(fontSize: 16.0, fontFamily: "Ubuntu-Medium"),
              //       border: OutlineInputBorder(
              //         borderRadius: BorderRadius.circular(20),
              //       ),
              //       errorStyle:
              //           TextStyle(color: Colors.redAccent, fontSize: 15.0),
              //     ),
              //     validator: (value) {
              //       if (value == null || value.isEmpty) {
              //         return 'Please enter name';
              //       } else if (!value.contains('@')) {
              //         return 'Please enter correct name';
              //       }
              //       return null;
              //     },
              //   ),
              // ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: TextFormField(
                  autofocus: false,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle:
                        TextStyle(fontSize: 16.0, fontFamily: "Ubuntu-Medium"),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    errorStyle:
                        TextStyle(color: Colors.blueGrey, fontSize: 15.0),
                  ),
                  controller: _emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter email';
                    } else if(!value.contains('@')) {
                      return 'Please enter correct email';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: TextFormField(
                  autofocus: false,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle:
                        TextStyle(fontSize: 16.0, fontFamily: "Ubuntu-Medium"),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    errorStyle:
                        TextStyle(color: Colors.blueGrey, fontSize: 15.0),
                  ),
                  controller: _passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter password';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: TextFormField(
                  autofocus: false,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: 'Confirm Password',
                    labelStyle:
                        TextStyle(fontSize: 16.0, fontFamily: "Ubuntu-Medium"),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    errorStyle:
                        TextStyle(color: Colors.blueGrey, fontSize: 15.0),
                  ),
                  controller: _confirmPasswordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter password';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                            if(_formKey.currentState!.validate()) {
                              setState(() {
                                _email = _emailController.text;
                                _password=_passwordController.text;
                                _confirmPassword=_confirmPasswordController.text;
                              });
                              registration();
                            }
                        },
                        child: Text(
                          'Register',
                          style: TextStyle(
                              fontSize: 18.0, fontFamily: "Ubuntu-Medium"),
                        )),
                    Container(
                      child: TextButton(
                          onPressed: () {
                            setState(() {
                              Navigator.pushReplacement(context, PageRouteBuilder(pageBuilder: (context, a, b) => LoginPage(),transitionDuration: Duration(seconds: 0)),);
                            });
                          },
                          child: Text('back to login?',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.red,
                                  fontFamily: "Ubuntu-Medium"))),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
