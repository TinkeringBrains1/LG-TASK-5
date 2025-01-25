import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:flutter/services.dart';
import 'dart:async';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  StateMachineController? _stateMachineController;
  Artboard? mainArtBoard;
  SMINumber? check;

  @override
  void initState() {
    super.initState();
    rootBundle.load("assets/progress.riv").then((riveByteData){
      RiveFile.initialize();
      late var riveFile = RiveFile.import(riveByteData);
      var mArtBoard = riveFile.mainArtboard;
      _stateMachineController = StateMachineController
          .fromArtboard(mArtBoard,"State Machine 1");
      if(_stateMachineController!=null){
        mArtBoard.addController(_stateMachineController!);
        mainArtBoard = mArtBoard;
        check = _stateMachineController!.getNumberInput("counter");
        if (check != null) {
          print('Counter input found: ${check?.value}');
        } else {
          print('Counter input is null');
        }
        setState(() {

        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text('PROGRESS BAR'),
        ),
        body: mainArtBoard!=null ? InkWell(
          onTap: (){
            check?.value = 1;
            print(check?.value);
          },
          child: SizedBox(
              width : double.infinity,
              height: double.infinity,
              child: Rive(artboard: mainArtBoard!, fit: BoxFit.contain,)),
        ) : Container()
    );
  }
}