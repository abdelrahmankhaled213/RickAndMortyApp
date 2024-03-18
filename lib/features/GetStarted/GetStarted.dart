import 'package:flutter/material.dart';

class GetStarted extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
         Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                "assets/Images/unsplash_fouVDmGXoPI.png",
              ),
              fit: BoxFit.cover
            )
          ),
        ),
      ]
      ),
    );
  }
}
