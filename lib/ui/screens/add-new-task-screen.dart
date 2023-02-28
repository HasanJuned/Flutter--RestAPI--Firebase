import 'package:flutter/material.dart';
import 'package:softbyhasan/ui/utils/text-styles.dart';
import 'package:softbyhasan/ui/widgets/app-elevated-button.dart';
import 'package:softbyhasan/ui/widgets/app-text-form-field.dart';
import 'package:softbyhasan/ui/widgets/screen-Background-images.dart';
import 'package:softbyhasan/ui/widgets/user-profile-widget.dart';

class AddNewTaskScreen extends StatefulWidget {
  const AddNewTaskScreen({Key? key}) : super(key: key);

  @override
  State<AddNewTaskScreen> createState() => _AddNewTaskScreenState();
}

class _AddNewTaskScreenState extends State<AddNewTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
           const UserProfileWidget(),
            Expanded(
              child: ScreenBackground(
                  child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Add New Task',
                        style: screenTitleTextStyle,
                      ),
                      const SizedBox(height: 16,),
                      AppTextFormFieldWidget(
                          hintText: 'Subject',
                          controller: TextEditingController()),
                      const SizedBox(height: 8,),
                      AppTextFormFieldWidget(
                          maxLine: 6,
                          hintText: 'Description',
                          controller: TextEditingController()
                      ),
                      const SizedBox(height: 16,),
                      AppElevatedButton(
                          child: Icon(Icons.arrow_circle_right_outlined),
                          ontap: (){})
                    ],
                  ),
                ),
              )),
            )
          ],
        ),
      ),
    );
  }
}
