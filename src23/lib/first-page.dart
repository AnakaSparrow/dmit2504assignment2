// ignore_for_file: avoid_print, use_key_in_widget_constructors, file_names, todo, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import

import 'package:flutter/material.dart';
import 'package:robbinlaw/widgets/mysnackbar.dart';

// Do not change the structure of this files code.
// Just add code at the TODO's.

final formKey = GlobalKey<FormState>();

// We must make the variable firstName nullable.
String? firstName;
final TextEditingController textEditingController = TextEditingController();

class MyFirstPage extends StatefulWidget {
  @override
  MyFirstPageState createState() => MyFirstPageState();
}

class MyFirstPageState extends State<MyFirstPage> {
  bool enabled = false;
  int timesClicked = 0;
  String msg1 = '';
  String? msg2 = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('A2 - User Input'),
      ),
      body: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //TODO: Replace this Text Widget
              // and build the label and switch here
              // as children of the row.

              Text('Enable Buttons'),
              Switch(
                value: enabled,
                onChanged: (bool onChangedValue){
                  enabled = onChangedValue;
                  setState(() {
                    if (enabled) {
                      msg1 = 'Click Me';
                    } else {
                      msg1 = 'Click Me';
                    }
                  });
                }
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //TODO: Build the two buttons here 
              // as children of the row.
              // For each button use a 
              // "Visibility Widget" and its child 
              // will be an "ElevatedButton"
              //-------------add button styling
              // -------------save times clicked so that it doesnt reset when button is disabled
              Visibility(
                visible: enabled,
                child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        timesClicked++;
                        msg1 = 'Clicked $timesClicked';
                      });
                    },
                    child: Text(msg1),
                    ),
                ),
                Visibility(
                  visible: enabled,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        timesClicked = 0;
                        msg1 = 'Click Me';
                      });
                    }, 
                    child: Text('Reset')),
                ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  //TODO: Build the text form field
                  // here as the first
                  // child of the column.
                  // Include as the second child
                  // of the column
                  // a submit button that will show a
                  // snackbar with the "firstName"
                  // if validation is satisfied.
                  //-------------add snackbar icon & 5 second time
                  //------------ add icon & click me to snackbar
                  //------------- add clickme onPressed to print message to console
                  //-------------- align submit button to the right
                  TextFormField(
                    controller: textEditingController,
                    onChanged: (value) {
                      print(value);
                    },
                    onFieldSubmitted: (text) {
                      print(text);
                      if(formKey.currentState!.validate()){
                        print('valid');
                      }
                    },
                    validator: (input) {
                      return input!.isEmpty ? "min: 1, max: 20" : null;
                    },
                    onSaved: (input) {
                      if(formKey.currentState!.validate()){
                        msg2 = input;
                      }
                    },
                    maxLength : 20,
                    decoration: InputDecoration(
                      icon: Icon(Icons.hourglass_top),
                      labelText : 'first name',
                      helperText: 'min 1, max 20',
                      suffixIcon: Icon(
                        Icons.check_circle
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if(formKey.currentState!.validate()){
                        formKey.currentState!.save();
                        textEditingController.clear();
                        MySnackBar(text: 'Hey There, Your name is $msg2').show();
                        setState(() {});
                      }
                    }, 
                    child: Text('Submit'))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}