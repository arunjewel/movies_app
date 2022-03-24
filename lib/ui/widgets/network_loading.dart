import 'package:flutter/material.dart';
import '../../resources/constants.dart';



class NetworkLoading extends StatelessWidget {
  const NetworkLoading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        valueColor: new AlwaysStoppedAnimation<Color>(
          Constants.themeGradients[0],
        ),
        strokeWidth: 1.5,
      ),
    );
  }
}
