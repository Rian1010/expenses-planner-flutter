import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionItem extends StatefulWidget {
  const TransactionItem({
    Key? key,
    required this.transaction,
    required this.deleteTx,
  }) : super(key: key);

  final Transaction transaction;
  final Function deleteTx;

  @override
  _TransactionItemState createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {
  // Selected color
  late Color _bgColor;

  @override
  void initState() {
    const availableColors = [
      Colors.red,
      Colors.black,
      Colors.blue,
      Colors.purple,
    ];

    _bgColor = availableColors[Random().nextInt(4)];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 5,
      ),
      child: ListTile(
        // leading: Container(
        //   height: 60,
        //   width: 60,
        //   decoration: BoxDecoration(
        //     color: Theme.of(context).primaryColor,
        //     shape: BoxShape.circle,
        //   ),
        // )
        leading: CircleAvatar(
          backgroundColor: _bgColor,
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: FittedBox(child: Text('\$${widget.transaction.amount}')),
          ),
        ),
        title: Text(
          widget.transaction.title,
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle: Text(
          DateFormat.yMMMd().format(widget.transaction.date),
        ),
        trailing: MediaQuery.of(context).size.width > 360
            ? FlatButton.icon(
                icon: const Icon(Icons.delete),
                label: const Text('Delete'),
                textColor: Theme.of(context).errorColor,
                onPressed: () => widget.deleteTx(widget.transaction.id),
              )
            : IconButton(
                icon: Icon(Icons.delete),
                onPressed: () => widget.deleteTx(widget.transaction.id),
                color: Theme.of(context).errorColor,
              ),
      ),
    );
    //   return Card(
    //       child: Row(children: <Widget>[
    //     Container(
    //       margin: EdgeInsets.symmetric(
    //         vertical: 10,
    //         horizontal: 15,
    //       ),
    //       decoration: BoxDecoration(
    //         border: Border.all(
    //           color: Theme.of(context).primaryColor,
    //           width: 2,
    //         ),
    //       ),
    //       padding: EdgeInsets.all(10),
    //       child: Text(
    //         '\$${transactions[index].amount.toStringAsFixed(2)}',
    //         // tx.amount.toString(),
    //         style: TextStyle(
    //           fontWeight: FontWeight.bold,
    //           fontSize: 20,
    //           color: Theme.of(context).primaryColor,
    //         ),
    //       ),
    //     ),
    //     Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: <Widget>[
    //         Text(
    //           transactions[index].title,
    //           style: TextStyle(
    //               fontSize: 18, fontWeight: FontWeight.bold),
    //         ),
    //         Text(
    //           DateFormat.yMMMd().format(transactions[index].date),
    //           style: TextStyle(color: Colors.grey),
    //         )
    //       ],
    //     )
    //   ]));
  }
}
