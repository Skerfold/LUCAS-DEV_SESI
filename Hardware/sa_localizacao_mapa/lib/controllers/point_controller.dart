//logica das marcações de pontos

import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:sa_localizacao_mapa/models/location_point.dart';

class PointController {

  final DateFormat _formatar = DateFormat("dd/MM/yyyy - HH:mm:ss");
  

  Future<LocationPoint> pegarPonto() async{
    // Solictar a localização atual do dispositivo 
    // Liberar permissão
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if(!serviceEnabled){
      throw Exception("Serviço de GPS não Habilitado");
    }
    permission = await Geolocator.checkPermission();
    if(permission == LocationPermission.denied){
      permission == await Geolocator.requestPermission();
      if(permission == LocationPermission.denied){
        throw Exception("Permissão ao GPS Negada");
      }
    }
    Position position = await Geolocator.getCurrentPosition();

    String dataHora = _formatar.format(DateTime.now());
    LocationPoint ponto = LocationPoint(
      latitude: position.latitude, 
      longitude: position.longitude, 
      timestamp: dataHora);
    return ponto;
  }
}