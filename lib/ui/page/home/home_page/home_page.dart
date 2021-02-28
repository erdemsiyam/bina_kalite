import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ornek1/ui/page/services/services_page.dart';
import 'package:ornek1/ui/utils/Responsive.dart';

class HomePage extends StatelessWidget with Responsive {
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
  double bottomBtnIconSizeHigh;
  double bottomBtnIconSizeLow;
  @override
  Widget build(BuildContext context) {
    deviceType = MediaQuery.of(context).size.shortestSide;
    bottomBtnIconSizeHigh = fit(26, 32, 40, 50);
    bottomBtnIconSizeLow = fit(24, 30, 38, 48);
    // personLogoSize = fit(30, 40, 60, 80);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(fit(8, 10, 16, 22)),
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
                        topPersonPart(),
                        cardsPart(context),
                      ],
                    ),
                  ),
                ),
                bottomButtonsPart(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget topPersonPart() {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: fit(24, 30, 40, 44),
        horizontal: fit(20, 36, 42, 50),
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
                style: TextStyle(
                  color: Colors.grey[400],
                  fontSize: fit(12, 16, 20, 24),
                ),
              ),
              SizedBox(height: fit(4, 6, 10, 12)),
              Text(
                'İsmet YILDIZ',
                style: TextStyle(
                  fontSize: fit(20, 24, 36, 42),
                ),
              ),
            ],
          ),
          SvgPicture.asset(
            personLogo,
            semanticsLabel: personLabel,
            width: fit(40, 50, 70, 86),
          ),
        ],
      ),
    );
  }

  Widget cardsPart(BuildContext context) {
    return Expanded(
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Flexible(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: [
                  smallCard(
                    Colors.blue[100],
                    locationLogo,
                    locationLabel,
                    [
                      Text('Bölgemdeki',
                          style: TextStyle(fontSize: fit(14, 18, 26, 30))),
                      Text('Risk ?',
                          style: TextStyle(fontSize: fit(20, 26, 33, 42))),
                    ],
                    () {},
                  ),
                  smallCard(
                    Colors.indigo[100],
                    clockLogo,
                    clockLabel,
                    [
                      Text('Aktif',
                          style: TextStyle(fontSize: fit(16, 18, 26, 28))),
                      Text('Hizmetlerim',
                          style: TextStyle(fontSize: fit(16, 18, 26, 28))),
                    ],
                    () {},
                  ),
                ],
              ),
            ),
            Flexible(
              child: largeCard(() {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ServicesPage(),
                  ),
                );
              }),
            ),
            Flexible(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: [
                  smallCard(
                    Colors.teal[100],
                    infoLogo,
                    infoLabel,
                    [
                      Text('Hakkımızda',
                          style: TextStyle(fontSize: fit(16, 20, 28, 32))),
                    ],
                    () {},
                  ),
                  smallCard(
                    Colors.yellow[100],
                    settingsLogo,
                    settingsLabel,
                    [
                      Text('Ayarlar',
                          style: TextStyle(fontSize: fit(16, 20, 28, 32))),
                    ],
                    () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget smallCard(
    Color materialColor,
    String logoPath,
    String logoLabel,
    List<Widget> textWidgets,
    Function onTap,
  ) {
    return Flexible(
      child: InkWell(
        onTap: onTap,
        child: Card(
          color: materialColor,
          elevation: 20,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(fit(10, 20, 20, 20)),
          ),
          margin: EdgeInsets.all(fit(6, 10, 14, 18)),
          child: Stack(
            children: [
              Container(
                width: fit(130, 150, 200, 250),
                height: fit(130, 150, 200, 250),
              ),
              Positioned(
                left: fit(8, 10, 15, 18),
                top: fit(12, 16, 24, 28),
                child: (textWidgets.length == 1)
                    ? textWidgets[0]
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: textWidgets,
                      ),
              ),
              Positioned(
                right: fit(-22, -30, -38, -40),
                bottom: fit(-22, -30, -38, -40),
                child: SvgPicture.asset(
                  logoPath,
                  semanticsLabel: logoLabel,
                  width: fit(85, 116, 147, 155),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget largeCard(
    Function onTap,
  ) {
    return InkWell(
      onTap: onTap,
      child: Card(
        color: Colors.blue[200],
        elevation: 20,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(fit(10, 20, 20, 20)),
        ),
        margin: EdgeInsets.all(fit(11, 10, 15, 15)),
        child: Stack(
          children: [
            Container(
              width: fit(286, 330, 430, 580),
              height: fit(150, 150, 250, 300),
            ),
            Positioned(
              left: fit(-70, -80, -90, -100),
              top: fit(-130, -150, -170, -200),
              child: SvgPicture.asset(
                circle1Logo,
                semanticsLabel: circle1Label,
                width: fit(160, 190, 230, 260),
                color: Colors.amber[100],
              ),
            ),
            Positioned(
              bottom: fit(-140, -160, -180, -210),
              left: fit(-10, -20, -30, -20),
              child: SvgPicture.asset(
                circle2Logo,
                semanticsLabel: circle2Label,
                width: fit(160, 190, 230, 250),
                color: Colors.green[100],
              ),
            ),
            Positioned(
              top: fit(-50, -50, -50, -90),
              right: fit(-50, -70, -90, -90),
              child: SvgPicture.asset(
                circle3Logo,
                semanticsLabel: circle3Label,
                width: fit(160, 200, 280, 300),
                color: Colors.green[100],
              ),
            ),
            Positioned(
              left: fit(30, 50, 40, 60),
              top: 5,
              bottom: 5,
              child: Center(
                child: Text(
                  'Hizmetlerimiz',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: fit(20, 24, 32, 40),
                  ),
                ),
              ),
            ),
            Positioned(
              right: fit(14, 10, 20, 30),
              top: fit(8, 10, 12, 2),
              bottom: 2,
              child: SvgPicture.asset(
                likeLogo,
                semanticsLabel: likeLabel,
                width: fit(60, 80, 115, 120),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget bottomButtonsPart() {
    return Padding(
      padding: EdgeInsets.only(
        top: fit(12, 20, 28, 30),
        bottom: fit(2, 4, 6, 8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: [
          IconButton(
            icon: Icon(
              Icons.history,
              size: bottomBtnIconSizeLow,
            ),
            onPressed: () {},
          ),
          Container(
            padding: EdgeInsets.all(fit(7, 8, 10, 8)),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue[900],
            ),
            child: Icon(
              Icons.home_outlined,
              size: bottomBtnIconSizeHigh,
              color: Colors.white,
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.mode_comment_outlined,
              size: bottomBtnIconSizeLow,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
