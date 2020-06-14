class Announcement {
  String title;
  String body;
  String date;
  String cover;
  String type;

  Announcement({this.title, this.body, this.date, this.cover, this.type});
  factory Announcement.fromJson(Map<String, dynamic> json) {
    return Announcement(
        title: json["title"],
        body: json["body"],
        date: json["date"],
        cover: json["cover"],
        type: json["type"]);
  }
}
