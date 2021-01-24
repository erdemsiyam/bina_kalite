import 'package:flutter/material.dart';
import 'package:ornek1/ui/constants/text_styles.dart';
import 'package:ornek1/utils/responsive.dart';

class UserPasswordPart extends StatefulWidget {
  final double shortestSide;
  UserPasswordPart(this.shortestSide);
  @override
  _UserPasswordPart createState() => _UserPasswordPart();
}

class _UserPasswordPart extends State<UserPasswordPart> with Responsive {
  FocusNode _fs1 = FocusNode();
  bool _isPasswordHide = true;
  final String inputHint = 'Password';
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
        vertical: fit(4, 13, 16, 20),
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
          obscureText: _isPasswordHide,
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
                Icons.vpn_key,
                size: fit(20, 24, 34, 42),
                color: (_fs1.hasFocus)
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).disabledColor,
              ),
            ),
            suffixIcon: (_isPasswordHide)
                ? Padding(
                    padding: EdgeInsets.only(right: fit(10, 20, 26, 34)),
                    child: IconButton(
                      icon: Icon(
                        Icons.visibility,
                        size: fit(20, 24, 34, 42),
                        color: (_fs1.hasFocus)
                            ? Theme.of(context).primaryColor
                            : Theme.of(context).disabledColor,
                      ),
                      onPressed: () {
                        setState(
                          () {
                            _isPasswordHide = !_isPasswordHide;
                          },
                        );
                      },
                    ),
                  )
                : Padding(
                    padding: EdgeInsets.only(right: fit(10, 20, 26, 30)),
                    child: IconButton(
                      icon: Icon(
                        Icons.visibility_off,
                        size: fit(20, 24, 34, 38),
                        color: (_fs1.hasFocus)
                            ? Theme.of(context).primaryColor
                            : Theme.of(context).disabledColor,
                      ),
                      onPressed: () {
                        setState(
                          () {
                            _isPasswordHide = !_isPasswordHide;
                          },
                        );
                      },
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
