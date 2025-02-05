import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tw_wallet_ui/common/application.dart';
import 'package:tw_wallet_ui/common/theme/color.dart';
import 'package:tw_wallet_ui/common/theme/font.dart';
import 'package:tw_wallet_ui/router/routers.dart';
import 'package:tw_wallet_ui/service/progress_dialog.dart';
import 'package:tw_wallet_ui/store/identity_store.dart';
import 'package:tw_wallet_ui/store/mnemonics.dart';
import 'package:tw_wallet_ui/views/backup_mnemonics/widgets/tips.dart';
import 'package:tw_wallet_ui/widgets/hint_dialog.dart';
import 'package:tw_wallet_ui/widgets/layouts/common_layout.dart';

class RestoreMnemonicsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => RestoreMnemonicsPageState();
}

class RestoreMnemonicsPageState extends State<RestoreMnemonicsPage> {
  final RxList<String> _inputWords = RxList([]);
  final RxBool _restoreFailed = false.obs;

  bool get _isValidInput => _inputWords.length == 12;

  Widget buildInfoTipButton() {
    return Positioned(
      top: -6,
      right: 0,
      child: GestureDetector(
        onTap: () => hintDialogHelper(
          context,
          DialogType.none,
          '使用纸和笔正确抄写助记词。\n请勿将助记词告诉任何人，妥善保管至隔离网络的安全地方。\n如果您的手机丢失、被盗、损坏，助记词可以恢复您的资产。',
          title: '备份提示',
        ),
        child: const Image(
          image: AssetImage('assets/images/info-black.png'),
          width: 40,
          height: 40,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ScreenUtil screenUtil = ScreenUtil();

    return Obx(
      () => CommonLayout(
        withBottomBtn: true,
        btnOnPressed: _isValidInput
            ? () async {
                final ProgressDialog progressDialog = Get.find();
                progressDialog.show();
                try {
                  final MnemonicsStore mnemonicsStore = Get.find();
                  mnemonicsStore.brandNew(mnemonics: _inputWords.join(' '));
                  Get.find<IdentityStore>().restore().then((maxIndex) {
                    mnemonicsStore.save(newIndex: maxIndex);
                  }).then((_) {
                    progressDialog.dismiss();
                    Application.router
                        .navigateTo(context, Routes.home, clearStack: true);
                  });
                } catch (_) {
                  _restoreFailed.value = true;
                  progressDialog.dismiss();
                }
              }
            : null,
        bottomBackColor: WalletColor.white,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: WalletColor.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
          ),
          child: ListView(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(top: 40),
                child: Center(
                  child: Stack(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: Text('输入助记词', style: WalletFont.font_20()),
                      ),
                      // buildInfoTipButton()
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: screenUtil.setWidth(40),
                  bottom: screenUtil.setWidth(24),
                  left: screenUtil.setWidth(24),
                  right: screenUtil.setWidth(24),
                ),
                child: Center(
                  child: Text(
                    '请输入您在创建钱包时备份的助记词。正确输入后，钱包将被恢复。',
                    style: WalletFont.font_14(),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: screenUtil.setWidth(24),
                ),
                child: Container(
                  height: screenUtil.setHeight(162),
                  decoration: BoxDecoration(
                    color: WalletColor.lightGrey,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: TextField(
                      autofocus: true,
                      style: WalletFont.font_16(
                        textStyle: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      maxLength: 320,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                          RegExp("[a-zA-Z ]"),
                        )
                      ],
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        counterText: '',
                      ),
                      onChanged: (String value) => _inputWords.assignAll(
                        value
                            .trim()
                            .split(' ')
                            .where((e) => e.isNotEmpty)
                            .toList(),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: screenUtil.setWidth(24),
                ),
                child: _restoreFailed.value
                    ? const Tips('恢复失败，请稍后再试')
                    : Container(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
