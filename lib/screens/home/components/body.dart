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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const ProfileHeader(),

          // PILIH LOKASI CARD
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding, vertical: 10),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Row(
                  children: [
                    const Icon(Icons.location_on, color: Colors.green, size: 28),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        selectedAddress ?? "Belum ada lokasi terpilih",
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                        ),
                      ),
                    ),        
                    ElevatedButton(
                      onPressed: _openMapPage,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF0C9869),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                      ),
                      child: const Text(
                        "Pilih Lokasi",
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                    ),            
                  ],
                ),
              ),
            ),
          ),

          HeaderWithSearchBox(size: size),
          TitleWithMoreBtn(title: "Recomended", press: () {}),
          RecomendsPlants(),
          TitleWithMoreBtn(title: "Featured Plants", press: () {}),
          FeaturedPlants(),
          const SizedBox(height: kDefaultPadding),
        ],
      ),      
    );
  }
}
