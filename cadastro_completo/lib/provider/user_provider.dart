import 'dart:math';

import 'package:cadastro_completo/data/data_users.dart';
import 'package:flutter/cupertino.dart';

import '../models/user.dart';

class UsersProvider with ChangeNotifier {
  final Map<String, User> _items = {...Data_Users};

  List<User> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  User byIndex(int i) {
    return _items.values.elementAt(i);
  }

  void put(User user) {
    if (user.id.trim().isNotEmpty && _items.containsKey(user.id)) {
      //alterar
      _items.update(user.id, (_) => user);
    } else {
//adicionar
      final id = Random().nextDouble().toString();
      _items.putIfAbsent(
        id,
        () => User(
          avatarUrl: user.avatarUrl,
          id: id,
          email: user.email,
          nome: user.nome,
        ),
      );
    }
    notifyListeners();
  }

  void remove(User user) {
    _items.remove(user);
    notifyListeners();
  }
}
