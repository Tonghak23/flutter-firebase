import 'package:flutter/material.dart';
import 'package:flutter_firebase/homes/loginpage.dart';

  class SignUpAccount extends StatefulWidget {
    const SignUpAccount({Key? key}) : super(key: key);

    @override
    _SignUpAccountState createState() => _SignUpAccountState();
  }

  class _SignUpAccountState extends State<SignUpAccount> {
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: Form(
          // key: _formkey,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 60.0,horizontal: 20.0),
            child: ListView(
              children: [
                Padding(padding: EdgeInsets.all(10),
                  child: Image.network("https://cdn.dribbble.com/users/790111/screenshots/15027427/media/e8dc8cbbb22e997d0105043f01391153.png?compress=1&resize=400x300",fit: BoxFit.contain,height: 200,),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: TextFormField(
                    autofocus: false,
                    decoration: InputDecoration(
                      labelText: 'Name',
                      labelStyle: TextStyle(fontSize: 16.0,fontFamily: "Ubuntu-Medium"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      errorStyle: TextStyle(color: Colors.blueGrey,fontSize: 15.0),
                    ),
                    validator:(value){
                      if(value==null || value.isEmpty) {
                        return 'Please enter name';
                      }else if(!value.contains('@')) {
                        return 'Please enter correct name';
                      }
                      return null;
                    },
                  ),
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
                      errorStyle: TextStyle(color: Colors.blueGrey,fontSize: 15.0),
                    ),
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
                    validator:(value){
                      if(value==null || value.isEmpty) {
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
                      labelStyle: TextStyle(fontSize: 16.0,fontFamily: "Ubuntu-Medium"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      errorStyle: TextStyle(color: Colors.blueGrey,fontSize: 15.0),
                    ),
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

                        });
                      },
                          child: Text('Register',style: TextStyle(fontSize: 18.0,fontFamily: "Ubuntu-Medium"),)
                      ),
                      Container(
                        child: TextButton(onPressed: (){
                          setState(() {
                            Navigator.pushAndRemoveUntil(context,
                                PageRouteBuilder(pageBuilder: (context,a,b) => LoginPage(),
                                    transitionDuration: Duration(seconds: 0)
                                ), (route) => false);
                          });
                        },
                            child: Text('back to login?',style: TextStyle(fontSize: 15,color: Colors.red,fontFamily: "Ubuntu-Medium"))),
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
