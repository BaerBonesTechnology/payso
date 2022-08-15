import 'package:flutter/material.dart';
import 'package:payso/custom/num_pad.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PaySo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {

    if(controller.text.isEmpty){
      controller.text = "0";
    }
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  Row(
                    children: [
                    //  const Text("\$"),
                      TextField(
                        controller: controller,
                        textAlign: TextAlign.center,
                        showCursor: false,
                        style: const TextStyle(
                            fontSize: 40
                        ),
                        keyboardType: TextInputType.none,
                      ),
                    ],flutter
                  ),
                  NumberPad(
                      controller: controller,
                      delete: (){
                        controller.text = controller
                            .text
                            .substring(0, controller.text.length - 1);
                      }),
                  const Text("hello world")
                ]
            )
        )
    );
  }
}
