import 'package:flutter/material.dart';
import 'package:flutter_firebase/homes/loginpage.dart';
import 'package:flutter_firebase/user/dashboard.dart';
import 'package:flutter_firebase/user/user_change_password.dart';
import 'package:flutter_firebase/user/user_profile.dart';

  class UserMain extends StatefulWidget {

    @override
    _UserMainState createState() => _UserMainState();
  }
  
  class _UserMainState extends State<UserMain> {
    String profile = "https://static.wixstatic.com/media/902040_30336145aa8b40d8b6e898e3e107f92c~mv2.png/v1/fill/w_300,h_302,al_c,q_85,usm_0.66_1.00_0.01/User%2005c.webp";
    int _selectedIndex=0;
    static List<Widget> _widgetOptions = <Widget> [
          DashboardUser(),
          UserProfile(),
          UserChangePass(),
    ];
    void _OnItemtapped(int index) {
      setState(() {
        _selectedIndex=index;
      });
    }
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: _buildAppBar(),
        body: _buildBody(),
        drawer: _buildDrawer(),
        bottomNavigationBar: _buildNavBar(),
      );
    }
    _buildAppBar() {
        return AppBar(
          title: Text("Nike shop",
            style: TextStyle(fontFamily: "Ubuntu-Medium"),),
            centerTitle: true,
            backgroundColor: Colors.blueGrey,
        );
    }
    _buildBody() {
        _widgetOptions.elementAt(_selectedIndex);
    }
    _buildNavBar() {
      return BottomNavigationBar(
        selectedItemColor: Colors.indigo,
        unselectedItemColor: Colors.blueGrey,
        currentIndex: _selectedIndex,
        onTap: _OnItemtapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined),label: 'Home',),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_basket_rounded), label: 'Wallet',),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: 'Me',),
        ],
      );
    }
    _buildDrawer() {
      return Drawer(
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            DrawerHeader(
              // decoration: BoxDecoration(
              //   gradient: LinearGradient(
              //     begin: Alignment.topCenter,
              //     end: Alignment.bottomCenter,
              //     colors: [Colors.white70,Colors.blueAccent],
              //   ),
              // ),
              child: Image.network(profile),
            ),
            ListTile(
              leading: Icon(Icons.home,color: Colors.blueGrey[900]),
              title: Text("Home",style: TextStyle(fontFamily:  "Ubuntu-Medium",fontSize: 16.0)),
              trailing: Icon(Icons.navigate_next_sharp,color: Colors.indigoAccent,),
            ),
            ListTile(
              leading: Icon(Icons.account_circle_outlined,color: Colors.blueGrey[900]),
              title: Text("Me",style: TextStyle(fontFamily:  "Ubuntu-Medium",fontSize: 16.0)),
              trailing: Icon(Icons.navigate_next_sharp,color: Colors.indigoAccent,),
            ),
            ListTile(
              leading: Icon(Icons.shopping_basket_rounded,color: Colors.blueGrey[900]),
              title: Text("Wallet",style: TextStyle(fontFamily:  "Ubuntu-Medium",fontSize: 16.0)),
              trailing: Icon(Icons.navigate_next_sharp,color: Colors.indigoAccent,),
            ),
            ListTile(
              leading: Icon(Icons.settings,color: Colors.blueGrey[900],),
              title: Text("Setting",style: TextStyle(fontFamily:  "Ubuntu-Medium",fontSize: 16.0)),
              trailing: Icon(Icons.navigate_next_sharp,color: Colors.indigoAccent,),
            ),
            ListTile(
              onTap: () {setState(() {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage(),),);
              });},
              leading: Icon(Icons.logout,color: Colors.redAccent,),
              title: Text("Logout",style: TextStyle(fontFamily:  "Ubuntu-Medium",fontSize: 16.0,color: Colors.redAccent)),
              trailing: Icon(Icons.navigate_next_sharp,color: Colors.redAccent,),
            ),
          ],
        ),
      );
    }
  }
  