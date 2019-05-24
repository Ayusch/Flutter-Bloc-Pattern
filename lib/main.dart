import 'package:bloc_tutorial/BlocProvider.dart';
import 'package:bloc_tutorial/CounterBloc.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: CounterBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final CounterBloc bloc = BlocProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _getStreamChild(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          bloc.incrementCounter();
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _getStreamChild() {
    final CounterBloc bloc = BlocProvider.of<CounterBloc>(context);
    return StreamBuilder(
      initialData: 0,
      stream: bloc.counterStream,
      builder: (BuildContext context, snapshot) {
        return Center(
          child: Text(
            "Clicked " + snapshot.data.toString() + " times!",
            style: TextStyle(fontSize: 18),
          ),
        );
      },
    );
  }
}
