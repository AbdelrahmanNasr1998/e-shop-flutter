import 'package:flutter/material.dart';
import 'package:flutter_course_project/pages/details.dart';
import 'pages/home.dart';
import 'pages/categories.dart';
import 'pages/categories/asus.dart';
import 'pages/categories/razer.dart';
import 'pages/categories/acer.dart';
import 'pages/categories/apple.dart';
import 'pages/categories/hp.dart';
import 'pages/categories/lenovo.dart';
import 'pages/login.dart';
import 'pages/about.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "E-Commerce",
      home: Home(),
      routes: {
        'home' : (context) {
          return Home();
        },
        'categories' : (context) {
          return Categories();
        },
        'asus' : (context) {
          return Asus();
        },
        'razer' : (context) {
          return Razer();
        },
        'acer' : (context) {
          return Acer();
        },
        'apple' : (context) {
          return Apple();
        },
        'hp' : (context) {
          return Hp();
        },
        'lenovo' : (context) {
          return Lenovo();
        },
        'login' : (context) {
          return LogIn();
        },
        'about' : (context) {
          return About();
        },
      },
    );
  }
}

class Login {
}