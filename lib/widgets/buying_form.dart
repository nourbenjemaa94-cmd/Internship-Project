import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BuyingForm extends StatefulWidget {
  final double totalPrice;
  
  const BuyingForm({super.key, required this.totalPrice});

  static const gouvernements = {
    'tunis': 'Tunis',
    'benArous': 'Ben Arous',
    'nabeul': 'Nabeul',
    'ariana': 'Ariana',
    'sousse': 'Sousse',
    'mahdia': 'Mahdia',
    'monastir': 'Monastir',
    'sfax': 'Sfax',
    'gabes': 'Gabes',
    'mednine': 'Mednine',
    'tozeur': 'Tozeur',
    'kebili': 'Kebili',
    'gafsa': 'Gafsa',
    'kairouan': 'Kairouan',
    'siliana': 'Siliana',
    'jendouba': 'Jendouba',
    'bizerte': 'Bizerte',
    'beja': 'Beja',
    'zaghouan': 'Zaghouan',
    'manouba': 'Manouba',
    'tatawin': 'Tatawin',
  };

  @override
  State<BuyingForm> createState() => _BuyingFormState();
}

class _BuyingFormState extends State<BuyingForm> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  String? selectedGouvernement;

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    super.dispose();
  }

  Future<void> submitBuyingForm() async {
    if (formKey.currentState!.validate()) {
      try {
        final user = FirebaseAuth.instance.currentUser;
        if (user != null) {
          await FirebaseFirestore.instance
              .collection('orders')
              .add({
            'userId': user.uid,
            'name': nameController.text.trim(),
            'email': emailController.text.trim(),
            'gouvernement': selectedGouvernement,
            'timestamp': FieldValue.serverTimestamp(),
          });
          
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Order placed successfully!')),
          );
          Navigator.pop(context);
        }
      } catch (e) {
        print('Error: $e');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Form to Buy',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 8),
                const Text('Acheter votre bouquet de fleures'),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Total:',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '${widget.totalPrice.toStringAsFixed(2)} DT',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 113, 21, 62),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                const Text('Nom et Prenom:'),
                const SizedBox(height: 6),
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                    hintText: 'foulen el fouleni',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                const Text('Email:'),
                const SizedBox(height: 6),
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: 'exemple@gmail.com',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!value.contains('@')) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                const Text('Gouvernement'),
                const SizedBox(height: 6),
                DropdownButtonFormField<String>(
                  value: selectedGouvernement,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  hint: const Text('Select'),
                  items: BuyingForm.gouvernements.entries
                      .map((e) => DropdownMenuItem(
                            value: e.key,
                            child: Text(e.value),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedGouvernement = value;
                    });
                  },
                  validator: (value) {
                    if (value == null) {
                      return 'Please select a gouvernement';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OutlinedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Cancel'),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        await submitBuyingForm();
                      },
                      child: const Text('Submit Order'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}