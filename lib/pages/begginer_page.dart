import 'package:flutter/material.dart';
import 'package:widgets_app/constants/app_colors.dart';
import 'package:widgets_app/data/widget_list.dart';
import 'package:widgets_app/pages/widget_details_page.dart';

class BegginerPage extends StatefulWidget {
  const BegginerPage({super.key});

  @override
  State<BegginerPage> createState() => _BegginerPageState();
}

class _BegginerPageState extends State<BegginerPage> {
  @override
  Widget build(BuildContext context) {
    final basicWidgets =
        widgetList.where((widget) => widget.category == "Basic").toList();
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 4 / 3,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemBuilder: (context, index) {
        final widgetModel = basicWidgets[index];
        return Card(
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
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    widgetModel.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      itemCount: basicWidgets.length,
    );
  }
}
