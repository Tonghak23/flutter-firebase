import 'package:flutter/material.dart';
  class ForgotPass extends StatefulWidget {
    const ForgotPass({Key? key}) : super(key: key);
  
    @override
    _ForgotPassState createState() => _ForgotPassState();
  }
  
  class _ForgotPassState extends State<ForgotPass> {
    String logo ="https://www.go.ooo/img/bg-img/Login.jpg";
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: _buildAppbar(),
        body: _buildBody(),
      );
    }
    _buildAppbar() {
        return AppBar(title: Text("Forgot password"),centerTitle: true,backgroundColor: Colors.indigo,);
    }
    _buildBody() {
      return Form(
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
                child: TextButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.all(16.0),
                    textStyle: TextStyle(fontSize: 16),
                    backgroundColor: Colors.blueAccent,
                  ),
                  onPressed: () {},
                  child: const Text('Verify new password',style: TextStyle(color: Colors.white,fontSize: 16.0,fontFamily: "Ubuntu-Medium"),),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
  