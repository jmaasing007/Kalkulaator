import 'package:flutter/material.dart';


class KmtomilesScreen extends StatefulWidget {
  const KmtomilesScreen({Key? key}) : super(key: key);

  @override
  State<KmtomilesScreen> createState() => _KmtomilesScreenState();
}

class _KmtomilesScreenState extends State<KmtomilesScreen> {
  late double _numberFrom;
  late String _startMeasure;
  late String _endMeasure;
  final List<String> _measures = [
    'meters',
    'kilometers',
    'grams',
    'kilograms',
    'feet',
    'miles',
    'pounds',
    'ounces',
  ];

  @override
  void initState(){
    _numberFrom = 0;
    _startMeasure = _measures[1];
    _endMeasure = _measures[5];
    super.initState();
  }
  double convert (double value, String from, String to){
    switch(from){
      case'kilometers':
        switch(to){
          case 'miles':
            return value * 0.621371;
            default:
             return value;
        }
        case 'miles':
          switch(to){
            case 'kilometers':
              return value * 1.60934;
            default:
              return value;
      }
      default:
        return value;
    }
  }
  @override
  Widget build(BuildContext context) {
    double sizeY = MediaQuery.of(context).size.height;
    final spacer = Padding(padding: EdgeInsets.only(bottom: sizeY / 40));
    final TextStyle inputStyle = TextStyle(
      fontSize: 20,
      color:  Colors.blue[900],
    );
    final TextStyle labelStyle = TextStyle(
      fontSize: 24,
      color: Colors.grey[700],
    );
    return Scaffold
        (
        appBar: AppBar(title: const Text('Km to Miles Converter'),
          centerTitle: true,
        ),
    body: Center(
      child: Column(
        children: [
          spacer,
          Text("Value", style: inputStyle),
          TextField(
            textAlign: TextAlign.center,
            decoration: const InputDecoration(
              hintText: "Please enter the values you want to convert",
            ),
            onChanged: (text) {
              var rv = double.tryParse(text);
              if (rv !=null){
                setState(() {
                  _numberFrom =rv;
                });
              }
            },
          ),
          spacer,
          // ignore: unnecessary_null_comparison
          Text((_numberFrom==null)? ' ' : _numberFrom.toString()),
          spacer,
          Text("From",
          style: labelStyle,
          ),
          DropdownButton(
            isExpanded: true,
            value: _startMeasure,
              items: _measures.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value,style: inputStyle),
                  );
                }).toList(),
                     onChanged: (value) {
                       assert(value != null);
                      setState(() {
                      _startMeasure =value!;
                    });
                },
            ),
          spacer,
          Text(
            "To",
            style: labelStyle,
          ),
          DropdownButton(
            isExpanded: true,
            value: _endMeasure,
            items: _measures.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                  child: Text(value,style: inputStyle),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                _startMeasure = value!;
              });
            },
          ),
          spacer,
          ],
        ),
      ),
    );
  }

}
