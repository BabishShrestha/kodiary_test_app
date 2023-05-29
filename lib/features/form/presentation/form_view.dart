import 'package:flutter/material.dart';

class FormView extends StatefulWidget {
  const FormView({super.key});

  @override
  State<FormView> createState() => _FormViewState();
}

class _FormViewState extends State<FormView> {
  @override
  Widget build(BuildContext context) {
    final globalKey= GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(title: Text("Form View"),),
      body: Form
      (
        key: globalKey,

        child: Column(children: [
          SingleChildScrollView(
            child: TextFormField(
              
            ),
          )
        ],)
      ),
    );
  }
}