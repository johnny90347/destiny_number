import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String assetsPath = 'assets/image/Ball1.png';
  String destinyResult = 'Press button to start';
  String destinyNumber = '';
  final assets = ['assets/image/Ball1.png', 'assets/image/Ball2.png', 'assets/image/Ball3.png'];

  final destinyScript = [
    'If you have a partner, you will grow closer by giving your partner tender care and your undivided, unwavering attention',
    'Is it time for a romantic weekend? Yes! Running from September 29th to October 1st, if you have extra holiday time, add a day or two at either end for what’s sure to be a charming weekend',
    'Life is getting better, and thanks to Jupiter, even more so in the second half of 2024 and beyond. I know it seems far away, but it will come sooner than you think',
    'You can try a new line of expensive skin care products, get a haircut, try a dramatic new hairstyle, or buy expensive items',
    'We can\'t control everything in life, if you have a medical emergency or are worried about losing your chance to rent an apartment or a job if you don\'t sign the contract, then please sign',
    'Your image will be enhanced. At work, your passion for all the things you believe in will inspire others to join you, and the seeds you plant now will pay dividends for you over the next two years and pay you dividends in the meantime.'
        'This is a special time, so take it seriously - in many ways, you are the leader of the class, the leader of the march, the person everyone wants to know, support and follow.'
  ];

  void getAssets() {
    final random = Random();
    setState(() {
      assetsPath = assets[random.nextInt(assets.length)];
    });
  }

  void getText() {
    final random = Random();
    final number = random.nextInt(destinyScript.length);

    setState(() {
      destinyNumber = '${number + 1}';
      destinyResult = destinyScript[number];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/image/bg.png'), fit: BoxFit.fill)),
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        assetsPath,
                      ),
                      fit: BoxFit.fill)),
              child: Center(
                child: Text(
                  destinyNumber,
                  style: TextStyle(fontSize: 100, color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Expanded(
              child: Text(
                destinyResult,
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
            MaterialButton(
                color: Colors.blue,
                minWidth: 200,
                child: Text(
                  "Draw lots",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  getAssets();
                  getText();
                }),
            SizedBox(
              height: 100,
            )
          ],
        ),
      ),
    );
  }
}
