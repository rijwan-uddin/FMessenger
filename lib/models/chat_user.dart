class ChatUser{
  final String uid;
  final String name;
  final String email;
  final String imageUrl;
  final DateTime lastActive;

  ChatUser({
    required this.name,
    required this.uid,
    required this.imageUrl,
    required this.email,
    required this.lastActive,
});
  factory ChatUser.fromJson(Map<String, dynamic> _json) {
    return ChatUser(name:_json["name"],
        uid: _json["uid"],
        imageUrl: _json["image"],
        email: _json["email"],
        lastActive: _json["last_active"].toDate());
  }

  Map<String , dynamic> toMap(){
    return{
      "email": email,
      "name": name,
      "last_active":lastActive,
      "image": imageUrl,
    };
  }
  String lastDayActive(){
    return "${lastActive.month}/${lastActive.day}/${lastActive.year}";
  }
bool wasRecentlyActive(){
    return DateTime.now().difference(lastActive).inHours <2;
}
}