class ApiSetting{
  static const String _URL_API = 'https://wsamaa.com/wp-json/wp/v2/';
  static const String POSTS = _URL_API  + 'posts';
  static const String CATEGORY = _URL_API + 'categories';
  static String postCategory(int id){
    return _URL_API + 'posts?categories=$id';
  }

  static String postMedia(int id){
    return _URL_API + 'media/$id';
}

}