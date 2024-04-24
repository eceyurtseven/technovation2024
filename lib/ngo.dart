import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:technovation2024/home.dart';

void main() {
  runApp(NGO());
}

class NGO extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
            title: Text('NGO'),
          ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'lib/un.png',
                width: 250,
                height: 250,
              ),
              SizedBox(height: 20,),
              Text(
                'Sustainable Development Goal 13 (SDG 13) focuses on Climate Action, addressing the urgent need to combat climate change and its impacts. Climate change poses a significant threat to the environment, economies, and livelihoods worldwide. Rising temperatures, extreme weather events, sea-level rise, and disrupted ecosystems are some of the key challenges associated with climate change.',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 16.0),
              Text(
                'To tackle these issues, various solutions are being implemented globally. Transitioning to renewable energy sources such as solar, wind, and hydroelectric power reduces reliance on fossil fuels, thereby decreasing greenhouse gas emissions. Investing in energy-efficient technologies and infrastructure promotes sustainable development while mitigating climate impacts. Reforestation and afforestation efforts play a crucial role in sequestering carbon dioxide and restoring ecosystems, contributing to climate resilience.',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 16.0),
              Text(
                'Furthermore, enhancing climate resilience through adaptation measures, such as building climate-resilient infrastructure and implementing early warning systems, helps communities better withstand the impacts of climate change. International cooperation and policy frameworks, like the Paris Agreement, facilitate collective action and commitment to reducing greenhouse gas emissions on a global scale.',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 16.0),
              Text(
                'Despite these efforts, challenges persist, including inadequate funding, lack of political will, and socio-economic barriers. Addressing these challenges requires multi-stakeholder collaboration, innovative solutions, and increased awareness. By prioritizing climate action and implementing sustainable practices, we can mitigate the impacts of climate change and work towards a more resilient and sustainable future for all.',
                style: TextStyle(fontSize: 16.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
