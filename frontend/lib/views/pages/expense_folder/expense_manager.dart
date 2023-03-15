import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:frontend/controllers/add_transaction_controller.dart';
import 'package:frontend/controllers/transaction_controller.dart';
import 'package:frontend/models/transaction_data_model.dart';
import 'package:frontend/navigation_container.dart';
import 'package:frontend/views/pages/expense_folder/add.dart';
import 'package:frontend/views/pages/expense_folder/statistics.dart';
import 'package:frontend/views/widgets/loading.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:frontend/data/listdata.dart';
import 'package:frontend/data/model/hive_models/add_date.dart';
import 'package:frontend/data/utlity.dart';
import 'package:telephony/telephony.dart';
import 'package:vibration/vibration.dart';

onBackgroundMessage(SmsMessage message) {
  debugPrint("onBackgroundMessage called");
  Vibration.vibrate(duration: 500);
}

class ExpenseManager extends StatefulWidget {
  const ExpenseManager({Key? key}) : super(key: key);

  @override
  State<ExpenseManager> createState() => _ExpenseManagerState();
}

class _ExpenseManagerState extends State<ExpenseManager> {
  final Telephony telephony = Telephony.instance;
  String _message = "";

  bool isFirst = true;
  final storage = new FlutterSecureStorage();

  var _transactionController = Get.put(TransactionController());

  var history;
  late Data data;
  final box = Hive.box<Add_data>('data');
  final List<String> day = [
    'Monday',
    "Tuesday",
    "Wednesday",
    "Thursday",
    'friday',
    'saturday',
    'sunday'
  ];

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  onMessage(SmsMessage message) async {
    setState(() {
      _message = message.body ?? "Error reading message body.";
      print(_message);
      String s = _message;
      String p = "";
      String w = "";
      String amt = "";
      String type = "";
      String refNo = "";
      String status = "success";
      String date = "01/02/2022";
      String des = "xyz";
      String cat = "UA";
      int flag = 0;

      int f = 0;
      //to get amt .
      for (int i = 0; i < s.length; i++) {
        var ch = s[i];
        if (ch != ' ') {
          p = p + ch;
        } else {
          if (f == 2) {
            f++;
            flag = 1;
            refNo = p;
          } else if (p.length >= 2 && p[0] == 'R' && p[1] == 's') {
            amt = p.substring(2);
          } else if (p == 'if' || p == 'If') {
            type = "send";
          } else if (p == 'Ref' || p == 'ref') {
            f++;
          } else if (f == 1 && (p == 'no' || p == 'No')) {
            f++;
          }
          p = "";
        }
      }
      if (type == "" && flag == 1) {
        type = "recieved";
      }

      if (type != "") {
        AddTransactionController _addTransactionController = Get.put(
            AddTransactionController(
                type, refNo, amt, "complete", "15/03/2022", des, cat));

        // var add = Add_data(selctedItemi!, amount_c.text, date,
        //     description_C.text, selctedItem!);
        // box.add(add);
        Get.snackbar(
          "Success",
          "Transaction added :)",
          colorText: Colors.black,
          snackPosition: SnackPosition.BOTTOM,
          icon: const Icon(Icons.check_box),
          barBlur: 20,
          isDismissible: true,
          duration: const Duration(seconds: 5),
        );
        Get.off(NavigationContainer());
      }
    });
  }

  Future<void> initPlatformState() async {
    // Platform messages may fail, so we use a try/catch PlatformException.
    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.

    final bool? result = await telephony.requestPhoneAndSmsPermissions;

    if (result != null && result) {
      telephony.listenIncomingSms(
          onNewMessage: onMessage, onBackgroundMessage: onBackgroundMessage);
    }

    if (!mounted) return;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Obx(() {
      if (_transactionController.isLoading == true) {
        return const Center(child: Loading());
      }
      return SafeArea(
          child: ValueListenableBuilder(
              valueListenable: box.listenable(),
              builder: (context, value, child) {
                return CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: SizedBox(height: 340, child: _head()),
                    ),
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Transactions History',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 19,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              'See all',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          //history = box.values.toList()[index];
                          history = _transactionController.model!.data![index];
                          return getList(history, index);
                        },
                        childCount: _transactionController.model != null
                            ? _transactionController.model?.data?.length
                            : 0,
                      ),
                    )
                  ],
                );
              }));
    }));
  }

  Widget getList(Data history, int index) {
    return Dismissible(
        key: UniqueKey(),
        onDismissed: (direction) {
          //history.delete();
        },
        child: get(index, history));
  }

  ListTile get(int index, Data history) {
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        //child: Image.asset('images/${history.category}.png', height: 40),
      ),
      title: Text(
        '${history.category} ',
        style: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: Text(
        '${history.date} ',
        style: TextStyle(
          fontWeight: FontWeight.w600,
        ),
      ),
      trailing: Text(
        '${history.amount} ',
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 19,
          color: history.type == 'recieve' ? Colors.green : Colors.red,
        ),
      ),
    );
  }

  Widget _head() {
    return Stack(
      children: [
        Column(
          children: [
            Container(
              width: double.infinity,
              height: 240,
              decoration: BoxDecoration(
                color: Color(0xff3E54AC),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 35,
                    left: 340,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(7),
                      child: Container(
                        height: 40,
                        width: 40,
                        color: Color.fromRGBO(250, 250, 250, 0.1),
                        child: IconButton(
                          iconSize: 30,
                          icon: const Icon(
                            Icons.query_stats,
                          ),
                          color: Colors.white,
                          onPressed: () {
                            Get.to(Statistics());
                          },
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 35,
                    left: 280,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(7),
                      child: Container(
                        height: 40,
                        width: 40,
                        color: Color(0xff3E54AC),
                        child: IconButton(
                          iconSize: 30,
                          icon: const Icon(
                            Icons.add,
                          ),
                          color: Colors.white,
                          onPressed: () {
                            Get.deleteAll();
                            Get.to(Add_Screen());
                          },
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 35, left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Good afternoon',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Color.fromARGB(255, 224, 223, 223),
                          ),
                        ),
                        Text(
                          'Sankalp Srivastava',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        Positioned(
          top: 140,
          left: 37,
          child: Container(
            height: 170,
            width: 320,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color(0xff2B3467),
                  offset: Offset(0, 6),
                  blurRadius: 17,
                  spreadRadius: 3,
                ),
              ],
              color: Color(0xff2B3467),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total Balance',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      Icon(
                        Icons.more_horiz,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 7),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Row(
                    children: [
                      Text(
                        '\₹ ${total()}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 25),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 13,
                            backgroundColor: Color(0xffB6E2A1),
                            child: Icon(
                              Icons.arrow_downward,
                              color: Colors.white,
                              size: 19,
                            ),
                          ),
                          SizedBox(width: 7),
                          Text(
                            'Income',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Color.fromARGB(255, 216, 216, 216),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 13,
                            backgroundColor: Color(0xffFF6464),
                            child: Icon(
                              Icons.arrow_upward,
                              color: Colors.white,
                              size: 19,
                            ),
                          ),
                          SizedBox(width: 7),
                          Text(
                            'Expenses',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Color.fromARGB(255, 216, 216, 216),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 6),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\₹ ${income()}',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 17,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        '\₹ ${expenses()}',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 17,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
