import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ServicesPage extends StatelessWidget {
  final String building1Logo = 'assets/images/services/building1.svg';
  final String circle2Logo = 'assets/images/home/circle2.svg';
  final String building1Label = 'Building Icon';
  final String circle2Label = 'Circle2 Icon';

  var pageController = PageController(
    initialPage: 0,
    keepPage: true,
    viewportFraction: 0.7,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[800],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            backPart(),
            titlePart(),
            servicesPart(),
            footerPart(),
          ],
        ),
      ),
    );
  }

  Widget backPart() {
    return Padding(
      padding: EdgeInsets.only(top: 10, left: 10),
      child: Row(
        children: [
          IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
            onPressed: () {},
          )
        ],
      ),
    );
  }

  Widget titlePart() {
    return Padding(
      padding: EdgeInsets.only(
        top: 15,
        left: 20,
        bottom: 25,
      ),
      child: Row(
        children: [
          Text(
            'Hizmetlerimiz',
            style: TextStyle(
              color: Colors.white,
              fontSize: 26,
            ),
          ),
        ],
      ),
    );
  }

  Widget servicesPart() {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(top: 10),
        child: PageView(
          scrollDirection: Axis.horizontal,
          controller: pageController,
          // pageSnapping:	true,
          children: [
            servicePaket1(),
            servicePaket1(),
            servicePaket1(),
          ],
        ),
      ),
    );
  }

  Widget servicePaket1() {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: 250,
                height: 420,
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: -30,
                      left: -30,
                      child: SvgPicture.asset(
                        circle2Logo,
                        semanticsLabel: circle2Label,
                        width: 140,
                        color: Colors.amber[200],
                      ),
                    ),
                    Positioned(
                      top: -30,
                      left: -30,
                      child: SvgPicture.asset(
                        circle2Logo,
                        semanticsLabel: circle2Label,
                        width: 110,
                        color: Colors.amber[300],
                      ),
                    ),
                    Positioned(
                      top: 40,
                      right: -50,
                      child: SvgPicture.asset(
                        circle2Logo,
                        semanticsLabel: circle2Label,
                        width: 110,
                        color: Colors.blue[200],
                      ),
                    ),
                    Positioned(
                      top: 150,
                      right: 60,
                      child: SvgPicture.asset(
                        circle2Logo,
                        semanticsLabel: circle2Label,
                        width: 10,
                        color: Colors.pink[200],
                      ),
                    ),
                    Positioned(
                      top: 170,
                      left: 30,
                      child: SvgPicture.asset(
                        circle2Logo,
                        semanticsLabel: circle2Label,
                        width: 20,
                        color: Colors.deepPurple[100],
                      ),
                    ),
                    Positioned(
                      top: 170,
                      left: 30,
                      child: SvgPicture.asset(
                        circle2Logo,
                        semanticsLabel: circle2Label,
                        width: 20,
                        color: Colors.deepPurple[100],
                      ),
                    ),
                    Positioned(
                      top: 230,
                      right: 30,
                      child: SvgPicture.asset(
                        circle2Logo,
                        semanticsLabel: circle2Label,
                        width: 15,
                        color: Colors.green[100],
                      ),
                    ),
                    Positioned(
                      top: 140,
                      left: 20,
                      right: 20,
                      child: SvgPicture.asset(
                        building1Logo,
                        semanticsLabel: building1Label,
                        width: 100,
                      ),
                    ),
                    Positioned(
                      top: 270,
                      left: 30,
                      child: Text(
                        'Paket 1',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 310,
                      left: 30,
                      child: Container(
                        width: 200,
                        child: Text(
                          'Açıklama açıklama açıklama açıklama açıklama açıklama Açıklama açıklama açıklama açıklama açıklama açıklama',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[400],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 400,
              left: 60,
              right: 60,
              child: SizedBox(
                height: 50,
                child: RaisedButton(
                  color: Colors.amber[400],
                  child: Text(
                    'Ücretsiz',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Colors.amber[400],
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget footerPart() {
    return Container(
      height: 60,
      // width: 50,
      color: Colors.blue[800],
    );
  }
}
