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
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    rootBundle.load("assets/gemini.riv").then((riveByteData){
      RiveFile.initialize();
      late var riveFile = RiveFile.import(riveByteData);
      var mArtBoard = riveFile.mainArtboard;
      _stateMachineController = StateMachineController
          .fromArtboard(mArtBoard,"State Machine 1");
      if(_stateMachineController!=null){
        mArtBoard.addController(_stateMachineController!);
        mainArtBoard = mArtBoard;
        check = _stateMachineController!.getNumberInput("check");
        print(check?.value);
        setState(() {

        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text('GEMINI'),
        ),
        body: mainArtBoard!=null ? GestureDetector(
          onLongPress: (){
            _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
              setState(() {
                if (check?.value == 8 || check?.value == 9 || check?.value == 10 ) {
                  check?.value = 0;
                  Timer(const Duration(seconds: 0), () {});
                }
                else if (check?.value == 0) {
                  check?.value = 3;
                  Timer(const Duration(seconds: 0), () {});
                }
                else if (check?.value == 3.0) {
                  check?.value = 2;
                  Timer(const Duration(seconds: 0), () {});
                }
                else if (check?.value == 2) {
                  check?.value = 1;
                  Timer(const Duration(seconds: 2), () {});
                }
                else if (check?.value == 1) {
                  check?.value = 4;
                  Timer(const Duration(seconds: 2), () {});
                }
                else if (check?.value == 4) {
                  check?.value = 3;
                  Timer(const Duration(seconds: 2), () {});
                }
              });
            });

            },
          onLongPressUp: (){
            _timer.cancel();
            if (check?.value == 0 || check?.value == 3 || check?.value == 2 || check?.value == 1 || check?.value == 4){
              check?.value = 9;
              Timer(const Duration(seconds: 2), () {});
            }
          },
          child: SizedBox(
              width : double.infinity,
              height: double.infinity,
              child: Rive(artboard: mainArtBoard!, fit: BoxFit.cover,)),
        ) : Container()
    );
  }
}
