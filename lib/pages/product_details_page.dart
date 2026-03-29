import 'package:flutter/material.dart';
import './../widgets/cart_provider.dart';
import 'package:provider/provider.dart';
import './../widgets/global_variables.dart';


class ProductDetailsPage extends StatelessWidget {
  final Product product;
  const ProductDetailsPage({
    super.key, 
    required this.product
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(0, 255, 255, 255),
      ),
      body:  Column(
        children: [

          Text(
            product.title,
            style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 113, 21, 62)
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Image.asset(
              product.image,
              height: 300,
              width: 500,
              fit: BoxFit.cover,
            ),

          ),
          const Spacer(flex:2), 
          Container(
            height: 200,
            decoration: BoxDecoration(
              color: const Color.fromARGB(236, 245, 243, 248),
              borderRadius: BorderRadius.circular(35),
            ),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Price: ${product.price.toStringAsFixed(0)} DT',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 113, 21, 62),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    product.description,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed:(){
                      Provider.of<CartProvider>(context, listen: false)
                        .addProduct(
                          {
                            'title': product.title,
                            'price': product.price,
                            'image': product.image,
                            'description': product.description,
                          }
                        );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 212, 179, 226),
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      textStyle: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    child: const Text('Ajouter Au Panier',
                    style: TextStyle(
                      color:  Color.fromARGB(255, 46, 1, 65),
                      fontSize: 19,
                    ),
                    ),
                    // actions: [
                    //           TextButton(
                    //             onPressed: () => Navigator.pop(context),
                    //             child: const Text('OK'),
                    //           ),
                    //         ],
                  ),
                  ),
                
              ],
            ),
          )
        ],
      ),

    );
  }
}