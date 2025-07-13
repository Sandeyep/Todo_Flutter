import 'dart:typed_data';
import 'package:flutter/material.dart';

class Category {
  final String name;
  final Uint8List iconBytes;
  final Color color;

  Category({
    required this.name,
    required this.iconBytes,
    required this.color,
  });
}
