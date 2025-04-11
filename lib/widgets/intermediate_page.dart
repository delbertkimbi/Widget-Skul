import 'package:flutter/material.dart';
import 'package:widgets_app/constants/app_colors.dart';
import 'package:widgets_app/data/widget_list.dart';
import 'package:widgets_app/pages/widget_details_page.dart';

class IntermediatePage extends StatefulWidget {
  const IntermediatePage({super.key});

  @override
  State<IntermediatePage> createState() => _IntermediatePageState();
}

class _IntermediatePageState extends State<IntermediatePage> {
  @override
  Widget build(BuildContext context) {
    final intermediateList =
        widgetList
            .where((widget) => widget.category == 'Intermediate')
            .toList();
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 4 / 3,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemBuilder: (context, index) {
        final widgetModel = intermediateList[index];
        return Card(
          margin: const EdgeInsets.all(8.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return WidgetDetailsPage(widgetModel: widgetModel);
                  },
                ),
              );
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 4,
              children: [
                Hero(
                  tag: widgetModel.name,
                  child: Icon(
                    widgetModel.icon,
                    size: 40,
                    color: AppColors.primaryPurple,
                  ),
                ),
                Text(
                  widgetModel.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        );
      },
      itemCount: intermediateList.length,
    );
  }
}
