import 'dart:convert';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

Future<List<String>> fetchData() async {
  final response =
      await http.get(Uri.parse('https://dogapi.dog/api/v2/breeds'));
  if (response.statusCode == 200) {
    final jsonBody = json.decode(response.body);
    List<dynamic> breeds = jsonBody['data'];
    List<String> breedNames =
        breeds.map((breed) => breed['attributes']['name'].toString()).toList();
    return breedNames;
  } else {
    throw Exception('Failed to load data...');
  }
}

class ApiPage extends StatefulWidget {
  const ApiPage({super.key});

  @override
  State<ApiPage> createState() => _ApiPageState(); // ✅ Correct
}

class _ApiPageState extends State<ApiPage> {
  late Future<List<String>> futureBreeds;

  @override
  void initState() {
    super.initState();
    futureBreeds = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dog Breeds')),
      body: Center(
        child: FutureBuilder<List<String>>(
          future: futureBreeds,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Text('No data available');
            }
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(snapshot.data![index]),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
