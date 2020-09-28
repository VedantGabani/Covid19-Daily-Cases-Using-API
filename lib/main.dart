import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'HomePage.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'dart:async';
void main() async{
  runApp(new MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: new AppBarTheme(
          color: Colors.blue[700],
        ),
        brightness: Brightness.dark,
      ),
      home: HomePage(),
    );
  }
}

// Future<List> getAllData() async{
//   var api = "https://coronavirus-19-api.herokuapp.com/countries";
//   var data = await http.get(api);
//   var jsonData = json.decode(data.body);

//   return jsonData;
// }