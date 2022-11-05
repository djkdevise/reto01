import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora de Divisas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Calculadora Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

final textOrigen = TextEditingController();
final textDestino = TextEditingController();

String op1 = 'USD';
String op2 = 'COP';
List<DropdownMenuItem<String>> listaMonedas = [
  DropdownMenuItem(
    child: Text('USD'),
    value: 'USD',
  ),
  DropdownMenuItem(
    child: Text('COP'),
    value: 'COP',
  ),
  DropdownMenuItem(
    child: Text('EUR'),
    value: 'EUR',
  ),
  DropdownMenuItem(
    child: Text('GBP'),
    value: 'GBP',
  ),
  DropdownMenuItem(
    child: Text('MXN'),
    value: 'MXN',
  ),
  DropdownMenuItem(
    child: Text('BRL'),
    value: 'BRL',
  ),
  DropdownMenuItem(
    child: Text('ARS'),
    value: 'ARS',
  ),
  DropdownMenuItem(
    child: Text('CLP'),
    value: 'CLP',
  ),
  DropdownMenuItem(
    child: Text('PEN'),
    value: 'PEN',
  ),
  DropdownMenuItem(
    child: Text('UYU'),
    value: 'UYU',
  ),
  DropdownMenuItem(
    child: Text('CRC'),
    value: 'CRC',
  ),
  DropdownMenuItem(
    child: Text('CUP'),
    value: 'CUP',
  ),
  DropdownMenuItem(
    child: Text('GTQ'),
    value: 'GTQ',
  ),
  DropdownMenuItem(
    child: Text('HNL'),
    value: 'HNL',
  ),
  DropdownMenuItem(
    child: Text('NIO'),
    value: 'NIO',
  ),
  DropdownMenuItem(
    child: Text('SVC'),
    value: 'SVC',
  ),
  DropdownMenuItem(
    child: Text('PYG'),
    value: 'PYG',
  ),
  DropdownMenuItem(
    child: Text('BOB'),
    value: 'BOB',
  ),
  DropdownMenuItem(
    child: Text('DOP'),
    value: 'DOP',
  ),
  DropdownMenuItem(
    child: Text('VEF'),
    value: 'VEF',
  ),
  DropdownMenuItem(
    child: Text('PAB'),
    value: 'PAB',
  ),
  DropdownMenuItem(
    child: Text('BGN'),
    value: 'BGN',
  ),
  DropdownMenuItem(
    child: Text('CZK'),
    value: 'CZK',
  ),
  DropdownMenuItem(
    child: Text('DKK'),
    value: 'DKK',
  ),
  DropdownMenuItem(
    child: Text('HUF'),
    value: 'HUF',
  ),
];

class calculadora {
  final titulo;
  final color;
  final icono;

  calculadora(this.titulo, this.color, this.icono);
}

List<calculadora> cal = [
  calculadora("9", Colors.lightBlue, Icon(Icons.abc)),
  calculadora("8", Colors.lightBlue, Icon(Icons.abc)),
  calculadora("7", Colors.lightBlue, Icon(Icons.abc)),
  calculadora("6", Colors.lightBlue, Icon(Icons.abc)),
  calculadora("5", Colors.lightBlue, Icon(Icons.abc)),
  calculadora("4", Colors.lightBlue, Icon(Icons.abc)),
  calculadora("3", Colors.lightBlue, Icon(Icons.abc)),
  calculadora("2", Colors.lightBlue, Icon(Icons.abc)),
  calculadora("1", Colors.lightBlue, Icon(Icons.abc)),
  calculadora("0", Colors.lightBlue, Icon(Icons.abc)),
  calculadora("Limpiar", Colors.lightBlue, Icon(Icons.cleaning_services)),
  calculadora("=", Colors.lightBlue, Icon(Icons.abc)),
];

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Padding(
          padding: EdgeInsets.all(25),
          child: Column(
            children: [
              Row(
                children: [
                  Text("Moneda origen: "),
                  DropdownButton(
                      items: listaMonedas,
                      value: op1,
                      onChanged: (value) {
                        setState(() {
                          op1 = value.toString();
                        });
                      }),
                  Text("Moneda destino: "),
                  DropdownButton(
                      items: listaMonedas,
                      value: op2,
                      onChanged: (value) {
                        setState(() {
                          op2 = value.toString();
                        });
                      }),
                ],
              ),
              TextField(
                controller: textOrigen,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Ingrese el monto',
                  icon: Icon(Icons.monetization_on),
                ),
              ),
              TextField(
                controller: textDestino,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Ingrese el monto',
                  icon: Icon(Icons.monetization_on),
                ),
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  itemCount: cal.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      color: cal[index].color,
                      child: Center(
                        child: index == 10
                            ? cal[index].icono
                            : Text(
                                cal[index].titulo,
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
