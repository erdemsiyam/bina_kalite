import 'package:flutter/material.dart';

class UserModel {
  String refresh;
  String access;
  String username;
  String password;
  UserModel({
    @required this.refresh,
    @required this.access,
    @required this.username,
    @required this.password,
  });
}
