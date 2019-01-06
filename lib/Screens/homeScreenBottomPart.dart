import 'package:flutter/material.dart';

var viewAllStyle = TextStyle(fontSize: 14.0, color: Colors.orange);
const TextStyle dropDownMenuItemStyle =
    TextStyle(color: Colors.black, fontSize: 14.0);

var homeScreenBottomPart = Column(
  children: <Widget>[
    Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              "Currently watched Items",
              style: dropDownMenuItemStyle,
            ),
            Spacer(),
            Text(
              "VIEW ALL(12)",
              style: viewAllStyle,
            )
          ],
        ))
  ],
);
