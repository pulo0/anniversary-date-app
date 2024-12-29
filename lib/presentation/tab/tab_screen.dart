import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:anniversary_date_app/presentation/tab/widgets/scaffold_added_pref.dart';
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
    final DateCubit dateCubit = locator<DateCubit>();
    final OverlayRepository overlayRepository = locator<OverlayRepository>();

    return BlocProvider(
      create: (context) => dateCubit..initializeData(),
      child: BlocBuilder<DateCubit, DateState>(
        builder: (context, state) {
          if (state is InitialDateState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is AddedPrefDateState) {
            return ScaffoldAddedPref(
              overlayRepository: overlayRepository,
              dateCubit: dateCubit,
              dateState: state.datePreference,
              nameState: state.namePreference,
            );
          } else {
            return const Center(
              child: Text('Wrong state'),
            );
          }
        },
      ),
    );
  }
}
