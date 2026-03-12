import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AjouterSymptome extends StatefulWidget {
  const AjouterSymptome({super.key});

  @override
  State<AjouterSymptome> createState() => _AjouterSymptomeState();
}

class _AjouterSymptomeState extends State<AjouterSymptome> {
  final TextEditingController _symptomeController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  Future<void> _enregistrerSymptome() async {
    String symptome = _symptomeController.text;
    String date = _dateController.text;

    if (symptome.isNotEmpty) {
      await FirebaseFirestore.instance.collection('symptomes').add({
        'symptome': symptome,
        'date': date,
        'timestamp': FieldValue.serverTimestamp(),
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Symptôme enregistré avec succès!')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ajouter un Symptôme')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _symptomeController,
              decoration: const InputDecoration(
                labelText: 'Symptôme',
                hintText: 'Ex: Douleur au rein droit',
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _dateController,
              decoration: const InputDecoration(
                labelText: 'Date (optionnelle)',
                hintText: 'Ex: 12 mars 2024',
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _enregistrerSymptome,
              child: const Text('Enregistrer'),
            ),
          ],
        ),
      ),
    );
  }
}
