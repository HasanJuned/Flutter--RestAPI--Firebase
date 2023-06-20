import 'package:flutter/material.dart';
import 'student_dashboard_screen.dart';
import 'package:get/get.dart';

class MyResultScreen extends StatelessWidget {
  final String? score;

  const MyResultScreen({Key? key, required this.score}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Scoreboard'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(56.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'My Score : ',
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 24),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                score.toString(),
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
              ),
              const SizedBox(
                height: 60,
              ),
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        Get.offAll(const StudentDashboardScreen());
                      },
                      child: const Text('Return Home')))
            ],
          ),
        ),
      ),
    );
  }
}
