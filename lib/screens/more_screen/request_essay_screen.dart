import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:wsamaa_project/controller/firestore_controller.dart';
import 'package:wsamaa_project/models/add_essay.dart';
import 'package:wsamaa_project/models/request_essay.dart';
import 'package:wsamaa_project/size_config.dart';
import 'package:wsamaa_project/utiles/Helper.dart';

class RequestEssayScreen extends StatefulWidget {
  @override
  _RequestEssayScreenState createState() => _RequestEssayScreenState();
}

class _RequestEssayScreenState extends State<RequestEssayScreen> {
  late TextEditingController _titleController;
  late TextEditingController _nameController;
  late TextEditingController _emailController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _titleController = TextEditingController();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _titleController.dispose();
    _nameController.dispose();
    _emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text('قومي بإضافة مقالتك'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.scaleWidth(20),
              vertical: SizeConfig.scaleHeight(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'هناك عدة ملاحظات:',
                  style: addEssayHeadStyle(),
                ),
                Text(
                  '1- سوف يتم الاجابة على طلبكم في أسرع وقت ممكن وتوفير المقالة.',
                  style: addEssayDetailsStyle(),
                ),
                Text(
                  '2- اذا تأخرنا في نشر المقالة فأعلم اننا نراجع المصادر بشكل جيد لاعطائكم مقالة تفي بحقكم.',
                  style: addEssayDetailsStyle(),
                ),
                Text(
                  '3- لا تخجل في طرح مشكلتك لنقوم بحلها.',
                  style: addEssayDetailsStyle(),
                ),

                SizedBox(
                  height: SizeConfig.scaleHeight(30),
                ),
                defaultTextField(
                  lable: 'الإسم',
                  controller: _nameController,
                  keyboard: TextInputType.text,
                  maxLines: 1,
                ),
                SizedBox(
                  height: SizeConfig.scaleHeight(20),
                ),
                defaultTextField(
                  lable: 'الإيميل',
                  controller: _emailController,
                  keyboard: TextInputType.emailAddress,
                  maxLines: 1,
                ),
                SizedBox(
                  height: SizeConfig.scaleHeight(20),
                ),
                defaultTextField(
                  lable: 'عنوان المقالة',
                  controller: _titleController,
                  keyboard: TextInputType.text,
                  maxLines: 1,
                ),
                SizedBox(
                  height: SizeConfig.scaleHeight(20),
                ),

                SizedBox(
                  height: SizeConfig.scaleHeight(20),
                ),
                SizedBox(
                  width: double.infinity,
                  height: SizeConfig.scaleHeight(50),
                  child: ElevatedButton(
                    onPressed: () {
                      preformRequestEssay();
                    },
                    child: Text(
                      'اطلب الان!',
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future preformRequestEssay() async {
    if (checkData()) {
      requestEssay();
      Navigator.pop(context);
      Fluttertoast.showToast(
        msg: "تم إرسال الطلب الى المشرفين",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.greenAccent,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }

  bool checkData() {
    if (
        _titleController.text.isNotEmpty &&
        _emailController.text.isNotEmpty &&
        _nameController.text.isNotEmpty) {
      return true;
    }
    Fluttertoast.showToast(
      msg: "الرجاء اكمال الحقول الفارغة",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );
    return false;
  }

  Future requestEssay() async {
    await FirestoreController.instance.requestEssay(getRequest());
  }

  RequestEssay getRequest() {
    RequestEssay request = RequestEssay(
      name: _nameController.text,
      email: _emailController.text,
      title: _titleController.text,

    );
    return request;
  }
}
