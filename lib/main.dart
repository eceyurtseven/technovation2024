import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:technovation2024/hello.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

void main() async{
   WidgetsFlutterBinding.ensureInitialized();
   MobileAds.instance.initialize();

  await Supabase.initialize(
    url: "https://yvxfrjwvewrjvrzjjfwr.supabase.co",
    anonKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inl2eGZyand2ZXdyanZyempqZndyIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTEyODAyOTEsImV4cCI6MjAyNjg1NjI5MX0.9uYEZwIYZx7mq1Jn2oc9_mQKinK03AStXprLjLlYC8o",
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override 
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HelloPage(),
      theme: ThemeData(
        primarySwatch: Colors.green,
        appBarTheme: const AppBarTheme(
          color: Colors.green,
        )
       ),
      
    );
  }
}