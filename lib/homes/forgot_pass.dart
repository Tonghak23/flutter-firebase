import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/homes/loginpage.dart';
import 'package:flutter_firebase/homes/signup_account.dart';
  class ForgotPass extends StatefulWidget {

    @override
    _ForgotPassState createState() => _ForgotPassState();
  }
  class _ForgotPassState extends State<ForgotPass> {
    String logo ="https://www.go.ooo/img/bg-img/Login.jpg";
    var _email="";
    final _formkey=GlobalKey<FormState>();
    var _emailController = TextEditingController();
    resetPassWord() async {
          try{
              await FirebaseAuth.instance.sendPasswordResetEmail(email: _email);
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: Colors.red,
                content: Text("Password reset email has been send",style: TextStyle(fontSize: 14.0,color: Colors.white,fontFamily: "Ubuntu-Medium"),),
              ),);
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage(),),);
          }on FirebaseAuthException catch(error){
              if(error.code=="user-not-found") {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: Colors.red,
                  content: Text("Email no registered",style: TextStyle(fontSize: 14.0,color: Colors.white,fontFamily: "Ubuntu-Medium"),),
                ),);
              }
        }
    }

    @override
  void dispose() {
  super.dispose();
  _emailController.dispose();
  }

  @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: _buildAppbar(),
        body: _buildBody(),
      );
    }
    _buildAppbar() {
        return AppBar(title: Text("Verify new password",style: TextStyle(fontFamily: "Ubuntu-Medium"),),centerTitle: true,backgroundColor: Colors.indigo,);
    }
    _buildBody() {
      return Form(
        key: _formkey,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 60,horizontal: 20),
          child: ListView(
            children: [
                Padding(padding: EdgeInsets.all(10),
                child: Image.network(logo,fit: BoxFit.contain,height: 200,),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: TextFormField(
                  autofocus: false,
                  autocorrect: false,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(fontSize: 16.0,fontFamily: "Ubuntu-Medium"),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    errorStyle: TextStyle(color: Colors.red,fontSize: 15.0),
                  ),
                  controller: _emailController,
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
              SizedBox(height: 10),
              Container(
                margin: EdgeInsets.symmetric(vertical: 16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          if(_formkey.currentState!.validate()) {
                            setState(() {
                              _email = _emailController.text;
                            });
                            resetPassWord();
                          }
                        },
                        child: Text(
                          'Verify password',
                          style: TextStyle(
                              fontSize: 18.0, fontFamily: "Ubuntu-Medium"),
                        )),
                  ],
                ),
              ),
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
              ),
            ],
          ),
        ),
      );
    }
  }
  