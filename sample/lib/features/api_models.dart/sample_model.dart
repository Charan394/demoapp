class SampleResponse {
  final int userId;
  final int id;
  final String title;
  final String body;


  SampleResponse({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });
  factory SampleResponse.fromJson(Map<String, dynamic> json) {
    return SampleResponse(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }

  
  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'id': id,
      'title': title,
      'body': body,
    };
  }

  static listFromJson(List<dynamic> data  ){
    final list=(data ).map((e)=>SampleResponse.fromJson(e));
    return list;
  }
}