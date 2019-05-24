import 'dart:async';
import 'package:bloc_tutorial/BlocProvider.dart';


class CounterBloc extends BlocBase{
  
  StreamController streamController = StreamController<int>.broadcast();
  
  Sink get counterSink => streamController.sink;
  Stream<int> get counterStream => streamController.stream;
  
  int counter = 0;

  incrementCounter(){
    counterSink.add(++counter);
  }

  @override
  void dispose() {
    streamController.close();
  }

}