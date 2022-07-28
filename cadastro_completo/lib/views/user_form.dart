import 'dart:math';

import 'package:cadastro_completo/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/user.dart';

class UserForm extends StatefulWidget {
  const UserForm({Key? key}) : super(key: key);

  @override
  State<UserForm> createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  final _form = GlobalKey<FormState>();

  bool loading = true;
  late User user;
  @override
  void initState() {
    userloading();
    super.initState();
  }

  userloading() async {
    //checa se o widget já existe, se existir cria
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      final arguments = ModalRoute.of(context)?.settings.arguments;
      if (arguments == null && arguments is! User) {
        user = User(
          id: Random().nextInt(10000).toString(),
          avatarUrl: '',
          email: '',
          nome: '',
        );
      } else {
        user = arguments as User;
      }

      setState(() {
        loading = false;
      });
    });
  }

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
                Provider.of<UsersProvider>(context, listen: false).put(user);
                Navigator.of(context).pop();
              }
            },
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      body: loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(15),
              child: Form(
                key: _form,
                child: Column(
                  children: [
                    TextFormField(
                      initialValue: user.nome,
                      validator: (value) {
                        if (value == null || value.trim().length <= 3) {
                          return 'Nome Inválido';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        labelText: 'Nome',
                      ),
                      onSaved: (value) => user = user.copyWith(nome: value),
                    ),
                    TextFormField(
                      initialValue: user.email,
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            value.length < 3 ||
                            !value.contains('@')) {
                          return 'Ocorreu um erro';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        labelText: 'Email',
                      ),
                      onSaved: (value) => user = user.copyWith(email: value),
                    ),
                    TextFormField(
                      initialValue: user.avatarUrl,
                      decoration: const InputDecoration(
                        labelText: 'URL do Avatar',
                      ),
                      onSaved: (value) =>
                          user = user.copyWith(avatarUrl: value),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
