
class Product {
  final String title;
  final String id;
  final double price;
  final String image;
  final String description;

  Product({
    
    required this.title,
    required this.id,
    required this.price,
    required this.image,
    required this.description,
  });
}

final List<Product> products = [
  Product(
    title: 'Lilies',
    id:'1',
    price: 50.0,
    image: 'assets/images/lilies.jpg',
    description: 'Lilies are elegant flowers that symbolize purity and refined beauty. They come in various colors and are perfect for special occasions.',
  ),
  Product(
    title: 'Roses',
    id:'2',
    price: 70.0,
    image: 'assets/images/roses.jpg',
    description: 'Roses are classic flowers that represent love and passion. They are available in a variety of colors and sizes.',
  ),
  Product(
    title: 'Tulips',
    id:'3',
    price: 40.0,
    image: 'assets/images/tulips.jpg',
    description: 'Tulips are vibrant flowers that symbolize perfect love and rebirth. They bloom in a wide range of colors.',
  ),
  Product(
    title: 'Peonies',
    id:'4',
    price: 90.0,
    image: 'assets/images/peonies.png',
    description: 'Peonies are lush flowers that symbolize romance and prosperity. Their large, fragrant blooms are perfect for weddings and special occasions.',
  ),
  Product(
    title: 'Orchids',
    id:'5',
    price: 80.0,
    image: 'assets/images/orchid.jpg',
    description: 'Orchids are exotic flowers that represent beauty and strength. They are known for their unique shapes and vibrant colors.',
  ),
  Product(
    title: 'Carnations',
    id:'6',
    price: 35.0,
    image: 'assets/images/carnations.jpg',
    description: 'Carnations are fragrant flowers that symbolize fascination and distinction. They are long-lasting and available in many colors.',
  ),
  Product(
    title: 'Sunflowers',
    id:'7',
    price: 60.0,
    image: 'assets/images/sunflowers.jpg',
    description: 'Sunflowers are bright and cheerful flowers that symbolize adoration and loyalty. Their large blooms bring warmth to any room.',
  ),
  Product(
    title: 'Daisies',
    id:'8',
    price: 30.0,
    image: 'assets/images/daisies.jpg',
    description: 'Daisies are cheerful flowers that represent innocence and purity. Their simple beauty brightens any space.',
  ),
  
];

List<Product> cart = [];

// App Colors
// class AppColors {
//   static const Color primaryColor = Color(0xFF4CAF50);
//   static const Color secondaryColor = Color(0xFFFF9800);
//   static const Color accentColor = Color(0xFFE91E63);
//   static const Color backgroundColor = Color(0xFFF5F5F5);
//   static const Color textColor = Color(0xFF333333);
//   static const Color lightTextColor = Color(0xFF666666);
// }