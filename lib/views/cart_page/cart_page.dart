import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../components/cart.dart';
import '../../models/cart_model.dart';
import '../../models/shoe_model.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: ((context, value, child) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'My Cart',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: value.getUserCart().length,
                itemBuilder: (context, index) {
                  Shoe indiviualShoe = value.getUserCart()[index];
                  return CartItem(
                    shoe: indiviualShoe,
                  );
                },
              ),
            ),
          ],
        ),
      )),
    );
  }
}
