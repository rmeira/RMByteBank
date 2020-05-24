import 'package:flutter/material.dart';

void main() => runApp(FlutterInitApp());

class FlutterInitApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: TransferForm(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class TransferForm extends StatelessWidget {
  final TextEditingController _account = TextEditingController();
  final TextEditingController _value = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            TransferFormField(
              controller: _account,
              label: 'Número da conta',
              hint: '1000',
              autofocus: true,
            ),
            TransferFormField(
              controller: _value,
              label: 'Valor gasto',
              hint: '120.00',
              icon: Icons.attach_money,
            ),
            RaisedButton(
              color: Colors.orange[600],
              textColor: Colors.white,
              child: Text("Adicionar transferência"),
              onPressed: () {
                final double value = double.tryParse(_value.text);
                final int account = int.tryParse(_account.text);

                if (value != null && account != null) {
                  Transfer(value, account);
                }
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        actions: <Widget>[BackButton()],
        title: const Text('Adicionar nova transferência'),
        backgroundColor: Colors.orange[600],
      ),
    );
  }
}

class TransferFormField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final bool autofocus;
  final IconData icon;

  TransferFormField({
    this.controller,
    this.label,
    this.hint,
    this.autofocus = false,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: TextField(
        controller: controller,
        style: TextStyle(
          fontSize: 20,
        ),
        decoration: InputDecoration(
          suffixIcon: Padding(
            padding: const EdgeInsetsDirectional.only(end: 4.0),
            child: Icon(icon), // myIcon is a 48px-wide widget.
          ),
          labelText: label,
          hintText: hint,
          border: OutlineInputBorder(),
        ),
        autofocus: autofocus,
        keyboardType: TextInputType.number,
      ),
    );
  }
}

class TransferList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            TransferItem(Transfer(100.0, 1000)),
            TransferItem(Transfer(100.0, 2000)),
            TransferItem(Transfer(100.0, 3000)),
            TransferItem(Transfer(100.0, 4000)),
            TransferItem(Transfer(100.0, 5000)),
            TransferItem(Transfer(100.0, 6000)),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('Transferências'),
        backgroundColor: Colors.orange[600],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.orange[600],
      ),
    );
  }
}

class TransferItem extends StatelessWidget {
  final Transfer _transfer;

  TransferItem(this._transfer);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(
          Icons.monetization_on,
          size: 32.00,
        ),
        title: Text('R ' + _transfer.value.toString()),
        subtitle: Text('Conta: ' + _transfer.account.toString()),
      ),
    );
  }
}

class Transfer {
  final double value;
  final int account;

  Transfer(this.value, this.account);
}
