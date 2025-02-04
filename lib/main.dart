import 'package:flutter/material.dart';
import 'package:w7/api_page.dart';
import 'welcome_page.dart';
import 'about_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => HomePage(),
        '/welcome': (context) => const WelcomePage(),
        '/aboutUs': (context) => const AboutPage(),
        '/second': (context) => SecondPage(),
        '/api': (context) => const ApiPage(),
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: AppBarTheme(color: Colors.orange[600]),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      initialRoute: '/',
    );
  }
}

class HomePage extends StatelessWidget {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Long In'),
      ),
      backgroundColor: Colors.white60,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _controller1,
              decoration: const InputDecoration(
                labelText: 'กรุณา Username (chayanun)',
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _controller2,
              decoration: const InputDecoration(
                labelText: 'กรุณากรอก Passsword (mew)',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final username = _controller1.text.trim();
                final password = _controller2.text.trim();

                if (username.isNotEmpty && password.isNotEmpty) {
                  Navigator.pushNamed(
                    context,
                    '/second',
                    arguments: {'username': username, 'password': password},
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('กรุณากรอกข้อมูลให้ครบถ้วน')),
                  );
                }
              },
              child: const Text('แสดงข้อมูล'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                final username = _controller1.text.trim();
                final password = _controller2.text.trim();

                if (username == 'chayanun' && password == 'mew') {
                  Navigator.pushNamed(
                    context,
                    '/welcome',
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('ชื่อผู้ใช้หรือรหัสผ่านไม่ถูกต้อง')),
                  );
                }
              },
              child: const Text('Home Page'),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/api');
                },
                child: const Text("Api Page"))
          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>?;

    final username = args?['username'] ?? 'Unknown';
    final password = args?['password'] ?? 'Unknown';

    return Scaffold(
      appBar: AppBar(
        title: const Text('หน้าที่สอง'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Card(
              color: Colors.orange[700],
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                child: Column(
                  children: [
                    Text(
                      'Hi: $username',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 26),
                    ),
                    Text(
                      'Password is: $password',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 26),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Back'),
            ),
          ],
        ),
      ),
    );
  }
}
