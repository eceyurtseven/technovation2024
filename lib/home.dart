import 'package:flutter/material.dart';
import 'package:technovation2024/advertisement.dart';
import 'package:technovation2024/calculator/calculator.dart';
import 'package:technovation2024/maps/air_map.dart';
import 'package:technovation2024/maps/plant_map.dart';
import 'package:technovation2024/news.dart';
import 'package:technovation2024/ngo.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("EnviroRoot")),
      drawer: Drawer(
        child: ListView(padding: EdgeInsets.zero, children: [
          DrawerHeader(
              decoration: BoxDecoration(color: Theme.of(context).primaryColor),
              child: Text(
                "Pages",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Colors.white),
              )),
          ListTile(
            onTap: () {
              /*Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  ScoutingPage())); */
            },
            title: const Text("Profile"),
          ),
          ListTile(
            title: const Text('Settings'),
            onTap: () {
              /* Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SettingsPage())); */
              //final router = ref.read(routerProvider);
              //router.push(SettingsPage.path);
            },
          ),
          ListTile(
            onTap: () {
              /*Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  ScoutingPage())); */
            },
            title: const Text("Help"),
          ),
        ]),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        const SizedBox(height: 150,),
          Text(
              "Welcome to EnviroRoot!",
              style: TextStyle(
                color: Colors.green[800],
                fontSize: 22,
                fontWeight: FontWeight.bold,
            ),
            ),
          const SizedBox(height: 50,),
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RewardedExample()));
                    },
                    child: Text("AdTree")),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RecyclingPage()));
                    },
                    child: Text("News")),
                 TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Calculator()));
                    },
                    child: Text("CO2 / O2 Calculator")),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AirMap()));
                    },
                    child: Text("Air Quality Data")),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PlantMap()));
                    },
                    child: Text("Tree Planting Map")),
                TextButton(
                    onPressed: () {
                      //final router = ref.watch(routerProvider);
                      //router.push(PitScoutingsPage.path);
                    },
                    child: Text("AI Tree Identification")),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => NGO()));
                    },
                    child: Text("NGO Cooperation")),
              ]),
        ],
      ),
    );
  }
}