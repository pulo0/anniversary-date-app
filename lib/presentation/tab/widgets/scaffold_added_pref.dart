import 'package:flutter/material.dart';
import 'package:anniversary_date_app/presentation/date/widgets/date_panel.dart';
import 'package:anniversary_date_app/presentation/bottom_sheet/date_bottom_sheet.dart';
import 'package:anniversary_date_app/presentation/date/cubit/date_cubit.dart';
import 'package:anniversary_date_app/domain/repositories/overlay_repository.dart';

class ScaffoldAddedPref extends StatelessWidget {
  const ScaffoldAddedPref({
    required this.overlayRepository,
    required this.dateCubit,
    required this.dateState,
    required this.nameState,
    super.key,
  });

  final OverlayRepository overlayRepository;
  final DateCubit dateCubit;
  final DateTime dateState;
  final String nameState;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => overlayRepository.openDateOverlay(
          context,
          DateBottomSheet(dateCubit),
        ),
        label: const Text('Add date'),
        icon: const Icon(Icons.date_range_outlined),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DatePanel(
              dateState: dateState,
              nameState: nameState,
            ),
          ],
        ),
      ),
    );
  }
}
