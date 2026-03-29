import 'package:flutter/material.dart';
import '../widgets/global_variables.dart';
import '../widgets/product_card.dart';
import 'product_details_page.dart';



class ProductList extends StatelessWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
    // appBar: AppBar(
    //     title: const Text('Fleure de la Poste'),
    //     backgroundColor: const Color.fromARGB(255, 234, 201, 233),
    //   ),

    body: 
        GridView.builder(
          padding: const EdgeInsets.all(16),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 27,
            mainAxisSpacing: 3,
            childAspectRatio: 0.5,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ProductDetailsPage(product: product),
                  ),
                );
              },
              child: ProductCard(
                title: product.title,
                price: product.price,
                image: product.image,
                product: product,
              ),
            );
          },
        ),
      //],
    );
    //);
  }
}
