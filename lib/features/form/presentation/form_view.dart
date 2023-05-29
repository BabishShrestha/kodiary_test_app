import 'package:flutter/material.dart';

class FormView extends StatefulWidget {
  const FormView({super.key});

  @override
  State<FormView> createState() => _FormViewState();
}

class _FormViewState extends State<FormView> {
  late int counter;
  @override
  void initState() {
    counter = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final globalKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(title: const Text("Form View"), actions: [
        IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              setState(() {
                increaseCounter();
              });
            }),
      ]),
      body: Form(
          key: globalKey,
          child: Column(
            children: [
              Container(
                  color: Colors.amber,
                  height: MediaQuery.of(context).size.height,
                  child: ListView.builder(
                    
                      itemCount: counter,
                      itemBuilder: (context, index) {
                        return _row(index);
                      }))
            ],
          )),
    );
  }

  void increaseCounter() {
    counter++;
  }

  Row _row(int index) {
    return Row(
      children: [
        Text('ID $index:'),
        Expanded(
          child: TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
        )
      ],
    );
  }
}
