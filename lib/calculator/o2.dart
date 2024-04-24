import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:technovation2024/home.dart';

void main() {
  runApp(OxygenGainCalculator());
}

class OxygenGainCalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Oxygen Gain Calculator',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: OxygenGainPage(),
    );
  }
}

class OxygenGainPage extends StatefulWidget {
  @override
  _OxygenGainPageState createState() => _OxygenGainPageState();
}

class _OxygenGainPageState extends State<OxygenGainPage> {
  int treeCount = 0;
  int oxygenGain = 0;

  void calculateOxygenGain() {
    setState(() {
      // Each tree can produce approximately 260 pounds of oxygen per year
      // and one pound of oxygen is roughly equal to 0.119688 liters
      const double oxygenPerTreePerYear = 260 * 0.119688;
      oxygenGain = (treeCount * oxygenPerTreePerYear).toInt();
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
            SizedBox(height: 30,),
            Icon(Icons.forest, size: 200, color: Colors.green),
            SizedBox(height: 30,),
            Text(
              'Number of Trees Planted:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () {
                    setState(() {
                      if (treeCount > 0) treeCount--;
                    });
                  },
                ),
                Text(
                  '$treeCount',
                  style: TextStyle(fontSize: 18),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    setState(() {
                      treeCount++;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: calculateOxygenGain,
              child: Text('Calculate'),
            ),
            SizedBox(height: 20),
            Text(
              'Oxygen Gain: $oxygenGain liters per year',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
