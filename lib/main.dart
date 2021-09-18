import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/homes/loginpage.dart';
import 'package:flutter_firebase/homes/signup_account.dart';
import 'package:flutter_firebase/homes/user_main.dart';

  void main() {
      WidgetsFlutterBinding.ensureInitialized();
      runApp(MyApp());
  }
    class MyApp extends StatelessWidget {
      final Future<FirebaseApp>_initailization = Firebase.initializeApp();
      @override
      Widget build(BuildContext context) {
        return FutureBuilder(
          future: _initailization,
          builder: (context,snapshot) {
                 if(snapshot.hasError) {
                   print("Something went wrong");
                 }if(snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CupertinoActivityIndicator());
                 }
                 return MaterialApp(
                      debugShowCheckedModeBanner: false,
                      title:"Flutter firebase",
                      theme: ThemeData(primarySwatch: Colors.blueGrey),
                      home: LoginPage (),
                 );
          },
        );
      }
    }

