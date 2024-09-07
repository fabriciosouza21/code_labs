import 'package:flutter/material.dart';
import 'package:namer_app/main.dart';
import 'package:provider/provider.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  FormPageState createState() => FormPageState();
}

class FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();
  final _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    return MaterialApp(
      title: 'Formulario',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Formulario'),
        ),
        body: Center(
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: _textController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor insira um texto';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      String value = _textController.text;
                      appState.addFavorite(value);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Favorito adicionado')),
                      );
                      _textController.clear();
                    }
                  },
                  child: const Text('Adicionar Favorito'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}