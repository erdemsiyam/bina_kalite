import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(width: 70),
                  Text(
                    'Bina Kontrol',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 30),
                    child: Icon(
                      Icons.person,
                      size: 40,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Column(
                    children: [
                      Text('Hizmetler'),
                      SizedBox(
                        child: Divider(thickness: 2),
                        width: 40,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text('Geçmiş İşlemler'),
                      SizedBox(
                        child: Divider(thickness: 2),
                        width: 80,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 30),
              CarouselSlider(
                options: CarouselOptions(
                  height: 400.0,
                  enableInfiniteScroll: false,
                  enlargeCenterPage: true,
                  aspectRatio: 16 / 9,
                ),
                items: [
                  packet1Card,
                  packet1Card,
                  packet1Card,
                ],
              ),
              SizedBox(height: 30),
              Container(
                alignment: Alignment.center,
                height: 300,
                width: double.infinity,
                child: ListView(
                  children: [
                    ListTile(
                      title: Text(
                        'Ahmet Varan',
                      ),
                      leading: Icon(Icons.person),
                      subtitle: Text(
                        'ASDASD aSDAS Dasd ASDD dad dsa dddd aadasd dad',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget get packet1Card => Container(
        width: 800,
        margin: EdgeInsets.symmetric(horizontal: 5.0),
        decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.all(Radius.circular(40)),
        ),
        child: Column(
          children: [
            SizedBox(height: 20),
            Icon(Icons.build, size: 150),
            SizedBox(height: 20),
            Text(
              'Paket 1',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 36,
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  'Paket 1 Paket 1 Paket 1 Paket 1 Paket 1 Paket 1 Paket 1 Paket 1 Paket 1 Paket 1 Paket 1',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(bottom: 18.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('\$123'),
                  RaisedButton(child: Text('Ücretsiz'), onPressed: () {}),
                ],
              ),
            ),
          ],
        ),
      );
}
