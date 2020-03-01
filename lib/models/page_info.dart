import 'package:flutter/material.dart';

class PageInfo {
  String title;
  Widget page;

  PageInfo(this.title, this.page);

  String toString() {
    return this.title;
  }
}