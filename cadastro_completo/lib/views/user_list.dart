import 'package:cadastro_completo/provider/user_provider.dart';
import 'package:cadastro_completo/widgets/user_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserList extends StatelessWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UsersProvider>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Lista de Usuarios'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: user.count,
        itemBuilder: (ctx, i) => UserTile(
          user: user.byIndex(i),
        ),
      ),
    );
  }
}
