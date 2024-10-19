import 'package:anniversary_date_app/widgets/add_date.dart';
import 'package:flutter/material.dart';
import 'package:anniversary_date_app/style/app_theme.dart';
import 'date_item.dart';

class TabScreen extends StatelessWidget {
  const TabScreen({super.key});

  @override
  Widget build(BuildContext context) {

    void openAddDateOverlay() {
      showModalBottomSheet(
        context: context,
        useSafeArea: true,
        isScrollControlled: true,
        builder: (ctx) => const AddDate(),
      );
    }

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
          onPressed: openAddDateOverlay,
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
