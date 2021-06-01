import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
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
      fontSize: SizeConfig.scaleTextFont(20),
      color: Colors.black,
      fontWeight: FontWeight.bold,
    );

Style styleHtml() => Style(
  fontSize: FontSize(SizeConfig.scaleTextFont(16),
  ),
  fontFamily: 'A',
  lineHeight: LineHeight(SizeConfig.scaleHeight(1.5)),
  color: Colors.black
);



