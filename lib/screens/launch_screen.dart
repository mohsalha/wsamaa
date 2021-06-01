import 'package:flutter/material.dart';
import 'package:wsamaa_project/size_config.dart';

class LaunchScreen extends StatefulWidget {
  @override
  _LaunchScreenState createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 3),(){
      Navigator.pushReplacementNamed(context, '/main_screen');
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(

      body: Column(

        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          Center(
            child: Text(
              'موقع وسامة',
              style: TextStyle(
                fontSize: SizeConfig.scaleTextFont(24),
                fontWeight: FontWeight.bold,
                fontFamily: 'A',
                color: Colors.black,
              ),
            ),
          ),
          Text(
            'لوجهٌ أجمل وخالي من المشاكل',
            style: TextStyle(
                fontFamily: 'B',
                fontSize: SizeConfig.scaleTextFont(14),
                color: Colors.black54),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: SizeConfig.scaleHeight(20),
            ),
            child: RichText(
              text: TextSpan(
                  text: 'جميع الحقوق محفوظة  ',
                  style: TextStyle(
                    fontFamily: 'B',
                    fontWeight: FontWeight.bold,
                    fontSize: SizeConfig.scaleTextFont(13),
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: 'موقع وسامة',style: TextStyle(
                      fontFamily: 'B',
                      fontWeight: FontWeight.bold,
                      fontSize: SizeConfig.scaleTextFont(13),
                      color: Colors.redAccent.shade400,
                    ),
                    ),
                  ]
              ),

            ),
          ),
        ],
      ),
    );
  }
}
