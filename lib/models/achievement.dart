class Achievements {
  final String achTit;
  final String achDesc;
  final String achDate;
  final String achCover;

  Achievements({this.achTit, this.achDesc, this.achDate, this.achCover});

  factory Achievements.fromJson(Map<String, dynamic> json) => Achievements(
      achTit: json['title'],
      achDesc: json['desc'],
      achDate: json['date'],
      achCover: json['cov']);

  Map<String, dynamic> toJson() =>
      {'title': achTit, 'desc': achDesc, 'date': achDate, 'cov': achCover};
}
