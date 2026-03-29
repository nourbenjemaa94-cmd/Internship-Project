import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'package:testing/main.dart';
import '../widgets/favorites_provider.dart';
import 'product_details_page.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    
   
    return Scaffold(
      
      body: Consumer<FavoritesProvider>(
        builder: (context, favoritesProvider, child) {
          if (favoritesProvider.favorites.isEmpty) {
            return const Center(
              child: Text('No favorites yet!'),
            );
          }
          return ListView.builder(
            itemCount: favoritesProvider.favorites.length,
            itemBuilder: (context, index) {
              final product = favoritesProvider.favorites[index];
              return ListTile(
                leading: Image.asset(product.image, width: 50, fit: BoxFit.cover),
                title: Text(product.title),
                subtitle: Text('${product.price.toStringAsFixed(0)} DT'),
                trailing: IconButton(
                  icon: const Icon(Icons.delete, color: Color.fromARGB(255, 155, 11, 20),),
                  onPressed: () {
                    favoritesProvider.removeFavorite(product);
                  },
                ),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ProductDetailsPage(product: product),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}