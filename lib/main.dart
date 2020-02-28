import 'package:crypto_prices/magic/model/crypto_model.dart';
import 'package:crypto_prices/magic/services/crypt_memory.dart';
// import 'package:crypto_prices/magic/services/crypto_repo.dart';
import 'package:crypto_prices/magic/services/crypto_call.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';



// CryptRepo cryptRepo = CryptRepo();


void main(){
  runApp(MyHomePage());
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       // theme: ThemeData.dark(),
//       home: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.blueAccent,
//           title: Text('Crypto Exchange'),
//           centerTitle: true,
//           elevation: 0.4,
//           actions: <Widget>[
//             IconButton(icon: Icon(Icons.refresh),onPressed: _apiGet,)
//           ],
//           ),

//         body:MyHomePage(),
//       ),
//     );

//   }

  
//   }


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static CryptMemory memory;
  bool isLoading = false;
  CryptoCall call = CryptoCall();


  @override
  void initState() {
    super.initState();
    CryptMemory.cryptMemory.fetchMemCrypto();
    call.fetchCrypto();

  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
          home: Scaffold(
            appBar: AppBar(
              title: Text('Crypto Exchange',),  
              centerTitle: true,
              elevation: 0,
              actions: <Widget>[
                IconButton(icon: Icon(Icons.refresh),onPressed: ()async{ _apiget();},)
              ],
              ),
              body: Container(
                child: FutureBuilder(
                    future: CryptMemory.cryptMemory.fetchMemCrypto(),
                    builder: (BuildContext context,AsyncSnapshot<List<Crypto>> snapshot){
                        if(!snapshot.hasData){
                          return Center(child: SpinKitDualRing(color: Colors.blue,size: 70,),);
                        }else{
                          return ListView.builder(
                            itemCount: snapshot.data.length,
                            itemBuilder: (BuildContext context,int index){
                                return ListTile(
                                  leading: Text(snapshot.data[index].symbol.toString(),maxLines: 1,),
                                  title: Text(snapshot.data[index].name.toString()),
                                  subtitle: Text('\$ ${snapshot.data[index].priceUsd}'),
                                  trailing: Text('${snapshot.data[index].percentChange1H} %'),
                                  dense: true,
                                );
                            }
                          );
                        }
                        return Center(child: SpinKitDualRing(color: Colors.blue,size: 70,),);
                    })
                  ),
                )
                );
              }

  // _naEmbethis(){
  //   return FutureBuilder (
  //       future: CryptMemory.cryptMemory.fetchMemCrypto(),
  //       builder: (BuildContext context,AsyncSnapshot<List<Crypto>> snapshot){
  //           if(!snapshot.hasData){
  //             return Center(child: SpinKitDualRing(color: Colors.blue,size: 70,),);
  //           }else{
  //             ListView.builder(
  //               itemCount: snapshot.data.length,
  //               itemBuilder: (BuildContext context,int index){
  //                   return ListTile(
  //                     leading: Text(snapshot.data[index].symbol.toString()),
  //                     title: Text(snapshot.data[index].name.toString()),
  //                     subtitle: Text('\$ ${snapshot.data[index].priceUsd}'),
  //                     trailing: Text('${snapshot.data[index].percentChange1H} %'),
  //                   );
  //               }
  //             );
  //           }
  //           return null;
  //       });
  // }
  _apiget() async{
    setState(() {
      isLoading = true;
    });
    var apiProvider = CryptoCall();
    apiProvider.fetchCrypto();
    
    await Future.delayed(Duration (seconds: 1));

    setState(() {
      isLoading = false;
    });
  }
}