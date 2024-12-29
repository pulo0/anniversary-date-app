import 'package:fluttertoast/fluttertoast.dart';
import 'package:anniversary_date_app/style/app_theme.dart';

void showToast({required String message}) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: colorScheme.onPrimary.withOpacity(.5),
    textColor: colorScheme.onPrimaryContainer.withOpacity(.8),
    fontSize: 16,
  );
}
