import 'package:flutter/material.dart';
import 'package:tw_wallet_ui/common/theme/color.dart';
import 'package:tw_wallet_ui/common/theme/font.dart';
import 'package:tw_wallet_ui/models/amount.dart';
import 'package:tw_wallet_ui/models/tx_status.dart';

class ColorMoneyText extends StatelessWidget {
  final Amount amount;
  final TxStatus status;
  final bool isExpense;
  final TextStyle? textStyle;

  const ColorMoneyText(
      {required this.amount,
      required this.status,
      required this.isExpense,
      this.textStyle});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: amount.humanReadableWithSign,
        style: textStyle != null
            ? textStyle!.merge(TextStyle(color: _toColor(status)))
            : WalletFont.font_18(
                textStyle: TextStyle(color: _toColor(status)),
              ),
      ),
    );
  }

  Color _parseSucceededColor() {
    // expense -> red, or blue
    return isExpense ? WalletColor.accent : WalletColor.blue;
  }

  Color _toColor(TxStatus status) {
    final _statusColorMap = {
      TxStatus.succeeded: _parseSucceededColor(),
      TxStatus.transferring: _parseSucceededColor(),
      TxStatus.failed: _parseSucceededColor(),
    };
    return _statusColorMap[status]!;
  }
}
