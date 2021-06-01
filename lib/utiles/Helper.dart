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
    fontSize: FontSize(
      SizeConfig.scaleTextFont(16),
    ),
    fontFamily: 'A',
    lineHeight: LineHeight(SizeConfig.scaleHeight(1.5)),
    color: Colors.black);

Widget defaultButton({
  required String title,
  required String route,
  required BuildContext context,
}) =>
    SizedBox(
      width: double.infinity,
      height: SizeConfig.scaleHeight(50),
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, route);
        },
        child: Text(
          '$title',
          style: TextStyle(
            fontSize: SizeConfig.scaleTextFont(25),
            fontFamily: 'b',
            fontWeight: FontWeight.bold,
          ),
        ),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );

TextStyle addEssayHeadStyle() => TextStyle(
      fontFamily: 'A',
      fontWeight: FontWeight.bold,
      fontSize: SizeConfig.scaleTextFont(24),
      color: Colors.redAccent,
    );

TextStyle addEssayDetailsStyle() => TextStyle(
      fontFamily: 'b',
      fontWeight: FontWeight.bold,
      fontSize: SizeConfig.scaleTextFont(20),
      color: Colors.black,
    );

Widget defaultTextField({
  required String lable,
  required TextEditingController controller,
  required TextInputType keyboard,
  required int maxLines,
}) =>
    TextField(
      keyboardType: keyboard,
      controller: controller,
      style: TextStyle(
        fontSize: SizeConfig.scaleTextFont(16),
        fontWeight: FontWeight.bold,
        fontFamily: 'A',
      ),
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: lable,
        border: OutlineInputBorder(),
        filled: true,
        fillColor: Color.fromRGBO(247, 247, 247, 1),
      ),
    );
