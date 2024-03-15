import 'package:flutter/material.dart';
import 'package:localization/pages/registration_page.dart';
import 'package:easy_localization/easy_localization.dart';

import 'generated/codegen_loader.g.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
        supportedLocales: [Locale('en'), Locale('ru'), Locale('kk')],
        path: 'assets/translations',
        fallbackLocale: Locale('en'),
        assetLoader: CodegenLoader(),
        child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: 'My First Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FirstPage(),
    );
  }
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Страница выбора языка'),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                context.setLocale(Locale("ru"));
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SecondPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                fixedSize: Size(220, 80),
                side: BorderSide(
                    color: const Color.fromARGB(255, 0, 0, 0), width: 3),
              ),
              child: Row(
                children: [
                  Image.asset('assets/image/ru.png',
                      width: 50, height: 50), // Путь к изображению флага
                  const SizedBox(
                      width: 5), // Пространство между изображением и текстом
                  const Text(
                    'Русский',
                    style: TextStyle(
                      color: Color.fromARGB(
                          255, 0, 0, 0), // Устанавливаем красный цвет текста
                      fontSize: 20, // Устанавливаем размер шрифта 20 пунктов
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                context.setLocale(Locale("kk")); //язык
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SecondPage()),
                ); // навигатор
              },
              style: ElevatedButton.styleFrom(
                fixedSize: Size(220, 80),
                side: BorderSide(
                    color: const Color.fromARGB(255, 0, 0, 0), width: 3),
              ),
              child: Row(
                children: [
                  Image.asset('assets/image/kk.png',
                      width: 50, height: 50), // Путь к изображению флага
                  const SizedBox(
                      width: 5), // Пространство между изображением и текстом
                  const Text(
                    'Қазақша',
                    style: TextStyle(
                      color: Color.fromARGB(
                          255, 0, 0, 0), // Устанавливаем красный цвет текста
                      fontSize: 20, // Устанавливаем размер шрифта 20 пунктов
                    ),
                  ),
                ],
              ), //стиль текста
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                context.setLocale(Locale("en"));
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SecondPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                fixedSize: Size(220, 80),
                side: BorderSide(
                    color: const Color.fromARGB(115, 0, 0, 0), width: 3),
              ),
              child: Row(
                children: [
                  Image.asset('assets/image/en.png',
                      width: 50, height: 50), // Путь к изображению флага
                  const SizedBox(
                      width: 5), // Пространство между изображением и текстом
                  const Text(
                    'English',
                    style: TextStyle(
                      color:
                          Colors.black45, // Устанавливаем красный цвет текста
                      fontSize: 20, // Устанавливаем размер шрифта 20 пунктов
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
