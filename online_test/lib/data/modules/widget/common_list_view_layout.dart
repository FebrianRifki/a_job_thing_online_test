import 'package:flutter/material.dart';

class CommonListViewLayout extends StatefulWidget {
  final List<Widget> children;
  final bool hasAppBar;
  final String? appbarTitle;
  final bool? isBlog;
  const CommonListViewLayout(
      {super.key,
      required this.children,
      this.appbarTitle,
      this.hasAppBar = false,
      this.isBlog = false});

  @override
  State<CommonListViewLayout> createState() => _CommonListViewLayoutState();
}

class _CommonListViewLayoutState extends State<CommonListViewLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.hasAppBar
          ? AppBar(
              backgroundColor:
                  widget.isBlog == true ? Colors.green : Colors.blue,
              leading: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () => Navigator.of(context).pop(),
              ),
              title: Text(
                widget.appbarTitle ?? '',
                overflow: TextOverflow.ellipsis,
              ),
              centerTitle: true,
            )
          : null,
      body: SafeArea(
        child: ListView(
          children: widget.children,
        ),
      ),
    );
  }
}
