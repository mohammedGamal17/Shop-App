import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

final textColor = HexColor('FFFFFF');
final iconColor = HexColor('FFFFFF');
final buttonColor = HexColor('0096C7');

final lightBackground = HexColor('0077B6');
final appBarLightColor = HexColor('0077B6');
final bottomNavigationBarLightColor = HexColor('ADE8F4');

final darkBackground = HexColor('343a40');

final hh= BoxDecoration(
  gradient: LinearGradient(
      begin: AlignmentDirectional.topStart,
      end: AlignmentDirectional.bottomEnd,
    colors: [
        HexColor('03045E'),
        HexColor('0096C7'),
    ]
  )
);