import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: WifiStatusScreen()));
}

class WifiStatusScreen extends StatefulWidget {
  const WifiStatusScreen({super.key});

  @override
  State<WifiStatusScreen> createState() => _WifiStatusScreenState();
}

class _WifiStatusScreenState extends State<WifiStatusScreen> {
  //atributos
  String _mensagem = ""; //informar o Status da Conexão
  // Objeto para ouvir (listener) as mudanças de conexão
  late StreamSubscription<ConnectivityResult> _conexaoSubscription;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //1. faz uma verificação inical ao abrir a tela
    _checkInicialConnection();

    //2. Começa a Ouvir a as mudanças de Status (sTreaM)
    _conexaoSubscription = Connectivity().onConnectivityChanged.listen(
      _updateConexaoStatus,
    );
  }

  //função que roda no inicio da aplicação
  void _checkInicialConnection() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    _updateConexaoStatus(connectivityResult);
  }

  // função que atualiza o status da conexão
  void _updateConexaoStatus(ConnectivityResult result) {
    setState(() {
      switch (result) {
        case ConnectivityResult.wifi:
          _mensagem = "Conectado no WIFI";
          break;
        case ConnectivityResult.mobile:
          _mensagem = "Conectado Via Dados Móveis";
          break;
        case ConnectivityResult.none:
          _mensagem = "Sem conexão com a Internet";
          break;
        default:
          _mensagem = "Procurando conexão com a Internet";
          break;
      }
    });
  }

  @override
  void dispose() {
    // TCancelar o processo de verificação do WIFI ao sair da aplicação
    _conexaoSubscription.cancel(); 
    super.dispose();
  }
  // Dispose é chamado quando a tela é fechada 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Status da Conexão")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              //mudar de Acordo com o Resultado do Status
              _mensagem.contains("WIFI")
                  ? Icons.wifi
                  : _mensagem.contains("Dados")
                  ? Icons.network_cell
                  : Icons.wifi_off,
              size: 80,
              color: _mensagem.contains("Sem Conexão")
                  ? Colors.red
                  : Colors.green,
            ),
            SizedBox(height: 10),
            Text("Status: $_mensagem"),
          ],
        ),
      ),
    );
  }
}
