import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tw_wallet_ui/common/theme/color.dart';
import 'package:tw_wallet_ui/common/theme/index.dart';
import 'package:tw_wallet_ui/models/dcep/dcep.dart';
import 'package:tw_wallet_ui/models/identity/decentralized_identity.dart';
import 'package:tw_wallet_ui/store/identity_store.dart';
import 'package:tw_wallet_ui/views/home/home.dart';
import 'package:tw_wallet_ui/views/home/home_store.dart';
import 'package:tw_wallet_ui/widgets/hint_dialog.dart';
import 'package:tw_wallet_ui/widgets/layouts/common_layout.dart';

class BlePaymentHome extends StatefulWidget {
  final HomeStore homeStore;

  const BlePaymentHome(this.homeStore);

  @override
  State<StatefulWidget> createState() => _BlePaymentHomeState();
}

class _BlePaymentHomeState extends State<BlePaymentHome> {
  final Rx<DcepType> _redeemType = Rx(DcepType.rmb100);

  @override
  void initState() {
    super.initState();
  }

  Widget _buildAddIdentityCard(BuildContext context, HomeStore homeStore) {
    final ScreenUtil _screenUtil = ScreenUtil();

    return Container(
      margin: EdgeInsets.only(
          left: _screenUtil.setWidth(24).toDouble(),
          right: _screenUtil.setWidth(24).toDouble(),
          top: _screenUtil.setHeight(10).toDouble(),
          bottom: _screenUtil.setHeight(147).toDouble()),
      padding: EdgeInsets.only(
          left: _screenUtil.setWidth(20).toDouble(),
          right: _screenUtil.setWidth(20).toDouble(),
          top: _screenUtil.setHeight(90).toDouble(),
          bottom: _screenUtil.setHeight(46).toDouble()),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SvgPicture.asset(
            'assets/icons/new-identity.svg',
          ),
          Column(
            children: const <Widget>[
              Text("您还没有添加身份",
                  style: TextStyle(
                    color: Color(0xff111111),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    letterSpacing: 0,
                  )),
              Text("请前往“身份”页面添加身份。",
                  style: TextStyle(
                    color: Color(0xff111111),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    letterSpacing: 0,
                  )),
            ],
          ),
          WalletTheme.button(
            text: '立即前往',
            height: 44,
            onPressed: () {
              Navigator.pop(context);
              homeStore.currentPage = HomeState.identityIndex;
            },
          ),
        ],
      ),
    );
  }

  Widget _buildMainPage(DecentralizedIdentity identity) {
    return Container(
      color: WalletColor.white,
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Obx(() => DropdownButton(
                  value: _redeemType.value,
                  items: DcepType.values
                      .map((type) => DropdownMenuItem(
                          value: type, child: Text(type.humanReadable)))
                      .toList(),
                  onChanged: (DcepType value) {
                    _redeemType.value = value;
                  },
                )),
            WalletTheme.button(
              text: '兑换',
              height: 28,
              onPressed: () => identity
                  .redeemDcep(_redeemType.value)
                  .then((_) => showDialogSimple(DialogType.success, '兑换成功')),
            ),
          ]),
        )
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CommonLayout(
        title: '离线支付演示',
        child: Get.find<IdentityStore>()
            .selectedIdentity
            .map((identity) => _buildMainPage(identity))
            .orElse(_buildAddIdentityCard(context, widget.homeStore)));
  }
}
