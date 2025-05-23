import 'package:flutter/material.dart';
import 'package:navigation/presentation/detail_order_page.dart';

class Orderpage extends StatefulWidget {
  const Orderpage({super.key});

  @override
  State<Orderpage> createState() => _OrderpageState();
}

class _OrderpageState extends State<Orderpage> {
  final TextEditingController makananController = TextEditingController();
  final TextEditingController minumanController = TextEditingController();
  final TextEditingController jumlahMakananController = TextEditingController();
  final TextEditingController jumlahMinumanController = TextEditingController();
  int totalHarga = 0;

  void calculateTotalPrice() {
    int jumlahMakanan = int.tryParse(jumlahMakananController.text) ?? 0;
    int jumlahMinuman = int.tryParse(jumlahMinumanController.text) ?? 0;

    setState(() {
      totalHarga = (jumlahMinuman * 4000) + (jumlahMakanan * 18000);
    });
  }

   @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(title: Text('Order Page')),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: makananController,
              decoration: const InputDecoration(labelText: 'Food Order'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your food order';
                }
                return null;
              },
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: jumlahMakananController,
              decoration: const InputDecoration(labelText: 'Food QTY Order'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your qty of food order';
                }
                return null;
              },
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: minumanController,
              decoration: const InputDecoration(labelText: 'Drink Order'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your drink order';
                }
                return null;
              },
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: jumlahMinumanController,
              decoration: const InputDecoration(labelText: 'Drink QTY Order'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your qty of drink order';
                }
                return null;
              },
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  calculateTotalPrice();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailOrderPage(
                        makanan: makananController.text,
                        jumlahMakanan: jumlahMakananController.text,
                        minuman: minumanController.text,
                        jumlahMinuman: jumlahMinumanController.text,
                        totalHarga: totalHarga,
                      ),
                    ),
                  );
                }
              },
              child: Text('Order Now'),
            ),
          ],
        ),
      ),
    );
  }
}