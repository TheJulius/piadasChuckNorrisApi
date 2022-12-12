import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EscreverPiada extends StatefulWidget {
  const EscreverPiada({super.key});

  @override
  Home createState() => Home();
}

class Home extends State<EscreverPiada> {
  // ignore: non_constant_identifier_names
  TextEditingController T_controller = TextEditingController();

  // ignore: non_constant_identifier_names
  late SharedPreferences s_prefs;

  String temp = '';

  // ignore: non_constant_identifier_names
  _saveToShared_Preferences() async {
    s_prefs = await SharedPreferences.getInstance();
    s_prefs.setString("KEY_1", T_controller.text.toString());
  }

  _showSavedValue() async {
    s_prefs = await SharedPreferences.getInstance();
    setState(() {
      temp = s_prefs.getString("KEY_1").toString();
    });
  }

  // ignore: non_constant_identifier_names
  _delete_Shared_Preferences() async {
    s_prefs = await SharedPreferences.getInstance();
    s_prefs.remove("KEY_1");
    setState(() {
      temp = " ";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            top: true,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      margin: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                      child: TextField(
                          controller: T_controller,
                          decoration: const InputDecoration(
                            labelText: 'Crie sua piada aqui....',
                            border: OutlineInputBorder(),
                          ))),
                  Container(
                      margin: const EdgeInsets.fromLTRB(10, 15, 0, 0),
                      child: ElevatedButton(
                        onPressed: () => _saveToShared_Preferences(),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                        ),
                        child: const Text('Salvar Piada'),
                      )),
                  Container(
                      margin: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                      child: ElevatedButton(
                        onPressed: () => _showSavedValue(),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                        ),
                        child: const Text('Mostar Piada'),
                      )),
                  Container(
                      margin: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                      child: ElevatedButton(
                        onPressed: () => _delete_Shared_Preferences(),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                        ),
                        child: const Text('Deletar Piada'),
                      )),
                  Container(
                      margin: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                      child: Text(
                        temp.toString(),
                        style:
                            const TextStyle(fontSize: 25, color: Colors.black),
                        textAlign: TextAlign.center,
                      ))
                ],
              ),
            )));
  }
}
