import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class EventoConcluido extends StatefulWidget {
  State<StatefulWidget> createState() {
    return new EventoConcluidoPage();
  }
}

class EventoConcluidoPage extends State<EventoConcluido> {
  static String tag = '/detalhe';
  var snapshots = FirebaseFirestore.instance
      .collection('todo')
      .where('data', isLessThan: Timestamp.now())
      //.where('feito', isEqualTo: true)
      .orderBy('data', descending: false)
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.of(context).pop();
            }),
        title: Text('Eventos Passados', textAlign: TextAlign.center),
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
              return Center(child: Text('Nenhum Evento'));
            }

            return ListView.builder(
              itemCount: snapshot.data.docs.length,
              itemBuilder: (BuildContext context, int i) {
                var doc = snapshot.data.docs[i];
                var item = doc.data();
                DateTime d = item['data'].toDate();
                return Container(
                  height: 80,
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
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        Text(item['descricao']),
                        Text(DateFormat(" d 'de' MMMM 'de' y", "pt_BR")
                            .format(d))
                      ],
                    ),
                  ),
                );
              },
            );
          }),
    );
  }
}
