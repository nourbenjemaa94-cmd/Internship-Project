//import 'package:fleure_de_la_poste/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:testing/widgets/buying_form.dart';
import './../widgets/cart_provider.dart';
import 'package:provider/provider.dart';


class CartPage extends StatelessWidget {
  const CartPage({super.key});
  //final Product product;

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>().cart;
    
    // Calculate total price
    double totalPrice = 0;
    for (var item in cart) {
      totalPrice += (item['price'] as num).toDouble();
    }
    
    return Scaffold(
      appBar: AppBar(
        title: Text('You have ${cart.length} items in your cart'),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cart.length,
              itemBuilder: (context, index) {

                final cartItem = cart[index];

                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(cartItem['image']),
                    radius: 30,
                  ),
                  title: Text(
                    cartItem['title'],
                  ),
                  trailing: IconButton(
                    onPressed: (){
                      showDialog(
                        barrierDismissible: false,
                        context: context,
                         builder: (context) {
                          return AlertDialog(
                            title: const Text('Remove Item'),
                            content: const Text('Are you sure you want to remove this bouquet from the cart?'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context); 
                                },
                                child: const Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () {
                                  context.read<CartProvider>().removeProduct(cartItem);
                                  Navigator.pop(context); 
                                },
                                child: const Text('Remove'),
                              ),
                            ],
                          );
                         }
                      );

                    }, 
                    icon: const Icon(Icons.delete, color: Color.fromARGB(255, 155, 11, 20),)),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color.fromARGB(255, 234, 201, 233),
                    Color.fromARGB(255, 113, 21, 62),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(255, 113, 21, 62).withOpacity(0.5),
                    blurRadius: 12,
                    offset: const Offset(0, 6),
                  ),
                  BoxShadow(
                    color: const Color.fromARGB(255, 234, 201, 233).withOpacity(0.3),
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  //overlayColor: Colors.transparent,
                ),
                onPressed: () {
                  showDialog(
                        barrierDismissible: false,
                        context: context,
                         builder: (context) {
                          return AlertDialog(
                            title: const Text('Confirm Purchase'),
                            content: Text('Total: $totalPrice DT. Do you want to proceed to buy?'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context); 
                                },
                                child: const Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  showDialog(
                                    context: context,
                                    builder: (context) => Dialog(
                                      child: BuyingForm(totalPrice: totalPrice),
                                    ),
                                  );
                                },
                                child: const Text('Confirmer'),
                              ),
                            ],
                          );
                         }
                      );
                },
                child: const Text(
                  'Acheter',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}