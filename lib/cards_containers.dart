import 'dart:ui';

import 'package:flutter/material.dart';

Card selectionCard(BuildContext cntxt,String fileName, String title, double scale, double textScale, StatelessWidget s) {
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.0),
    ),
    elevation: 10,
    child: InkWell(
        child: categoryContainer( fileName, title, scale, textScale),
        onTap: () {
          Navigator.push(
            cntxt,
            new MaterialPageRoute(builder: (cntxt) => s),);
        }
    ),
  );
}

Container categoryContainer(String imgName, String title, double inputNum, double inputNum2)
{
  return Container(
    width: 200*inputNum,
    height: 240*inputNum,
    child: Column(
      children: <Widget>[
        Image.asset('Assets/images/custom_icons/$imgName'),
        Text(
            "$title", style: TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 18*inputNum2
        ),
            textAlign: TextAlign.center
        )
      ],
    ),
  );
}