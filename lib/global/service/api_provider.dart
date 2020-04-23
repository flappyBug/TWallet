import 'package:built_value/serializer.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:tw_wallet_ui/global/common/get_it.dart';
import 'package:tw_wallet_ui/global/service/api_response.dart';
import 'package:tw_wallet_ui/models/api_response.dart';
import 'package:tw_wallet_ui/models/contract.dart';
import 'package:tw_wallet_ui/models/transaction.dart';
import 'package:tw_wallet_ui/models/tw_balance.dart';

class ApiProvider {
  ApiProvider();

  final Dio _dio = getIt<Dio>();

  Future<TwBalance> fetchPointV1({@required String address}) async {
    return _dio.get('/v1/tw-points/' + address).then((response) {
      return Future.value(
          ApiResponseNew.fromJson(response.data, [FullType(TwBalance)]).result);
    });
  }

  Future<ContractModel> fetchContractAbiV1(
      {@required String contractName}) async {
    return _dio.get('/v1/contracts/$contractName').then((response) {
      final ApiResponse data = ApiResponse.fromJson(response.data);
      return Future.value(ContractModel.fromJson(data.result));
    });
  }

  Future<Response> identityRegister(String name, String publicKey,
      String address, String did, String signedRawTx) {
    return _dio.post('/v1/identities', data: {
      'name': name,
      'publicKey': publicKey,
      'address': address,
      'did': did,
      'signedTransactionRawData': signedRawTx
    });
  }

  Future<Response> transferPoint(
      String fromAddress, String publicKey, String signedRawTx) {
    return _dio.post('/v1/tw-points/transfer', data: {
      'fromAddress': fromAddress,
      'fromPublicKey': publicKey,
      'signedTransactionRawData': signedRawTx
    });
  }

  Future<List<Transaction>> listTx(String fromAddress) async {
    final resp = await _dio.get("/v1/transactions?from_addr=" + fromAddress);
    final ApiResponse<List<dynamic>> data =
        ApiResponse<List<dynamic>>.fromJson(resp.data);
    return Future(
        () => data.result.map((tx) => Transaction.fromJson(tx)).toList());
  }

  Future<Transaction> fetchTxDetails({@required String txHash}) async {
    final resp = await _dio.get('/v1/transactions/' + txHash);
    final ApiResponse data = ApiResponse.fromJson(resp.data);
    return data.result;
  }
}
