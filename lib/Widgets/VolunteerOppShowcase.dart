import 'package:flutter/material.dart';
import 'package:altru/API.dart';

class NonProfitVolunteerShowcase extends StatelessWidget {
  final NonProfit nonProfit;

  NonProfitVolunteerShowcase({this.nonProfit});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(

        nonProfit.name +'has these volunteer opportunities available',
        textAlign: TextAlign.center,
      ),
    );
  }
}
