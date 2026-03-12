import 'package:flutter/material.dart';

class UrgencePage extends StatelessWidget {
  const UrgencePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Urgence')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Contactez immédiatement un médecin ou rendez-vous aux urgences.', textAlign: TextAlign.center),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Logique pour appeler un numéro d'urgence
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: const Text('Appeler les urgences'),
            ),
          ],
        ),
      ),
    );
  }
}
