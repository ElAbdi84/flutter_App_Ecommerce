import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';
import '../providers/cart_provider.dart';
import 'package:flutter_ecommerce/providers/product_provider.dart';

class ProductDetailsPage extends StatelessWidget {
  final String productId;

  ProductDetailsPage({required this.productId});

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<ProductProvider>(context).products.firstWhere((prod) => prod.id == productId);
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: Column(
        children: [
          Image.network(product.imageUrl, height: 300, fit: BoxFit.cover),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.name, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
                Text('\$${product.price}', style: TextStyle(fontSize: 20, color: Colors.green)),
                SizedBox(height: 16),
                Text(product.description),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    cartProvider.addProductToCart(product);
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Added to cart')));
                  },
                  child: Text('Add to Cart'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
