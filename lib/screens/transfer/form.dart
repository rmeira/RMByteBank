import 'package:RMByteBank/components/formTextField.dart';
import 'package:RMByteBank/models/transfer.dart';
import 'package:flutter/material.dart';

class TransferForm extends StatefulWidget {
  @override
  _TransferFormState createState() => _TransferFormState();
}

class _TransferFormState extends State<TransferForm> {
  final TextEditingController _account = TextEditingController();
  final TextEditingController _value = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar nova transferência'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            FormTextField(
              controller: _account,
              label: 'Número da conta',
              hint: '1000',
              autofocus: true,
            ),
            FormTextField(
              controller: _value,
              label: 'Valor gasto',
              hint: '120.00',
              icon: Icons.attach_money,
            ),
            RaisedButton(
              child: Text("Adicionar transferência"),
              onPressed: () => _handleCreateTranfer(context, _value, _account),
            ),
          ],
        ),
      ),
    );
  }

  void _handleCreateTranfer(BuildContext context, _value, _account) {
    final double value = double.tryParse(_value.text);
    final int account = int.tryParse(_account.text);

    if (value != null && account != null) {
      final tranferCreate = Transfer(value, account);
      Navigator.pop(context, tranferCreate);
    }
  }
}
