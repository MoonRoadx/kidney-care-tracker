import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AjouterExamen extends StatefulWidget {
  const AjouterExamen({super.key});

  @override
  State<AjouterExamen> createState() => _AjouterExamenState();
}

class _AjouterExamenState extends State<AjouterExamen> {
  final TextEditingController _typeExamenController = TextEditingController();
  final TextEditingController _resultatController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  Future<void> _enregistrerExamen() async {
    String typeExamen = _typeExamenController.text;
    String resultat = _resultatController.text;
    String date = _dateController.text;

    if (typeExamen.isNotEmpty && resultat.isNotEmpty) {
      await FirebaseFirestore.instance.collection('examens').add({
        'type': typeExamen,
        'resultat': resultat,
        'date': date,
        'timestamp': FieldValue.serverTimestamp(),
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Examen enregistré avec succès!')),
        );
        Navigator.pop(context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ajouter un Examen')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _typeExamenController,
              decoration: const InputDecoration(
                labelText: 'Type d\'examen',
                hintText: 'Ex: ECBU, Prise de sang, Échographie',
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _resultatController,
              decoration: const InputDecoration(
                labelText: 'Résultat',
                hintText: 'Ex: 18-20%, Normal, Anormal',
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
              onPressed: _enregistrerExamen,
              child: const Text('Enregistrer'),
            ),
          ],
        ),
      ),
    );
  }
}
