//Number pad to be used on the main page of the application
import 'package:flutter/material.dart';

class NumberPad extends StatelessWidget {
  final double buttonSize;
  final Color buttonColor;
  final Color iconColor;
  final TextEditingController controller;
  final Function delete;

  const NumberPad({Key? key,
    this.buttonSize = 50,
    this.buttonColor = const Color(0xff232323),
    this.iconColor = Colors.white,
    required this.controller,
    required this.delete,
}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff232323),
      margin: const EdgeInsets.only(left: 30, right: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const SizedBox(height: 20),
          NumberRow(left: 1, middle: 2, right: 3, size: buttonSize, color: buttonColor, controller: controller),
          NumberRow(left: 4, middle: 5, right: 6, size: buttonSize, color: buttonColor, controller: controller),
          NumberRow(left: 7, middle: 8, right: 9, size: buttonSize, color: buttonColor, controller: controller),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:[
                ElevatedButton(onPressed: (){
                  controller.text += ".";
                }
                    , child: const Center(
                      child: Text(".",
                      style:
                        TextStyle(
                          fontWeight:
                            FontWeight.bold,
                          fontSize: 30,
                          color: Colors.white
                        ),),
                    )),
                NumberButton(number: 0, size: buttonSize, color: buttonColor, controller: controller),
                ElevatedButton.icon(onPressed: delete(), icon: const Icon(Icons.chevron_left,
                color: Colors.white,), label: const Text(""))
              ],
          )

        ],
      ),
    );
  }
}

class NumberRow extends StatelessWidget {
  final int left;
  final int middle;
  final int right;
  final double size;
  final Color color;
  final TextEditingController controller;

  const NumberRow({
    Key? key,
    required this.left,
    required this.middle,
    required this.right,
    required this.size,
    required this.color,
    required this.controller
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        NumberButton(number: left, size: size, color: color, controller: controller),
        NumberButton(number: middle, size: size, color: color, controller: controller),
        NumberButton(number: right, size: size, color: color, controller: controller)
      ],
    );
  }
}


class NumberButton extends StatelessWidget {
  final int number;
  final double size;
  final Color color;
  final TextEditingController controller;

  const NumberButton({
    Key? key,
    required this.number,
    required this.size,
    required this.color,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onPressed: () {
          controller.text += number.toString();
        },
        child: Center(
          child: Text(
            number.toString(),
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white, fontSize: 30),
          ),
        ),
      ),
    );
  }
}


