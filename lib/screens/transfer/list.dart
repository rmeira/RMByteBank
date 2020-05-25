import 'package:RMByteBank/models/transfer.dart';
import 'package:RMByteBank/screens/transfer/form.dart';
import 'package:flutter/material.dart';

const _appBarTitle = 'Transferências';

class TransferList extends StatefulWidget {
  final List<Transfer> _transfer = List();

  @override
  State<StatefulWidget> createState() => TransferListState();
}

class TransferListState extends State<TransferList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: widget._transfer.length,
        itemBuilder: (context, index) {
          final transfer = widget._transfer[index];
          return TransferItem(transfer);
        },
      ),
      appBar: AppBar(
        title: const Text(_appBarTitle),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return TransferForm();
          })).then(
            (transferReceived) => _transferReceived(transferReceived),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _transferReceived(Transfer transferReceived) {
    if (transferReceived != null) {
      setState(() => widget._transfer.add(transferReceived));
    }
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
        title: Text(_transfer.value.toString()),
        subtitle: Text(_transfer.account.toString()),
      ),
    );
  }
}
