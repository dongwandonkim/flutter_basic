import 'package:expense_app/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> userTransactions;
  final Function deleteTransaction;

  const TransactionList(this.userTransactions, this.deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return userTransactions.isEmpty
        ? LayoutBuilder(
            builder: (context, constraints) {
              return Column(
                children: [
                  Text(
                    'no transactions',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                      height: constraints.maxHeight * 0.6,
                      child: Image.asset('assets/images/waiting.png',
                          fit: BoxFit.cover))
                ],
              );
            },
          )
        : ListView.builder(
            itemBuilder: (ctx, idx) {
              return Card(
                elevation: 5,
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FittedBox(
                        child: Text('\$${userTransactions[idx].amount}'),
                      ),
                    ),
                  ),
                  title: Text(
                    userTransactions[idx].title,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  subtitle: Text(
                    DateFormat.yMMMd().format(userTransactions[idx].date),
                  ),
                  trailing: MediaQuery.of(context).size.width > 400
                      ? TextButton.icon(
                          style: TextButton.styleFrom(
                            primary: Theme.of(context).errorColor,
                          ),
                          icon: const Icon(
                            Icons.delete,
                          ),
                          label: const Text('Delete'),
                          onPressed: () =>
                              deleteTransaction(userTransactions[idx].id),
                        )
                      : IconButton(
                          icon: const Icon(Icons.delete),
                          color: Theme.of(context).errorColor,
                          onPressed: () =>
                              deleteTransaction(userTransactions[idx].id),
                        ),
                ),
              );
            },
            itemCount: userTransactions.length,
          );
  }
}
