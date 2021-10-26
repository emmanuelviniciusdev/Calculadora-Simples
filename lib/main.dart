import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora Simples',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        brightness: Brightness.dark,
      ),
      home: const MyHomePage(title: 'Calculadora Simples'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _mathOperationValues = [
    'Selecione a operação matemática...',
    'Somar',
    'Subtrair',
    'Multiplicar',
    'Dividir'
  ];

  String _selectedMathOperationValue = 'Selecione a operação matemática...';
  Icon? _selectedMathOperationIcon;

  final firstNumberInputController = TextEditingController(text: '0');
  final secondNumberInputController = TextEditingController(text: '0');
  final resultInputController = TextEditingController(text: '0');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Image(
                image: AssetImage('lib/assets/images/calculator-logo.png'),
                width: 220,
                height: 220,
              ),
              TextField(
                controller: firstNumberInputController,
                decoration: const InputDecoration(
                  labelText: "Primeiro número",
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20),
              TextField(
                controller: secondNumberInputController,
                decoration: const InputDecoration(
                  labelText: "Segundo número",
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20),
              TextField(
                controller: resultInputController,
                decoration: const InputDecoration(
                  labelText: "Resultado",
                ),
                readOnly: true,
              ),
              const SizedBox(height: 20),
              DropdownButton(
                isExpanded: true,
                icon: _selectedMathOperationIcon,
                value: _selectedMathOperationValue,
                items: _mathOperationValues
                    .map((value) {
                  return DropdownMenuItem(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    _selectedMathOperationValue = value!;

                    double firstValue = double.parse(firstNumberInputController.text);
                    double secondValue = double.parse(secondNumberInputController.text);

                    if (value.toLowerCase() == 'somar') {
                      _selectedMathOperationIcon = const Icon(Icons.add);
                      resultInputController.text = (firstValue + secondValue).toStringAsFixed(2);
                    }
                    else if (value.toLowerCase() == 'subtrair') {
                      _selectedMathOperationIcon = const Icon(Icons.remove);
                      resultInputController.text = (firstValue - secondValue).toStringAsFixed(2);
                    }
                    else if (value.toLowerCase() == 'multiplicar') {
                      _selectedMathOperationIcon = const Icon(Icons.close);
                      resultInputController.text = (firstValue * secondValue).toStringAsFixed(2);
                    }
                    else if (value.toLowerCase() == 'dividir') {
                      _selectedMathOperationIcon = const Icon(Icons.view_module_outlined);
                      resultInputController.text = (firstValue / secondValue).toStringAsFixed(2);
                    }
                  });
                },
              )
            ],
          ),
        )
      ),
    );
  }
}
