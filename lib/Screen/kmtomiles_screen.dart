import 'package:flutter/material.dart';





class KmtomilesScreen extends StatefulWidget {
  const KmtomilesScreen({Key? key}) : super(key: key);

  @override
  State<KmtomilesScreen> createState() => _KmtomilesScreenState();
}

class _KmtomilesScreenState extends State<KmtomilesScreen> {
  double _numberFrom;
  String _startMeasure;
  String _endMeasure;
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
    super.initState();
  }
  Widget build(BuildContext context) {
    double sizeX = MediaQuery.of(context).size.width;
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
            decoration: InputDecoration(
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
                      setState(() {
                      _startMeasure =value;
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
                _startMeasure = value;
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
