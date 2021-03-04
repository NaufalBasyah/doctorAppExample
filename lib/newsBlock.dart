import 'dart:ui';

import 'package:flutter/material.dart';
Container createNewsWidget(String imgName, String articleName) {
  return Container(
    child: InkWell(
      child: Container(

        margin: EdgeInsets.only(bottom: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
          color: Colors.white,
        ),
        child: Container(
          padding: EdgeInsets.all(7),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Container(
                width: 70,
                height: 90,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            'Assets/images/custom_icons/$imgName'),
                        fit: BoxFit.cover
                    )
                ),
              ),
              SizedBox(width: 10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("$articleName", style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),),
                  SizedBox(height: 5,),
                  Container(
                    width: 250,
                    height: 50,
                    child: Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam vel erat a quam semper sagittis. ",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                      overflow: TextOverflow.clip,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
      onTap: () {},
    ),
  );
}

Container newsScroll() {
  return Container(
    height: 250,
    child: SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: <Widget>[
          createNewsWidget("FAQ.png", "News #1"),
          createNewsWidget("FAQ.png", "News #2"),
          createNewsWidget("FAQ.png", "News #3"),
          createNewsWidget("FAQ.png", "News #4"),
        ],
      ),
    ),
  );
}