import 'package:flutter/material.dart';
import 'package:wsamaa_project/controller/firestore_controller.dart';
import 'package:wsamaa_project/models/add_essay.dart';
import 'package:wsamaa_project/size_config.dart';
import 'package:wsamaa_project/utiles/Helper.dart';

class AddEsaayScreen extends StatefulWidget {
  @override
  _AddEsaayScreenState createState() => _AddEsaayScreenState();
}

class _AddEsaayScreenState extends State<AddEsaayScreen> {
  late TextEditingController _titleController;
  late TextEditingController _detailsController;
  late TextEditingController _nameController;
  late TextEditingController _emailController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _titleController = TextEditingController();
    _detailsController = TextEditingController();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _titleController.dispose();
    _detailsController.dispose();
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
                  '1- يجب ان تكون المقالة من تعبيرك الخاص، وغير منسوخة من اي موقع اخر.',
                  style: addEssayDetailsStyle(),
                ),
                Text(
                  '2- سوف يتم اضافة المقالة بعد التدقيق عليها من قبل الفريق الخاص بنا.',
                  style: addEssayDetailsStyle(),
                ),
                Text(
                  '3- سوف يتم وضع الاسم الخاص بك في نهاية المقالة التي تكتبيها، لذا احرصي ان يكون الاسم صحيح.',
                  style: addEssayDetailsStyle(),
                ),
                Text(
                  '4- في حال كانت مقالاتك جميلة وذات سرد نصي رائع سوف يتم التواصل معكم عبر الايميل للعمل رسمياً في موقع وسامة.',
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
                  keyboard: TextInputType.text,
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
                defaultTextField(
                    lable: 'تفاصيل المقالة',
                    controller: _detailsController,
                    keyboard: TextInputType.text,
                    maxLines: 10),
                SizedBox(
                  height: SizeConfig.scaleHeight(20),
                ),
                SizedBox(
                  width: double.infinity,
                  height: SizeConfig.scaleHeight(50),
                  child: ElevatedButton(
                    onPressed: () {
                      preformAddEssay();
                    },
                    child: Text(
                      'أضف المقالة الأن',
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
  Future preformAddEssay() async {
    if (checkData()) {

      addEssay();
      Navigator.pop(context);
    }
  }

  bool checkData(){
    if(_detailsController.text.isNotEmpty&&_titleController.text.isNotEmpty&&_emailController.text.isNotEmpty&&_nameController.text.isNotEmpty){
      return true;
    }
    return false;
  }

  Future addEssay() async {
    await FirestoreController.instance.creat(getEssay());
  }

  AddEssay getEssay() {
    AddEssay essay = AddEssay(
      name: _nameController.text,
      email: _emailController.text,
title: _titleController.text,
      details: _detailsController.text,
    );
    return essay;
  }
}
