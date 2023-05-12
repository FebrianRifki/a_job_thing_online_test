class Blog {
  final int id;
  final String title;
  final String subTitle;
  final String photo;
  final String content;
  final String author;
  final int createAt;
  final String tag;

  Blog(
      {required this.id,
      required this.title,
      required this.subTitle,
      required this.photo,
      required this.content,
      required this.author,
      required this.createAt,
      required this.tag});

  factory Blog.fromJson(Map<String, dynamic> json) {
    return Blog(
        id: json['id'],
        title: json['title'],
        subTitle: json['subTitle'],
        photo: json['photo'],
        content: json['content'],
        author: json['author'],
        createAt: json['create_at'],
        tag: json['tag']);
  }
}
