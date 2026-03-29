import 'package:flutter/material.dart';
//import 'package:testing/pages/favorites_page.dart';
import './global_variables.dart';
import './favorites_provider.dart';
import 'package:provider/provider.dart';
// import './../widgets/product_list.dart';
// import 'package:testing/widgets/cart_provider.dart';
// import './../widgets/global_variables.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final String image;
  final double price;
  final String title;
  //final VoidCallback? onFavoritePressed;

  const ProductCard({
    super.key,
    required this.image,
    required this.price,
    required this.title,
    required this.product,
    //this.onFavoritePressed,
  });

  @override
  Widget build(BuildContext context) {
    final favoritesProvider = Provider.of<FavoritesProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      
    
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Container(
              height: 150,
              width: double.infinity,

              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),


                image: DecorationImage(
                  image: AssetImage(product.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 125, 100, 100),
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  
                  const SizedBox(height: 8),
            
                  Text(
                    '${product.price.toStringAsFixed(0)} DT',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 113, 21, 62),
                    ),
                  ),
                  
                  const SizedBox(height: 15),



                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        
                        if (favoritesProvider.favorites.contains(product)) {
                          favoritesProvider.removeFavorite(product);
                        } else {
                          favoritesProvider.addFavorite(product);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),

                      child: Row(
                        children: [
                          const Icon(Icons.favorite, color: Color.fromARGB(255, 206, 152, 162),),
                          const SizedBox(width: 8),
                           Text(favoritesProvider.favorites.contains(product) ? 'Unlike' : 'Like',
                            style: TextStyle(color: Color.fromARGB(255, 190, 152, 206)),
                          ),
                        ]
                    ),

                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}