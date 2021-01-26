import 'package:flutter/material.dart';

final Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() {
  runApp(MyApp());
}

final s = Stream.periodic(Duration(seconds:1), (x) => x).take(5).asBroadcastStream();


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: darkBlue),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: ListView.builder(itemBuilder: (c, i) {
//           print(i);
//           var val = s.take(2).toList().then((x) => print(x));
              return FutureBuilder(
                  future: s.skip(i).take(1).toList(),
                  builder: (b, snapshot) {
                    if(snapshot.hasData) {
                      return Text("Hello $i --> ${snapshot.data}");
                    }
                    else return Text("No data :-(");
                  }
                //           return Text("Hello $i!");
              );
            }
            )
        )
    );
  }
}

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('Hello, World!', style: Theme.of(context).textTheme.headline4);
  }
}
