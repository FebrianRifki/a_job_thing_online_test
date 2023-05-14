import 'package:flutter/material.dart';
import 'package:online_test/data/models/blog.dart';
import 'package:online_test/data/modules/blog/controller.dart';
import 'package:online_test/data/modules/widget/common_list_view_layout.dart';
import 'package:get/get.dart';

class BlogView extends StatefulWidget {
  final BlogController blogController = Get.find<BlogController>();
  final Blog blog;
  BlogView({required this.blog, super.key});

  @override
  State<BlogView> createState() => _BlogViewState();
}

class _BlogViewState extends State<BlogView> {
  @override
  Widget build(BuildContext context) {
    return CommonListViewLayout(
        hasAppBar: true,
        isBlog: true,
        appbarTitle: widget.blog.title,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              widget.blog.photo.isNotEmpty
                  ? Image.network(widget.blog.photo)
                  : Container(),
              Container(
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3))
                    ],
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10))),
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 10, left: 10.0, right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                          child: Column(
                        children: [
                          Text(
                            widget.blog.title,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5.0),
                            child: Text(
                              widget.blog.author,
                              style: const TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Text(
                            widget.blog.createAt.toString(),
                            style: const TextStyle(color: Colors.grey),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                        ],
                      )),
                      Text(
                        widget.blog.subTitle,
                        textAlign: TextAlign.justify,
                        style: const TextStyle(fontSize: 15),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Text(widget.blog.content,
                          textAlign: TextAlign.justify,
                          style: const TextStyle(fontSize: 15)),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Text('Tags: ${widget.blog.tag}',
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          )),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ]);
  }
}
