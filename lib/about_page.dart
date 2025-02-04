import 'package:flutter/material.dart';

void main() {
  runApp(const AboutPage());
}

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

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
      backgroundColor: Colors.white60,
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                  'assets/car.png',
                  width: 600,
                ),
                const SizedBox(height: 10),
                const Text(
                  'Electonic Car',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.orange[700],
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black87,
                        offset: Offset(4, 4),
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  alignment: Alignment.centerLeft,
                  child: const Column(
                    children: [
                      Text(
                        'An electric car or electric vehicle (EV) is a passenger automobile that is propelled by an electric traction motor, using electrical energy as the primary source of propulsion. The term normally refers to a plug-in electric vehicle, typically a battery electric vehicle (BEV), which only uses energy stored in on-board battery packs, but broadly may also include plug-in hybrid electric vehicle (PHEV), range-extended electric vehicle (REEV) and fuel cell electric vehicle (FCEV), which can convert electric power from other fuels via a generator or a fuel cell.',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.black),
                      ),
                    ],
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
