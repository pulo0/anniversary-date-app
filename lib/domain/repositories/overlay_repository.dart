import 'package:flutter/material.dart';

abstract class OverlayRepository {
  Future<void> openDateOverlay(BuildContext context, Widget child);
}
