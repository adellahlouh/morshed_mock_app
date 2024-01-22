import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InteractionBottomSheetWidget extends StatefulWidget {
  InteractionBottomSheetWidget({super.key});

  @override
  State<InteractionBottomSheetWidget> createState() =>
      _InteractionBottomSheetWidgetState();
}

class _InteractionBottomSheetWidgetState
    extends State<InteractionBottomSheetWidget> {
  final List<String> callOutcomeList = [
    'Busy',
    'Connected',
    'Left live message',
    'Left voicemail',
    'No answer',
    'Wrong number',
  ];

  List<String> callTypeList = [
    'Call - student',
    'Call - parent',
    'Message - student',
    'Message - parent',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(end: 4),
      child: Scrollbar(
        thumbVisibility: true,
        trackVisibility: true,
        radius: const Radius.circular(8),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                const SizedBox(
                  width: double.infinity,
                  height: 32,
                ),
                const Text('Call outcome dropdown'),
                const SizedBox(
                  width: double.infinity,
                  height: 6,
                ),
                DropdownButtonExample(
                  list: callOutcomeList,
                ),
                const SizedBox(
                  height: 16,
                ),
                const Text('Call Type'),
                const SizedBox(
                  width: double.infinity,
                  height: 6,
                ),
                DropdownButtonExample(
                  list: callTypeList,
                ),
                const SizedBox(
                  height: 16,
                ),
                const Text('Date Time'),
                const SizedBox(
                  width: double.infinity,
                  height: 6,
                ),
                DatePickerWidget(),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      )),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Submit',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DropdownButtonExample extends StatefulWidget {
  final List<String> list;

  const DropdownButtonExample({Key? key, required this.list}) : super(key: key);

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dropdownValue = widget.list.first;
  }

  String dropdownValue = 'Select Option';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.blue),
          color: Colors.white),
      child: DropdownButton<String>(
        value: dropdownValue,
        icon: const Icon(Icons.arrow_drop_down, color: Colors.blue),
        isExpanded: true,
        elevation: 16,
        style: const TextStyle(color: Colors.black, fontSize: 16),
        underline: const SizedBox(),
        onChanged: (String? value) {
          // This is called when the user selects an item.
          setState(() {
            dropdownValue = value!;
          });
        },
        items: widget.list.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}

class DatePickerWidget extends StatefulWidget {
  @override
  _DatePickerWidgetState createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Colors.white,
        border: Border.all(
          color: Colors.blue,
          width: 1,
        ),
      ),
      child: ElevatedButton(
        onPressed: () => _selectDate(context),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.white),
          overlayColor: MaterialStateProperty.all(Colors.white),
          foregroundColor: MaterialStateProperty.all(Colors.white),
          shadowColor: MaterialStateProperty.all(Colors.white),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          )),
          minimumSize: MaterialStateProperty.all(const Size(
            double.infinity,
            50,
          )),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            '${DateFormat('yyyy-MM-dd').format(selectedDate)}',
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
