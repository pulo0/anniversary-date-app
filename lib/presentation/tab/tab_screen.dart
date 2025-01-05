import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:anniversary_date_app/presentation/date/widgets/date_panel.dart';
import 'package:anniversary_date_app/presentation/date/widgets/starter_date_panel.dart';
import 'package:anniversary_date_app/presentation/tab/widgets/scaffold_date.dart';
import 'package:anniversary_date_app/presentation/date/cubit/date_cubit.dart';
import 'package:anniversary_date_app/presentation/date/cubit/date_state.dart';
import 'package:anniversary_date_app/domain/repositories/overlay_repository.dart';
import 'package:anniversary_date_app/data/service/service_locator.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context);
    final DateCubit dateCubit = locator<DateCubit>();
    final OverlayRepository overlayRepository = locator<OverlayRepository>();

    return BlocProvider(
      create: (context) => dateCubit..initializeData(),
      child: BlocBuilder<DateCubit, DateState>(
        builder: (context, state) {
          if (state is InitialDateState) {
            return ScaffoldDate(
              overlayRepository: overlayRepository,
              dateCubit: dateCubit,
              scaffoldChild: const StarterDatePanel(),
            );
          } else if (state is AddedPrefDateState) {
            return ScaffoldDate(
              overlayRepository: overlayRepository,
              dateCubit: dateCubit,
              scaffoldChild: DatePanel(
                nameState: state.namePreference,
                dateState: state.datePreference,
              ),
            );
          } else {
            return Center(
              child: Text(
                locale.wrongState,
              ),
            );
          }
        },
      ),
    );
  }
}
