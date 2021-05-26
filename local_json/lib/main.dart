import 'package:flutter/material.dart';
import 'dart:convert';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JSON Loader"),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          child: FutureBuilder(
            future: DefaultAssetBundle.of(context)
                .loadString("localjson/jsondata.json"),
            builder: (context, snapshot) {
              var mydata = jsonDecode(snapshot.data.toString());
              return ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text("Name: " + mydata[index]['name']),
                        Text("Age: " + mydata[index]['age']),
                        Text("Gender: " + mydata[index]['gender']),
                      ],
                    ),
                  );
                },
                itemCount: mydata == null ? 0 : mydata.length,
              );
            },
          ),
        ),
      ),
    );
  }
}
