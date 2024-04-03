import 'dart:io';
import 'package:page_transition/page_transition.dart';
import 'package:technovation2024/home.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:flutter/material.dart';

class RewardedExample extends StatefulWidget {
  const RewardedExample({super.key});

  @override
  RewardedExampleState createState() => RewardedExampleState();
}

class RewardedExampleState extends State<RewardedExample> {
  RewardedAd? _rewardedAd;
  var _showWatchVideoButton = false;
  var _number = 8;
  var _trees = 0;
  bool pressed = false;

  // TODO: replace this test ad unit with your own ad unit.
  final adUnitId = Platform.isAndroid
    ? 'ca-app-pub-3940256099942544/5224354917'
    : 'ca-app-pub-3940256099942544/1712485313';

  @override
  void initState() {
    super.initState();
    _startNewGame();
    
  }

  void _startNewGame() {
    loadAd();
  }

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
            title: Text('AdTree'),
          ),
          body: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: EdgeInsets.only(top: 50),
                  child: Icon(Icons.forest, size: 150, color: Colors.green,)
                ),
              ),
              const Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.only(top: 250, left: 30, right:30 ),
                    child: Text(
                      'Here you may watch ads to plant trees! With each 10 ads you plant 1 tree.',
                      softWrap: true,
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(
                            fontSize: 25, 
                            fontWeight: FontWeight.bold,
                            leadingDistribution: TextLeadingDistribution.proportional,
                            
                          ),
                    ),
                  )),
              Align(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 50,),
                      Visibility(
                        visible: !pressed,
                        child: ElevatedButton(
                          onPressed: (){
                            setState(() {
                              pressed = true;
                              debugPrint('pressed = true');
                              _showWatchVideoButton = true;
                              _startNewGame();
                            });
                          }, 
                          style: ElevatedButton.styleFrom(
                            primary: Colors.green,
                            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 30),
                            textStyle: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          child: Text(pressed
                            ? 'Advertisement!'
                            : 'Let\'s Plant Trees!'),
                        ),
                      ),
                      Visibility(
                          visible: _showWatchVideoButton,
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                _showWatchVideoButton = false;
                                pressed = false;
                              });

                              if (_rewardedAd != null) {
                                _rewardedAd?.show(onUserEarnedReward:
                                  (AdWithoutView ad, RewardItem rewardItem) {
                                    setState(() {
                                      _number += 1;
                                      _trees = _number~/10;
                                    });
                                  }
                                );
                              } else {
                                print("Ad is not loaded yet");
                              }
                            },
                            style: ElevatedButton.styleFrom(
                            primary: Colors.green,
                            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 30),
                            textStyle: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                            child: const Text(
                                'Click to watch the ad!'),
                          ))
                    ],
                  )),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                    padding: const EdgeInsets.only(bottom:270, left:15, right:15, top: 20),
                    child: Text(
                      '🍿Ads Watched🍿 : $_number',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )),
              ),
              SizedBox(height: 30,),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                    padding: const EdgeInsets.only(bottom:230, left:15, right:15, top: 20),
                    child: Text(
                      '🌳Trees Planted🌳 : $_trees',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      )),
              ),
            ],
          )),
    );
  }

  /// Loads a rewarded ad.
  void loadAd() {
    RewardedAd.load(
        adUnitId: adUnitId,
        request: const AdRequest(),
        rewardedAdLoadCallback: RewardedAdLoadCallback(
          // Called when an ad is successfully received.
          onAdLoaded: (ad) {
            ad.fullScreenContentCallback = FullScreenContentCallback(
              // Called when the ad showed the full screen content.
              onAdShowedFullScreenContent: (ad) {},
              // Called when an impression occurs on the ad.
              onAdImpression: (ad) {},
              // Called when the ad failed to show full screen content.
              onAdFailedToShowFullScreenContent: (ad, err) {
                // Dispose the ad here to free resources.
                ad.dispose();
              },
              // Called when the ad dismissed full screen content.
              onAdDismissedFullScreenContent: (ad) {
                // Dispose the ad here to free resources.
                ad.dispose();
              },
              // Called when a click is recorded for an ad.
              onAdClicked: (ad) {});

            debugPrint('$ad loaded.');
            // Keep a reference to the ad so you can show it later.
            _rewardedAd = ad;
          },
          // Called when an ad request failed.
          onAdFailedToLoad: (LoadAdError error) {
            loadAd();
            debugPrint('RewardedAd failed to load: $error');
          },
        ));
  }
  @override
  void dispose() {
    _rewardedAd?.dispose();
    super.dispose();
  }
}
