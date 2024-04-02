import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController gasolina = TextEditingController();
    TextEditingController alcool = TextEditingController();
    String texto = '';

    void calculo() {
      double? gas;
      double? alc;

      gas = double.parse(gasolina.text);
      alc = double.parse(alcool.text);

      if (gas == 0 || alc == 0) {
        setState(() {
          texto = 'O valor do álcool não pode ser zero.';
        });
      } else {

        double resul = (alc / gas);

        if (resul >= 0.7) {
          setState(() {
            texto = 'Gasolina é uma opção melhor';
          });
        } else {
          setState(() {
            texto = 'Álcool é uma opção melhor';
          });
        }
      }
    }

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
          title: Center(
              child: Text(
            'Gasolina ou Álcool',
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          )),
          backgroundColor: const Color.fromARGB(255, 35, 109, 143)),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(30),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 80),
                  child: Center(
                    child: Image.asset(
                      'assets/images/logo.png',
                      height: 100,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 60),
                  margin: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      TextField(
                        decoration: InputDecoration(
                            contentPadding: EdgeInsetsDirectional.all(15),
                            labelText: 'Insira o valor da gasolina',
                            border: OutlineInputBorder(),
                            labelStyle: TextStyle(color: Colors.black)),
                        keyboardType: TextInputType.number,
                        maxLength: 4,
                        controller: gasolina,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextField(
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(15),
                            labelText: 'Insira o valor da álcool',
                            border: OutlineInputBorder(),
                            labelStyle: TextStyle(color: Colors.black)),
                        keyboardType: TextInputType.number,
                        maxLength: 4,
                        controller: alcool,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          calculo();
                        },
                        child: Text(
                          'Calcular',
                          style: TextStyle(fontSize: 15, color: Colors.black),
                        ),
                      ),
                      Text(
                        texto,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
