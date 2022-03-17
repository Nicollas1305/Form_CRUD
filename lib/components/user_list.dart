import 'package:flutter/material.dart';
import 'package:formulario_flutter/models/user.dart';

class UserList extends StatelessWidget {
  final List<User> users;
  final void Function(String) onRemove;

  UserList(
    this.users,
    this.onRemove,
  );

  @override
  Widget build(BuildContext context) {
    return users.isEmpty
        ? Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Text(
                'Nenhuma Pessoa Cadastrada',
                style: Theme.of(context).textTheme.headline6,
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                height: 200,
                child: Image.asset(
                  'assets/images/waiting.png',
                  fit: BoxFit.cover,
                ),
              ),
            ],
          )
        : ListView.builder(
            itemCount: users.length,
            itemBuilder: (ctx, index) {
              final us = users[index];
              return Card(
                elevation: 5,
                margin: EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 5,
                ),
                child: ListTile(
                  title: Text(
                    us.name,
                  ),
                  subtitle: Text(
                    us.email,
                  ),
                  trailing: IconButton(
                    onPressed: () => onRemove(us.id),
                    icon: Icon(
                      Icons.delete,
                    ),
                    color: Colors.red,
                  ),
                ),
              );
            },
          );
  }
}
