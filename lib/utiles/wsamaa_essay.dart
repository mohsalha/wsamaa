import 'package:flutter/material.dart';
import 'package:wsamaa_project/api/api_reqeusts.dart';
import 'package:wsamaa_project/screens/essay_screen.dart';
import 'package:wsamaa_project/size_config.dart';
import 'package:wsamaa_project/utiles/Helper.dart';

class WsamaaEssay extends StatefulWidget {
  final String title;
  final int imgId;
  final String content;

  WsamaaEssay(
      {required this.imgId, required this.title, required this.content});

  @override
  _WsamaaEssayState createState() => _WsamaaEssayState();
}

class _WsamaaEssayState extends State<WsamaaEssay> {
  late Future<Map<String, dynamic>> _futureMedia;
  Map<String, dynamic> _media = {};

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _futureMedia = ApiReqeusets().getPostsMedia(widget.imgId);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
        bottom: SizeConfig.scaleHeight(15),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.only(bottom: SizeConfig.scaleHeight(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              height: SizeConfig.scaleHeight(174),
              child: FutureBuilder<Map<String, dynamic>>(
                future: _futureMedia,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return waitingWidgit();
                  } else {
                    if (snapshot.hasError) {
                      return errorWidget();
                    } else {
                      if (snapshot.hasData) {
                        _media = snapshot.data!;
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EssayScreen(
                                        content: widget.content,
                                        img: _media['guid']['rendered'],
                                        title: widget.title)));
                          },
                          child: Image.network(
                            _media['guid']['rendered'],
                          ),
                        );
                      }
                    }
                    return SizedBox();
                  }
                },
              ),
            ),
            SizedBox(
              height: SizeConfig.scaleHeight(5),
            ),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: SizeConfig.scaleWidth(20)),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      widget.title,
                      style: TextStyle(
                        fontSize: SizeConfig.scaleTextFont(18),
                        fontFamily: 'A',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
