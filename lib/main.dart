import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sisterslabsecond/data/datasource/remote/btc_usdt_socket.dart';
import 'package:sisterslabsecond/data/datasource/remote/eu_try_socket.dart';
import 'package:sisterslabsecond/data/datasource/remote/usdt_try_socket.dart';

void main() {
  runApp(MyView());
}

class MyView extends StatefulWidget {
  const MyView({super.key});

  @override
  State<MyView> createState() {
    return _MyViewState();
  }
}

class _MyViewState extends State<MyView> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BtcUsdtSocket()..connect()),
        ChangeNotifierProvider(create: (_) => UsdtTrySocket()..connect()),
        ChangeNotifierProvider(create: (_) => EuTrySocket()..connect()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text('BTC/USDT Live Price'),
          ),
          body: const SocketScreen(),
        ),
      ),
    );
  }
}

class SocketScreen extends StatelessWidget {
  const SocketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var btcUsdtSocket = Provider.of<BtcUsdtSocket>(context);
    var usdtTrySocket = Provider.of<UsdtTrySocket>(context);
    var euTrySocket = Provider.of<EuTrySocket>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(),
        Text("${btcUsdtSocket.trade.s} ${btcUsdtSocket.trade.p}"),
        Text("${usdtTrySocket.trade.s} ${usdtTrySocket.trade.p}"),
        Text("${euTrySocket.trade.s} ${euTrySocket.trade.p}"),
        const SizedBox(
          height: 100,
        ),
      ],
    );
  }
}
