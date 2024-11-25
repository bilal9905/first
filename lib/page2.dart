import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Page2 extends StatefulWidget {
   Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  TimeOfDay? _selectedTime;
  Future<void> _pickTime() async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime != null) {
      setState(() {
        _selectedTime = pickedTime;
      });
    }
  }
  DateTime? _selectedDate;
  double _currentValue=0;
  RangeValues _currentValues = RangeValues(20, 80);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 10,),
            Container(
                margin: EdgeInsets.all(10),
                child: Text('Setting of the App ',style: TextStyle(color: Colors.white),)),
            Container(
              height: 100,
              width: 400,
              margin: EdgeInsets.only(right: 30,left: 30,bottom: 10),
              decoration: BoxDecoration(
                color: Colors.grey.shade900,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  SizedBox(height: 5),
                  Text(
                    'Level of Audio in applcation\n $_currentValue',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                  Slider(
                    activeColor: Colors.pink,
                    inactiveColor: Colors.pink[200],
                    value: _currentValue,
                    min: 0,
                    max: 100,
                    divisions: 10,
                    label: _currentValue.toStringAsFixed(1),
                    onChanged: (value) {
                      setState(() {
                        _currentValue = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            Container(
              height: 100,
              width: 400,
              margin: EdgeInsets.only(right: 30,left: 30,bottom: 10),
              decoration: BoxDecoration(
                color: Colors.grey.shade900,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  SizedBox(height: 5),
                  Text(
                    'Number of posts in home page\n ${_currentValues.start.toStringAsFixed(1)} - ${_currentValues.end.toStringAsFixed(1)}',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                  RangeSlider(
                    activeColor: Colors.pink,
                    inactiveColor: Colors.pink[200],
                    values: _currentValues,
                    min: 0,
                    max: 100,
                    divisions: 10,
                    labels: RangeLabels(
                      _currentValues.start.toStringAsFixed(1),
                      _currentValues.end.toStringAsFixed(1),
                    ),
                    onChanged: (RangeValues values) {
                      setState(() {
                        _currentValues = values;
                      });
                    },
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
                child: Text('select the date and time to close the application ',style: TextStyle(color: Colors.white),)),
            Container(
              height: 120,
              width: 400,
              margin: EdgeInsets.only(right: 30, left: 30, bottom: 10),
              decoration: BoxDecoration(
                color: Colors.grey.shade900,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 5),
                  Text(
                    'Selected Date\n${_selectedDate != null ? _selectedDate!.toLocal().toString().split(' ')[0] : "No date chosen"}',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 10),
                  TextButton(
                    onPressed: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                      );
                      if (pickedDate != null) {
                        setState(() {
                          _selectedDate = pickedDate;
                        });
                      }
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.pink,
                      foregroundColor:  Colors.white,
                    ),
                    child: Text("Select Date"),
                  ),
                ],
              ),
            ),
            Container(
              height: 120,
              width: 400,
              margin: EdgeInsets.only(right: 30, left: 30, bottom: 10),
              decoration: BoxDecoration(
                color: Colors.grey.shade900,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Selected Time:\n${_selectedTime != null ? _selectedTime!.format(context) : 'No Time Selected'}',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink,
                      foregroundColor:  Colors.pink,
                    ),
                    onPressed: _pickTime,
                    child: Text(
                      'Pick a Time',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
// RangeSlider(
// activeColor: Colors.pink,
// inactiveColor: Colors.pink[200],
// values: _currentValues,
// min: 0,
// max: 100,
// divisions: 10,
// labels: RangeLabels(
// _currentValues.start.toStringAsFixed(1),
// _currentValues.end.toStringAsFixed(1),
// ),
// onChanged: (RangeValues values) {
// setState(() {
// _currentValues = values;
// });
// },
// ),
