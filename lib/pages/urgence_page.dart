import 'package:flutter/material.dart';

class UrgencePage extends StatelessWidget {
  const UrgencePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Urgence')),
      body: const Center(
        child: Text('Appeler le médecin ou les urgences.'),
      ),
    );
  }
}
