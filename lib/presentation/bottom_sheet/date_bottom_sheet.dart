import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:anniversary_date_app/utils/toast.dart';
import 'package:anniversary_date_app/utils/validator_bottom_sheet.dart';
import 'package:anniversary_date_app/presentation/date/cubit/date_cubit.dart';
import 'package:anniversary_date_app/presentation/bottom_sheet/widgets/custom_input_field.dart';
import 'package:anniversary_date_app/domain/repositories/selector_repository.dart';
import 'package:anniversary_date_app/domain/repositories/shared_prefs_repository.dart';
import 'package:anniversary_date_app/data/service/service_locator.dart';

class DateBottomSheet extends StatefulWidget {
  const DateBottomSheet(this._dateCubit, {super.key});

  final DateCubit _dateCubit;

  @override
  State<DateBottomSheet> createState() => _DateBottomSheetState();
}

class _DateBottomSheetState extends State<DateBottomSheet> {
  final _sharedPrefs = locator<SharedPrefsRepository>();
  final _selectorRepository = locator<SelectorRepository>();
  final _validator = locator<ValidatorBottomSheet>();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TimeOfDay rawTime = TimeOfDay.now();
  DateTime rawDate = DateTime.now();

  final double horPadding = 30;
  final double verPadding = 45;
  final _nameController = TextEditingController();
  final _dateController = TextEditingController();
  final _timeController = TextEditingController();
  final DateTime dateNow = DateTime.now();
  final DateTime dateFirst = DateTime(1800);

  @override
  void dispose() {
    _nameController.dispose();
    _dateController.dispose();
    _timeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context);
    final keyboardPlacement = MediaQuery.of(context).viewInsets.bottom;
    return SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            horPadding,
            verPadding,
            horPadding,
            keyboardPlacement + verPadding,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                CustomInputField(
                  controller: _nameController,
                  labelTxt: locale.nameLabelText,
                  hintTxt: locale.nameHintText,
                  isInputText: true,
                ),
                CustomInputField(
                  controller: _dateController,
                  labelTxt: locale.dateLabelText,
                  hintTxt: locale.dateHintText,
                  isInputText: false,
                  icon: const Icon(Icons.date_range_outlined),
                  showPicker: () => _selectorRepository.openDateSelector(
                    context,
                    rawDate: rawDate,
                    initialAndLastDate: dateNow,
                    firstDate: dateFirst,
                    controller: _dateController,
                    onDateSelected: (item) => rawDate = item,
                  ),
                  validator: _validator
                      .validatorRequire(locale.validationRequireField)
                      .call,
                ),
                const SizedBox(height: 16),
                CustomInputField(
                  controller: _timeController,
                  labelTxt: locale.timeLabelText,
                  hintTxt: locale.timeHintText,
                  isInputText: false,
                  icon: const Icon(Icons.access_time),
                  showPicker: () => _selectorRepository.openTimeSelector(
                    context,
                    rawTime: rawTime,
                    initialTime: TimeOfDay.now(),
                    controller: _timeController,
                    onTimeSelected: (item) => rawTime = item,
                  ),
                  validator: _validator
                      .validatorRequire(locale.validationRequireField)
                      .call,
                ),
                const SizedBox(height: 16),
                Row(
                  children: <Widget>[
                    OutlinedButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text(locale.backButtonText),
                    ),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (_formKey.currentState!.validate()) {
                            final formattedDate = DateTime(
                                    rawDate.year,
                                    rawDate.month,
                                    rawDate.day,
                                    rawTime.hour,
                                    rawTime.minute)
                                .millisecondsSinceEpoch;
                            _sharedPrefs.saveNameValue(_nameController.text);
                            _sharedPrefs.saveDateValue(formattedDate);
                            widget._dateCubit.initializeData();
                            showToast(message: locale.toastSuccessMessage);
                            Navigator.of(context).pop();
                          }
                        });
                      },
                      child: Text(locale.addButtonText),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
