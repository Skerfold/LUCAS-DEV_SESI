import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:sa_localizacao_mapa/controllers/point_controller.dart';
import 'package:sa_localizacao_mapa/models/location_point.dart';

class MapView extends StatefulWidget {
  const MapView({super.key});

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  // Atributos
  // Lista para aramazenar os pontos que serão inserido no map
  final List<LocationPoint> _pontos = [];
  // Obj para manipulação dos métodos do controller
  final _pointController = PointController();
  // flutter_map -> biblioteca para manipulação de map
  // Obj para controlar o map ( bilbioteca própria do flutterMap )
  final _mapController = MapController();

  bool _isLoading = false;
  String? _erro;

  // Método para adicionar pontos no MAPA
  void _adicionarPontoMapa() async {
    setState(() {
      _isLoading = true;
      _erro = null; // limpa o erro
    });
    try {
      // Pegar a localização
      LocationPoint novaLocalizacao = await _pointController.pegarPonto();
      _pontos.add(novaLocalizacao);
      // Manipular meu map para ele desloccar para o novo ponto
      _mapController.move(
        LatLng(novaLocalizacao.latitude, novaLocalizacao.longitude),
        11,
      );
    } catch (e) {
      _erro = e.toString();
      // Mostrar o erro
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(_erro!)));
    } finally {
      // Executa de qualquer jeito ( com erro ou sem erro )
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Botão para adicioanr novas localizações
      // E o mapa com os pontos
      appBar: AppBar(
        title: Text("Mapa de Localização"),
        actions: [
          IconButton(
            onPressed: _isLoading ? null : _adicionarPontoMapa,
            icon: _isLoading
                ? CircularProgressIndicator()
                : Icon(Icons.add_location_alt),
          ),
        ],
      ),
      body: FlutterMap(
        mapController: _mapController,
        options: MapOptions(
          initialCenter: LatLng(-22.3353, -47.2406),
          initialZoom: 11,
        ),
        children: [
          // Camada do MAP
          TileLayer(
            urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
            userAgentPackageName: "com.example.sa_localizacao_mapa",
          ),
          // Camada de Marcações
          MarkerLayer(
            markers: _pontos.map((ponto) {
              return Marker(
                point: LatLng(ponto.latitude, ponto.longitude),
                width: 50,
                height: 50,
                child: Icon(Icons.location_on, color: Colors.red, size: 35),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
