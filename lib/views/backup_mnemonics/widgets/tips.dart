import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tw_wallet_ui/common/theme/color.dart';
import 'package:tw_wallet_ui/common/theme/font.dart';

class Tips extends StatelessWidget {
  final String tipText;
  const Tips(this.tipText);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        color: WalletColor.accent.withOpacity(0.1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(right: 2),
            child: SvgPicture.asset('assets/icons/tips.svg'),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(top: 3),
              child: Text(
                tipText,
                style: WalletFont.font_12(
                  textStyle: TextStyle(
                    color: WalletColor.accent,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
