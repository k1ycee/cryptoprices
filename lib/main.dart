import 'package:crypto_prices/magic/bloc/crypto_bloc.dart';
import 'package:crypto_prices/magic/model/crypto_model.dart';
import 'package:crypto_prices/magic/services/crypto_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';



CryptRepo cryptRepo = CryptRepo();

void main(){
  runApp(MyApp(cryptRepo:cryptRepo));
}

class MyApp extends StatelessWidget {
  
  final CryptRepo cryptRepo;
  
  MyApp({this.cryptRepo});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: Text('CryptoExchange'),
          centerTitle: true,
          elevation: 0,
          ),
        body: BlocProvider(
          create: (context) => CryptoBloc(cryptRepo: cryptRepo)..add(FetchCrypto()),
          child: MyHomePage(),
      ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CryptoBloc,CryptoState>(
      builder: (context,state){
        if (state is CryptoInitial){
          return Center(
            child: SpinKitPouringHourglass(color: Colors.blueGrey, size: 70),
          );
        }
        if (state is CryptoError){
          return Center(
            child: Text("Couldn't fetch any data at this point in time :("),
          );
        }
        if (state is CryptoLoaded){
          return ListView.builder(
            itemCount: state.crypto.length,
            itemBuilder:(BuildContext context,int index){
              return Last(crypto: state.crypto[index],);
            });
        }
        return null;
      },
    );
  }
}

class Last extends StatelessWidget {
  final Crypto crypto;
  Last({this.crypto});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(crypto.symbol.toString()),
      title: Text(crypto.name.toString()),
      subtitle: Text(crypto.priceUsd.toString()),
      trailing: Text('${crypto.percentChange1H.toString()}%'),
    );
  }
}