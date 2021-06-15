import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_crud/campus.dart';
import 'package:flutter_crud/detalhe.dart';
import 'package:flutter_crud/my_text_field_date_picker.dart';
import 'package:flutter_crud/event_futuro.dart';
import 'package:flutter_crud/event_concluido.dart';
import 'package:flutter_crud/Cesupa.dart';
import 'package:flutter_crud/take_photo.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  final String email;

  const Home(this.email);
  @override
  State<StatefulWidget> createState() {
    return new HomePage();
  }
}

class HomePage extends State<Home> {
  static String tag = '/home';
  DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    var snapshots = FirebaseFirestore.instance
        .collection('todo')
        .where('excluido', isEqualTo: false)
        .orderBy('data', descending: false)
        .snapshots();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('EVENTOS'),
      ),
      backgroundColor: Colors.grey[200],
      body: StreamBuilder(
          stream: snapshots,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }

            if (snapshot.data.docs.length == 0) {
              return Center(child: Text('Nenhum Evento Cadastrado'));
            }

            return ListView.builder(
              //scrollDirection: Axis.vertical,
              //shrinkWrap: true,
              itemCount: snapshot.data.docs.length,
              itemBuilder: (BuildContext context, int i) {
                //DocumentSnapshot doc = snapshot.data.docs[i];
                var doc = snapshot.data.docs[i];
                var item = doc.data();
                DateTime d = item['data'].toDate();
                return Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                  child: ListTile(
                    isThreeLine: false,
                    leading: IconButton(
                      icon: Icon(
                        item['feito']
                            ? Icons.check_circle
                            : Icons.check_circle_outline,
                        size: 22,
                      ),
                      onPressed: () => doc.reference.update({
                        'feito': !item['feito'],
                      }),
                    ),
                    title: Text(item['titulo']),
                    subtitle: Text(
                      DateFormat("d 'de' MMMM 'de' y", "pt_BR").format(d),
                      style: TextStyle(color: Colors.black.withOpacity(0.6)),
                    ),
                    trailing: Wrap(
                      spacing: 12,
                      children: <Widget>[
                        IconButton(
                            icon: Icon(
                              Icons.fullscreen,
                              size: 23,
                            ),
                            onPressed: () => Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return new Detalhe(
                                      '${doc.reference.id}',
                                      item['titulo'],
                                      item['descricao'],
                                      d,
                                      item['link']);
                                }))),
                        IconButton(
                          icon: Icon(
                            Icons.delete,
                            size: 20,
                          ),
                          onPressed: () =>
                              doc.reference.update({'excluido': true}),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text(""),
              accountEmail: Text(widget.email),
              currentAccountPicture: CircleAvatar(
                radius: 30.0,
                backgroundImage: NetworkImage(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTt33ryz7VjjZHyBcH3Z2MhipRDpBgl9BpOuthjqFpVamrriHNawZab1C0MMYCjlcHvsE4&usqp=CAU'),
                backgroundColor: Colors.transparent,
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Inicio'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Home(widget.email);
                }));
              },
            ),
            ListTile(
              leading: Icon(Icons.event),
              title: Text('Eventos Futuro'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return EventoFuturo();
                }));
              },
            ),
            ListTile(
              leading: Icon(Icons.event_busy),
              title: Text('Eventos Passados'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return EventoConcluido();
                }));
              },
            ),
            ListTile(
              leading: Icon(Icons.camera),
              title: Text('Camera'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return TakePhoto();
                }));
              },
            ),
            ListTile(
              leading: Icon(Icons.school),
              title: Text('Campus'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Campus();
                }));
              },
            ),
            ListTile(
              leading: Icon(Icons.account_balance),
              title: Text('CESUPA'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return CarouselWithIndicatorDemo();
                }));
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => modalCreate(context),
        tooltip: 'Adicionar novo',
        child: Icon(Icons.add),
      ),
    );
  }

  modalCreate(BuildContext context) {
    var form = GlobalKey<FormState>();

    var titulo = TextEditingController();
    var descricao = TextEditingController();
    var data;
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Criar novo evento'),
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
                          hintText: 'Ex.:Titulo do Evento',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
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
                          hintText: 'Ex.:Local do evento',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
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
                    await FirebaseFirestore.instance.collection('todo').add({
                      'titulo': titulo.text,
                      'descricao': descricao.text,
                      'feito': false,
                      'data': data,
                      'excluido': false,
                      'link':
                          'https://www.google.com/maps/place/Cesupa+-+Campus+Alcindo+Cacela+I+(Argo)/@-1.4501966,-48.4774716,15z/data=!4m5!3m4!1s0x0:0x3e7fb16332282dbd!8m2!3d-1.4501966!4d-48.4774716',
                    });

                    Navigator.of(context).pop();
                  }

                  Scaffold.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Evento Adicionado!'),
                      //action: Text(),
                    ),
                  );
                },
                color: Colors.indigo,
                child: Text('Salvar'),
              ),
            ],
          );
        });
  }
}
