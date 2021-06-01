import 'package:flutter/material.dart';
import 'package:wsamaa_project/size_config.dart';

Widget errorWidget() => Center(
  child: Text(
    'تواجهين مشكلة، تأكدي من اتصالك بالإنترنت!',
    style: TextStyle(
      fontWeight: FontWeight.bold,
      fontFamily: 'A',
      fontSize: SizeConfig.scaleTextFont(24),
      color: Colors.black,
    ),
  ),
);

Widget waitingWidgit() => Center(
  child: CircularProgressIndicator(),
);

TextStyle styleTitle() => TextStyle(
    fontFamily: 'A',
    fontSize: SizeConfig.scaleTextFont(16),
    color: Colors.black);