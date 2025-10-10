import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(MaterialApp(home: ImagePickerScreen()));
}

// Criar um exemplo de uso de camera -> biblioteca image_picker

class ImagePickerScreen extends StatefulWidget {
  const ImagePickerScreen({super.key});

  @override
  State<ImagePickerScreen> createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {
  File? _image;
  final ImagePicker _picker =
      ImagePicker(); // Obj controlador do uso da câmera / galeria x

  // Métodos
  // Método para tirar foto
  void _getImageFromCamera() async {
    // Abre a camera e permite tirar uma foto,
    // Armazena a foto em um arquivo temporário (pickedFile)
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.camera,
    );
    // Verificar se a imagem foi armazenada no cache
    if (pickedFile != null) {
      setState(() {
        // Peguei da memória e carrego para o aplicativo
        _image = File(pickedFile.path);
      });
    }
  }

  // Método pegar img da galeria
  void _getImageFromGallery() async {
    // Abrir a galeria de imagens do disposito
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
    );
    // Verificar se a imagem foi armazenada no cache
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  // Método para pegar img da galeria

  // build
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Exemplo Image Picker")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Campo para mostrar a imagem ( ou tirada da câmera ou selecionada da galeria )
            _image != null
                ? Image.file(_image!, height: 200)
                : Text("Nenhuma Imagem Selecionada"),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _getImageFromCamera,
              child: Text("Tirar Foto"),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _getImageFromGallery,
              child: Text("Escolher da galeria"),
            ),
          ],
        ),
      ),
    );
  }
}
