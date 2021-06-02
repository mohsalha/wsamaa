class RequestEssay{
  String? id;
  String? name;
  String? email;
  String? title;


  RequestEssay({ this.id,this.name,required this.email,required this.title,});
  RequestEssay.fromMap(Map< String, dynamic> map){
    this.id = map['id'];
    this.name = map['name'];
    this.email = map['email'];
    this.title = map['title'];
  }
  Map<String,dynamic> toMap(){
    Map<String, dynamic> map = Map<String, dynamic>();
    // map['id'] = this.id;    */ work el firebase */

    map['name'] = this.name;
    map['email'] = this.email;
    map['title'] = this.title;

    return map;
  }
}