import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:technovation2024/home.dart';

void main() {
  runApp(RecyclingPage());
}

class RecyclingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Recycling Information',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Scaffold(
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
            title: Text('News'),
          ),
        body: RecyclingBody(),
      ),
    );
  }
}

class RecyclingBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Image.asset(
            'lib/recycling.png',
            fit: BoxFit.cover,
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              'Why Recycle?',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              'Recycling helps conserve resources, reduce waste sent to landfills, save energy, and decrease pollution. By recycling, we can contribute to a healthier environment and a sustainable future for generations to come.',
              style: TextStyle(fontSize: 16),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Recycling Tips:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            leading: Icon(Icons.receipt),
            title: Text('Check local recycling guidelines and sorting rules.'),
          ),
          ListTile(
            leading: Icon(Icons.cleaning_services),
            title: Text('Clean and dry recyclables before placing them in the bin.'),
          ),
          ListTile(
            leading: Icon(Icons.public),
            title: Text('Support recycling programs and initiatives in your community.'),
          ),
          ListTile(
            leading: Icon(Icons.repeat),
            title: Text('Reduce, Reuse, Recycle - prioritize in that order.'),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Commonly Recycled Items:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            title: Text('Paper and Cardboard'),
          ),
          ListTile(
            title: Text('Plastic Bottles and Containers'),
          ),
          ListTile(
            title: Text('Glass Bottles and Jars'),
          ),
          ListTile(
            title: Text('Metal Cans and Foil'),
          ),
          ListTile(
            title: Text('Electronics (e-waste)'),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
