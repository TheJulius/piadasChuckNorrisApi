import 'package:flutter/material.dart';
import 'piadaDog.dart';
import 'piadaBird.dart';
import 'piadaChicken.dart';
import 'escreverPiada.dart';

void main() => runApp(const ExemploInicial());

class ExemploInicial extends StatefulWidget {
  const ExemploInicial({Key? key}) : super(key: key);
  @override
  _ExemploInicial createState() => _ExemploInicial();
}

class _ExemploInicial extends State {
  var _currentPage = 0;
  final _pages = [
    const PiadaBird(
      title: 'Piadas CN Pássaro',
    ),
    const PiadaDog(
      title: 'Piadas CN Cachorro',
    ),
    const PiadaChicken(
      title: 'Piadas CN Galinha',
    ),
    const EscreverPiada()
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: _pages.elementAt(_currentPage),
        ),
        bottomNavigationBar: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.cruelty_free_rounded),
                  label: "Piadas Pássaro"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.cruelty_free_rounded),
                  label: "Piadas Cachorro"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.cruelty_free_rounded),
                  label: "Piadas Galinha"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.edit_note_sharp), label: "Criar Piada")
            ],
            currentIndex: _currentPage,
            fixedColor: Colors.orange,
            onTap: (int inIndex) {
              setState(() {
                _currentPage = inIndex;
              });
            }),
      ),
    );
  }
}
