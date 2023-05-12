import 'package:flutter/material.dart';

class CommonListView extends StatefulWidget {
  final List<Widget> children;
  const CommonListView({super.key, required this.children});

  @override
  State<CommonListView> createState() => _CommonListViewState();
}

class _CommonListViewState extends State<CommonListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: widget.children,
        ),
      ),
    );
  }
}
