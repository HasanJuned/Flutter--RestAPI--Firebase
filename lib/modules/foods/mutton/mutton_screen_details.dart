import 'package:flutter/material.dart';

import '../../widgets/app_elevated_button.dart';

class MuttonScreenDetails extends StatefulWidget {
  final String? url;

  const MuttonScreenDetails({Key? key, required this.url}) : super(key: key);

  @override
  State<MuttonScreenDetails> createState() => _MuttonScreenDetailsState();
}

class _MuttonScreenDetailsState extends State<MuttonScreenDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent.withOpacity(0.4),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              children: [
                Expanded(
                  child: Image.network(
                    widget.url.toString(),
                    width: double.infinity,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: double.infinity,
                  child:AppElevatedButton(text: 'Checkout', onTap: (){}),
                ),
                const SizedBox(
                  height: 130,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
