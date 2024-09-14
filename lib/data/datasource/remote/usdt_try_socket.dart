
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sisterslabsecond/data/model/TradeModel.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class UsdtTrySocket extends ChangeNotifier {
  late WebSocketChannel channel;
  late TradeModel trade = TradeModel();


  void connect() {
    channel = WebSocketChannel.connect(Uri.parse('wss://stream.binance.com:9443/ws/usdttry@trade'));
    channel.stream.listen((message) {
      TradeModel tradeModel = TradeModel.fromJson(json.decode(message));
      trade = tradeModel;
      notifyListeners();
    });
  }

  @override
  void dispose() {
    channel.sink.close();
    super.dispose();
  }
}