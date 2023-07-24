class Contact {
  String? createdAt;
  String? name;
  String? avatar;
  String? number;
  String? id;

  Contact({
    this.createdAt,
    this.name,
    this.avatar,
    this.number,
    this.id,
  });

  factory Contact.fromJson(Map<String, Object?> json) => Contact(
        createdAt: json["createdAt"] as String?,
        name: json["name"] as String?,
        avatar: json["avatar"] as String?,
        number: json["number"] as String?,
        id: json["id"] as String?,
      );

  Map<String, Object?> toJson() => {
    "createdAt" : createdAt,
    "name" : name,
    "avatar" : avatar,
    "number" : number,
    "id" : id,
  };

  @override
  String toString() {
    return 'Contact{createdAt: $createdAt, name: $name, avatar: $avatar, number: $number, id: $id}';
  }
}
