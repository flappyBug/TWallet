import 'package:get/get.dart';
import 'package:tw_wallet_ui/models/dcep/dcep.dart';
import 'package:tw_wallet_ui/service/api_provider.dart';
import 'package:tw_wallet_ui/service/contract.dart';
import 'package:tw_wallet_ui/store/identity_store.dart';
import 'package:web3dart/web3dart.dart';

const dcepPrefix = 'dcep';

class DcepStore {
  String owner;
  final RxList<Dcep> items = RxList([]);

  Future<void> refresh() {
    return Get.find<ApiProvider>().fetchTokenV2(owner).then((res) {
      res.ifPresent((list) async {
        items.value = list;
      });
    });
  }

  DcepStore() {
    Get.find<IdentityStore>()
        .selectedIdentityStream
        .listen((identity) => _updateOwner(identity.address));

    Get.find<ContractService>().nftTokenContract.eventStream('TransferSingle',
        (results) {
      final EthereumAddress from = results[1] as EthereumAddress;
      final EthereumAddress to = results[2] as EthereumAddress;
      if (from.toString().toLowerCase() == owner ||
          to.toString().toLowerCase() == owner) {
        refresh();
      }
    });
  }

  void clear() {
    items.clear();
  }

  void _updateOwner(String newOwner) {
    owner = newOwner.toLowerCase();
    refresh();
  }
}
