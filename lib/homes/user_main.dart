import 'package:flutter/material.dart';
import 'package:flutter_firebase/homes/loginpage.dart';

  class UserMain extends StatefulWidget {
    const UserMain({Key? key}) : super(key: key);
  
    @override
    _UserMainState createState() => _UserMainState();
  }
  
  class _UserMainState extends State<UserMain> {
    String profile = "https://static.wixstatic.com/media/902040_30336145aa8b40d8b6e898e3e107f92c~mv2.png/v1/fill/w_300,h_302,al_c,q_85,usm_0.66_1.00_0.01/User%2005c.webp";
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(title: Text("Nike shop"),centerTitle: true,backgroundColor: Colors.indigo[800],),
        body: _buildBody(),
        drawer: _buildDrawer(),
        bottomNavigationBar: _buildnavBar(),
      );
    }
    _buildBody() {
        return Container();
    }
    _buildnavBar() {
      return BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(icon: Icon(Icons.home,size: 30.0,color: Colors.indigo),onPressed: (){},),
            IconButton(icon: Icon(Icons.play_circle_outline,size: 30.0,color: Colors.indigo,),onPressed: (){},),
            IconButton(icon: Icon(Icons.replay_circle_filled,size: 30.0,color: Colors.indigo,),onPressed: (){},),
            IconButton(icon: Icon(Icons.account_circle,size: 30.0,color: Colors.indigo,),onPressed: (){},),
            IconButton(icon: Icon(Icons.menu,size:30.0,color: Colors.indigo,),onPressed: (){
            },
            ),
          ],
        ),
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
              leading: Icon(Icons.computer_sharp,color: Colors.blueGrey[900]),
              title: Text("Course",style: TextStyle(fontFamily:  "Ubuntu-Medium",fontSize: 16.0)),
              trailing: Icon(Icons.navigate_next_sharp,color: Colors.indigoAccent,),
            ),
            ListTile(
              leading: Icon(Icons.location_history,color: Colors.blueGrey[900]),
              title: Text("Location",style: TextStyle(fontFamily:  "Ubuntu-Medium",fontSize: 16.0)),
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
  