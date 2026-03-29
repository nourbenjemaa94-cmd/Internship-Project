import 'package:flutter/material.dart';
import 'package:testing/pages/favorites_page.dart';
import './cart_page.dart';
import 'product_list.dart';
//import './profile_page.dart';


class HomePage extends StatefulWidget { 
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 0;

  List <Widget> pages = const [ ProductList(),FavoritesPage(),CartPage()];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentPage,
        children: pages,
      ),
      
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 30,
        onTap: (value) {
          setState(() {
            currentPage = value;
          });
        },
        currentIndex: currentPage,
        items:const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            backgroundColor:Color.fromARGB(255, 211, 187, 221),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
             backgroundColor:  Color.fromARGB(255, 212, 179, 226),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
              backgroundColor: Color.fromARGB(255, 208, 193, 214),
            label: 'Panier',
          ),
          // BottomNavigationBarItem(icon:   Icon(Icons.person),
          //   backgroundColor:  Color.fromARGB(255, 113, 21, 62),
          //   label: 'Profile',
          // ),
      ],
      ),

     );
  }
}

