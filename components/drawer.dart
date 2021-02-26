import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {

  var username;
  var email;
  bool isSignIn = false;
  getPref() async {
      SharedPreferences preferences = await SharedPreferences.getInstance();

      username = preferences.getString("username");
      email = preferences.getString("email");

      if (username != null) {
        setState(() {
          username = preferences.getString("username");
          email = preferences.getString("email");
          isSignIn = true;
          print("username");
          print("email");
        });
      }else{
        print("object");
      }
    }


  @override
  void initState() {
     getPref() ; 
    super.initState();
  }

  @override
  Widget build(BuildContext context) {   
  
    return Drawer(
          child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: isSignIn ? Text(username) : Text(""),
                accountEmail: isSignIn ? Text(email) : Text("You are not logged in yet."),
                currentAccountPicture: CircleAvatar(
                  child:Icon(Icons.person)
                  ),
                decoration: BoxDecoration(
                  color: Colors.red[900], 
                ),
              ),
              ListTile(
                title: Text("Home Page", style: TextStyle(fontSize: 16),),
                leading: Icon(Icons.home),
                onTap: (){
                  Navigator.of(context).pushNamed("home");
                },
              ),
              ListTile(
                title: Text("Categories", style: TextStyle(fontSize: 16),),
                leading: Icon(Icons.category),
                onTap: (){
                  Navigator.of(context).pushNamed("categories");
                },
              ),
              ListTile(
                title: Text("About App", style: TextStyle(fontSize: 16),),
                leading: Icon(Icons.code),
                onTap: (){
                  Navigator.of(context).pushNamed("about");
                },
              ),
              ListTile(
                title: Text("Settings", style: TextStyle(fontSize: 16),),
                leading: Icon(Icons.settings),
                onTap: (){},
              ),
              
              isSignIn?
                ListTile(
                  title: Text("Logout", style: TextStyle(fontSize: 16),),
                  leading: Icon(Icons.login),
                  onTap: () async{
                    SharedPreferences preferences = await SharedPreferences.getInstance();
                    preferences.remove("username");
                    preferences.remove("email");
                    Navigator.of(context).pushNamed("home");
                  },
                )
              : 
                ListTile(
                  title: Text("Login", style: TextStyle(fontSize: 16),),
                  leading: Icon(Icons.login),
                  onTap: (){
                    Navigator.of(context).pushNamed("login");
                  },
                ),
            ],
          ),
        );
  }
}


// class MyDrawer extends StatelessWidget {
//   var username;
//   var email;
//   @override
//   Widget build(BuildContext context) {
//   }
// }