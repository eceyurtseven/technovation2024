import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:technovation2024/home.dart';

class AirMap extends StatefulWidget {
  const AirMap({super.key});

  @override
  State<AirMap> createState() => _AirMapState();
}

class _AirMapState extends State<AirMap> {
  @override
  String? city = "Istanbul";
  var new_city;
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
        title: Text('Air Quality Map'),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        padding: EdgeInsets.only(left: 10, right: 10, top: 30),
        child: Column(
          children: [
            Icon(
              Icons.air,
              size: 150,
              color: Colors.green,),
              SizedBox(height: 20,),
            DropdownButton(
              iconSize: 40,
              value: city,
              items: [
                DropdownMenuItem(
                  child: Text("Istanbul"),
                  value: "Istanbul",
                ),
                DropdownMenuItem(
                  child: Text("Houston"),
                  value: "Houston",
                ),
                DropdownMenuItem(
                  child: Text("Seville"),
                  value: "Seville",
                ),
              ],
              onChanged: (new_city) {
                setState(() {
                  city = new_city;
                });
              },
            ),
            Column(
              children: [
                if (city == "Istanbul")
                  Image.asset(
                    "lib/maps/photos/istanbul_air.png",
                    height: 250,
                  )
                else if (city == "Houston")
                  Image.asset("lib/maps/photos/houston_air.png",
                    height: 250,
                  )
                else if (city == "Seville")
                  Image.asset("lib/maps/photos/seville_air.png",
                  height: 250,
                )
                  
              ],
            )
          ],
        ),
      ),
    );
  }
}