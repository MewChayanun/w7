import 'package:flutter/material.dart';
import 'package:w7/api_page.dart';
import 'package:w7/detail_page.dart';
import 'package:w7/my_listpage.dart';
import 'welcome_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/welcome': (context) => const WelcomePage(),
        '/about': (context) => const AboutPage(),
        '/api': (context) => const ApiPage(),
        '/detail': (context) => const DetailPage(
              productId: 1,
            ),
        '/mylist': (context) => const MyListPage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/welcome');
              },
              child: const Text('Go to Welcome Page'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/about');
              },
              child: const Text('Go to ChargerCal Page'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/api');
              },
              child: const Text('Go to Api Page'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/detail');
              },
              child: const Text('Go to Detail Page'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/mylist');
              },
              child: const Text('Go to Mylist Page'),
            ),
          ],
        ),
      ),
    );
  }
}

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  AboutPageState createState() => AboutPageState();
}

class AboutPageState extends State<AboutPage> {
  final currentSOCController = TextEditingController();
  final targetSOCController = TextEditingController();
  final chargingRateController = TextEditingController();
  final voltageController = TextEditingController();
  final efficiencyController = TextEditingController();

  @override
  void dispose() {
    currentSOCController.dispose();
    targetSOCController.dispose();
    chargingRateController.dispose();
    voltageController.dispose();
    efficiencyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Benz EQC',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/car.png',
                width: 300,
              ),
              const SizedBox(height: 20),
              const CarInfoCard(),
              const SizedBox(height: 20),
              _buildInputField(
                controller: currentSOCController,
                labelText: 'Current SOC (%)',
              ),
              const SizedBox(height: 10),
              _buildInputField(
                controller: targetSOCController,
                labelText: 'Target SOC (%)',
              ),
              const SizedBox(height: 10),
              _buildInputField(
                controller: chargingRateController,
                labelText: 'Charging Rate (A)',
              ),
              const SizedBox(height: 10),
              _buildInputField(
                controller: voltageController,
                labelText: 'Voltage (V)',
              ),
              const SizedBox(height: 10),
              _buildInputField(
                controller: efficiencyController,
                labelText: 'Efficiency (%)',
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  final currentSOC =
                      double.tryParse(currentSOCController.text) ?? -1;
                  final targetSOC =
                      double.tryParse(targetSOCController.text) ?? -1;
                  final chargingRate =
                      double.tryParse(chargingRateController.text) ?? 0.0;
                  final voltage =
                      double.tryParse(voltageController.text) ?? 0.0;
                  final efficiency =
                      double.tryParse(efficiencyController.text) ?? 0.0;

                  if (currentSOC < 0 ||
                      currentSOC > 100 ||
                      targetSOC < 0 ||
                      targetSOC > 100 ||
                      targetSOC <= currentSOC) {
                    _showSnackBar(context,
                        'Invalid Input: SOC values must be between 0-100 and Target SOC > Current SOC.');
                    return;
                  }

                  if (chargingRate <= 0 || voltage <= 0 || efficiency <= 0) {
                    _showSnackBar(context,
                        'Invalid Input: Charging Rate, Voltage, and Efficiency must be greater than 0.');
                    return;
                  }

                  final chargingPower = (voltage * chargingRate) / 1000;
                  final chargingTime = (targetSOC - currentSOC) /
                      100 *
                      (63 / chargingPower / (efficiency / 100));

                  Navigator.pushNamed(
                    context,
                    '/about',
                    arguments: chargingTime.toStringAsFixed(2),
                  );
                },
                child: const Text('Calculate Charging Time'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputField({
    required TextEditingController controller,
    required String labelText,
  }) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(color: Colors.grey),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        filled: true,
        fillColor: Colors.grey.shade100,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: Colors.transparent,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: Colors.blue,
            width: 2,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: Colors.transparent,
            width: 2,
          ),
        ),
      ),
      keyboardType: TextInputType.number,
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }
}

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    final chargingTime = ModalRoute.of(context)?.settings.arguments as String?;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculation Result'),
      ),
      body: Center(
        child: Card(
          color: Colors.blue.shade100,
          margin: const EdgeInsets.all(16),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Charging Time',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Text(
                  '$chargingTime hours',
                  style: const TextStyle(fontSize: 24, color: Colors.black87),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Back'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CarInfoCard extends StatelessWidget {
  const CarInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildInfoCard(
          icon: Icons.battery_full,
          title: 'Battery',
          value: '63%',
          color: Colors.green,
        ),
        _buildInfoCard(
          icon: Icons.add_road,
          title: 'Distance',
          value: '104 km',
          color: Colors.blue,
        ),
        _buildInfoCard(
          icon: Icons.thermostat,
          title: 'Climate',
          value: '22°C',
          color: Colors.orange,
        ),
      ],
    );
  }

  Widget _buildInfoCard({
    required IconData icon,
    required String title,
    required String value,
    required Color color,
  }) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Icon(icon, size: 40, color: color),
            const SizedBox(height: 10),
            Text(title, style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 5),
            Text(
              value,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
