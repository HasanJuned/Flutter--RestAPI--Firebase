import 'package:flutter/material.dart';
import 'package:ostad_flutter_batch_two/modules/widgets/app_elevated_button.dart';

class ChickenScreenDetails extends StatefulWidget {
  final String? url;

  const ChickenScreenDetails({Key? key, required this.url}) : super(key: key);

  @override
  State<ChickenScreenDetails> createState() => _ChickenScreenDetailsState();
}

class _ChickenScreenDetailsState extends State<ChickenScreenDetails> {
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
                  child: AppElevatedButton(text: 'Checkout', onTap: (){})
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
