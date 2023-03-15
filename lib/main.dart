import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:quickalert/quickalert.dart';
import 'package:spice_tracker/presentation/performence/target.dart';
import 'package:spice_tracker/presentation/performence/adhikari_profile.dart';
import 'package:spice_tracker/presentation/performence/list_of%20_activities.dart';
import 'package:spice_tracker/presentation/performence/mperformen.dart';
import 'package:spice_tracker/presentation/performence/notification_alerts_screen.dart';
import 'package:spice_tracker/presentation/widgets/bottomsheets/bottomsheet.dart';
import 'package:spice_tracker/presentation/widgets/dialog/are_you_shur_dialog.dart';
import 'package:spice_tracker/utils/app_colors.dart';
import 'package:spice_tracker/utils/images_loation.dart';

import 'data/dependency_injection/inject.dart';

// import 'package:intl/intl.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQueryData.fromWindow(WidgetsBinding.instance.window),
      child: ScreenUtilInit(
        designSize: const Size(412, 847),
        builder: (c, w) => GetMaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
              primarySwatch: Colors.blue,
              scaffoldBackgroundColor: AppColors.WHITE),
          home: const MyHomePage(title: 'Flutter Demo Home Page'),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  @override
  void initState() {
    dateController.text = ""; //set the initial value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
              ),
              children: [
                GestureDetector(
                    onTap: () => Get.to(NotificationsAndAllerts()),
                    child: Container(
                      alignment: Alignment.center,
                      color: AppColors.white1,
                      height: 50,
                      child: Text("Notification and \n alerts"),
                    )),
                GestureDetector(
                    onTap: () => BottomSheets.ReminderBottomSheet(
                        context: context,
                        dateController: dateController,
                        timeController: timeController,
                        dateCallBack: () async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(), //get today's date
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2101));

                          if (pickedDate != null) {
                            print(pickedDate);
                            String formattedDate = pickedDate.day.toString() +
                                "/" +
                                pickedDate.month.toString() +
                                "/" +
                                pickedDate.year.toString();

                            print(formattedDate);

                            setState(() {
                              dateController.text = formattedDate;
                            });
                          } else {
                            print("Date is not selected");
                          }
                        },
                        timeCallBAck: () async {
                          TimeOfDay? time = (await showTimePicker(
                            initialTime: TimeOfDay.now(),
                            context: context,
                          ));

                          if (time != null) {
                            print(time);
                            String formattedDate = time.toString();

                            print(formattedDate);

                            setState(() {
                              timeController.text = formattedDate;
                            });
                          } else {
                            print("selecte time");
                          }
                        }),
                    child: Container(
                      alignment: Alignment.center,
                      color: AppColors.white1,
                      height: 50,
                      child: Text("add a reminder"),
                    )),

                ////////////////////////////////////////////////////////////////
                GestureDetector(
                    onTap: () => BottomSheets.CommentBottomSheet(
                        callBack: (String value) {},
                        context: context,
                        commentController: TextEditingController()),
                    child: Container(
                      alignment: Alignment.center,
                      color: AppColors.white1,
                      height: 50,
                      child: Text("add a comment "),
                    )),
                GestureDetector(
                    onTap: () => Get.to(ListOfActivities()),
                    child: Container(
                      alignment: Alignment.center,
                      color: AppColors.white1,
                      height: 50,
                      child: Text("list of activities"),
                    )),
                GestureDetector(
                    onTap: () => Get.to(AdhikariProfile()),
                    child: Container(
                      alignment: Alignment.center,
                      color: AppColors.white1,
                      height: 50,
                      child: Text("adhikari profile"),
                    )),
                GestureDetector(
                    onTap: () => Get.to(Performance()),
                    child: Container(
                      alignment: Alignment.center,
                      color: AppColors.white1,
                      height: 50,
                      child: Text("Performance"),
                    )),
                GestureDetector(
                    onTap: () => showDialog(
                        context: context,
                        builder: (context) => ShowDialogAreYouShure()),
                    child: Container(
                      alignment: Alignment.center,
                      color: AppColors.white1,
                      height: 50,
                      child: Text("Show Dialog"),
                    )),
                GestureDetector(
                    onTap: () => Get.to(TargetPage()),
                    child: Container(
                      alignment: Alignment.center,
                      color: AppColors.white1,
                      height: 50,
                      child: Text("Map Page"),
                    )),
              ]),
        ),
      ),
    );
  }
}

Card buildButton({
  required onTap,
  required title,
  required text,
  required leadingImage,
}) {
  return Card(
    shape: const StadiumBorder(),
    margin: const EdgeInsets.symmetric(
      horizontal: 20,
    ),
    clipBehavior: Clip.antiAlias,
    elevation: 1,
    child: ListTile(
      onTap: onTap,
      leading: CircleAvatar(
        backgroundImage: AssetImage(
          leadingImage,
        ),
      ),
      title: Text(title ?? ""),
      subtitle: Text(text ?? ""),
      trailing: const Icon(
        Icons.keyboard_arrow_right_rounded,
      ),
    ),
  );
}
