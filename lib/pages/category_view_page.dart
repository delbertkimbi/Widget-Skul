 import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:widgets_app/model/flutter_widget_model.dart';
import 'package:widgets_app/pages/widget_details_page.dart';

class CategoryViewPage extends StatelessWidget {
  final String categoryName;
  final List<FlutterWidgetModel> widgets;
  final Color categoryColor;

  const CategoryViewPage({
    Key? key,
    required this.categoryName,
    required this.widgets,
    required this.categoryColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text(
          "$categoryName Widgets",
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
        ),
        backgroundColor: categoryColor,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildCategoryHeader(context),
          Expanded(
            child: _buildWidgetGrid(),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryHeader(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: categoryColor.withOpacity(0.1),
        border: Border(
          bottom: BorderSide(
            color: categoryColor.withOpacity(0.3),
            width: 1,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            categoryName,
            style: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: categoryColor,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            "${widgets.length} widgets available",
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: Colors.grey[700],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWidgetGrid() {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.85,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: widgets.length,
      itemBuilder: (context, index) {
        final widget = widgets[index];
        return _buildWidgetCard(context, widget);
      },
    );
  }

  Widget _buildWidgetCard(BuildContext context, FlutterWidgetModel widget) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => WidgetDetailsPage(
              widgetModel: widget,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.15),
              spreadRadius: 1,
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 35,
              backgroundColor: categoryColor.withOpacity(0.2),
              child: Icon(
                widget.icon,
                color: categoryColor,
                size: 35,
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                widget.name,
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                widget.usage.split('.').first,
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: Colors.grey[600],
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}