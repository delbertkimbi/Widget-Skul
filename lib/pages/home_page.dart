import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:widgets_app/data/widget_list.dart';
import 'package:widgets_app/model/flutter_widget_model.dart';
import 'package:widgets_app/pages/all_widgets_page.dart';
import 'package:widgets_app/pages/widget_details_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String query = '';
  bool isSearching = false;

  // Group widgets by category
  final Map<String, List<FlutterWidgetModel>> categorizedWidgets = {
    'Basic': widgetList.where((widget) => widget.category == 'Basic').toList(),
    'Intermediate':
        widgetList
            .where((widget) => widget.category == 'Intermediate')
            .toList(),
    'Advanced':
        widgetList.where((widget) => widget.category == 'Advanced').toList(),
    'Input & Interactive':
        widgetList
            .where((widget) => widget.category == 'Input & Interactive')
            .toList(),
  };

  @override
  Widget build(BuildContext context) {
    List<FlutterWidgetModel> filteredWidgets = [];

    if (query.isNotEmpty) {
      filteredWidgets =
          widgetList
              .where(
                (widget) =>
                    widget.name.toLowerCase().contains(query.toLowerCase()),
              )
              .toList();
    }

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        centerTitle: true,
        title: Hero(
          tag: 'header',
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Widget",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                  fontSize: 25,
                ),
              ),
              Text(
                "Skul",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                  fontSize: 25,
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.grey[100],
        elevation: 0,
      ),
      body: Column(
        children: [
          _buildSearchBar(),
          const SizedBox(height: 10),
          Expanded(
            child:
                query.isNotEmpty
                    ? _buildSearchResults(filteredWidgets)
                    : _buildCategorySuggestions(),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Material(
        elevation: 5,
        shadowColor: Colors.black45,
        borderRadius: BorderRadius.circular(30),
        child: TextField(
          onChanged:
              (value) => setState(() {
                query = value;
                isSearching = value.isNotEmpty;
              }),
          decoration: InputDecoration(
            hintText: "Search a widget...",
            hintStyle: GoogleFonts.poppins(),
            prefixIcon: const Icon(Icons.search, color: Colors.deepPurple),
            suffixIcon:
                query.isNotEmpty
                    ? IconButton(
                      icon: const Icon(Icons.clear, color: Colors.deepPurple),
                      onPressed:
                          () => setState(() {
                            query = '';
                            isSearching = false;
                          }),
                    )
                    : null,
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 15,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSearchResults(List<FlutterWidgetModel> filteredWidgets) {
    return filteredWidgets.isEmpty
        ? Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.search_off_rounded,
                size: 80,
                color: Colors.grey,
              ),
              const SizedBox(height: 16),
              Text(
                "No widget found 😔",
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  color: Colors.grey,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "Try searching with a different term",
                style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey),
              ),
            ],
          ),
        )
        : ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemCount: filteredWidgets.length,
          itemBuilder: (context, index) {
            final widget = filteredWidgets[index];
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 2,
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: _getCategoryColor(widget.category),
                  child: Icon(widget.icon, color: Colors.white, size: 20),
                ),
                title: Text(
                  widget.name,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                subtitle: Text(
                  widget.category,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
                trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) => WidgetDetailsPage(widgetModel: widget),
                    ),
                  );
                },
              ),
            );
          },
        );
  }

  Widget _buildCategorySuggestions() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Explore Widgets",
              style: GoogleFonts.poppins(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple[800],
              ),
            ),
            const SizedBox(height: 16),
            _buildCategorySection("Basic", Colors.deepPurple),
            _buildCategorySection("Intermediate", Colors.orange),
            _buildCategorySection("Advanced", Colors.red),
          ],
        ),
      ),
    );
  }

  Widget _buildCategorySection(String category, Color color) {
    // Get top 4 widgets for suggestion
    final suggestions = categorizedWidgets[category]?.take(4).toList() ?? [];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              category,
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: color,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => AllWidgetsPage()),
                );
              },
              child: Text(
                "See All",
                style: GoogleFonts.poppins(
                  color: Colors.deepPurple,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 160,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: suggestions.length,
            itemBuilder: (context, index) {
              final widget = suggestions[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) => WidgetDetailsPage(widgetModel: widget),
                    ),
                  );
                },
                child: Container(
                  width: 140,
                  margin: const EdgeInsets.only(right: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: color.withOpacity(0.2),
                        child: Hero(
                          tag: widget.name,
                          child: Icon(widget.icon, color: color, size: 30),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        widget.name,
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "Tap to view",
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }

  Color _getCategoryColor(String category) {
    switch (category) {
      case 'Basic':
        return Colors.blue;
      case 'Intermediate':
        return Colors.orange;
      case 'Advanced':
        return Colors.red;
      case 'Input & Interactive':
        return Colors.green;
      default:
        return Colors.deepPurple;
    }
  }
}
