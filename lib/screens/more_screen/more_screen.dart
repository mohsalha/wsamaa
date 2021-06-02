import 'package:flutter/material.dart';
import 'package:wsamaa_project/size_config.dart';
import 'package:wsamaa_project/utiles/Helper.dart';

class SittingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.scaleWidth(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'هذا القسم سيدتي هو قسمك المفضل!!',
            style: styleTitle(),
          ),
          SizedBox(
            height: SizeConfig.scaleHeight(15),
          ),
          Text(
            'اي شيء تحتاجينه يمكنك طلبه الأن',
            style: styleTitle(),
          ),
          SizedBox(
            height: SizeConfig.scaleHeight(50),
          ),
          defaultButton(title: 'اطلبي مقالتك',context: context,route: '/request_essay'),
          SizedBox(
            height: SizeConfig.scaleHeight(20),
          ),
          defaultButton(title: 'اكتبي مقالة خاصة بكِ',context: context,route: '/add_essay'),
        ],
      ),
    );
  }
}
