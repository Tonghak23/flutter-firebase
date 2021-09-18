import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/homes/forgot_pass.dart';
import 'package:flutter_firebase/homes/signup_account.dart';
import 'package:flutter_firebase/homes/user_main.dart';

  class LoginPage extends StatefulWidget {
    const LoginPage({Key? key}) : super(key: key);
  
    @override
    _LoginPageState createState() => _LoginPageState();
  }
  
  class _LoginPageState extends State<LoginPage> {
    final _formkey=GlobalKey<FormState>();
    var email ="";
    var password="";
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    userLogin() async {
        try{
            await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>UserMain()));
        }on FirebaseAuthException catch(error){
            if(error.code == 'user-not-found') {
                print("user not found for this email");
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    backgroundColor: Colors.red,
                    content: Text("No registered for this email",style: TextStyle(fontSize: 14.0,color: Colors.white,fontFamily: "Ubuntu-Medium"),),
                ),);
            }else if(error.code == 'wrong-password') {
                  print("Wrong password provider by this user");
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    backgroundColor: Colors.red,
                    content: Text("Wrong password provider by this user",style: TextStyle(fontSize: 14.0,color: Colors.white,fontFamily: "Ubuntu-Medium"),),
                  ),);
            }
      }
    }

    @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
    Widget build(BuildContext context) {
      return Scaffold(
            backgroundColor: Colors.white,
            body: Form(
              key: _formkey,
              child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 60.0,horizontal: 20.0),
                    child: ListView(
                      children: [
                        Padding(padding: EdgeInsets.all(10),
                        child: Image.network("https://www.ouriginal.com/wp-content/uploads/2021/01/Ouriginal_Header_Element-1.png",fit: BoxFit.contain,height: 200,),
                        ),
                        Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            child: TextFormField(
                                  autofocus: false,
                                  decoration: InputDecoration(
                                    labelText: 'Email',
                                    labelStyle: TextStyle(fontSize: 16.0,fontFamily: "Ubuntu-Medium"),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    errorStyle: TextStyle(color: Colors.red,fontSize: 15.0),
                                  ),
                              controller: emailController,
                              validator:(value){
                                    if(value==null || value.isEmpty) {
                                        return 'Please enter email';
                                    }else if(!value.contains('@')) {
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
                              obscureText: false,
                              decoration: InputDecoration(
                              labelText: 'Password',
                              labelStyle: TextStyle(fontSize: 16.0,fontFamily: "Ubuntu-Medium"),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              errorStyle: TextStyle(color: Colors.blueGrey,fontSize: 15.0),
                            ),
                            controller: passwordController,
                            validator:(value){
                              if(value==null || value.isEmpty) {
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
                                    ElevatedButton(onPressed: (){
                                      setState(() {
                                          email = emailController.text;
                                          password = passwordController.text;
                                      });
                                      userLogin();
                                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => UserMain(),),);
                                    },
                                        child: Text('Login',style: TextStyle(fontSize: 16.0,fontFamily: "Ubuntu-Medium"),)
                                    ),
                                    TextButton(onPressed: (){
                                      setState(() {
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPass(),),);
                                      });
                                    },
                                        child: Text('Forgot password?',style: TextStyle(fontSize: 15,color: Colors.red,fontFamily: "Ubuntu-Medium"))),
                                ],
                          ),
                        ),
                        Container(
                            child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Don't have an account?",style: TextStyle(fontFamily: "Ubuntu-Medium"),),
                                    TextButton(onPressed: (){
                                      setState(() {
                                        Navigator.pushAndRemoveUntil(context,
                                            PageRouteBuilder(pageBuilder: (context,a,b) => SignUpAccount(),
                                              transitionDuration: Duration(seconds: 0)
                                            ), (route) => false);
                                      });
                                    },
                                        child: Text("Signup",style: TextStyle(fontFamily: "Ubuntu-Medium"),),),
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
  