import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:localization/translations/locale_keys.g.dart';
import 'package:localization/class/user.dart'; // Импортируем модель User
import 'main_page.dart'; // Импортируем страницу MainPage

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.registration_page_title.tr()),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          width: 800,
          height: 500,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: LocaleKeys.name_label.tr(),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: LocaleKeys.email_label.tr(),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: LocaleKeys.password_label.tr(),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: confirmPasswordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: LocaleKeys.confirm_password_label.tr(),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    String name = nameController.text;
                    String email = emailController.text;
                    String password = passwordController.text;
                    String confirmPassword = confirmPasswordController.text;

                    if (password == confirmPassword) {
                      User user =
                          User(name: name, email: email, password: password);

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MainPage(
                            name: user.name,
                            email: user.email,
                            password: user.password,
                          ),
                        ),
                      );
                    } else {
                      // Пароли не совпадают, показать сообщение об ошибке
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Ошибка"),
                            content: Text("Пароли не совпадают."),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text("OK"),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black, // Черный цвет кнопки
                    minimumSize: Size(double.infinity, 60),
                  ),
                  child: Text(
                    LocaleKeys.register_button_label.tr(),
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white, // Белый цвет текста
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
