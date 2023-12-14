import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controllers/contact_controller.dart';

class AddToContact extends StatelessWidget {
  AddToContact({super.key});

  TextEditingController name = TextEditingController();
  TextEditingController number = TextEditingController();
  ContactsController contact_controller = Get.put(
    ContactsController(),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Contact"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextFormField(
              controller: name,
              decoration: InputDecoration(
                hintText: "Enter the Name",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: number,
              maxLength: 10,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: InputDecoration(
                hintText: "Enter Mobile Number",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            GestureDetector(
              onTap: () {
                contact_controller.insert_contact(
                    name: name.text, number: number.text);
                log("*added contact successfully!!");
                Navigator.of(context).pop();
              },
              child: Container(
                height: 50,
                width: 100,
                alignment: Alignment.center,
                child: Text("Add"),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
