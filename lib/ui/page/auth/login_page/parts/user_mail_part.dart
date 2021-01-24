import 'package:flutter/material.dart';
import 'package:ornek1/ui/constants/text_styles.dart';
import 'package:ornek1/utils/responsive.dart';

class UserMailPart extends StatefulWidget {
  final double shortestSide;
  UserMailPart(this.shortestSide);
  @override
  _UserMailPartState createState() => _UserMailPartState();
}

class _UserMailPartState extends State<UserMailPart> with Responsive {
  FocusNode _fs1 = FocusNode();
  final String inputHint = 'E-Mail';
  @override
  void initState() {
    super.initState();
    _fs1.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    deviceType = widget.shortestSide;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: fit(30, 40, 60, 80),
        vertical: fit(2, 13, 16, 20),
      ),
      child: SizedBox(
        child: TextFormField(
          cursorHeight: fit(15, 20, 25, 25),
          focusNode: _fs1,
          style: (_fs1.hasFocus)
              ? fit(
                  tsInputAktif_350,
                  tsInputAktif_450,
                  tsInputAktif_550,
                  tsInputAktif_bigest,
                )
              : fit(
                  tsInputDeaktif_350,
                  tsInputDeaktif_450,
                  tsInputDeaktif_550,
                  tsInputDeaktif_bigest,
                ),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              vertical: fit(0, 20, 30, 40),
            ),
            hintText: inputHint,
            filled: true,
            fillColor: Colors.white,
            isDense: false,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(50.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).primaryColor,
              ),
              borderRadius: BorderRadius.circular(50.0),
            ),
            prefixIcon: Padding(
              padding: EdgeInsets.only(
                left: fit(20, 26, 34, 42),
                right: fit(10, 16, 20, 24),
              ),
              child: Icon(
                Icons.person,
                size: fit(20, 24, 34, 42),
                color: (_fs1.hasFocus)
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).disabledColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
