import 'package:flutter/material.dart';
import 'package:fuel_app/Screens/customShapeClipper.dart';
import 'package:fuel_app/Screens/choiceChip.dart';

Color firstColor = Color(0xFFF47D15);
Color secondColor = Color(0xFFF47D15);

List<String> locations = ['Kiambu (KBU)', 'Nairobi (NRB)'];

const TextStyle dropDownLabelStyle = TextStyle(color: Colors.white, fontSize: 13.0);
const TextStyle dropDownMenuItemStyle = TextStyle(color: Colors.black, fontSize: 13.0);

class HomeScreen extends StatefulWidget {
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var selectedLocationIndex = 0;
  bool isFlightSelected = true;

  @override
  Widget build(BuildContext context) {
    return Stack(
       children: <Widget>[
         ClipPath(
           clipper: CustomShapeClipper(),
           child: Container(
             height: 400.0, 
             decoration: BoxDecoration(
               gradient: LinearGradient(colors: [firstColor, secondColor])
             ),
             child: Column(
               children: <Widget>[
                 SizedBox(height: 50.0,),
                 Padding(
                   padding: const EdgeInsets.all(16.0),
                   child: Row(children: <Widget>[
                     Icon(Icons.location_on, color: Colors.white),
                     SizedBox(width: 10.0,),
                     PopupMenuButton(
                       onSelected: (index) {
                         setState(() {
                            selectedLocationIndex = index;
                         });
                       },
                       child: Row(children: <Widget>[
                         Text(
                           locations[selectedLocationIndex], 
                           style: TextStyle(color: Colors.white, fontSize: 16.0),
                         ),
                         Icon(Icons.keyboard_arrow_down, color: Colors.white)
                       ],
                       ),
                       itemBuilder: (BuildContext context) => <PopupMenuItem<int>>[
                         PopupMenuItem(
                           child: Text(locations[0], style: dropDownMenuItemStyle),
                           value: 0,
                         ),
                         PopupMenuItem(
                           child: Text(locations[1], style: dropDownMenuItemStyle),
                           value: 1,
                         )
                       ],
                     ),
                     Spacer(),
                     Icon(Icons.settings, color: Colors.white),
                   ],),
                 ),
                 SizedBox(height: 50.0,),
                 Text('Where would\n you want to go?',
                  style: TextStyle(fontSize: 24.0, color: Colors.white),
                  textAlign: TextAlign.center,
                 ),
                 SizedBox(height: 30.0),
                 Padding(
                   padding: EdgeInsets.symmetric(horizontal: 32.0),
                   child: Material(
                     elevation: 5.0,
                     borderRadius: BorderRadius.all(Radius.circular(30.0)),
                     child: TextField(
                       controller: TextEditingController(text: locations[selectedLocationIndex]),
                       style: dropDownMenuItemStyle,
                       cursorColor: Colors.orange,
                       decoration: InputDecoration(
                         contentPadding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 14.0),
                         border: InputBorder.none,
                         suffixIcon: Material(
                           elevation: 2.0,
                           borderRadius: BorderRadius.all(Radius.circular(30.0)),
                           child: Icon(Icons.search, color: Colors.black),
                         )
                       ),
                     )
                   ),
                 ),
                 SizedBox(height: 20.0,),
                 Row(
                   mainAxisSize: MainAxisSize.min,
                   mainAxisAlignment: MainAxisAlignment.spaceAround,
                   children: <Widget>[
                     InkWell(
                       child: ChoiceChips(Icons.flight_takeoff, "Flights", isFlightSelected),
                       onTap: () {
                         setState(() {
                           isFlightSelected = true;
                         });
                       },
                     ),
                    SizedBox(width: 20.0,),
                    InkWell(
                      child: ChoiceChips(Icons.hotel, "Hotels", !isFlightSelected),
                      onTap: () {
                         setState(() {
                           isFlightSelected = false;
                         });
                       }
                    )
                 ],)
               ],
             ),
           ),
         ),
       ]
    );
  }
}


