import '../imports.dart';

class Api {
  int postId;
  int id;
  String name;
  String email;
  String body;

  Api({
    this.postId = 0,
    this.id = 0,
    this.name = '',
    this.email = '',
    this.body = '',
  });

  Api.fromJson(Map<String, dynamic>? json)
    : postId = json?['postId'] ?? 0,
      id = json?['id'] ?? 0, 
      name = json?['name'] ?? '',
      email = json?['email'] ?? '',
      body = json?['body'] ?? '';

  Map<String, dynamic> toJson() => {
    'postId': postId,
    'id': id,
    'name': name,
    'email': email,
    'body': body
  };

   @override
  String toString() {
    return 'Api(id: $id, name: $name, email: $email)';
  }
}
