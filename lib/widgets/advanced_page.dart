import 'package:flutter/material.dart';
import 'package:widgets_app/constants/app_colors.dart';
import 'package:widgets_app/data/widget_list.dart';
import 'package:widgets_app/pages/widget_details_page.dart';

class AdvancedPage extends StatefulWidget {
  const AdvancedPage({super.key});

  @override
  State<AdvancedPage> createState() => _AdvancedPageState();
}

class _AdvancedPageState extends State<AdvancedPage> {
  @override
  Widget build(BuildContext context) {
    final advancedList =
        widgetList.where((widget) => widget.category == "Advanced").toList();
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        childAspectRatio: 4 / 3,
        mainAxisSpacing: 12,
      ),
      itemBuilder: (context, index) {
        final widgetModel = advancedList[index];
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),

          child: InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => WidgetDetailsPage(widgetModel: widgetModel),
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
      itemCount: advancedList.length,
    );
  }
}
