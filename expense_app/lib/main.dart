import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './transaction.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
        id: 't1', title: 'New shoes', amount: 49.99, date: DateTime.now()),
    Transaction(
        id: 't2', title: 'New laptop', amount: 1249.99, date: DateTime.now())
  ];

  String titleInput = '';
  String amountInput = '';

  void addTransactionHandler() {
    transactions.add(Transaction(
        id: 't3',
        title: titleInput,
        amount: double.parse(amountInput),
        date: DateTime.now()));
    print(transactions[transactions.length - 1].amount);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('expense app'),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            width: double.infinity,
            child: const Card(
              color: Colors.amber,
              child: Text('my Chart'),
              elevation: 5,
            ),
          ),
          Card(
              child: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextField(
                  decoration: const InputDecoration(labelText: 'title'),
                  onChanged: (val) {
                    titleInput = val;
                  },
                ),
                TextField(
                  decoration: const InputDecoration(labelText: 'amount'),
                  onChanged: (val) => amountInput = val,
                ),
                TextButton(
                  child: const Text('Add Transaction'),
                  style: TextButton.styleFrom(primary: Colors.deepOrange),
                  onPressed: addTransactionHandler,
                )
              ],
            ),
          )),
          Column(
            children: transactions.map((tx) {
              return Card(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.deepOrange,
                        width: 2,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                    margin: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 15),
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      '\$${tx.amount}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.deepOrange,
                      ),
                    ),
                  ),
                  Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        tx.title,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        DateFormat.yMMMd().format(tx.date),
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ));
            }).toList(),
          )
        ],
      ),
    );
  }
}
