import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:wsamaa_project/size_config.dart';
import 'package:wsamaa_project/utiles/Helper.dart';

class EssayScreen extends StatefulWidget {
  final String content;
  final String img;
  final String title;

  EssayScreen({required this.content, required this.img, required this.title});

  @override
  _EssayScreenState createState() => _EssayScreenState();
}

class _EssayScreenState extends State<EssayScreen> {
  @override
  Widget build(BuildContext context) {
    String hasData = widget.content;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                widget.img,
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: SizeConfig.scaleHeight(25),
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(
                    start: SizeConfig.scaleWidth(20),
                    end: SizeConfig.scaleWidth(20),
                    bottom: SizeConfig.scaleHeight(20)),
                child: Column(
                  children: [
                    Text(
                      widget.title,
                      style: styleTitle(),
                    ),
                    Html(
                      data: hasData,
                      shrinkWrap: true,
                      style: {
                        'html':styleHtml(),
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
