import 'package:flutter/material.dart';

class UserForm extends StatelessWidget {
  UserForm({Key? key}) : super(key: key);

  final _form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Formulário de Usuário',
        ),
        actions: [
          IconButton(
            onPressed: () {
              final isValid = _form.currentState!.validate();

              if (isValid) {
                _form.currentState!.save();
                Navigator.of(context).pushNamed('/');
              }
            },
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: _form,
          child: Column(
            children: [
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty || value.trim().length > 3) {
                    return 'Ocorreu um erro';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  labelText: 'Nome',
                ),
              ),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty ||
                      value.length > 3 ||
                      !value.contains('@')) {
                    return 'Ocorreu um erro';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  labelText: 'Email',
                ),
              ),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty || value.length > 3) {
                    return 'Ocorreu um erro';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  labelText: 'URL do Avatar',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
