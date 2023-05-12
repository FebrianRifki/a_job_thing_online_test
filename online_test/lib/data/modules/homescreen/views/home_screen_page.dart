import 'package:flutter/material.dart';
import 'package:online_test/data/models/blog.dart';
import 'package:online_test/data/models/candidates.dart';
import 'package:online_test/data/modules/homescreen/controller/controller.dart';
import 'package:online_test/data/modules/widget/common_list_view.dart';
import 'package:online_test/data/modules/widget/data_list_widget.dart';
import 'package:online_test/util/debouncer.dart';
import 'package:get/get.dart';

class HomeScreenPage extends GetView<HomeScreenController> {
  const HomeScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController _searchController = TextEditingController();
    final Debouncer debouncer = Debouncer(milliseconds: 500);

    return CommonListView(children: [
      Padding(
        padding: const EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                  hintText: 'Search data',
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black))),
              onChanged: (value) {
                debouncer.run(() {
                  controller.searchData(value);
                });

                if (value.isEmpty) {
                  controller.shuffleList.value = [];
                  controller.getAllData();
                }
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Obx(
              () {
                if (controller.isErrorRequest.value == true) {
                  return AlertDialog(
                    title: const Text('Request Error'),
                    content:
                        const Text('Something went wrong when requesting data'),
                    actions: [
                      Center(
                        child: TextButton(
                          onPressed: () {
                            controller.getAllData();
                          },
                          child: const Text('Retry'),
                        ),
                      ),
                    ],
                  );
                } else {
                  if (controller.isLoadingShuffelData.value == true) {
                    return const SizedBox(
                      height: 50,
                      width: 50,
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    if (controller.shuffleList.isNotEmpty) {
                      return Column(
                        children: controller.shuffleList
                            .map((element) => DataListWidget(datas: element))
                            .toList(),
                      );
                    } else {
                      return Container();
                    }
                  }
                }
              },
            )
          ],
        ),
      )
    ]);
  }
}
