import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:technovation2024/home.dart';

void main() {
  runApp(CarbonFootprintCalculator());
}

class CarbonFootprintCalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: CarbonFootprintPage(),
    );
  }
}

class CarbonFootprintPage extends StatefulWidget {
  @override
  _CarbonFootprintPageState createState() => _CarbonFootprintPageState();
}

class _CarbonFootprintPageState extends State<CarbonFootprintPage> {
  double electricityUsage = 0.0;
  double gasUsage = 0.0;
  double vehicleMiles = 0.0;
  double carbonFootprint = 0.0;

  void calculateCarbonFootprint() {
    setState(() {
      // Assuming some constants for carbon footprint calculation
      double electricityCO2PerKWh = 0.5; // in kgCO2 per kWh
      double gasCO2PerTherm = 12.0; // in kgCO2 per therm
      double vehicleCO2PerMile = 0.4; // in kgCO2 per mile

      double electricityCarbon = electricityUsage * electricityCO2PerKWh;
      double gasCarbon = gasUsage * gasCO2PerTherm;
      double vehicleCarbon = vehicleMiles * vehicleCO2PerMile;

      carbonFootprint = electricityCarbon + gasCarbon + vehicleCarbon;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.green,
            leading: BackButton(
              onPressed: () {
              Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.leftToRight,
                    child: HomePage(),
                  ),
                );
                },
            ),
            title: Text('CO2 / O2 Calculator'),
        ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(height: 20),
            Text(
              'Enter your usage:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Image.asset(
                        'lib/calculator/electric.png',
                        width: 100,
                        height: 100,
                      ),
                      SizedBox(height: 10),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Electricity Usage (kWh)',
                        ),
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          setState(() {
                            electricityUsage = double.tryParse(value) ?? 0.0;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Image.asset(
                        'lib/calculator/gas.png',
                        width: 100,
                        height: 100,
                      ),
                      SizedBox(height: 10),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Gas Usage (therms)',
                        ),
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          setState(() {
                            gasUsage = double.tryParse(value) ?? 0.0;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Image.asset(
                        'lib/calculator/car.png',
                        width: 100,
                        height: 100,
                      ),
                      SizedBox(height: 10),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Vehicle Miles',
                        ),
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          setState(() {
                            vehicleMiles = double.tryParse(value) ?? 0.0;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: calculateCarbonFootprint,
              child: Text('Calculate'),
            ),
            SizedBox(height: 20),
            Text(
              'Carbon Footprint: ${carbonFootprint.toStringAsFixed(2)} kgCO2',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
