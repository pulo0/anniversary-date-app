import 'package:anniversary_date_app/widgets/add_date.dart';
import 'package:flutter/material.dart';
import 'package:anniversary_date_app/style/app_theme.dart';
import 'date_item.dart';

class TabScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TabScreen();
}

class _TabScreen extends State<TabScreen> {

  void _openAddDateOverlay() {
    showModalBottomSheet(
      context: context,
      useSafeArea: true,
      isScrollControlled: true,
      builder: (ctx) => AddDate(),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            colorScheme.primary,
            colorScheme.onTertiaryContainer,
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        floatingActionButton: FloatingActionButton.extended(
          onPressed: _openAddDateOverlay,
          label: const Text('Add date'),
          icon: const Icon(Icons.date_range_outlined),
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
        ),
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DateItem(),
            ],
          ),
        ),
      ),
    );
  }
}
