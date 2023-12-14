import 'dart:developer';

import 'package:database_crud_revision/views/utils/route_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../controllers/contact_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  ContactsController contact_controller = Get.put(
    ContactsController(),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Obx(
          () {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: contact_controller.allContacts.value.length,
                    itemBuilder: (context, index) {
                      log("----------------");
                      log("${contact_controller.allContacts.value[index].name}");
                      return Card(
                        child: ListTile(
                          onTap: () {
                            // Navigator.of(context).pushNamed(
                            //   MyRoutes.DetailPage,
                            //   arguments: index,
                            // );
                          },
                          title: Text(
                            contact_controller.allContacts.value[index].name
                                .toString(),
                          ),
                          subtitle: Text(
                            contact_controller.allContacts.value[index].number
                                .toString(),
                          ),
                          leading: CircleAvatar(
                            radius: 22,
                            backgroundColor:
                                Colors.primaries[index % 18].shade200,
                            child: Text(
                              "${contact_controller.allContacts[index].name?.substring(0, 1).toUpperCase()}",
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w400),
                            ),
                          ),
                          trailing: FloatingActionButton.small(
                            shape: CircleBorder(),
                            onPressed: () {
                              // FlutterPhoneDirectCaller.callNumber(
                              //     "${contact_controller.allContacts[index].number}");
                            },
                            child: Icon(
                              Icons.call,
                              color: Colors.white,
                            ),
                            backgroundColor: Colors.green,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(MyRoutes.addToContact);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
