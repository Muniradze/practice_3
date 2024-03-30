import 'package:flutter/material.dart';

void main() {
  runApp(ContentSwitcherApp()); //Точка входа программы
}

class ContentSwitcherApp extends StatelessWidget { //Создание класса ContentSwitcherApp и наследование от основного класса StatelessWidget
  @override  //Переопределение
  Widget build(BuildContext context) {
    return MaterialApp( //Возвращаем окно
      home: ContentSwitcherScreen(), //В качестве главное страницы возвращаем класс ContentSwitcherScreen, в котором будет содержаться контент который будет меняться
    );
  }
}

class ContentSwitcherScreen extends StatefulWidget { //Создание класса ContentSwitcherScreen
  @override
  _ContentSwitcherScreenState createState() => _ContentSwitcherScreenState();
}

class _ContentSwitcherScreenState extends State<ContentSwitcherScreen> {
  int _currentIndex = 0; //Создание счетчика

  final List<Widget> _screens = [ //Вызов классов, которые будут созданы ниже, вызываются при использовании навигации
    ScreenWidget1(),
    ScreenWidget2(),
    ScreenWidget3(),
    ScreenWidget4(),
    ScreenWidget5(),
  ];

  void _changeScreen(int index) { //Создание метода, меняющего контент
    setState(() {
      _currentIndex = index;
    });
  }

  @override //Переопределение
  Widget build(BuildContext context) {
    return Scaffold( //Создание объекта, внутри которого будут находиться другие объекты
      appBar: AppBar( //Создание заголовка
        backgroundColor: Colors.amberAccent, //изменение цвета заднего фона
        title: Text('Content Mun App'), //Текст заголовка
        centerTitle: true, //Размещение текста посередине
      ),
      body: _screens[_currentIndex], //Создание тела окна, размещение в массив _screens счетчика _currentIndex
      drawer: Drawer( //Создание бокового меню
        backgroundColor: Colors.amberAccent, //Цвет заднего фона
        child: ListView( //Дочерний объект
          children: [
            ListTile( //Добавление списка
              leading: Icon(Icons.home), //Создание иконки перед заголовком
              title: Text('Домой'), //Текст заголовка
              onTap: () { //Обработчик нажатия
                _changeScreen(0); //Вызов метода _changeScreen(0) при нажатии и возвращение первого класса
                Navigator.pop(context); //Навигация между экранами
              },
            ),
            ListTile( //Добавление списка
              leading: Icon(Icons.search), //Создание иконки перед заголовком
              title: Text('Поиск'), //Текст заголовка
              onTap: () {  //Обработчик нажатия
                _changeScreen(1); //Вызов метода _changeScreen(1) при нажатии и возвращение первого класса
                Navigator.pop(context); //Навигация между экранами
              },
            ),
            ListTile(
              leading: Icon(Icons.add),
              title: Text('Добавить'),
              onTap: () {
                _changeScreen(2);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.favorite),
              title: Text('Нравится'),
              onTap: () {
                _changeScreen(3);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.person_pin),
              title: Text('Профиль'),
              onTap: () {
                _changeScreen(4);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ScreenWidget1 extends StatelessWidget {  //Создание первого класса с контентом
  @override //Переопределение
  Widget build(BuildContext context) {
    return Scaffold( //Возвращение объекта с объектами
      body: Container( //Создание контейнера
        color: Colors.blueGrey, // Changing background color to blue grey
        child: Center( //Расположение объекта по центру
          child: Text( //Создание виджета Text
            'Домашняя страница',
            style: TextStyle( //Изменение стиля текста
              fontSize: 28, //Изменение размера текста
              color: Colors.black, //Изменение цвета текста
            ),
          ),
        ),
      ),
    );
  }
}

class ScreenWidget2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.brown, // Changing background color to teal
        child: Center(
          child: Text(
            'Поиск',
            style: TextStyle(
              fontSize: 28, // Changing font size to 28
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}


class ScreenWidget3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.indigo, // Changing background color to blue grey
        child: Center(
          child: FloatingActionButton(onPressed: () {},child: Text('+',), backgroundColor: Colors.amber,)
          ),
        ),
     );
  }
}

class ScreenWidget4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.lightBlue, // Changing background color to blue grey
        child: Center(
          child: Icon(Icons.accessibility_new, size: 100,),
        ),
      ),
    );
  }
}

class ScreenWidget5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black87, // Changing background color to blue grey
        child: Center(
          child: Text(
            'Имя Ибрагим вам что-нибудь напоминает?',
            style: TextStyle(
              fontSize: 28,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

