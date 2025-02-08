import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AboutPage(),
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
              Row(
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
                    title: 'Remaining Distance',
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
              ),
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
                    _showErrorDialog(
                      context,
                      'Invalid Input',
                      'Please ensure SOC values are between 0 and 100, and Target SOC > Current SOC.',
                    );
                    return;
                  }

                  if (chargingRate <= 0 || voltage <= 0 || efficiency <= 0) {
                    _showErrorDialog(
                      context,
                      'Invalid Input',
                      'Please ensure Charging Rate, Voltage, and Efficiency are greater than 0.',
                    );
                    return;
                  }

                  final chargingPower = (voltage * chargingRate) / 1000;
                  final chargingTime = (targetSOC - currentSOC) /
                      100 *
                      (63 / chargingPower / (efficiency / 100));

                  _showResultDialog(
                    context,
                    'Calculation Result',
                    'Charging Time: ${chargingTime.toStringAsFixed(2)} hours',
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
        border: const OutlineInputBorder(),
      ),
      keyboardType: TextInputType.number,
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

  void _showResultDialog(BuildContext context, String title, String content) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void _showErrorDialog(BuildContext context, String title, String content) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title, style: const TextStyle(color: Colors.red)),
        content: Text(content),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
