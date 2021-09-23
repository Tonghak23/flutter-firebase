import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

  class UserProfile extends StatefulWidget {
    @override
    _UserProfileState createState() => _UserProfileState();
  }

  class _UserProfileState extends State<UserProfile> {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    final email = FirebaseAuth.instance.currentUser!.email;
    final creationTime = FirebaseAuth.instance.currentUser!.metadata.creationTime;
    @override
    Widget build(BuildContext context) {
      return Container();
    }
  }
