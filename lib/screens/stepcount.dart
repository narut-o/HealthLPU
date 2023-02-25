import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:pedometer/pedometer.dart';
import 'package:percent_indicator/percent_indicator.dart';

class StepCounter extends StatefulWidget {
  @override
  State<StepCounter> createState() => _StepCounterState();
}

class _StepCounterState extends State<StepCounter> {
  late Stream<StepCount> _stepCountStream;
  late Stream<PedestrianStatus> _pedestrianStatusStream;
  String _status = '?', _steps = '0';
  int initalStep = 100;
  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  void onStepCount(StepCount event) {
    print(event);
    setState(() {
      _steps = event.steps.toString();
    });
  }

  void onPedestrianStatusChanged(PedestrianStatus event) {
    print(event);
    setState(() {
      _status = event.status;
    });
  }

  void onPedestrianStatusError(error) {
    print('onPedestrianStatusError: $error');
    setState(() {
      _status = 'Pedestrian Status not available';
    });
    print(_status);
  }

  void onStepCountError(error) {
    print('onStepCountError: $error');
    setState(() {
      _steps = '0';
    });
  }

  void initPlatformState() {
    _pedestrianStatusStream = Pedometer.pedestrianStatusStream;
    _pedestrianStatusStream
        .listen(onPedestrianStatusChanged)
        .onError(onPedestrianStatusError);

    _stepCountStream = Pedometer.stepCountStream;
    _stepCountStream.listen(onStepCount).onError(onStepCountError);

    if (!mounted) return;
  }

  @override
  Widget build(BuildContext context) {
    int num = 1;
    double per = int.parse(_steps) / initalStep;

    return SafeArea(
        child: Scaffold(
            body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: CircularPercentIndicator(
              radius: 120.0,
              lineWidth: 15.0,
              percent: per > 1 ? per / 100 : per,
              center: new Text(
                _steps,
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.w600),
              ),
              startAngle: 200,
              progressColor: Color.fromARGB(255, 216, 48, 231),
            ),
          ),
        ),
        Text(
          "Target: ${initalStep.toString()} steps",
          style: TextStyle(fontSize: 30),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 100),
          child: TextField(
            onChanged: ((value) => {
                  num = int.parse(value),
                }),
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: _steps,
                alignLabelWithHint: true),
            keyboardType: TextInputType.number,
          ),
        ),
        ElevatedButton.icon(
          onPressed: () {
            setState(() {
              if (num.toInt() < initalStep) {
                _steps = "0";
                initalStep = 100;
              } else {
                initalStep = num.toInt();
              }
            });
          },
          icon: Icon(Icons.add),
          label: Text("Update"),
          style: ElevatedButton.styleFrom(primary: Colors.black),
        ),
      ],
    )));
  }
}
