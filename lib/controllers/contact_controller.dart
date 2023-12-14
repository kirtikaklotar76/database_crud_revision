import 'dart:developer';

import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../helper/contact_helper.dart';
import '../modals/Contact_Modal.dart';

class ContactsController extends GetxController {
  RxList<ContactModals> allContacts = <ContactModals>[].obs;

  init() async {
    allContacts(
        (await DBHelper.dbHelper.displayContacts()).cast<ContactModals>());
    allContacts.value.forEach((element) {
      log("Data: ${element.id} => ${element.name}");
    });
  }

  Future<int> insert_contact(
      {required String name, required String number}) async {
    log("${name} or ${number}");
    return await DBHelper.dbHelper.insertContacts(name: name, number: number);
  }

  Future<List<ContactModals>> display_Contacts() async {
    allContacts(
        (await DBHelper.dbHelper.displayContacts()).cast<ContactModals>());
    log("getAllContacts - ${allContacts.toString()}");
    return allContacts;
  }
}
