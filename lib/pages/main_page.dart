import 'package:flutter/material.dart';
import 'user_page.dart'; // Импортируем страницу с информацией о пользователе

class MainPage extends StatelessWidget {
  final String name;
  final String email;
  final String password;

  MainPage({required this.name, required this.email, required this.password});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Главная страница',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      ),
      body: Center(
        child: Text(
          'Главная страница',
          style: TextStyle(fontSize: 24),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.delete),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.info),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UserPage(
                      name: name,
                      email: email,
                      password: password,
                    ),
                  ),
                );
              },
              icon: Icon(Icons.person),
            ),
          ],
        ),
      ),
    );
  }
}
