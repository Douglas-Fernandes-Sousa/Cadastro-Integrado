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
}
