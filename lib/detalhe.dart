import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:intl/intl.dart';
import 'package:flutter_crud/my_text_field_date_picker.dart';

class Detalhe extends StatefulWidget {
  final String id;
  final String titulo;
  final String descricao;
  final DateTime data;
  final String link;

  const Detalhe(this.id, this.titulo, this.descricao, this.data, this.link);

  @override
  State<StatefulWidget> createState() {
    return new DetalhePage();
  }
}

class DetalhePage extends State<Detalhe> {
  static String tag = '/detalhe';
  @override
  Widget build(BuildContext context) {
    var snapshots = FirebaseFirestore.instance
        .collection('todo')
        .doc(widget.id)
        .snapshots();
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.of(context).pop();
              }),
          title: Text('Detalhe Tarefa'),
          actions: [
            IconButton(
                icon: Icon(Icons.refresh),
                onPressed: () {
                  /*Detalhe(
                      widget.id, widget.titulo, widget.descricao, widget.data);
                */
                })
          ],
        ),
        backgroundColor: Colors.grey[200],
        body: ListView(
          children: [
            Card(
              color: Colors.grey[200],
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  ListTile(
                    /*leading: Icon(
                      Icons.article_rounded,
                      color: Colors.black,
                      size: 40,
                    ),*/
                    title: Text(
                      widget.titulo,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Divider(
                    color: Colors.black,
                    height: 20,
                    thickness: 5,
                    indent: 20,
                    endIndent: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(Icons.add_location_rounded),
                            SizedBox(
                              width: 5,
                            ),
                            GestureDetector(
                                child: Text(widget.descricao,
                                    style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        color: Colors.black.withOpacity(0.6))),
                                onTap: () {
                                  abrirGoogleMaps();
                                }),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.calendar_today),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              DateFormat("d 'de' MMMM 'de' y", "pt_BR")
                                  .format(widget.data),
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.6)),
                            ),
                            Text(
                              DateFormat(", EEEE", "pt_BR").format(widget.data),
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.6)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Image.asset('img/logo.png'),
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => modalAlter(context),
          tooltip: 'Editar',
          child: Icon(
            Icons.edit,
          ),
        ));
  }

  abrirGoogleMaps() async {
    String urlMap = widget.link;
    if (await canLaunch(urlMap)) {
      await launch(urlMap);
    } else {
      throw 'Could not launch Maps';
    }
  }

  modalAlter(BuildContext context) {
    var form = GlobalKey<FormState>();

    var titulo = TextEditingController();
    var descricao = TextEditingController();
    var data;
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Alterar Evento'),
            content: Form(
              key: form,
              child: Container(
                height: MediaQuery.of(context).size.longestSide,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Titulo'),
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: 'Ex.:Titulo da tarefa',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                      controller: titulo,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Este campo não pode ser vazio';
                        }
                      },
                    ),
                    SizedBox(height: 20),
                    Text('Local'),
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: 'Ex.:Local da tarefa',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                      controller: descricao,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Este campo não pode ser vazio';
                        }
                      },
                    ),
                    SizedBox(height: 20),
                    Text('Data'),
                    MyTextFieldDatePicker(
                      //labelText: "Data",
                      prefixIcon: Icon(Icons.date_range),
                      suffixIcon: Icon(Icons.arrow_drop_down),
                      lastDate: DateTime.now().add(Duration(days: 366)),
                      firstDate: DateTime.now(),
                      initialDate: DateTime.now().add(Duration(days: 1)),
                      onDateChanged: (selectedDate) {
                        data = selectedDate;
                      },
                    ),
                  ],
                ),
              ),
            ),
            actions: <Widget>[
              FlatButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text('Cancelar'),
              ),
              FlatButton(
                onPressed: () async {
                  if (form.currentState.validate()) {
                    FirebaseFirestore.instance
                        .collection('todo')
                        .doc(widget.id)
                        .update({
                      'titulo': titulo.text,
                      'descricao': descricao.text,
                      'data': data,
                    });
                  }
                  Navigator.of(context).pop();
                },
                color: Colors.indigo,
                child: Text('Alterar'),
              ),
            ],
          );
        });
  }
}
