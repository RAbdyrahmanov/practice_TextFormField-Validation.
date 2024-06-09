import 'package:flutter/material.dart';
import 'package:home_page/screens/deteil_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final SharedPreferences prefs;
  _initPrefs() async {
    prefs = await SharedPreferences.getInstance();
    text = prefs.getString('0703999941') ?? '';
    setState(() {});
  }

  @override
  void initState() {
    _initPrefs();
    super.initState();
  }

  String text = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Главная страница'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DeteilScreen(),
                  ),
                );
              },
              child: const Text('Go to Deteil Screen'),
            ),
          ],
        ),
      ),
    );
  }
}
