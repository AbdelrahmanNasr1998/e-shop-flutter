import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class LogIn extends StatefulWidget {
  LogIn({Key key}) : super(key: key);

  @override
  _LogInState createState() => _LogInState();
}

showloading(context) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Center(
            heightFactor: 2,
              child: CircularProgressIndicator(valueColor: new AlwaysStoppedAnimation<Color>(Colors.red[900]),)
          ),
        );
      });
}

showdialogall(context, String mytitle, String mycontent) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(mytitle),
          content: Text(mycontent),
          actions: <Widget>[
            FlatButton(
              child: Text("Done", style: TextStyle(color: Colors.red[900]),),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      });
}

class _LogInState extends State<LogIn> {
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  // Start Form Controller

  TextEditingController username = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  GlobalKey<FormState> formstatesignin = new GlobalKey<FormState>();
  GlobalKey<FormState> formstatesignup = new GlobalKey<FormState>();
  //  , String id 
  savePref(String username, String email) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    // preferences.setString("id", id);
    preferences.setString("username", username);
    preferences.setString("email", email);
    print(preferences.getString("username"));
    print(preferences.getString("email"));
    // print(preferences.getString("id"));
  }



  String validglobal (String val) {
    if (val.isEmpty) {
      print("Field is Empty.");
      return "Field is Empty.";
    }
  }

  String validusername (String val) {
    if (val.trim().isEmpty) {
      return "username can't be empty.";
    }
    if (val.length < 4 ) {
      return "username should be more than 4 character.";
    }
    if (val.length > 20 ) {
      return "username should be less than or equal 20 character.";
    }
  }

    String validemail (String val) {
    if (val.trim().isEmpty) {
      return "e-mail can't be empty.";
    }
    if (val.length < 10 ) {
      return "e-mail should be more than 10 character.";
    }
    if (val.length > 50 ) {
      return "e-mail should be less than or equal 50 character.";
    }
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(val)) {
      return " incorrect e-mail.";
    }
  }

  String validpassword (String val) {
    if (val.trim().isEmpty) {
      return "password can't be empty.";
    }
    if (val.length < 8 ) {
      return "password should be more than 8 character.";
    }
    if (val.length > 50 ) {
      return "password should be less than or equal 50 character.";
    }
  }

  signin() async {
    // _autoValidate = true;
    var formdata = formstatesignin.currentState;
    if (formdata.validate()) {
      formdata.save();
      showloading(context);
      var data = {"username" : username.text , "password" : password.text};
      var url = "http://10.0.2.2/dlist/login.php";
      var response = await http.post(url, body: data);
      var responsebody = jsonDecode(response.body);
      if(responsebody['status'] == 'success') {
        print("True");
        savePref(responsebody['username'],responsebody['email']);
        Navigator.of(context).pushNamed('home');
      }else{
        print("False");
        if(Navigator.of(context).canPop()) {
          Navigator.of(context).pop();     
        }
        showdialogall(context, "Log In Faild !", "username or password is incorrect.");
      }
    }else {
      print("not valid");
    }
  }

  signup() async{
    // _autoValidate = true;
    var formdata = formstatesignup.currentState;
    if (formdata.validate()) {
      formdata.save();
      showloading(context);
      var data = {"username" : username.text ,  "email" : email.text , "password" : password.text};
      var url = "http://10.0.2.2/dlist/signup.php";
      var response = await http.post(url, body: data);
      var responsebody = jsonDecode(response.body);
      if(responsebody['status'] == 'success') {
        print("True");
        Navigator.of(context).pushNamed('home');
      }else{
        print("False");
        if(Navigator.of(context).canPop()) {
          Navigator.of(context).pop();     
        }
        showdialogall(context, "Sign Up Faild !", "this e-mail already exists.");
      }
    }else {
      print("not valid");
    }
  }



  TapGestureRecognizer _changesign;
  bool showsignin = true;
  bool _autoValidate = false;

  @override
  void initState() {
    _changesign = new TapGestureRecognizer()
      ..onTap = () {
        setState(() {
          showsignin = !showsignin;
          print(showsignin);
        });
      };
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var mdw = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: Colors.red[900],
        body: Stack(
          children: <Widget>[
            Container(height: double.infinity, width: double.infinity),
            Container(
              height: 1000,
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                        padding: EdgeInsets.only(top: 90, bottom: 5),
                        alignment: Alignment.center,
                        child: showsignin ? Icon(Icons.login, size: 90,):Icon(Icons.sync, size: 90,)
                    ),
                      
                    Container(
                      padding: EdgeInsets.only(bottom: 90),
                      alignment: Alignment.center,
                      child: Text(
                        showsignin ? "Sign In": "Sign Up",
                        style: TextStyle(fontSize: 30, color: Colors.white),),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                    ),
                    
                    showsignin ? buildFormBoxSignIn(mdw) : buildFormBoxSignUp(mdw),

                    Container(
                      padding: EdgeInsets.only(right: 30,left: 30),
                      child: Column(
                        children: <Widget>[
                          showsignin ? InkWell(child: Text("Forget Password ?"),onTap: (){print("tap");},):InkWell(child: Text("Clicking on Sign Up Means That You Have Read The Terms of Creating an Account."),onTap: (){print("tap");},),
                          Padding(padding: EdgeInsets.only(bottom: 10)),
                          RaisedButton(
                            padding: EdgeInsets.symmetric(vertical:10,horizontal: 40),
                            color: Colors.black,
                            splashColor: Colors.yellow[900],
                            onPressed: showsignin ? signin : signup ,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text(showsignin ? "Sign In":"Sign Up", style: TextStyle(color: Colors.white),),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.only(top: 30),
                      child: RichText(
                        text: TextSpan(style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900, color: Colors.black),
                        children: <TextSpan> [
                          TextSpan(text: showsignin ? "You Don't Have An Account ?": "You Have An Account ?"),
                                TextSpan(recognizer: _changesign, text: showsignin ? " Sign Up": " Sign In",style: TextStyle(color: Colors.white))
                          ],
                        ),   
                      ),
                    ),  

                  ],
                ),
              )
            )
        ],
      ),
    );
  }

Center buildFormBoxSignIn(double mdw) {
  return Center(
    child: Form(
      key: formstatesignin,
      // autovalidate: _autoValidate,
      child: Container(
        width: 300,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              buildTextFormFieldAll("username",false, username, validusername, Icon(Icons.person, color: Colors.black,size: 25) ,null),
              SizedBox(
                height: 20,
              ),
              buildTextFormFieldAll("password",true, password, validpassword, Icon(Icons.security, color: Colors.black,size: 25) ,null),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

Center buildFormBoxSignUp(double mdw) {
  return Center(
    child: Form(
      key: formstatesignup,
      // autovalidate: _autoValidate,
      child: Container(
        width: 300,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              buildTextFormFieldAll("username",false, username, validusername, Icon(Icons.person, color: Colors.black,size: 25,),20),
              SizedBox(
                height: 10,
              ),
              buildTextFormFieldAll("e-mail",false, email, validemail, Icon(Icons.mail, color: Colors.black,size: 25,), 50),
              SizedBox(
                height: 10,
              ),
              buildTextFormFieldAll("password",true, password, validpassword , Icon(Icons.security, color: Colors.black,size: 25,) ,null),
              SizedBox(
                height: 20,
              ),    
            ],
          ),
        ),
      ),
    ),
  );
}



  TextFormField buildTextFormFieldAll(String label, bool pass, TextEditingController myController, myvalid, icon, length) {
    return TextFormField(
      obscureText: pass,
      controller: myController,
      validator: myvalid,
      maxLength: length,
      style: TextStyle(fontSize: 20,color: Colors.black),
      cursorColor: Colors.black,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(10),
        // hintText: "username", 
        labelText: label,
        labelStyle: TextStyle(color: Colors.black),
        filled: true, 
        fillColor: Colors.white,
        prefixIcon: icon,
        prefixStyle: TextStyle(fontSize: 30),
        errorStyle: TextStyle(color: Colors.white),
        // border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),       
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: Colors.white,
            width: 2.0,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: Colors.yellow[900],
            width: 2.0,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: Colors.yellow[900],
            width: 2.0,
          ),
        ),
      )
    );
  }


  
}

