import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
  class DashboardUser extends StatefulWidget {
    @override
    _DashboardUserState createState() => _DashboardUserState();
  }

  class _DashboardUserState extends State<DashboardUser> {
    String dashboard ="https://miro.medium.com/max/1400/1*fu3I075PGtnVEABJNRbUnw.png";
    @override
    Widget build(BuildContext context) {
      return Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Image.network(dashboard,fit: BoxFit.cover,),
        ),
      );
    }
  }
