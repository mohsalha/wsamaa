import 'package:flutter/material.dart';
import 'package:wsamaa_project/api/api_reqeusts.dart';
import 'package:wsamaa_project/size_config.dart';
import 'package:wsamaa_project/utiles/Helper.dart';
import 'package:wsamaa_project/utiles/wsamaa_essay.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List> _futurePosts;

  List _posts = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _futurePosts = ApiReqeusets().getAllPosts();

  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: SizeConfig.scaleWidth(20)),
          child: Row(
            children: [
              Image.asset(
                'images/home.png',
                height: SizeConfig.scaleHeight(25),
                width: SizeConfig.scaleWidth(25),
                fit: BoxFit.cover,
              ),
              SizedBox(
                width: SizeConfig.scaleWidth(5),
              ),
              Text(
                'اخترنا لكِ سيدتي!',
                style: TextStyle(
                  fontSize: SizeConfig.scaleTextFont(20),
                  fontFamily: 'b',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: SizeConfig.scaleHeight(15),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: SizeConfig.scaleWidth(20)),
          child: Text(
            'نتتمنى لكِ قراء ممتعة، وصحة بشرة أفضل',
            style: styleTitle(),
          ),
        ),
        SizedBox(
          height: SizeConfig.scaleHeight(15),
        ),
        Expanded(
          child: FutureBuilder<List>(
            future: _futurePosts,
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

                      return WsamaaEssay(imgId:_posts.elementAt(index)['featured_media'], title: _posts.elementAt(index)['title']['rendered']);
                    });
                  }
                }
                return SizedBox();
              }
            },
          ),
        ),
      ],
    );
  }
}

/*
ListView.builder(

                physics: BouncingScrollPhysics(),
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
                                  _posts.elementAt(index)['title']['rendered'],
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
                }),
 */

/*
FutureBuilder<List>(
                    future: _futurePosts,
                    builder: (context, snashot) {
                      if (snashot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        if (snashot.hasError) {
                          return Center(
                            child: Text(
                              'تواجه مشكلة، تأكدي من اتصالك بالإنترنت!',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'A',
                                fontSize: SizeConfig.scaleTextFont(24),
                              ),
                            ),
                          );
                        } else {
                          if(snashot.hasData){
                            _posts = snashot.data!;
                            return  Column(
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
                                          _posts.elementAt(index)['title']['rendered'],
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
                            );
                          }
                          return SizedBox();
                        }
                      }
                    },
                  ),
 */
