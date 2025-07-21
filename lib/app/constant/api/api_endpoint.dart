class ApiEndpoints {
  ApiEndpoints._();
 
  static const connectionTimeout = Duration(seconds: 1000);
 
  static const receiveTimeout = Duration(seconds: 1000);
 
  static const String serverAddress = "http://localhost:3001";
 
  static const String baseUrl = "$serverAddress/api";
 
  static const String imageUrl = "$serverAddress/uploads";
 
  //Auth
 
  static const String register = "/auth/register";
 
  static const String login = "/auth/login";
  static const String courses="/admin/courses";
}