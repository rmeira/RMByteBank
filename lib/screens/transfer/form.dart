import 'package:RMByteBank/components/formTextField.dart';
import 'package:RMByteBank/models/transfer.dart';
import 'package:flutter/material.dart';

const _appBarTitle = 'Adicionar nova transferência';
const _labelAccount = 'Número da conta';
const _hintAccount = '1000';
const _labelValue = 'Valor gasto';
const _hintValue = '0.00';
const _confirmButton = 'Adicionar transferência';

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
        title: const Text(_appBarTitle),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            FormTextField(
              controller: _account,
              label: _labelAccount,
              hint: _hintAccount,
              autofocus: true,
            ),
            FormTextField(
              controller: _value,
              label: _labelValue,
              hint: _hintValue,
              icon: Icons.attach_money,
            ),
            RaisedButton(
              child: Text(_confirmButton),
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
