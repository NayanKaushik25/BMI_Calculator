import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(myApp());

String Weight = "";
String Height = "";
double BMI = 0.0;
String bodystate = "";
double _result = 0.0;
String stringBMI = "";

class myApp extends StatefulWidget {
  const myApp({Key? key}) : super(key: key);

  @override
  State<myApp> createState() => _myAppState();
}

class _myAppState extends State<myApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: AppScreen(),
    );
  }
}

class AppScreen extends StatefulWidget {
  const AppScreen({Key? key}) : super(key: key);

  @override
  State<AppScreen> createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI Calculator',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 39, 255, 150),
        foregroundColor: Colors.white,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Calculate Your BMI',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 32),
          ),
          SizedBox(
            height: 15.0,
          ),
          Padding(padding: EdgeInsets.all(10)),
          TextField(
            onChanged: (text) {
              Weight = text;
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Weight in Kg',
              hintText: 'Enter your Weight in Kg',
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          TextField(
            onChanged: (text) {
              Height = text;
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Height in meters',
              hintText: 'Enter your Weight in meters',
            ),
          ),
          SizedBox(
            height: 10,
          ),
          RaisedButton(
            onPressed: () {
              BMICalculation();
              print(BMI);
              setState(() {
                BMI = BMI;
                Height = Height;
              });
            },
            color: Colors.blueAccent,
            child: Text(
              'COMPUTE',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 5.0),
          Text(
            '${stringBMI}',
            style: TextStyle(
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '${bodystate}',
            style: TextStyle(
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

void BMICalculation() {
  BMI = double.parse(Weight) / (double.parse(Height) * double.parse(Height));
  BMI = double.parse((BMI).toStringAsFixed(2));
  stringBMI = BMI.toString();
  stringBMI = "Your BMI is " + stringBMI;
  if (BMI < 18.5) {
    bodystate = "You are Underweight";
  } else if (BMI >= 18.5 && BMI <= 24.9) {
    bodystate = "You are Healthy";
  } else if (BMI >= 25 && BMI <= 29.9) {
    bodystate = "You are Overweight";
  } else {
    bodystate = "You are Obese";
  }
}
