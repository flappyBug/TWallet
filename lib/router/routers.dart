import 'dart:io';

import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:tw_wallet_ui/router/router_handler.dart';

class Routes {
  static const String home = "/home";
  static const String inputPin = "/input_pin";
  static const String newWallet = "/new_wallet";
  static const String magicLinkLogin = '/login/magic_link_login_page';
  static const String web3authLogin = '/login/web3auth_login_page';
  static const String newIdentity = "/new_identity";
  static const String backupMnemonics = "/backup_mnemonics";
  static const String confirmMnemonics = "/confirm_mnemonics";
  static const String restoreMnemonics = "/restore_mnemonics";
  static const String profile = "/profile";
  static const String transferTwPoints = '/transfer_tw_points';
  static const String txList = "/tx_list";
  static const String txListDetails = "/tx_list_details";
  static const String transferConfirm = '/transfer_confirm';
  static const String certificate = '/certificate';
  static const String identityDetail = '/identity';
  static const String qrPage = '/identity/qr';
  static const String qrScanner = '/qr_scanner';
  static const String healthCode = '/health_code';
  static const String healthCertPage = '/dapp/health_cert';
  static const String messagePage = '/dapp/message';
  static const String chatDetailPage = '/dapp/chatDetail';
  static const String dapp = '/dapp';
  static const String ownVcPage = '/ssi/vc';
  static const String composeVcPage = '/ssi/compose_vc_page';
  static const String passPage = '/ssi/pass_page';
  static const String applyVcPage = '/ssi/apply_vc_page';
  static const String verificationScenarioPage =
      '/ssi/verification_scenario_page';
  static const String verificationScenarioQrPage =
      '/ssi/verification_scenario_page/qr';
  static const String newVcPage = '/ssi/new_vc_page';

  static final Map<String, Handler> routers = {
    home: homeHandler,
    inputPin: inputPinHandler,
    newWallet: newWalletHandler,
    magicLinkLogin: magicLoginPageHandler,
    web3authLogin: web3authLoginPageHandler,
    newIdentity: newIdentityHandler,
    backupMnemonics: backupMnemonicsHandler,
    confirmMnemonics: confirmMnemonicsHandler,
    restoreMnemonics: restoreMnemonicsHandler,
    profile: profileHandler,
    transferTwPoints: transferTwPointsHandler,
    txList: txListHandler,
    txListDetails: txListDetailsHandler,
    transferConfirm: transferConfirmHandler,
    certificate: certificateHandler,
    qrPage: qrPageHandler,
    qrScanner: qrScannerHandler,
    healthCode: healthCodeHandler,
    healthCertPage: healthCertificationPageHandler,
    identityDetail: identityDetailHandler,
    dapp: dappHandler,
    ownVcPage: ownVcPageHandler,
    composeVcPage: composeVcPageHandler,
    passPage: passPageHandler,
    applyVcPage: applyVcPageHandler,
    verificationScenarioPage: verificationScenarioPageHandler,
    verificationScenarioQrPage: verificationScenarioQrPageHandler,
    newVcPage: newVcPageHandler,
    messagePage: messagePageHandler,
    chatDetailPage: chatDetailPageHandler,
  };

  static void configureRoutes(FluroRouter router) {
    final TransitionType transitionType =
        Platform.isIOS ? TransitionType.cupertino : TransitionType.material;

    routers.forEach(
      (p, h) => router.define(p, handler: h, transitionType: transitionType),
    );
    router.notFoundHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
        return null;
      },
    );
  }
}
