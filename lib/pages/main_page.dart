import 'package:flutter/material.dart';
import 'user_page.dart'; // Импортируем страницу с информацией о пользователе

class NewsItem {
  final String title;
  final String description;
  final String imageUrl;

  NewsItem(
      {required this.title, required this.description, required this.imageUrl});
}

class MainPage extends StatelessWidget {
  final String name;
  final String email;
  final String password;

  MainPage({required this.name, required this.email, required this.password});

  final List<NewsItem> newsList = [
    NewsItem(
      title: 'Снег в алматы',
      description: 'Непогода в Алматы: в акимате показали уборку снега вечером',
      imageUrl: 'assets/image/sneg.jpg',
    ),
    NewsItem(
      title: 'Проблемы с светом',
      description: 'Алматинцы в ряде районов столкнулись с отключением света ',
      imageUrl: 'assets/image/svet.jpeg',
    ),
    NewsItem(
      title: 'Землятресение ',
      description: 'Сильное землятресение поразило алматинцев ',
      imageUrl: 'assets/image/sh.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Новостная лента',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueGrey,
      ),
      body: ListView.builder(
        itemCount: newsList.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: 200, // Максимальная ширина изображения
                maxHeight: 200, // Максимальная высота изображения
              ),
              child: Image.asset(
                newsList[index].imageUrl,
                fit: BoxFit.cover, // Установите тип масштабирования
              ),
            ),
            title: Text(newsList[index].title),
            subtitle: Text(newsList[index].description),
            onTap: () {
              // Здесь можно добавить действие при нажатии на новость
            },
          );
        },
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
