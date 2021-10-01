import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Convertor',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Grados(),
    );
  }
}

class Grados extends StatefulWidget {
  Grados({Key? key}) : super(key: key);

  @override
  _GradosState createState() => _GradosState();
}

class _GradosState extends State<Grados> {
  double grados = 0;
  int _value = 1;
  int _value2 = 1;
  double result = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Convertorde grados"),
      ),
      body: Padding(
        padding: EdgeInsets.all(30.0),
        child: Column(
          children: [
            TextField(
              autofocus: true,
              textCapitalization: TextCapitalization.words,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                hintText: 'ingrece los grados',
                labelText: 'Grados',
              ),
              onChanged: (valor) {
                if (valor.isEmpty || double.tryParse(valor) == null) {
                  grados = 0;
                  return;
                }
                grados = double.parse(valor);
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "De grados:",
                  style: TextStyle(fontSize: 18),
                ),
                DropdownButton(
                  value: _value,
                  items: [
                    DropdownMenuItem(
                      child: Text("Celsius"),
                      value: 1,
                    ),
                    DropdownMenuItem(
                      child: Text("Fahrenheit"),
                      value: 2,
                    ),
                    DropdownMenuItem(
                      child: Text("Kelvin"),
                      value: 3,
                    )
                  ],
                  onChanged: (value) {
                    setState(() {
                      _value = int.parse(value.toString());
                    });
                  },
                  hint: Text("Select item"),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "A grados:",
                  style: TextStyle(fontSize: 18),
                ),
                DropdownButton(
                  value: _value2,
                  items: [
                    DropdownMenuItem(
                      child: Text("Celsius"),
                      value: 1,
                    ),
                    DropdownMenuItem(
                      child: Text("Fahrenheit"),
                      value: 2,
                    ),
                    DropdownMenuItem(
                      child: Text("Kelvin"),
                      value: 3,
                    )
                  ],
                  onChanged: (value) {
                    setState(() {
                      _value2 = int.parse(value.toString());
                    });
                  },
                  hint: Text("Select item"),
                ),
              ],
            ),
            ElevatedButton(
                onPressed: () => {
                      setState(() {
                        convertirGrados(_value, _value2);
                      })
                    },
                child: Text("Calcular")),
            ListTile(
              title: Text(
                'Los grados son: $result',
                style: TextStyle(color: Colors.black, fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void convertirGrados(int grado1, int grado2) {
    if (grados != 0) {
      switch (grado1) {
        case 1:
          switch (grado2) {
            case 1:
              result = grados;
              break;
            case 2:
              result = (grados * 9 / 5) + 32;
              break;
            case 3:
              result = grados + 273.15;
              break;
          }
          break;
        case 2:
          switch (grado2) {
            case 1:
              result = (grados - 32) * 5 / 9;
              break;
            case 2:
              result = grados;
              break;
            case 3:
              result = (grados - 32) * 5 / 9 + 273.15;
              break;
          }
          break;
        case 3:
          switch (grado2) {
            case 1:
              result = grados - 273.16;
              break;
            case 2:
              result = (grados - 273.15) * 9 / 5 + 32;
              break;
            case 3:
              result = grados;
              break;
          }
          break;
      }
    } else {
      result = 0;
    }
  }
}
