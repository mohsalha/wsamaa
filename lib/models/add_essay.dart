class AddEssay{
  String? id;
  String? name;
  String? email;
  String? title;
  String? details;

  AddEssay({ this.id,this.name,required this.email,required this.title,required this.details});
  AddEssay.fromMap(Map< String, dynamic> map){
    this.id = map['id'];
    this.name = map['name'];
    this.email = map['email'];
    this.title = map['title'];
    this.details = map['details'];
  }
  Map<String,dynamic> toMap(){
    Map<String, dynamic> map = Map<String, dynamic>();
    // map['id'] = this.id;    */ work el firebase */

    map['name'] = this.name;
    map['email'] = this.email;
    map['title'] = this.title;
    map['details'] = this.details;

    return map;
  }
}