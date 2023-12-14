import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../modals/contact_modal.dart';

class DBHelper {
  DBHelper._();

  static final DBHelper dbHelper = DBHelper._();
  late Database database;

  String contactsTable = "contacts3";
  String c_id = "id";
  String c_name = "name";
  String c_number = "number";

  init_DB() async {
    String dbPath = await getDatabasesPath();
    String dbname = "contacts3.db";

    String finalPath = join(dbPath, dbname);

    database = await openDatabase(
      finalPath,
      version: 1,
      onCreate: (db, version) {
        String query =
            "CREATE TABLE $contactsTable($c_id INTEGER PRIMARY KEY AUTOINCREMENT, $c_name TEXT,$c_number TEXT)";
        db.execute(query).then(
              (value) => log("contact table created succefully"),
            );
      },
    );
  }

  Future<List<ContactModals>> displayContacts() async {
    String query = "SELECT * FROM $contactsTable";

    List contacts = await database.rawQuery(query);
    log(contacts.toString());

    List<ContactModals> allcontacts =
        contacts.map((e) => ContactModals.fromMap(data: e)).toList();

    return allcontacts;
  }

  insertContacts({required String name, required String number}) async {
    String query = "INSERT INTO $contactsTable(name,number) VALUES(?,?)";

    List args = [name, number];

    int contact = await database.rawInsert(query, args);

    return contact;
  }

  Future<int> removeContact({required int c_id}) async {
    String sql = "DELETE FROM $contactsTable WHERE id = $c_id";
    return database.rawDelete(sql);
  }
}
