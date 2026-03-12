import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const KidneyCareTrackerApp());
}

class KidneyCareTrackerApp extends StatelessWidget {
  const KidneyCareTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KidneyCare Tracker',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const AccueilPage(),
    );
  }
}

class AccueilPage extends StatelessWidget {
  const AccueilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('KidneyCare Tracker')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Bienvenue', style: TextStyle(fontSize: 24)),
            ElevatedButton(
              onPressed: () async {
                await FirebaseFirestore.instance.collection('test').add({'message': 'Firebase fonctionne !'});
              },
              child: const Text('Tester Firebase'),
            ),
          ],
        ),
      ),
    );
  }
}
