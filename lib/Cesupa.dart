import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

final List<String> imgList = [
  'https://www.cesupa.br/banners/bannerenem.png',
  'https://www.cesupa.br/banners/2021.01.CombinaComigo-Banner.Site.png',
  'https://www.cesupa.br/banners/ICG_BANNER.png',
  'https://www.cesupa.br/banners/matriculas2sem.png',
  'https://www.cesupa.br/saibamais/informe/images/1411184759hackathon%20argo%20cesupa.jpg',
  'https://www.cesupa.br/saibamais/informe/images/227141040IMG_0087.jpg'
];

final List<Widget> imageSliders = imgList
    .map((item) => Container(
          child: Container(
            margin: EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                child: Stack(
                  children: <Widget>[
                    Image.network(item, fit: BoxFit.cover, width: 1000.0),
                    Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(200, 0, 0, 0),
                              Color.fromARGB(0, 0, 0, 0)
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                      ),
                    ),
                  ],
                )),
          ),
        ))
    .toList();

class CarouselWithIndicatorDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CarouselWithIndicatorState();
  }
}

class _CarouselWithIndicatorState extends State<CarouselWithIndicatorDemo> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sobre'),
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.of(context).pop();
            }),
      ),
      body: Column(children: [
        CarouselSlider(
          items: imageSliders,
          options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: true,
              aspectRatio: 2.0,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              }),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: imgList.map((url) {
            int index = imgList.indexOf(url);
            return Container(
              width: 8.0,
              height: 8.0,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _current == index
                    ? Color.fromRGBO(0, 0, 0, 0.9)
                    : Color.fromRGBO(0, 0, 0, 0.4),
              ),
            );
          }).toList(),
        ),
        Card(
          child: Column(
            children: [
              Text(
                  'A Associação Cultural e Educacional do Pará - ACEPA, foi instituída em 01/10/1986, como instituição de Direito Privado, sem fins lucrativos, de caráter educacional, conforme estabelece sua Ata de Constituição. A Instituição tem como finalidade, entre outras, manter o Centro de Ensino Superior do Pará - CESUPA.'),
              Text(
                  'Ao  longo de sua trajetória o Centro de Ensino Superior do Pará recebe do Conselho Nacional de Educação, em 14 de junho de 2002, seu credenciamento como Centro Universitário, mediante a publicação, no Diário Oficial da União, da Portaria n.º 1728, de 13/06/02, passando a denominar-se Centro Universitário do Estado do Pará - CESUPA. A conquista alcançada representa o coroamento do trabalho até aqui desenvolvido pelo conjunto institucional e consagra o projeto educacional do CESUPA, construído com segurança e equilíbrio, e sintonizado com a realidade sócio-econômico-cultural de nossa comunidade.'),
              Text(
                  'O CESUPA, comprometido com os princípios de qualidade e de contemporaneidade, incorpora, em seu projeto acadêmico, essencialmente, as funções de ensino e extensão, contemplando a pesquisa em algumas áreas de sua atuação específica.'),
            ],
          ),
        )
      ]),
    );
  }
}
