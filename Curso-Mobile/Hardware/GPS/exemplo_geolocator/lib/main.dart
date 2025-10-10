// Exemplo de uso do GPS

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

void main() {
  runApp(MaterialApp(home: LocationScreen()));
}

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  // Atributos
  String mensagem = 'Aguardando Localização. . .';

  // Método para pegar a localização do dispositivo
  // Verificar se a localização está ativada

  Future<String> getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Verifica se o serviço de localização está habilitado
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return "Serviço de localização desabilitado.";
    }
    // Solicita a permissão da localização
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return "Permissão de localização negada.";
      }
    }
    Position position = await Geolocator.getCurrentPosition();
    return "Latitude: ${position.latitude}, Longitude: ${position.longitude}";
  }

  @override
  void initState() {
    super.initState();
    // Chamar o método para pegar a localização
    _getLocation();
  }

  Future<void> _getLocation() async {
    String result = await getLocation();
    setState(() {
      mensagem = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("GPS - Localização")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(mensagem),
            ElevatedButton(
              onPressed: () async {
                String result = await getLocation();
                setState(() {
                  mensagem = result;
                });
              },
              child: Text("Obter Localização"),
            ),
          ],
        ),
      ),
    );
  }
}
