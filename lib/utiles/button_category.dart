import 'package:flutter/material.dart';
import 'package:wsamaa_project/screens/post_of_category.dart';
import 'package:wsamaa_project/size_config.dart';


class ButtonCategory extends StatelessWidget {
  final int count;
  final String title;
  final int id;

  ButtonCategory({required this.count, required this.title, required this.id});

  @override
  Widget build(BuildContext context) {

    return Row(
      children: [
        Expanded(
          flex: 3,
          child: SizedBox(
            height: SizeConfig.scaleHeight(45),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PostOfCategory(  name: title,id: id,),
                  ),
                );
              },
              child: Text(
                '$title',
                style: TextStyle(
                  fontFamily: 'A',
                  fontSize: SizeConfig.scaleTextFont(20),
                ),
              ),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
              ),
            ),
          ),
        ),
        SizedBox(
          width: SizeConfig.scaleWidth(7),
        ),
        Expanded(
          flex: 2,
          child: Text(
            'في هذا القسم $count مقالة',
            style: TextStyle(
              fontFamily: 'A',
              fontSize: SizeConfig.scaleTextFont(14),
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
