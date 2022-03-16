import 'package:flutter/material.dart';
import 'package:formulario_flutter/components/user_tile.dart';
import 'package:formulario_flutter/data/dummy_users.dart';

class UserList extends StatelessWidget {
  static const users = DUMMY_USERS;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Voos Infraero'),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.add),
            )
          ],
        ),
        body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, i) => UserTile(users.values.elementAt(i)),
        ));
  }
}
