import 'dart:math';
import 'package:flutter/material.dart';
import 'package:formulario_flutter/components/user_form.dart';
import 'package:formulario_flutter/components/user_list.dart';
import 'package:formulario_flutter/models/user.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  //static const users = DUMMY_USERS;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<User> _users = [];

  List<User> get _recentUsers {
    return _users.where((us) {
      return us.name.isNotEmpty;
    }).toList();
  }

  _addUser(String name, String email) {
    final newUser = User(
      id: Random().nextDouble().toString(),
      name: name,
      email: email,
    );

    setState(() {
      _users.add(newUser);
    });
  }

  _openUserForm(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return UserForm(_addUser);
      },
    );
  }

  _removeUser(String id) {
    setState(() {
      _users.removeWhere((us) => us.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: Text('Voos Infraero'),
      actions: [
        IconButton(
          onPressed: () => _openUserForm(context),
          icon: Icon(Icons.add),
        )
      ],
    );

    final availabeHeight = MediaQuery.of(context).size.height -
        appBar.preferredSize.height -
        MediaQuery.of(context).padding.top;

    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: availabeHeight,
              child: UserList(_users, _removeUser),
            ),
          ],
        ),
      ),
    );
  }
}
