import 'package:flutter/material.dart';
import 'package:tw_wallet_ui/global/common/theme.dart';
import 'package:tw_wallet_ui/global/widgets/page_title.dart';

class CommonLayout extends StatelessWidget {
  final Widget child;
  final bool withBottomBtn;
  final String btnText;
  final Function btnOnPressed;
  final String title;
  final String bodyBackColor;
  final BackIcon backIcon;

  CommonLayout({
    this.child,
    this.withBottomBtn = false,
    this.btnText = '完成',
    this.btnOnPressed,
    this.title,
    this.bodyBackColor = '#f2f2f2',
    this.backIcon = BackIcon.CLOSE,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: WalletTheme.rgbColor(bodyBackColor),
      appBar: AppBar(
        backgroundColor: WalletTheme.rgbColor('#fafafa'),
        brightness: Brightness.light,
        title: PageTitleWidget(title: title, backIcon: backIcon),
        textTheme: Theme.of(context).textTheme.apply(
            bodyColor: Colors.black,
            displayColor: Colors.black,
            decorationColor: Colors.black),
        automaticallyImplyLeading: false,
        elevation: 0,
        centerTitle: true,
        titleSpacing: 0.0,
      ),
      body: SafeArea(
          maintainBottomViewPadding: true,
          child: LayoutBuilder(
              builder: (context, constraints) => Container(
                  color: WalletTheme.rgbColor(bodyBackColor),
                  child: Column(
                    children: <Widget>[
                      Expanded(child: child),
                      withBottomBtn
                          ? Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: constraints.maxHeight / 20),
                              width: constraints.maxWidth * 0.7,
                              child: WalletTheme.button(
                                  text: btnText, onPressed: btnOnPressed),
                            )
                          : Container()
                    ],
                  )))),
    );
  }
}
