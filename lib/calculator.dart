import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Trip Cost Calculator",
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new FuelForm(),
    );
  }
}

class FuelForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FuelFormState();
}

class _FuelFormState extends State<FuelForm> {
  String results = '';
  final _currencies = ['Dollars', 'Euro', 'Pound'];
  String _currency = 'Pound';

  TextEditingController distanceController = TextEditingController();
  TextEditingController avgController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.title;
    return Scaffold(
      appBar: AppBar(
        title: Text("Trip Cost Calculator"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        padding: EdgeInsets.all(15.0),
        child: Column(children: <Widget>[
          TextField(
            controller: distanceController,
            decoration: InputDecoration(
              labelText: 'Distance',
              hintText: 'e.g. 124',
              labelStyle: textStyle,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0)
              )
            ),
            keyboardType: TextInputType.number,
          ),
          TextField(
            controller: avgController,
            decoration: InputDecoration(
              labelText: 'Distance per unit',
              hintText: 'e.g. 17',
              labelStyle: textStyle,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0)
              )
            ),
            keyboardType: TextInputType.number,
          ),
          TextField(
            controller: priceController,
            decoration: InputDecoration(
              labelText: 'Price',
              hintText: 'e.g. 1.65',
              labelStyle: textStyle,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0)
              )
            ),
            keyboardType: TextInputType.number,
          ),
          DropdownButton<String>(
            items: _currencies.map((String value){
              return DropdownMenuItem(
                value: value,
                child: Text(value)
              );
            }).toList(), 
            value: _currency,
            onChanged: (String value) {
              _onDropdownChanged(value);
            },
          ),
          RaisedButton(
            color: Theme.of(context).primaryColorDark,
            textColor: Theme.of(context).primaryColorLight,
            onPressed: () {
              setState(() {
                results = _calculate();
              });
            },
            child: Text(
              'Submit',
              textScaleFactor: 1.5,
            ),
          ),
          Text(results)
        ],),
      )
    );
  }

  _onDropdownChanged(String value) {
    setState(() {
          this._currency = value;
        });
  }

  String _calculate() {
    double _distance = double.parse(distanceController.text);
    double _fuelCost = double.parse(priceController.text);
    double _consumption = double.parse(avgController.text);
    double _totalCost = _distance / _consumption * _fuelCost;

    String _result = 'The total cost of your trip is ' +
      _totalCost.toStringAsFixed(2) + ' ' + _currency;
    return _result;
  }
}