import 'package:flutter/material.dart';

class ChoiceChips extends StatefulWidget {
  IconData icon;
  String text;
  final bool isSelected;

  ChoiceChips(this.icon, this.text, this.isSelected);

  @override
  _ChoiceChipState createState() => _ChoiceChipState();
}

class _ChoiceChipState extends State<ChoiceChips> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
      decoration: widget.isSelected ? BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        )
      ): null,
      child: Row(children: <Widget>[
      Icon(widget.icon, color: Colors.white,),
      Text(widget.text, style: TextStyle(
        color: Colors.white, fontSize: 16.0
        ))
    ],),
    );
     
  }
}