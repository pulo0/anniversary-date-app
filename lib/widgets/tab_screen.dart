import 'package:flutter/material.dart';
import 'package:anniversary_date_app/style/app_theme.dart';
import 'package:anniversary_date_app/widgets/date_bottom_sheet.dart';
import 'package:anniversary_date_app/widgets/date_panel.dart';

class TabScreen extends StatelessWidget {
  const TabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void openAddDateOverlay() {
      showModalBottomSheet(
        context: context,
        useSafeArea: true,
        isScrollControlled: true,
        builder: (ctx) => const DateBottomSheet(),
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
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DatePanel(),
            ],
          ),
        ),
      ),
    );
  }
}
