import 'dart:developer';

class ContactModals {
  int? id;
  String? name;
  String? number;

  ContactModals(this.id, this.name, this.number);

  // ContactModals.init(
  //     log("Modal initialised");
  //     );
  factory ContactModals.fromMap({required Map data}) {
    return ContactModals(data['id'], data['name'], data['number']);
  }
}
