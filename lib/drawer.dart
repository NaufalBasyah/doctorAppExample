import 'dart:ui';

import 'package:flutter/material.dart';

Drawer myDrawer(){
  return Drawer(
    // Add a ListView to the drawer. This ensures the user can scroll
    // through the options in the drawer if there isn't enough vertical
    // space to fit everything.
    child: ListView(
      // Important: Remove any padding from the ListView.
      padding: EdgeInsets.zero,
      children: <Widget>[
        UserAccountsDrawerHeader(
          accountName: Text("Naufal F. Basyah"),
          accountEmail: Text("naufal.basyah@gmail.com"),
          currentAccountPicture: CircleAvatar(
            backgroundColor: Colors.white,
            child: Text(
              "N",
              style: TextStyle(
                  fontSize: 40.0,
                  color: Colors.red[600]
              ),
            ),
          ),
          decoration: BoxDecoration(
              color: Colors.red[600]),
        ),
        ListTile(
          title: Text('Edit Profile'),
          onTap: () {
            // Update the state of the app
            // ...
            // Then close the drawer

          },
        ),
        ListTile(
          title: Text('Sign Out'),
          onTap: () {
            // Update the state of the app
            // ...
            // Then close the drawer

          },
        ),
        ListTile(
          title: Text('Contact Us'),
          onTap: () {
            // Update the state of the app
            // ...
            // Then close the drawer

          },
        ),
      ],
    ),
  );
}