

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'inputformart/CurrencyTextInputFormatter.dart';
import 'inputformart/DateInputFormatter.dart';
import 'inputformart/MaskTextInputFormatter.dart';
import 'inputformart/ThousandsFormatter.dart';
import 'inputformart/formart1/formatter.dart';
import 'inputformart/formart2/multi_masked_formatter.dart';
import 'inputformart/text_input_formatter_card.dart';

class FormatPage extends StatelessWidget {
  const FormatPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 40,),
            Container(
                width: double.infinity,
                height: 50,
                color: Colors.amber,
                child: TextField(
                  inputFormatters: [
                    TextInputFormatterCard()
                  ],
                  decoration: const InputDecoration(
                      hintText: "每四位数字加空格"
                  ),
                )
            ),
            const SizedBox(height: 10,),
            Container(
                width: double.infinity,
                height: 50,
                color: Colors.amber,
                child: TextField(
                  inputFormatters: [
                    MaskTextInputFormatter(
                        mask: '+# (###) ###-##-##',
                        filter: { "#": RegExp(r'[0-9]') },
                        type: MaskAutoCompletionType.lazy
                    )
                  ],
                  decoration: const InputDecoration(
                      hintText: "MaskTextInputFormatter"
                  ),
                )
            ),
            const SizedBox(height: 10,),
            Container(
                width: double.infinity,
                height: 50,
                color: Colors.amber,
                child: TextField(
                  inputFormatters: [
                    CurrencyTextInputFormatter()
                  ],
                  decoration: const InputDecoration(
                      hintText: "CurrencyTextInputFormatter"
                  ),
                )
            ),
            const SizedBox(height: 10,),
            TextField(
              inputFormatters: [
                DateInputFormatter()
              ],
              decoration: const InputDecoration(
                  hintText: "23/16/2024 "
              ),
            ),
            const SizedBox(height: 10,),
            TextField(
              maxLines: 1,
              inputFormatters: [
                ThousandsFormatter()
              ],
              decoration: const InputDecoration(
                  hintText: "111,111,111"
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 10,),
            TextField(
              inputFormatters: [
                NumberTextInputFormatter(
                  integerDigits: 10,
                  decimalDigits: 2,
                  maxValue: '1000000000.00',
                  decimalSeparator: '.',
                  groupDigits: 3,
                  groupSeparator: ',',
                  allowNegative: false,
                  overrideDecimalPoint: true,
                  insertDecimalPoint: false,
                  insertDecimalDigits: true,
                ),
              ],
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  hintText: "输入小数"
              ),
            ),
            TextField(
              inputFormatters: [NewCurrencyTextInputFormatter()],
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  hintText: "输入两位小数"
              ),
            ),

            TextField(
              inputFormatters: [PercentageTextInputFormatter(integerDigits: 5)],
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  hintText: "输入整数"
              ),
            ),
            TextField(
              inputFormatters: [
                MultiMaskedTextInputFormatter(
                    masks: ['xx-xxxx-xxxx', 'xx-xxx-xxxx'], separator: '-')
              ],
              autofocus: true,
              keyboardType: TextInputType.number,
              decoration:
              const InputDecoration(
                  labelText: '自定义输入内容格式',
                  hintText: '10-123-4567 or 10-1234-5678'),
            )
          ],
        ),
      ),
    );
  }

}