import 'package:flutter/material.dart';

import '../models/user.dart';

class UserTile extends StatelessWidget {
  const UserTile({Key? key, this.user}) : super(key: key);

  final User? user;

  @override
  Widget build(BuildContext context) {
    final avatar = user!.avatarUrl.isEmpty
        ? const CircleAvatar(
            child: Icon(
              Icons.person,
            ),
          )
        : CircleAvatar(
            backgroundImage: NetworkImage(user!.avatarUrl),
          );
    return ListTile(
      leading: avatar,
      title: Text(user!.nome),
      subtitle: Text(user!.email),
      trailing: SizedBox(
        width: 100,
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(
                  '/user-form',
                  arguments: user,
                );
              },
              icon: const Icon(
                Icons.edit,
                color: Colors.orange,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
