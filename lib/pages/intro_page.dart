import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor:
            Colors.blue, // Ubah warna latar belakang sesuai keinginan
        body: Stack(
          children: [
            Positioned(
              right: 16,
              bottom: 16, // Ubah nilai top dan left sesuai keinginan
              child: IconButton(
                icon: Image.asset("assets/logo.png"),
                onPressed: () {},
              ),
            ),
            Positioned(
              right: 16,
              child: CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage("assets/avatar.png"),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Colors.black,
                      ),
                      SizedBox(width: 8),
                      Text(
                        "Lokasi",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 50),
                  Container(
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Search',
                              prefixIcon: Icon(Icons.search),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              hintStyle: TextStyle(color: Colors.white),
                              contentPadding: EdgeInsets.all(10),
                            ),
                            onChanged: (value) {
                              // Tindakan ketika teks berubah
                            },
                            onSubmitted: (value) {
                              // Tindakan ketika teks dikirimkan
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
