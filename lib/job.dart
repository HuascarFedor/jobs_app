class Job {
  final int? id;
  final String title;
  final String description;

  Job({this.id, required this.title, required this.description});

  factory Job.fromJson(Map<String, dynamic> json) {
    return Job(
        id: json['id'],
        title: json['title'],
        description: json['description']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description
    };
  }
}
