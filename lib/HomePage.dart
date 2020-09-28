import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _index = 0;

  final String api = "https://coronavirus-19-api.herokuapp.com/countries";
  List data;

  @override
  void initState() {
    super.initState();
    this.getAllData();
  }

  Future<List> getAllData() async{
    var response = await http.get(api);
    print(response.body);

    setState(() {
      var convertDataToJson = json.decode(response.body);
      data = convertDataToJson;
    });

    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: new AppBar(
        title: new Text("Covid-19 Cases"),
        centerTitle: true,
      ),
      body: Center(
        child: SizedBox(
          height: 400, // card height
          child: PageView.builder(
            itemCount: data == null ? 0 : data.length,
            controller: PageController(viewportFraction: 0.7),
            onPageChanged: (int index) => setState(() => _index = index),
            itemBuilder: (_, i) {
              return Transform.scale(
                scale: i == _index ? 1 : 0.9,
                child: Card(
                  elevation: 6,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      new Text(
                        data[_index]["country"],
                        style: TextStyle(fontSize: 32, color: Colors.blue[700]),
                        textAlign: TextAlign.center,
                      ),
                      new SizedBox(height: 20.0,),
                      new Text("Cases: "+
                        data[_index]["cases"].toString(),
                        style: TextStyle(fontSize: 22, color: Colors.deepOrange[300]),
                      ),
                      new SizedBox(height: 5.0,),
                      new Text("Today Cases: "+
                        data[_index]["todayCases"].toString(),
                        style: TextStyle(fontSize: 22, color: Colors.deepOrange[300]),
                      ),
                      new SizedBox(height: 5.0,),
                      new Text("Deaths: "+
                        data[_index]["deaths"].toString(),
                        style: TextStyle(fontSize: 22),
                      ),
                      new SizedBox(height: 5.0,),
                      new Text("Today Deaths: "+
                        data[_index]["todayDeaths"].toString(),
                        style: TextStyle(fontSize: 22),
                      ),
                      new SizedBox(height: 5.0,),
                      new Text("Critical: "+
                        data[_index]["critical"].toString(),
                        style: TextStyle(fontSize: 22),
                      ),
                      new SizedBox(height: 5.0,),
                      new Text("Active: "+
                        data[_index]["active"].toString(),
                        style: TextStyle(fontSize: 22, color: Colors.green[300]),
                      ),
                      new SizedBox(height: 5.0,),
                      new Text("Recovered: "+
                        data[_index]["recovered"].toString(),
                        style: TextStyle(fontSize: 22, color: Colors.green[300]),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}