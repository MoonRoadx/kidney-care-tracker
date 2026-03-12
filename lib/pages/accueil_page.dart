import 'package:flutter/material.dart';

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
            const Text('Lanha', style: TextStyle(fontSize: 24)),
            const Text('Rein droit: 18-20%', style: TextStyle(fontSize: 18)),
            const Text('Dernier examen: ECBU (12 mars 2024)', style: TextStyle(fontSize: 16)),
            ElevatedButton(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const UrgencePage())),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: const Text('Urgence'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const AjouterSymptome())),
              child: const Text('Ajouter Symptôme'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const AjouterExamen())),
              child: const Text('Ajouter Examen'),
            ),
          ],
        ),
      ),
    );
  }
}
