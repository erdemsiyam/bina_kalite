import 'package:flutter/material.dart';
import 'package:ornek1/provider/auth_provider.dart';
import 'package:ornek1/ui/constants/text_styles.dart';
import 'package:ornek1/ui/utils/Responsive.dart';
import 'package:provider/provider.dart';

class WrongPasswordPart extends StatelessWidget with Responsive {
  AuthProvider _authProvider;
  double shortestSide;
  WrongPasswordPart(this.shortestSide);
  @override
  Widget build(BuildContext context) {
    deviceType = shortestSide;
    _authProvider = context.watch<AuthProvider>();
    return Column(
      children: [
        Text(
          'Şifre Hatalı',
          style: fit(
            tsLabel4_350,
            tsLabel4_450,
            tsLabel4_550,
            tsLabel4_bigest,
          ),
        ),
        SizedBox(
          height: fit(10, 16, 20, 36),
        ),
        IconButton(
          icon: Icon(
            Icons.refresh,
            color: Colors.grey[400],
            size: fit(34, 40, 46, 66),
          ),
          onPressed: () {
            _authProvider.again();
          },
        ),
      ],
    );
  }
}
