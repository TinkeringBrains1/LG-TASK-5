import 'dart:math';
import 'package:flutter/material.dart';
import 'package:animated_icon/animated_icon.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ICONS'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'OPTIONS',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20), // Space between the subtitle and the buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  AnimateIcon(
                    key: UniqueKey(),
                    onTap: () {
                    },
                    iconType: IconType.animatedOnTap,
                    height: 70,
                    width: 70,
                    color: Color.fromRGBO(
                      Random.secure().nextInt(255),
                      Random.secure().nextInt(255),
                      Random.secure().nextInt(255),
                      1,
                    ),
                    animateIcon: AnimateIcons.bell,
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Notifications',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              Column(
                children: [
                  AnimateIcon(
                    key: UniqueKey(),
                    onTap: () {
                    },
                    iconType: IconType.animatedOnTap,
                    height: 70,
                    width: 70,
                    color: Color.fromRGBO(
                      Random.secure().nextInt(255),
                      Random.secure().nextInt(255),
                      Random.secure().nextInt(255),
                      1,
                    ),
                    animateIcon: AnimateIcons.home,
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Home',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

