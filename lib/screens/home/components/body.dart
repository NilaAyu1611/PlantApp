import 'package:flutter/material.dart';
import 'package:plantapp/constants.dart';
import 'package:plantapp/screens/home/components/featurred_plants.dart';
import 'package:plantapp/screens/home/components/header_with_seachbox.dart';
import 'package:plantapp/screens/home/components/recomend_plants.dart';
import 'package:plantapp/screens/home/components/tittle_with_more_bbtn.dart';
import 'package:plantapp/screens/home/components/map_page.dart';
import 'package:plantapp/screens/home/components/profile_header.dart';

class Body extends StatefulWidget {         //akan menampilkan data yang bisa berubah (alamat)
  
  @override
   _BodyState createState() => _BodyState();
}
   
class _BodyState extends State<Body> {
  String? selectedAddress;

  void _openMapPage() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const MapPage()),
    );

    if (result != null && result is String) {
      setState(() {
        selectedAddress = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;


    // Mengembalikan widget scrollable
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const <Widget>[    
            HeaderWithSearchBox(size: size),
            TitleWithMoreBtn(title: "Recomended", press: () {}),
            RecomendsPlants(),
            TitleWithMoreBtn(title: "Featured Plants", press: () {}),
            FeaturedPlants(),
            SizedBox(height: kDefaultPadding),
          ],
        ),
      ),
    );
  }
}
