import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';
import '../services/firestore_service.dart';

class CheckoutPage extends StatefulWidget {
  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  final _formKey = GlobalKey<FormState>();
  String _address = '';
  String _paymentMethod = 'Credit Card';

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Address'),
                onSaved: (value) {
                  _address = value!;
                },
              ),
              DropdownButtonFormField(
                value: _paymentMethod,
                decoration: InputDecoration(labelText: 'Payment Method'),
                items: ['Credit Card', 'PayPal']
                    .map((method) => DropdownMenuItem(value: method, child: Text(method)))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _paymentMethod = value.toString();
                  });
                },
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () async {
                  _formKey.currentState!.save();
                  await FirestoreService().placeOrder(
                    cartProvider.items,
                    _address,
                    _paymentMethod,
                    cartProvider.totalPrice,
                  );
                  cartProvider.clearCart();
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Order placed successfully')));
                  Navigator.of(context).pop();
                },
                child: Text('Place Order'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
