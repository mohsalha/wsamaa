import 'package:flutter/material.dart';
import 'package:wsamaa_project/api/api_reqeusts.dart';
import 'package:wsamaa_project/size_config.dart';
import 'package:wsamaa_project/utiles/Helper.dart';
import 'package:wsamaa_project/utiles/button_category.dart';


class CategoriesScreen extends StatefulWidget {
  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  late Future<List> _futureCategory;
  List _category = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _futureCategory = ApiReqeusets().getCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.scaleWidth(20)),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'اخترنا لكِ أفضل التصنيفات التي تحافظ على بشرتك بشكل أفضل',
                  style: TextStyle(
                    fontSize: SizeConfig.scaleTextFont(20),
                    fontFamily: 'b',
                    fontWeight: FontWeight.bold,
                    color: Colors.redAccent,
                  ),
                ),
              ),
              SizedBox(
                width: SizeConfig.scaleWidth(5),
              ),
              Image.asset(
                'images/cat.png',
                fit: BoxFit.cover,
                height: SizeConfig.scaleHeight(40),
                width: SizeConfig.scaleWidth(40),
              ),
            ],
          ),
          SizedBox(
            height: SizeConfig.scaleHeight(25),
          ),
          Expanded(
            child: FutureBuilder<List>(
              future: _futureCategory,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return waitingWidgit();
                } else {
                  if (snapshot.hasError) {
                    return errorWidget();
                  } else {
                    if (snapshot.hasData) {
                      _category = snapshot.data!;
                      return ListView.builder(
                        itemCount: _category.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsetsDirectional.only(
                                bottom: SizeConfig.scaleHeight(15)),
                            child: ButtonCategory(
                              count: _category.elementAt(index)['count'],
                              title: _category.elementAt(index)['name'],
                              id: _category.elementAt(index)['id'],
                            ),
                          );
                        },
                      );
                    }
                    return SizedBox();
                  }
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
