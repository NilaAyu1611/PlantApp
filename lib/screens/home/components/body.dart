import 'package:flutter/material.dart';
import 'package:plantapp/constants.dart';
import 'package:plantapp/screens/home/components/header_with_seachbox.dart';
import 'package:plantapp/screens/home/components/tittle_with_more_bbtn.dart';

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
            HeaderWithSearchBox(size: size),
            TitleWithMoreBtn(title: "Recomended", press: () {}),
           
            TitleWithMoreBtn(title: "Featured Plants", press: () {}),
             
            SizedBox(height: kDefaultPadding),
          ],
        ),
      ),
    );
  }
}
