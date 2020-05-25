import 'package:RMByteBank/screens/transfer/list.dart';
import 'package:flutter/material.dart';

void main() => runApp(RMByteBank());

class RMByteBank extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.cyan[900],
        accentColor: Colors.cyan[600],
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.cyan[600],
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      home: TransferList(),
      debugShowCheckedModeBanner: false,
    );
  }
}
