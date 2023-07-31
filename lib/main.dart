import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_validation_bloc/bloc/form_bloc.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => FormBloc(),
    child: MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  final TextEditingController _textEditingController1 = TextEditingController();
  final TextEditingController _textEditingController2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Form With Bloc'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextFormField(
                controller: _textEditingController1,
                decoration: const InputDecoration(labelText: 'Field 1'),
                onChanged: (value) {
                  BlocProvider.of<FormBloc>(context).add(FormValuesChanged(
                      _textEditingController1.text, _textEditingController2.text));
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _textEditingController2,
                decoration: const InputDecoration(labelText: 'Field 2'),
                onChanged: (value) {
                  BlocProvider.of<FormBloc>(context).add(FormValuesChanged(
                      _textEditingController1.text, _textEditingController2.text));
                },
              ),
              ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      context.watch<FormBloc>().state.allowSubmit ? Colors.blue : Colors.grey),
                ),
                child: const Text('Submit'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
