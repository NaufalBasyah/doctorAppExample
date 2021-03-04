import 'dart:ui';

import 'package:flutter/material.dart';
import 'calendarWidget.dart';
import 'drawer.dart';
import 'cards_containers.dart';
import 'newsBlock.dart';
import 'faqPage.dart';
import 'appointmentPage.dart';
import 'PatientListPage.dart';


void main() => runApp(MyApp());

/// This is the main application widget.
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: homePage(),
    );
  }
}

/// This is the stateless widget that the main application instantiates.
class MyStatelessWidget extends StatelessWidget {
  MyStatelessWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
          children: <Widget> [IntrinsicHeight(
          child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

          children: <Widget> [
            selectionCard(context,"Appointment.png", "Make an Appointment", 1.2, 1.2, appointmentPage_Date()),
            Column(
                children: <Widget>[
                  selectionCard(context,"FAQ.png", "FAQ", 0.4, .6, faqPage()),
                  selectionCard(context,"Medicine.png", "Non-Prescription Medicine", 0.4,.4, homePage()),
                  selectionCard(context,"Schedule.png","Your Schedules",0.4,.6, CalendarPage())
              ]
            )
        ],
        )
      ),
      Text("Medical News",
        style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w800,
        ),
        textAlign: TextAlign.left,
      ),
      newsScroll()
    ]
    );
  }
}

class homePage extends StatelessWidget {
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
                Icons.settings,
                color: Colors.white,
              ),
              onPressed: () {
                // do something
              },
            )
          ],
        ),
        body: MyStatelessWidget(),
        drawer: myDrawer()
    );
  }
}









