import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ornek1/ui/utils/Responsive.dart';

class ServicesPage extends StatelessWidget with Responsive {
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
    deviceType = MediaQuery.of(context).size.shortestSide;
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
      padding: EdgeInsets.only(
        top: fit(0, 10, 22, 30),
        left: fit(10, 10, 15, 30),
      ),
      child: Row(
        children: [
          IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: fit(20, 24, 32, 38),
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
        top: fit(10, 15, 30, 40),
        left: fit(20, 20, 25, 40),
        bottom: fit(20, 25, 40, 40),
      ),
      child: Row(
        children: [
          Text(
            'Hizmetlerimiz',
            style: TextStyle(
              color: Colors.white,
              fontSize: fit(20, 26, 34, 40),
            ),
          ),
        ],
      ),
    );
  }

  Widget servicesPart() {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(
          top: fit(5, 10, 40, 20),
        ),
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
        padding: EdgeInsets.symmetric(
          horizontal: fit(15, 10, 24, 20),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: fit(200, 250, 350, 400),
                height: fit(320, 420, 600, 620),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: fit(-30, -30, -30, -40),
                      left: fit(-30, -30, -30, -40),
                      child: SvgPicture.asset(
                        circle2Logo,
                        semanticsLabel: circle2Label,
                        width: fit(110, 140, 180, 210),
                        color: Colors.amber[200],
                      ),
                    ),
                    Positioned(
                      top: fit(-30, -30, -30, -40),
                      left: fit(-30, -30, -30, -40),
                      child: SvgPicture.asset(
                        circle2Logo,
                        semanticsLabel: circle2Label,
                        width: fit(90, 110, 140, 170),
                        color: Colors.amber[300],
                      ),
                    ),
                    Positioned(
                      top: fit(25, 40, 50, 40),
                      right: fit(-40, -50, -70, -90),
                      child: SvgPicture.asset(
                        circle2Logo,
                        semanticsLabel: circle2Label,
                        width: fit(90, 110, 150, 180),
                        color: Colors.blue[200],
                      ),
                    ),
                    Positioned(
                      top: fit(120, 150, 200, 230),
                      right: fit(45, 60, 80, 90),
                      child: SvgPicture.asset(
                        circle2Logo,
                        semanticsLabel: circle2Label,
                        width: fit(8, 10, 16, 16),
                        color: Colors.pink[200],
                      ),
                    ),
                    Positioned(
                      top: fit(140, 170, 220, 250),
                      left: fit(30, 30, 50, 70),
                      child: SvgPicture.asset(
                        circle2Logo,
                        semanticsLabel: circle2Label,
                        width: fit(16, 20, 30, 30),
                        color: Colors.deepPurple[100],
                      ),
                    ),
                    Positioned(
                      top: fit(190, 230, 300, 350),
                      right: fit(24, 30, 40, 50),
                      child: SvgPicture.asset(
                        circle2Logo,
                        semanticsLabel: circle2Label,
                        width: fit(12, 15, 20, 20),
                        color: Colors.green[100],
                      ),
                    ),
                    Positioned(
                      top: fit(110, 140, 180, 200),
                      left: 20,
                      right: 20,
                      child: SvgPicture.asset(
                        building1Logo,
                        semanticsLabel: building1Label,
                        width: fit(80, 100, 160, 170),
                      ),
                    ),
                    Positioned(
                      top: fit(210, 270, 380, 410),
                      left: fit(24, 30, 40, 40),
                      child: Text(
                        'Paket 1',
                        style: TextStyle(
                          fontSize: fit(20, 24, 34, 40),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Positioned(
                      top: fit(240, 310, 440, 470),
                      left: fit(24, 30, 40, 40),
                      child: Container(
                        width: fit(150, 200, 250, 320),
                        child: Text(
                          'Açıklama açıkla ma açıkl ama açık lama açıklama açıklama Açıklama açıklama açıklama açıklama açıklama açıklama',
                          style: TextStyle(
                            fontSize: fit(10, 12, 17, 18),
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
              top: fit(300, 400, 570, 580),
              left: fit(40, 60, 60, 130),
              right: fit(40, 60, 60, 130),
              child: SizedBox(
                height: fit(40, 50, 70, 70),
                child: RaisedButton(
                  color: Colors.amber[400],
                  child: Text(
                    'Ücretsiz',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: fit(13, 14, 24, 28),
                    ),
                  ),
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Colors.amber[400],
                    ),
                    borderRadius: BorderRadius.circular(
                      fit(20, 25, 30, 30),
                    ),
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
      height: fit(50, 60, 70, 80),
      // width: 50,
      color: Colors.blue[800],
    );
  }
}
