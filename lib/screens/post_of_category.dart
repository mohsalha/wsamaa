import 'package:flutter/material.dart';
import 'package:wsamaa_project/api/api_reqeusts.dart';
import 'package:wsamaa_project/size_config.dart';
import 'package:wsamaa_project/utiles/Helper.dart';
import 'package:wsamaa_project/utiles/wsamaa_essay.dart';

class PostOfCategory extends StatefulWidget {
  final String name;
  final int id;

  PostOfCategory({required this.name, required this.id});

  @override
  _PostOfCategoryState createState() => _PostOfCategoryState();
}

class _PostOfCategoryState extends State<PostOfCategory> {
  late Future<List> _futurePost;
  List _posts = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _futurePost = ApiReqeusets().getPostsCategory(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.name),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'مرحباً في قسم ${widget.name}',
                style: styleTitle(),
              ),
              SizedBox(height: SizeConfig.scaleHeight(20),),
              Expanded(
                child: FutureBuilder<List>(
                    future: _futurePost,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return waitingWidgit();
                      } else {
                        if (snapshot.hasError) {
                          return errorWidget();
                        } else {
                          if (snapshot.hasData) {
                            _posts = snapshot.data!;
                            return ListView.builder(
                              physics: BouncingScrollPhysics(),
                              itemCount: _posts.length,
                              itemBuilder: (context, index) {
                                print(
                                    '${_posts.elementAt(index)['featured_media']}');
                                return WsamaaEssay(
                                  imgId:
                                      _posts.elementAt(index)['featured_media'],
                                  title: _posts.elementAt(index)['title']
                                      ['rendered'],
                                );
                              },
                            );
                          }
                          return SizedBox();
                        }
                      }
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/*
ListView.builder(
                                  physics: BouncingScrollPhysics(),
                                  itemCount: _posts.length,
                                  itemBuilder: (context, index) {
_
                                    return Padding(
                                      padding: EdgeInsetsDirectional.only(
                                        bottom: SizeConfig.scaleHeight(15),
                                      ),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Image.network(
                                            _posts.elementAt(index)['wp:featuredmedia']['href']['guid']['rendered']??'',
                                            fit: BoxFit.cover,
                                          ),
                                          SizedBox(
                                            height: SizeConfig.scaleHeight(5),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: SizeConfig.scaleWidth(20)),
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    _posts.elementAt(index)['title']
                                                    ['rendered'],
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
                                    );
                                  })
 */

/*
ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: _posts.length,
                        itemBuilder: (context, index) {

                          return Padding(
                            padding: EdgeInsetsDirectional.only(
                              bottom: SizeConfig.scaleHeight(15),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.network(
                                  _posts.elementAt(index)['guid']['rendered'],
                                  fit: BoxFit.cover,
                                ),
                                SizedBox(
                                  height: SizeConfig.scaleHeight(5),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: SizeConfig.scaleWidth(20)),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          _posts.elementAt(index)['title']
                                          ['rendered'],
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
                          );
                        });
 */
