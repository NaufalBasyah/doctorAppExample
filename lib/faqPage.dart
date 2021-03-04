import 'dart:ui';

import 'package:flutter/material.dart';
import 'drawer.dart';

class faqPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Demo App'),
        centerTitle: true,
        backgroundColor: Colors.red[600],
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.home,
              color: Colors.white,
            ),
            onPressed: () {
              // do something
              Navigator.pop(context);
            },
          )
        ],
      ),
      drawer: myDrawer(),
      body: ListView(
          children: <Widget>[
            Text("FAQ",
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.w800,
              ),
              textAlign: TextAlign.center,
            ),
            Card(
              child: ListTile(
                leading: FlutterLogo(size: 56.0),
                title: Text('Common Question'),
                subtitle: Text('Answer here'),
                trailing: Icon(Icons.beenhere_outlined),
              ),
            ),Card(
              child: ListTile(
                leading: FlutterLogo(size: 56.0),
                title: Text('Common Question'),
                subtitle: Text('Answer here'),
                trailing: Icon(Icons.beenhere_outlined),
              ),
            ),Card(
              child: ListTile(
                leading: FlutterLogo(size: 56.0),
                title: Text('Common Question'),
                subtitle: Text('Answer here'),
                trailing: Icon(Icons.beenhere_outlined),
              ),
            ),Card(
              child: ListTile(
                leading: FlutterLogo(size: 56.0),
                title: Text('Common Question'),
                subtitle: Text('Answer here'),
                trailing: Icon(Icons.beenhere_outlined),
              ),
            ),Card(
              child: ListTile(
                leading: FlutterLogo(size: 56.0),
                title: Text('Common Question'),
                subtitle: Text('Answer here'),
                trailing: Icon(Icons.beenhere_outlined),
              ),
            ),Card(
              child: ListTile(
                leading: FlutterLogo(size: 56.0),
                title: Text('Common Question'),
                subtitle: Text('Answer here'),
                trailing: Icon(Icons.block_outlined),
              ),
            ),
          ]
      ),
    );
  }
}