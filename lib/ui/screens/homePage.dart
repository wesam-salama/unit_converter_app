import 'package:flutter/material.dart';
import 'package:unit_converter_app/constant.dart';
import 'package:unit_converter_app/ui/screens/firstHalf.dart';
import 'package:unit_converter_app/ui/screens/floatingActionButton.dart';
import 'package:unit_converter_app/ui/screens/secoundHalf.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String result = '0';

  String fromCurrency = 'USD';

  String toCurrency = 'USD';

  int value = 0;
  Map mainMap = unitMap;

  getMap(Map value) {
    this.mainMap = value;
    setState(() {});
  }

  setfromCurrency(String value1) {
    this.fromCurrency = value1;
    calculate();
  }

  settoCurrency(String value1) {
    this.toCurrency = value1;
    calculate();
  }

  setTextFiled(String value1) {
    this.value = int.parse(value1);
  }

  calculate() {
    result = '${(mainMap[fromCurrency] / mainMap[toCurrency]) * value}';
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    print(mainMap[fromCurrency]);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Unit Converter')),
          backgroundColor: Colors.red,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,

        //Init Floating Action Bubble
        floatingActionButton: FloatingActionButtonWidget(getMap),
        body: Column(
          children: <Widget>[
            Expanded(
                child: FirstScreen(
                    setfromCurrency, settoCurrency, setTextFiled, mainMap)),
            Expanded(child: SecoundScreen(result)),
          ],
        ),
      ),
    );
  }
}
