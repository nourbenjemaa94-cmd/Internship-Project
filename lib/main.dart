import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:testing/firebase_options.dart';
//import 'package:testing/pages/singup_page.dart';
import 'package:firebase_auth/firebase_auth.dart'; 
//import 'package:cloud_firestore/cloud_firestore.dart';
import './pages/singup_page.dart';
import './pages/home_page.dart';
import 'package:testing/widgets/cart_provider.dart';
import 'package:provider/provider.dart';
import './../widgets/favorites_provider.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  

  
  @override
  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [ 
        ChangeNotifierProvider(create: (_) => CartProvider()), 
        ChangeNotifierProvider(create: (_) => FavoritesProvider()), ],

      
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Fleure de la Poste',

        theme: ThemeData.light().copyWith(
          appBarTheme: const AppBarTheme(
            centerTitle: true,
            elevation: 4,
          ),
          cardTheme: CardThemeData(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            margin: const EdgeInsets.all(8),
          ),
        ),
        darkTheme: ThemeData.dark().copyWith(
          appBarTheme: const AppBarTheme(
            backgroundColor: Color.fromARGB(255, 54, 52, 86),
            centerTitle: true,
            elevation: 4,
          ),
          cardTheme: CardThemeData(
            
            color: const Color.fromARGB(255, 38, 38, 40),
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            margin: const EdgeInsets.all(8),
          ),
        ),
        themeMode: ThemeMode.light,
        
        // theme: ThemeData(
        //   colorScheme: ColorScheme.fromSeed(
        //     seedColor: const Color.fromARGB(255, 23, 17, 130),
        //     primary: const Color.fromARGB(255, 23, 17, 130),
        //     secondary: const Color.fromARGB(255, 248, 193, 99),
        //   ),
        //   useMaterial3: true,
        //   appBarTheme: const AppBarTheme(
        //     backgroundColor: Color.fromARGB(255, 23, 17, 130),
        //     foregroundColor: Color.fromARGB(255, 250, 201, 134),
        //     centerTitle: true,
        //     elevation: 4,
        //   ),
        //   cardTheme: CardThemeData(
        //     elevation: 3,
        //     shape: RoundedRectangleBorder(
        //       borderRadius: BorderRadius.circular(12),
        //     ),
        //     margin: const EdgeInsets.all(8),
        //   ),
        // ),
        
        //home: HomePage(),
      home : StreamBuilder(
          stream: FirebaseAuth.instance.userChanges(),
          builder: (context, snapshot) {
            //if (snapshot.connectionState == ConnectionState.active) {return const Center(child: CircularProgressIndicator());      }
            if (snapshot.data != null) {
              return  HomePage();
            }
            return const SignUpPage(); 
          }
      )
      
      
      
    
      ),
    
    );
  }

}