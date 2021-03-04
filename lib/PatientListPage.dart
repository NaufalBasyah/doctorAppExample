import 'dart:ui';

import 'package:flutter/material.dart';
import 'newsBlock.dart';
import 'drawer.dart';

class patientList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Patients'),
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
              // Navigator.push(context, new MaterialPageRoute(builder: (context) => homePage()));
            },
          )
        ],
      ),
      drawer: myDrawer(),
      body: ListView(
          children: <Widget>[
            Text("Active Patients List",
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.w800,
              ),
              textAlign: TextAlign.center,
            ),
            Container(
              height: 550,
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: <Widget>[
                    createNewsWidget("Appointment.png", "Jane Doe"),
                    createNewsWidget("Appointment.png", "John Doe"),
                    createNewsWidget("Appointment.png", "Jane Doe"),
                    createNewsWidget("Appointment.png", "John Doe"),
                    createNewsWidget("Appointment.png", "Jane Doe"),
                    createNewsWidget("Appointment.png", "John Doe"),
                    createNewsWidget("Appointment.png", "Jane Doe"),
                    createNewsWidget("Appointment.png", "John Doe"),
                    createNewsWidget("Appointment.png", "Jane Doe")
                  ],
                ),
              ),
            )
          ]
      ),
    );
  }
}