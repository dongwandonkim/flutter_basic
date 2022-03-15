import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function(String, double, DateTime) addTransactionHandler;

  const NewTransaction(this.addTransactionHandler);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;

  void _submitData() {
    if (_amountController.text.isEmpty) return;

    final enteredTitle = _titleController.text;
    final entertedAmount = double.parse(_amountController.text);

    if (enteredTitle.isEmpty || entertedAmount <= 0 || _selectedDate == null) {
      return;
    }

    widget.addTransactionHandler(enteredTitle, entertedAmount, _selectedDate!);

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        child: Container(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                decoration: const InputDecoration(labelText: 'title'),
                controller: _titleController,
                onSubmitted: (_) => _submitData(),
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'amount'),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}'))
                ],
                controller: _amountController,
                onSubmitted: (_) => _submitData(),
              ),
              SizedBox(
                height: 70,
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        _selectedDate == null
                            ? 'No Date Chosen'
                            : 'Picked date: ${DateFormat.yMd().format(_selectedDate!)}',
                      ),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        primary: Theme.of(context).primaryColor,
                      ),
                      onPressed: _presentDatePicker,
                      child: const Text(
                        'Choose Date',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
              ElevatedButton(
                child: const Text('Add Transaction'),
                style: TextButton.styleFrom(
                    textStyle: Theme.of(context).textTheme.button,
                    backgroundColor: Theme.of(context).primaryColor),
                onPressed: _submitData,
              )
            ],
          ),
        ),
      ),
    );
  }
}
