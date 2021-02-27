import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  final String personLogo = 'assets/images/home/user.svg';
  final String locationLogo = 'assets/images/home/location.svg';
  final String clockLogo = 'assets/images/home/clock.svg';
  final String likeLogo = 'assets/images/home/like.svg';
  final String settingsLogo = 'assets/images/home/settings.svg';
  final String infoLogo = 'assets/images/home/info.svg';
  final String circle1Logo = 'assets/images/home/circle1.svg';
  final String circle2Logo = 'assets/images/home/circle2.svg';
  final String circle3Logo = 'assets/images/home/circle3.svg';
  final String personLabel = 'User Icon';
  final String locationLabel = 'Location Icon';
  final String clockLabel = 'Clock Icon';
  final String likeLabel = 'Like Icon';
  final String settingsLabel = 'Settings Icon';
  final String infoLabel = 'Info Icon';
  final String circle1Label = 'Circle1 Icon';
  final String circle2Label = 'Circle2 Icon';
  final String circle3Label = 'Circle3 Icon';
  @override
  Widget build(BuildContext context) {
    // personLogoSize = fit(30, 40, 60, 80);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Container(
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Container(
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 30,
                            horizontal: 36,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Merhaba,',
                                    style: TextStyle(color: Colors.grey[400]),
                                  ),
                                  SizedBox(height: 6),
                                  Text(
                                    'İsmet YILDIZ',
                                    style: TextStyle(fontSize: 24),
                                  ),
                                ],
                              ),
                              SvgPicture.asset(
                                personLogo,
                                semanticsLabel: personLabel,
                                width: 50,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                            color: Colors.white,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Flexible(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Flexible(
                                        child: bolgemdekiRisk(),
                                      ),
                                      Flexible(
                                        child: aktifHizmetlerim(),
                                      ),
                                    ],
                                  ),
                                ),
                                Flexible(child: myLargeCard()),
                                Flexible(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Flexible(
                                        child: hakkimizda(),
                                      ),
                                      Flexible(
                                        child: ayarlar(),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.history,
                          size: 30,
                        ),
                        onPressed: () {},
                      ),
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue[900],
                        ),
                        child: Icon(
                          Icons.home_outlined,
                          size: 32,
                          color: Colors.white,
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.mode_comment_outlined,
                          size: 26,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget bolgemdekiRisk() {
    return Card(
      color: Colors.blue[100],
      elevation: 20,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(10),
      child: Stack(
        children: [
          Container(
            width: 150,
            height: 150,
          ),
          Positioned(
            left: 10,
            top: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Bölgemdeki',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                Text(
                  'Risk ?',
                  style: TextStyle(
                    fontSize: 26,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: -30,
            bottom: -30,
            child: SvgPicture.asset(
              locationLogo,
              semanticsLabel: locationLogo,
              width: 116,
            ),
          ),
        ],
      ),
    );
  }

  Widget aktifHizmetlerim() {
    return Card(
      color: Colors.indigo[100],
      elevation: 20,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(10),
      child: Stack(
        children: [
          Container(
            width: 150,
            height: 150,
          ),
          Positioned(
            left: 10,
            top: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Aktif',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                Text(
                  'Hizmetlerim',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: -30,
            bottom: -30,
            child: SvgPicture.asset(
              clockLogo,
              semanticsLabel: clockLabel,
              width: 116,
            ),
          ),
        ],
      ),
    );
  }

  Widget hakkimizda() {
    return Card(
      color: Colors.teal[100],
      elevation: 20,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(10),
      child: Stack(
        children: [
          Container(
            width: 150,
            height: 150,
          ),
          Positioned(
            left: 10,
            top: 16,
            child: Text(
              'Hakkımızda',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          Positioned(
            right: -30,
            bottom: -30,
            child: SvgPicture.asset(
              infoLogo,
              semanticsLabel: infoLabel,
              width: 116,
            ),
          ),
        ],
      ),
    );
  }

  Widget ayarlar() {
    return Card(
      color: Colors.yellow[100],
      elevation: 20,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(10),
      child: Stack(
        children: [
          Container(
            width: 150,
            height: 150,
          ),
          Positioned(
            left: 10,
            top: 16,
            child: Text(
              'Ayarlar',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          Positioned(
            right: -30,
            bottom: -30,
            child: SvgPicture.asset(
              settingsLogo,
              semanticsLabel: settingsLabel,
              width: 116,
            ),
          ),
        ],
      ),
    );
  }

  Widget myLargeCard() {
    return Card(
      color: Colors.blue[200],
      elevation: 20,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(10),
      child: Stack(
        children: [
          Container(
            width: 330,
            height: 150,
          ),
          Positioned(
            left: -80,
            top: -150,
            child: SvgPicture.asset(
              circle1Logo,
              semanticsLabel: circle1Label,
              width: 190,
              color: Colors.amber[100],
            ),
          ),
          Positioned(
            bottom: -160,
            left: -20,
            child: SvgPicture.asset(
              circle2Logo,
              semanticsLabel: circle2Label,
              width: 190,
              color: Colors.green[100],
            ),
          ),
          Positioned(
            top: -50,
            right: -70,
            child: SvgPicture.asset(
              circle3Logo,
              semanticsLabel: circle3Label,
              width: 200,
              color: Colors.green[100],
            ),
          ),
          Positioned(
            left: 50,
            top: 5,
            bottom: 5,
            child: Center(
              child: Text(
                'Hizmetlerimiz',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ),
          ),
          Positioned(
            right: 10,
            top: 10,
            bottom: 2,
            child: SvgPicture.asset(
              likeLogo,
              semanticsLabel: likeLabel,
              width: 80,
            ),
          ),
        ],
      ),
    );
  }
}

// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blue[100],
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisSize: MainAxisSize.max,
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               SizedBox(height: 20),
//               Row(
//                 mainAxisSize: MainAxisSize.max,
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   SizedBox(width: 70),
//                   Text(
//                     'Bina Kontrol',
//                     style: TextStyle(
//                       fontSize: 28,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(right: 30),
//                     child: Icon(
//                       Icons.person,
//                       size: 40,
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 30),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 mainAxisSize: MainAxisSize.max,
//                 children: [
//                   Column(
//                     children: [
//                       Text('Hizmetler'),
//                       SizedBox(
//                         child: Divider(thickness: 2),
//                         width: 40,
//                       ),
//                     ],
//                   ),
//                   Column(
//                     children: [
//                       Text('Geçmiş İşlemler'),
//                       SizedBox(
//                         child: Divider(thickness: 2),
//                         width: 80,
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//               SizedBox(height: 30),
//               CarouselSlider(
//                 options: CarouselOptions(
//                   height: 400.0,
//                   enableInfiniteScroll: false,
//                   enlargeCenterPage: true,
//                   aspectRatio: 16 / 9,
//                 ),
//                 items: [
//                   packet1Card,
//                   packet1Card,
//                   packet1Card,
//                 ],
//               ),
//               SizedBox(height: 30),
//               Container(
//                 alignment: Alignment.center,
//                 height: 300,
//                 width: double.infinity,
//                 child: ListView(
//                   children: [
//                     ListTile(
//                       title: Text(
//                         'Ahmet Varan',
//                       ),
//                       leading: Icon(Icons.person),
//                       subtitle: Text(
//                         'ASDASD aSDAS Dasd ASDD dad dsa dddd aadasd dad',
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget get packet1Card => Container(
//         width: 800,
//         margin: EdgeInsets.symmetric(horizontal: 5.0),
//         decoration: BoxDecoration(
//           color: Colors.amber,
//           borderRadius: BorderRadius.all(Radius.circular(40)),
//         ),
//         child: Column(
//           children: [
//             SizedBox(height: 20),
//             Icon(Icons.build, size: 150),
//             SizedBox(height: 20),
//             Text(
//               'Paket 1',
//               textAlign: TextAlign.left,
//               style: TextStyle(
//                 fontSize: 36,
//               ),
//             ),
//             SizedBox(height: 20),
//             Expanded(
//               child: Padding(
//                 padding: const EdgeInsets.all(16),
//                 child: Text(
//                   'Paket 1 Paket 1 Paket 1 Paket 1 Paket 1 Paket 1 Paket 1 Paket 1 Paket 1 Paket 1 Paket 1',
//                   textAlign: TextAlign.left,
//                   style: TextStyle(
//                     fontSize: 16,
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(height: 20),
//             Padding(
//               padding: const EdgeInsets.only(bottom: 18.0),
//               child: Row(
//                 mainAxisSize: MainAxisSize.max,
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   Text('\$123'),
//                   RaisedButton(child: Text('Ücretsiz'), onPressed: () {}),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       );
// }
