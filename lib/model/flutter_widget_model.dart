import 'package:flutter/material.dart';

class FlutterWidgetModel {
  final String name;
  final String description;
  final String usage;
  final String exampleImage;
  final String exampleOutput;
  final String category; // "Basic", "Input & Interactive", "Other"
  final IconData icon;
  final String learnMoreUrl;

  FlutterWidgetModel({
    required this.name,
    required this.description,
    required this.usage,
    required this.exampleImage,
    required this.exampleOutput,
    required this.category,
    required this.icon,
    required this.learnMoreUrl,
  });
}
