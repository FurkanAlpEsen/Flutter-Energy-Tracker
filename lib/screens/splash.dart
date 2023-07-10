import 'package:energypocket/screens/home.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 89, 157, 213),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: ColorFiltered(
              colorFilter: ColorFilter.mode(
                  Colors.teal.withOpacity(0.7), BlendMode.color),
              child: Image.asset(
                'assets/images/splash.jpg',
                fit: BoxFit.cover,
                height: double.infinity,
                width: double.infinity,
                alignment: Alignment.center,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Color.fromARGB(197, 171, 217, 181),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => HomePage()));
          },
          label: Text(
            'Getting Started',
            style: TextStyle(color: Color.fromARGB(255, 30, 33, 34)),
          )),
    );
  }
}
