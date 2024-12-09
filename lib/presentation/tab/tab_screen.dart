import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:anniversary_date_app/presentation/date/widgets/date_panel.dart';
import 'package:anniversary_date_app/presentation/bottom_sheet/date_bottom_sheet.dart';
import 'package:anniversary_date_app/presentation/date/cubit/date_cubit.dart';
import 'package:anniversary_date_app/presentation/date/cubit/date_state.dart';
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

    void openAddDateOverlay() async {
      showModalBottomSheet(
        context: context,
        useSafeArea: true,
        isScrollControlled: true,
        builder: (ctx) => DateBottomSheet(dateCubit),
      );
    }

    Widget scaffoldAddedPref(AddedPrefDateState state) {
      return Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () => openAddDateOverlay(),
          label: const Text('Add date'),
          icon: const Icon(Icons.date_range_outlined),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DatePanel(
                dateState: state.datePreference,
                nameState: state.namePreference,
              ),
            ],
          ),
        ),
      );
    }

      return BlocProvider(
        create: (context) => dateCubit..initializeData(),
        child: BlocBuilder<DateCubit, DateState>(
          builder: (context, state) {
            if (state is InitialDateState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is AddedPrefDateState) {
              return scaffoldAddedPref(state);
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
