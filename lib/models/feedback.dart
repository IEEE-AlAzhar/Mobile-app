class Feedback {
  String fedTit;
  String fedBody;
  String fedDate;

  Feedback({this.fedTit, this.fedBody, this.fedDate});

  factory Feedback.fromJson(Map<String, dynamic> json) => Feedback(
      fedTit: json['title'], fedBody: json['body'], fedDate: json['date']);

  Map<String, dynamic> toJson() =>
      {'title': fedTit, 'body': fedBody, 'date': fedDate};
}
