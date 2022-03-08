import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_firebase_chat_core/flutter_firebase_chat_core.dart';
import 'package:tw_wallet_ui/common/theme/color.dart';
import 'package:tw_wallet_ui/views/home/my/chat.dart';
import 'package:tw_wallet_ui/views/home/my/util.dart';
import 'package:tw_wallet_ui/widgets/layouts/common_layout.dart';

class UsersPage extends StatefulWidget {
  @override
  _UsersPageState createState() => new _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  final TextEditingController _controller = new TextEditingController();
  String _searchText = "";

  _UsersPageState() {
    _controller.addListener(() {
      if (_controller.text.isEmpty) {
        setState(() {
          _searchText = "";
        });
      } else {
        setState(() {
          _searchText = _controller.text;
        });
      }
    });
  }

  void _handlePressed(types.User otherUser, BuildContext context) async {
    final room = await FirebaseChatCore.instance.createRoom(otherUser);

    Navigator.of(context).pop();
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ChatPage(
          room: room,
        ),
      ),
    );
  }

  Widget _buildAvatar(types.User user) {
    final color = getUserAvatarNameColor(user);
    final hasImage = user.imageUrl != null;
    final name = getUserName(user);

    return Container(
      margin: const EdgeInsets.only(right: 16),
      child: CircleAvatar(
        backgroundColor: hasImage ? Colors.transparent : color,
        backgroundImage: hasImage ? NetworkImage(user.imageUrl!) : null,
        radius: 20,
        child: !hasImage
            ? Text(
                name.isEmpty ? '' : name[0].toUpperCase(),
                style: const TextStyle(color: Colors.white),
              )
            : null,
      ),
    );
  }

  Widget _emptyUserList() {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(
        bottom: 200,
      ),
      child: Text(
        '暂无用户，请搜索用户名',
        style: TextStyle(
          color: WalletColor.lightGrey,
          fontSize: 9,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WalletColor.messageBg,
      appBar: AppBar(
        backgroundColor: WalletColor.primary,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        title: TextField(
          controller: _controller,
          style: const TextStyle(
            color: Colors.white,
          ),
          decoration: const InputDecoration(
              prefixIcon: const Icon(Icons.search, color: Colors.white),
              hintText: "搜索...",
              hintStyle: const TextStyle(color: Colors.white)),
        ),
      ),
      body: StreamBuilder<List<types.User>>(
        stream: FirebaseChatCore.instance.users(),
        initialData: const [],
        builder: (context, snapshot) {
          if (!snapshot.hasData ||
              snapshot.data!.isEmpty ||
              _searchText.isEmpty) {
            return _emptyUserList();
          }
          final result = snapshot.data!
              .where(
                (element) => element.firstName!
                    .toLowerCase()
                    .contains(_searchText.toLowerCase()),
              )
              .toList();
          if (result.isEmpty) {
            return _emptyUserList();
          }

          return ListView.builder(
            itemCount: result.length,
            itemBuilder: (context, index) {
              final user = result[index];

              return GestureDetector(
                onTap: () {
                  _handlePressed(user, context);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 15,
                  ),
                  child: Row(
                    children: [
                      _buildAvatar(user),
                      Text(
                        getUserName(user),
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: WalletColor.white,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
