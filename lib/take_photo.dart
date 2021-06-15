import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class TakePhoto extends StatefulWidget {
  State<StatefulWidget> createState() {
    return new TakePhotoPage();
  }
}

class TakePhotoPage extends State<TakePhoto> {
  File imagem;
  File imagemTemporaria;

  void pegarImagemGaleria() async {
    //imagemTemporaria = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      imagem = imagemTemporaria;
    });
  }

  void pegarImagemCamera() async {
    //imagemTemporaria = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      imagem = imagemTemporaria;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.ac_unit_rounded),
            onPressed: () {
              Navigator.of(context).pop();
            }),
        title: Text('Foto', textAlign: TextAlign.center),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
              child: Container(
            child: imagem != null
                ? Image.file(imagem)
                : Center(
                    child: Text('Selecione uma imagem.'),
                  ),
          )),
          Padding(
            padding: const EdgeInsets.all(32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                    icon: Icon(
                      Icons.camera_alt,
                      size: 50,
                      color: Colors.green,
                    ),
                    onPressed: () {
                      pegarImagemCamera();
                    }),
                SizedBox(
                  width: 60,
                ),
                IconButton(
                    icon: Icon(
                      Icons.image,
                      size: 50,
                      color: Colors.blue,
                    ),
                    onPressed: () {
                      pegarImagemGaleria();
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
