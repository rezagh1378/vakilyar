class Note {
  String? dateAlert;
  String? title;
  String? userNote;

  Note({this.dateAlert, this.title, this.userNote});

  Note.fromJson(Map<String, dynamic> json) {
    dateAlert = json['date_alert'];
    title = json['title'];
    userNote = json['user_note'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date_alert'] = this.dateAlert;
    data['title'] = this.title;
    data['user_note'] = this.userNote;
    return data;
  }
}
