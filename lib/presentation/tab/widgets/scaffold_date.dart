import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:anniversary_date_app/presentation/bottom_sheet/date_bottom_sheet.dart';
import 'package:anniversary_date_app/presentation/date/cubit/date_cubit.dart';
import 'package:anniversary_date_app/domain/repositories/overlay_repository.dart';

class ScaffoldDate extends StatelessWidget {
  const ScaffoldDate({
    required this.overlayRepository,
    required this.dateCubit,
    required this.scaffoldChild,
    super.key,
  });

  final OverlayRepository overlayRepository;
  final DateCubit dateCubit;
  final Widget scaffoldChild;

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => overlayRepository.openDateOverlay(
          context,
          DateBottomSheet(dateCubit),
        ),
        label: Text(locale.addDate),
        icon: const Icon(Icons.date_range_outlined),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            scaffoldChild,
          ],
        ),
      ),
    );
  }
}
