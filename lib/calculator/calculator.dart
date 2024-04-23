import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:technovation2024/calculator/co2.dart';
import 'package:technovation2024/home.dart';
import 'package:technovation2024/calculator/o2.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold
      (appBar: AppBar(
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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              height: 360,
              child: ElevatedButton(
                onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => O2()));
                    },
                child: Text("O2"),
                style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(255, 10, 169, 16),
                            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 30),
                            textStyle: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: double.infinity,
                height: 360,
                child: ElevatedButton(
                   onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => CO2()));
                      }, 
                  child: Text("CO2"),
                  style: ElevatedButton.styleFrom(
                              primary: const Color.fromARGB(255, 40, 52, 41),
                              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 30),
                              textStyle: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}