import 'package:flutter/material.dart';
import './singup_page.dart';
import 'package:firebase_auth/firebase_auth.dart';


class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    //return SignUpPage();
    return StreamBuilder(
          stream: FirebaseAuth.instance.userChanges(),
          builder: (context, snapshot) {
            // if (snapshot.connectionState == ConnectionState.active) {
            //   return const Center(child: CircularProgressIndicator(),);`
            // }
            if (snapshot.data != null) {
              return  MyProfilePage();
            }
            return const SignUpPage(); 
          }
        );
  }
        
}


class MyProfilePage extends StatelessWidget {
  const MyProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: const Color.fromARGB(255, 234, 201, 233),
      ),
      body: const Center(
        child: Text('This is the Profile Page'),
        
      ),
    );
  }
}