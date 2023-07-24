import 'contact.dart';

sealed class Parser {
  static List<Contact> parseContacts(Object? json) {
    List data = json as List;
    return data.map((e) => Contact.fromJson(e)).toList();
  }

  static Contact parseContact(Object? json) {
    return Contact.fromJson(json as Map<String, Object?>);
  }
}
