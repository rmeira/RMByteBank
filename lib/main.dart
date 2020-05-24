import 'package:flutter/material.dart';

void main() => runApp(FlutterInitApp());

class FlutterInitApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: TransferList(),
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
      appBar: AppBar(
        title: const Text('Adicionar nova transferência'),
        backgroundColor: Colors.orange[600],
      ),
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
              onPressed: () => _handleCreateTranfer(context, _value, _account),
            ),
          ],
        ),
      ),
    );
  }
}

void _handleCreateTranfer(BuildContext context, _value, _account) {
  final double value = double.tryParse(_value.text);
  final int account = int.tryParse(_account.text);

  if (value != null && account != null) {
    final tranferCreate = Transfer(value, account);
    Navigator.pop(context, tranferCreate);
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
            child: icon != null
                ? Icon(icon)
                : null, // myIcon is a 48px-wide widget.
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

class TransferList extends StatefulWidget {
  final List<Transfer> _transfer = List();

  @override
  State<StatefulWidget> createState() => TransferListState();
}

class TransferListState extends State<TransferList> {
  @override
  Widget build(BuildContext context) {
    debugPrint('$widget._transfer');
    return Scaffold(
      body: ListView.builder(
        itemCount: widget._transfer.length,
        itemBuilder: (context, index) {
          final transfer = widget._transfer[index];
          return TransferItem(transfer);
        },
      ),
      appBar: AppBar(
        title: const Text('Transferências'),
        backgroundColor: Colors.orange[600],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final Future<Transfer> future = Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return TransferForm();
            }),
          );
          future.then((handleTransferReceived) {
            debugPrint('$handleTransferReceived');
            widget._transfer.add(handleTransferReceived);
          });
        },
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

  @override
  String toString() {
    return 'Transfer{value: $value, account: $account}';
  }
}
