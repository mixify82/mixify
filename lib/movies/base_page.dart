// base_page.dart

import 'package:flutter/material.dart';

class BasePage extends StatelessWidget {
  final String pageTitle;
  final Widget body;

  BasePage({required this.pageTitle, required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          pageTitle,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          // Background gradient
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [Colors.black, Colors.deepPurple],
              ),
            ),
          ),
          // Body content
          body,
        ],
      ),
    );
  }
}
