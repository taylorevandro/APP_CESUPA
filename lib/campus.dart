import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';

class Campus extends StatefulWidget {
  State<StatefulWidget> createState() {
    return new CampusPage();
  }
}

class CampusPage extends State<Campus> {
  int _currentIndex = 0;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.of(context).pop();
              }),
          title: Text("Campus do Cesupa")),
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children: <Widget>[
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  Image.asset(
                    'img/medicina.jpeg',
                    fit: BoxFit.fill,
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    'Cesupa João Paulo do Valle Mendes',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 23,
                      color: Colors.indigo,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Cursos Ministrados na Unidade: ',
                    style: TextStyle(fontSize: 15),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Icon(Icons.check_circle),
                      SizedBox(
                        width: 10,
                      ),
                      Text('Medicina'),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 250,
                      ),
                      Text('Av. Almirante Barroso, 3775 - Souza, Belém - PA'),
                      Text('Fone: (91) 3205-9000')
                    ],
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  Image.asset(
                    'img/argo.jpeg',
                    fit: BoxFit.fill,
                    height: 200,
                    width: 200,
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    'Cesupa Alcindo Cancela 1',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 23,
                      color: Colors.indigo,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Cursos Ministrados na Unidade: ',
                    style: TextStyle(fontSize: 15),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Icon(Icons.check_circle),
                      SizedBox(
                        width: 10,
                      ),
                      Text('Engenharia da Computação'),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Icon(Icons.check_circle),
                      SizedBox(
                        width: 10,
                      ),
                      Text('Ciencia da Computação'),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Icon(Icons.check_circle),
                      SizedBox(
                        width: 10,
                      ),
                      Text('Engenharia Eletrica'),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 230,
                      ),
                      Text('Av. Alcindo Cancela, 1523 - Umarizal, Belém - PA'),
                      Text('Fone: (91) 3205-9301')
                    ],
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  Image.asset(
                    'img/direito.jpeg',
                    fit: BoxFit.fill,
                    // height: 200,
                    //width: 200,
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    'Cesupa Alcindo Cancela 2',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 23,
                      color: Colors.indigo,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Cursos Ministrados na Unidade: ',
                    style: TextStyle(fontSize: 15),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Icon(Icons.check_circle),
                      SizedBox(
                        width: 10,
                      ),
                      Text('Direito'),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Icon(Icons.check_circle),
                      SizedBox(
                        width: 10,
                      ),
                      Text('Arquitetura e Urbanismo'),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 270,
                      ),
                      Text('Av. Alcindo Cacela, 980 - Umarizal, Belém - PA'),
                      Text('Fone: (91) 4009-9180')
                    ],
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  Image.asset(
                    'img/josemalcher.jpeg',
                    fit: BoxFit.fill,
                    //height: 200,
                    //width: 200,
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    'Cesupa José Malcher',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 23,
                      color: Colors.indigo,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Cursos Ministrados na Unidade: ',
                    style: TextStyle(fontSize: 15),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Icon(Icons.check_circle),
                      SizedBox(
                        width: 10,
                      ),
                      Text('Farmacia'),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Icon(Icons.check_circle),
                      SizedBox(
                        width: 10,
                      ),
                      Text('Publicidade e Propraganda'),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Icon(Icons.check_circle),
                      SizedBox(
                        width: 10,
                      ),
                      Text('Fisioterapia'),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Icon(Icons.check_circle),
                      SizedBox(
                        width: 10,
                      ),
                      Text('Odontologia'),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Icon(Icons.check_circle),
                      SizedBox(
                        width: 10,
                      ),
                      Text('Engenharia Civil'),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 90,
                      ),
                      Text(
                          'Av. Governador José Malcher, 1923 - Nazaré, Belém - PA'),
                      Text('Fone: (91) 4009-9100')
                    ],
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  Image.asset(
                    'img/nazare.jpeg',
                    fit: BoxFit.fill,
                    //height: 200,
                    //width: 200,
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    'Cesupa Nazaré',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 23,
                      color: Colors.indigo,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Cursos Ministrados na Unidade: ',
                    style: TextStyle(fontSize: 15),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Icon(Icons.check_circle),
                      SizedBox(
                        width: 10,
                      ),
                      Text('Enfermagem'),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Icon(Icons.check_circle),
                      SizedBox(
                        width: 10,
                      ),
                      Text('---'),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Icon(Icons.check_circle),
                      SizedBox(
                        width: 10,
                      ),
                      Text('--'),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 210,
                      ),
                      Text('Av. Nazaré, 630 - Nazaré, Belém - PA'),
                      Text('Fone: (91) 4009-2100')
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
          _pageController.jumpToPage(index);
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
              title: Text(
                'Almirante',
                style: TextStyle(color: Colors.indigo),
              ),
              icon: Icon(
                Icons.school_rounded,
                color: Colors.indigo,
              )),
          BottomNavyBarItem(
              title: Text('ARGO'),
              icon: Icon(Icons.school_rounded, color: Colors.indigo)),
          BottomNavyBarItem(
              title: Text('Direito'),
              icon: Icon(Icons.school_rounded, color: Colors.indigo)),
          BottomNavyBarItem(
              title: Text(
                'J.Malcher',
                style: TextStyle(color: Colors.indigo),
              ),
              icon: Icon(Icons.school_rounded, color: Colors.indigo)),
          BottomNavyBarItem(
              title: Text('Nazaré'),
              icon: Icon(Icons.school_rounded, color: Colors.indigo)),
        ],
      ),
    );
  }

  argo() {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Image.asset(
            'img/argo.jpeg',
            fit: BoxFit.fill,
            height: 200,
            width: 200,
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            'Cesupa ARGO',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 23,
              color: Colors.indigo,
            ),
          ),
          SizedBox(height: 5),
          Text(
            'Cursos Ministrados na Unidade: ',
            style: TextStyle(fontSize: 15),
          ),
          Row(
            children: [
              SizedBox(
                width: 20,
              ),
              Icon(Icons.check_circle),
              SizedBox(
                width: 10,
              ),
              Text('Engenharia da Computação'),
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 20,
              ),
              Icon(Icons.check_circle),
              SizedBox(
                width: 10,
              ),
              Text('Ciencia da Computação'),
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 20,
              ),
              Icon(Icons.check_circle),
              SizedBox(
                width: 10,
              ),
              Text('Engenharia Eletrica'),
            ],
          ),
          Column(
            children: [
              SizedBox(
                height: 230,
              ),
              Text('Av. Alcindo Cancela, nº12 - Belém - Pará'),
              Text('Fone: (91) 3434-3434')
            ],
          ),
        ],
      ),
    );
  }
}
