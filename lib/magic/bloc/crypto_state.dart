part of 'crypto_bloc.dart';

abstract class CryptoState extends Equatable {
  const CryptoState();
   @override
  List<Object> get props => [];
}
// This here is the initial state of tha app before it firsts loads data
class CryptoInitial extends CryptoState {}
// This is what the UI would render after it has made the Api call and deserialized the data
class CryptoLoaded extends CryptoState{
  final List<Crypto> crypto;
  CryptoLoaded({this.crypto});

  @override
  List<Object> get props => [crypto];
}
class CryptoError extends CryptoState{}