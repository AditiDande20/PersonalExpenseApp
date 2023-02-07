import 'package:flutter/material.dart';

class NewTransactions extends StatefulWidget {
  final Function onPressed;
  const NewTransactions({super.key, required this.onPressed});

  @override
  State<NewTransactions> createState() => _NewTransactionsState();
}

class _NewTransactionsState extends State<NewTransactions> {
  final TextEditingController titleController = TextEditingController();

  final TextEditingController amountController = TextEditingController();

  onSubmit() {
    var title = titleController.text.toString();
    var amount = double.parse(amountController.text);

    if (title.isEmpty || amount <= 0) {
      return;
    }
    widget.onPressed(title, amount);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Container(
          width: double.infinity,
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                controller: titleController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  hintText: 'Title',
                  hintStyle: TextStyle(fontSize: 16, color: Colors.grey),
                  focusColor: Colors.yellow,
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.yellow),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: TextField(
                  controller: amountController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      focusColor: Colors.yellow,
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.yellow),
                      ),
                      hintText: 'Amount',
                      hintStyle: TextStyle(fontSize: 16, color: Colors.grey)),
                  onSubmitted: (_) => onSubmit(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 10),
                child: InkWell(
                    onTap: () {
                      onSubmit();
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(width: 2, color: Colors.yellow),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: Text(
                          'Add Transaction',
                          style: TextStyle(
                              color: Colors.yellow,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    )),
              )
            ],
          )),
    );
  }
}
