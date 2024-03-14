import 'package:flutter/material.dart';

class UserPage extends StatelessWidget {
  final String name;
  final String email;
  final String password;

  UserPage({
    required this.name,
    required this.email,
    required this.password,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Информация о пользователе',
          style: TextStyle(color: Colors.white70),
        ),
        backgroundColor: Colors.blueGrey,
      ),
      body: Container(
        width: 1000,
        height: 1000,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 0, 0, 0), // Цвет фона
          borderRadius: BorderRadius.circular(0.0), // Скругление углов
        ),
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Name: $name',
              style: const TextStyle(
                fontSize: 20,
                color: Color.fromARGB(255, 255, 246, 246),
                shadows: <Shadow>[
                  Shadow(
                    offset: Offset(3.0, 3.0),
                    blurRadius: 5.0,
                    color: Color.fromARGB(255, 185, 0, 161),
                  ),
                ],
              ), // Цвет текста
            ),
            SizedBox(height: 10),
            Text(
              'Email: $email',
              style: const TextStyle(
                fontSize: 20,
                color: Color.fromARGB(255, 255, 240, 240),
                shadows: <Shadow>[
                  Shadow(
                    offset: Offset(3.0, 3.0),
                    blurRadius: 5.0,
                    color: Color.fromARGB(0, 180, 0, 0),
                  ),
                ],
              ), // Цвет текста
            ),
            SizedBox(height: 10),
            Text(
              'Password: $password',
              style: const TextStyle(
                fontSize: 20,
                color: Color.fromARGB(255, 255, 239, 239),
                shadows: <Shadow>[
                  Shadow(
                    offset: Offset(3.0, 3.0),
                    blurRadius: 5.0,
                    color: Color.fromARGB(255, 116, 0, 139),
                  ),
                ],
              ), // Цвет текста
            ),
          ],
        ),
      ),
    );
  }
}
