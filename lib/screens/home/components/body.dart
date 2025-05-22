import 'package:flutter/material.dart';
import 'package:plantapp/constants.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    // Mendapatkan ukuran layar
    final Size size = MediaQuery.of(context).size;

    // Mengembalikan widget scrollable
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const <Widget>[            
            SizedBox(height: kDefaultPadding),
          ],
        ),
      ),
    );
  }
}
