import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:tw_wallet_ui/global/common/theme.dart';
import 'package:tw_wallet_ui/views/home/assets/point_tab.dart';
import 'package:tw_wallet_ui/views/home/assets/token_tab.dart';

import 'assets_store.dart';

class AssetsPage extends StatefulWidget {
  const AssetsPage({this.store});

  final AssetsStore store;

  @override
  State<StatefulWidget> createState() => _AssetsPageState(store: store);
}

class _AssetsPageState extends State<AssetsPage>
    with SingleTickerProviderStateMixin {
  _AssetsPageState({this.store});

  final AssetsStore store;
  final Map<AssetsType, String> _tabs = {
    AssetsType.point: '积分',
    AssetsType.token: '资产'
  };

  TabController _tabController;

  void _onTabChange() {
    // store.loadAssets(_tabs.keys.toList()[_tabController.index]);
  }

  @override
  void initState() {
    _tabController = TabController(length: _tabs.length, vsync: this)
      ..addListener(_onTabChange);
    // store.loadAssets(_tabs.keys.first);
    super.initState();
  }

  Widget buildHeader() {
    if (store.currentIdentity == null) {
      return Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
        Expanded(child: Container()),
        PopupMenuButton(
          icon: Icon(Icons.apps),
          itemBuilder: (BuildContext context) {
            return [PopupMenuItem(child: Text('老钱'))];
          },
        ),
      ]);
    }

    return Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
      Container(
        padding: EdgeInsets.all(15),
        child: CircleAvatar(
          backgroundImage: AssetImage('assets/images/avatar.jpg'),
        ),
      ),
      SizedBox(width: 10),
      Observer(builder: (_) {
        final future = store.currentIdentity;
        return Text(
            future.status == FutureStatus.fulfilled ? future.result.name : '');
      }),
      Expanded(child: Container()),
      PopupMenuButton(
        icon: Icon(Icons.apps),
        itemBuilder: (BuildContext context) {
          return [PopupMenuItem(child: Text('老钱'))];
        },
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: WalletTheme.rgbColor('fafafa'),
        child: Column(children: <Widget>[
          buildHeader(),
          TabBar(
              labelColor: Colors.blue,
              unselectedLabelColor: Colors.grey,
              controller: _tabController,
              tabs: _tabs.values.map((t) => Tab(text: t)).toList()),
          Expanded(
              child: Container(
                  color: WalletTheme.mainBgColor,
                  child: TabBarView(
                    controller: _tabController,
                    children: [PointTab(store: store), TokenTab(store: store)],
                  ))),
        ]));
  }
}
