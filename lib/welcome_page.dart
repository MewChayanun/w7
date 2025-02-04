import 'package:flutter/material.dart';
import 'about_page.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<WelcomePage> {
  String _output1 = "0";
  String _output2 = "0";
  final currentController = TextEditingController(text: '36');
  final targetController = TextEditingController(text: '100');
  final rateController = TextEditingController(text: '18.4');
  final voltageController = TextEditingController(text: '225');
  final capacityController = TextEditingController(text: '38.5');
  final efficiencyController = TextEditingController(text: '0.84');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Image.asset(
            'assets/ChargeLogo2020.png',
            width: 120,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: const [
          Icon(Icons.car_crash),
          SizedBox(
            width: 30,
          ),
          Icon(Icons.contrast_outlined),
          SizedBox(
            width: 30,
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AboutPage()),
                    );
                  },
                  splashColor: Colors.white10, // Splash color over image
                  child: Ink.image(
                    fit: BoxFit.cover,
                    width: 400,
                    height: 200,
                    image: const AssetImage('assets/car.png'),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.all(12),
                  decoration: const BoxDecoration(
                    color: Colors.black87,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.orange,
                        offset: Offset(4, 4),
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  alignment: Alignment.centerLeft,
                  child: Column(
                    children: [
                      const Text(
                        'CHARGE CAR!',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 26,
                            color: Colors.white),
                      ),
                      const SizedBox(height: 10),
                      Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  controller: currentController,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    labelText: 'Current SOC:',
                                    labelStyle: const TextStyle(
                                      color: Colors.white60,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    hintText: 'Enter Current SOC(%)',
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 30, horizontal: 30),
                                    fillColor: Colors.orange[700],
                                    filled: true,
                                    prefixIcon: const Icon(
                                        Icons.battery_1_bar_outlined),
                                  ),
                                  keyboardType: TextInputType.number,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: TextField(
                                  controller: targetController,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    labelText: 'Target SOC:',
                                    labelStyle: const TextStyle(
                                      color: Colors.white60,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    hintText: 'Enter Target SOC(%)',
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 30, horizontal: 30),
                                    fillColor: Colors.orange[700],
                                    filled: true,
                                    prefixIcon: const Icon(
                                        Icons.battery_charging_full_rounded),
                                  ),
                                  keyboardType: TextInputType.number,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  controller: rateController,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    labelText: 'Charging Rate:',
                                    labelStyle: const TextStyle(
                                      color: Colors.white60,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    hintText: 'Enter Charging Rate(A)',
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 30, horizontal: 30),
                                    fillColor: Colors.orange[700],
                                    filled: true,
                                    prefixIcon:
                                        const Icon(Icons.charging_station),
                                  ),
                                  keyboardType: TextInputType.number,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: TextField(
                                  controller: voltageController,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    labelText: 'Voltage:',
                                    labelStyle: const TextStyle(
                                      color: Colors.white60,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    hintText: 'Enter Voltage(V)',
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 30, horizontal: 30),
                                    fillColor: Colors.orange[700],
                                    filled: true,
                                  ),
                                  keyboardType: TextInputType.number,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  controller: capacityController,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    labelText: 'Bat Capacity:',
                                    labelStyle: const TextStyle(
                                      color: Colors.white60,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    hintText: 'Enter Bat Capacity(kWh)',
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 30, horizontal: 30),
                                    fillColor: Colors.orange[700],
                                    filled: true,
                                    prefixIcon: const Icon(
                                        Icons.battery_alert_outlined),
                                  ),
                                  keyboardType: TextInputType.number,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: TextField(
                                  controller: efficiencyController,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    labelText: 'Efficiency:',
                                    labelStyle: const TextStyle(
                                      color: Colors.white60,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    hintText: 'Enter Efficiency(%)',
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 30, horizontal: 30),
                                    fillColor: Colors.orange[700],
                                    filled: true,
                                  ),
                                  keyboardType: TextInputType.number,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Card(
                                  color: Colors.orange[700],
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 30),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(Icons.power),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          _output2,
                                          style: const TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Card(
                                  color: Colors.orange[700],
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 30),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(Icons.punch_clock_rounded),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          _output1,
                                          style: const TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(), elevation: 10),
                  onPressed: () {
                    final currentSOC = double.parse(currentController.text);
                    final targetSOC = double.parse(targetController.text);
                    final chargingRate = double.parse(rateController.text);
                    final voltage = double.parse(voltageController.text);
                    final batCapacity = double.parse(capacityController.text);
                    final efficiency = double.parse(efficiencyController.text);

                    final chargingPower = (voltage * chargingRate) / 1000;
                    final chargingTime = (targetSOC - currentSOC) *
                        batCapacity /
                        100 /
                        (chargingPower * efficiency);

                    debugPrint('Current SOC: $currentSOC');
                    debugPrint('Target SOC: $targetSOC');
                    debugPrint('Charging Rate: $chargingRate');
                    debugPrint('Voltage: $voltage');
                    debugPrint('Battery Capacity: $batCapacity');
                    debugPrint('Efficiency: $efficiency');
                    debugPrint(
                        'Charging Power: ${chargingPower.toStringAsFixed(4)} W');
                    debugPrint(
                        'Charging Time: ${chargingTime.toStringAsFixed(3)} hours');

                    setState(() {
                      _output1 = '${chargingTime.toStringAsFixed(3)} Hours';
                      _output2 = '${chargingPower.toStringAsFixed(4)} W';
                    });
                  },
                  child: const Text(
                    'Calculate',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  child: const Text('Open Page2'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AboutPage()),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
