import 'package:flutter/material.dart';
import 'package:unit_converter_app/ui/widgets/courrency_picker.dart';
import 'package:unit_converter_app/ui/widgets/text_filed.dart';

class FirstScreen extends StatelessWidget {
  Function setfromCurrency;
  Function settoCurrency;
  Function setTextFiled;

  Map mainMap;

  FirstScreen(this.setfromCurrency, this.settoCurrency, this.setTextFiled,
      this.mainMap);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(child: CurrencyPicker(setfromCurrency, mainMap)),
        Expanded(child: CurrencyTextFiled(setTextFiled)),
        Expanded(child: CurrencyPicker(settoCurrency, mainMap)),
      ],
    );
  }
}
