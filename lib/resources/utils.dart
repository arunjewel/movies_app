import 'package:flutter/material.dart';

toPage(BuildContext context, Widget widget) {
  return Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => widget));
}

toPushNamedAndRemoveUntil(
    {required BuildContext context, required String widgetName}) {
  return Navigator.pushNamedAndRemoveUntil(
      context, widgetName, (Route<dynamic> route) => false);
}
