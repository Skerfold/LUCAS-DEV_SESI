import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

void main(){
  runApp(MaterialApp(
    home: AcelerometroScreen(),
  ));
}

class AcelerometroScreen extends StatefulWidget {
  const AcelerometroScreen({super.key});

  @override
  State<AcelerometroScreen> createState() => _AcelerometroScreenState();
}

class _AcelerometroScreenState extends State<AcelerometroScreen> {
  //atributos
  List<double>? _acelerometroValues;
  StreamSubscription<AccelerometerEvent>? _acelerometroSubscription;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     _acelerometroSubscription = accelerometerEventStream().listen((AccelerometerEvent event) {
      setState(() {
        _acelerometroValues = <double>[event.x, event.y, event.z];
      });
    });
  }

  @override
  void dispose() {
    _acelerometroSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final acelerometro = _acelerometroValues?.map(
      (double v) => v.toStringAsFixed(1)).toList();
    return Scaffold(
      appBar: AppBar(title: Text("Aceleromêtro"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Valores do Aceleromêtro"),
            SizedBox(height: 20,),
            Text("Eixo X: ${acelerometro?[0]}"),
            Text("Eixo Y: ${acelerometro?[1]}"),
            Text("Eixo Z: ${acelerometro?[2]}"),
          ],
        ),
      ),
    );
  }
}