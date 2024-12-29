import 'package:flutter/material.dart';
import 'package:anniversary_date_app/domain/repositories/overlay_repository.dart';

class OverlayRepositoryImpl implements OverlayRepository {
  const OverlayRepositoryImpl();

  @override
  Future<void> openDateOverlay(BuildContext context, Widget child) async {
    await showModalBottomSheet(
      context: context,
      useSafeArea: true,
      isScrollControlled: true,
      builder: (ctx) => child,
    );
  }
}
