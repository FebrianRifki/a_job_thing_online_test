import 'package:flutter/material.dart';
import 'package:online_test/data/models/blog.dart';
import 'package:online_test/data/models/candidates.dart';
import 'package:get/get.dart';
import 'package:online_test/data/modules/homescreen/controller.dart';

class DataListWidget extends StatelessWidget {
  final homeScreenController = Get.find<HomeScreenController>();
  final dynamic datas;
  DataListWidget({required this.datas, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Container(
        child: datas is Candidate
            ? Container(
                decoration: BoxDecoration(
                    color: Colors.blue.shade200,
                    borderRadius: BorderRadius.circular(5)),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage(datas.photo)),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Candidate',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Name: ${datas.name} ',
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Expired: ${datas.expired} ',
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            : Container(
                decoration: BoxDecoration(
                    color: Colors.green.shade200,
                    borderRadius: BorderRadius.circular(5)),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      datas.photo != null
                          ? CircleAvatar(
                              radius: 30,
                              backgroundImage: NetworkImage(datas.photo))
                          : CircleAvatar(
                              child: Container(color: Colors.grey),
                            ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Blog',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Title: ${datas.title} ',
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Author: ${datas.author} ',
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
