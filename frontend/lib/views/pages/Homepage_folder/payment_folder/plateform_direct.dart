import 'package:flutter/material.dart';

import 'package:upi_india/upi_india.dart';
import 'package:frontend/views/pages/Homepage_folder/payment_folder/scanner.dart';
import 'package:frontend/views/pages/Homepage_folder/payment_folder/upi_direct_screen.dart';

class PlateformDirect extends StatefulWidget {
  const PlateformDirect({super.key});
  @override
  _PlateformDirectState createState() => _PlateformDirectState();
}

class _PlateformDirectState extends State<PlateformDirect> {
  Future<UpiResponse>? _transaction;
  String upi = qr_code.upi;
  String code = qr_code.code;
  final startIndex = qr_code.code.indexOf('&pn=') + 4;
  final endIndex = qr_code.code.indexOf('&mc=');
  late String name_final = qr_code.code.substring(startIndex, endIndex);
  late String name = name_final.replaceAll('%20%20', ' ');
  UpiIndia _upiIndia = UpiIndia();
  List<UpiApp>? apps;

  TextStyle header = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  TextStyle value = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 14,
  );

  @override
  void initState() {
    _upiIndia.getAllUpiApps(mandatoryTransactionId: false).then((value) {
      setState(() {
        apps = value;
      });
    }).catchError((e) {
      apps = [];
    });
    super.initState();
  }

  Future<UpiResponse> initiateTransaction(UpiApp app) async {
    double result = double.parse(detailsDirect.amount);

    return _upiIndia.startTransaction(
      app: app,
      receiverUpiId: detailsDirect.upiId,
      receiverName: 'My Name ',
      transactionRefId: 'PayBookPayment',
      transactionNote: detailsDirect.message,
      amount: result,
    );
  }

  Widget displayUpiApps() {
    if (apps == null)
      return Center(child: CircularProgressIndicator());
    else if (apps!.length == 0)
      return Center(
        child: Text(
          "No apps found to handle transaction.",
          style: header,
        ),
      );
    else
      // ignore: curly_braces_in_flow_control_structures
      return Align(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Wrap(
            children: apps!.map<Widget>((UpiApp app) {
              return GestureDetector(
                onTap: () {
                  _transaction = initiateTransaction(app);
                  setState(() {});
                },
                child: Container(
                  height: 100,
                  width: 100,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.memory(
                        app.icon,
                        height: 60,
                        width: 60,
                      ),
                      Text(app.name),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      );
  }

  String _upiErrorHandler(error) {
    switch (error) {
      case UpiIndiaAppNotInstalledException:
        return 'Requested app not installed on device';
      case UpiIndiaUserCancelledException:
        return 'You cancelled the transaction';
      case UpiIndiaNullResponseException:
        return 'Requested app didn\'t return any response';
      case UpiIndiaInvalidParametersException:
        return 'Requested app cannot handle the transaction';
      default:
        return 'An Unknown error has occurred';
    }
  }

  void _checkTxnStatus(String status) {
    switch (status) {
      case UpiPaymentStatus.SUCCESS:
        print('Transaction Successful');
        break;
      case UpiPaymentStatus.SUBMITTED:
        print('Transaction Submitted');
        break;
      case UpiPaymentStatus.FAILURE:
        print('Transaction Failed');
        break;
      default:
        print('Received an Unknown transaction status');
    }
  }

  Widget displayTransactionData(title, body) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("$title: ", style: header),
          Flexible(
              child: Text(
            body,
            style: value,
          )),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //String amount=upi;
    return Scaffold(
      appBar: AppBar(
        title: Text('UPI'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: displayUpiApps(),
          ),
          Expanded(
            child: FutureBuilder(
              future: _transaction,
              builder:
                  (BuildContext context, AsyncSnapshot<UpiResponse> snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        _upiErrorHandler(snapshot.error.runtimeType),
                        style: header,
                      ), // Print's text message on screen
                    );
                  }

                  // If we have data then definitely we will have UpiResponse.
                  // It cannot be null
                  UpiResponse _upiResponse = snapshot.data!;

                  // Data in UpiResponse can be null. Check before printing
                  String txnId = _upiResponse.transactionId ?? 'N/A';
                  String resCode = _upiResponse.responseCode ?? 'N/A';
                  String txnRef = _upiResponse.transactionRefId ?? 'N/A';
                  String status = _upiResponse.status ?? 'N/A';
                  String approvalRef = _upiResponse.approvalRefNo ?? 'N/A';
                  _checkTxnStatus(status);

                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        displayTransactionData('Transaction Id', txnId),
                        displayTransactionData('Response Code', resCode),
                        displayTransactionData('Reference Id', txnRef),
                        displayTransactionData('Status', status.toUpperCase()),
                        displayTransactionData('Approval No', approvalRef),
                      ],
                    ),
                  );
                } else
                  return Center(
                    child: Text(''),
                  );
              },
            ),
          )
        ],
      ),
    );
  }
}
