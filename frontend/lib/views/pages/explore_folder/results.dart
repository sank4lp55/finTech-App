import 'package:flutter/material.dart';
import 'package:frontend/data/disp_res.dart';
import 'package:frontend/views/widgets/result_card.dart';

class Results extends StatefulWidget {
  final risk_factor;
  final amount;
  final duration;

  final stock_list = [
    [
      'images/Mrf-logo.png',
      'MRF Ltd.',
      '₹1500.00',
      'https://groww.in/stocks/mrf-ltd'
    ],
    [
      'images/apollo-logo.png',
      'Apollo Hospitals',
      '₹4300.00',
      'https://groww.in/stocks/apollo-hospitals-enterprise-ltd'
    ],
    [
      'images/hindalco-logo.png',
      'Hindalco Industries',
      '₹460.00',
      'https://groww.in/stocks/hindalco-industries-ltd'
    ],
    [
      'images/itc-logo.png',
      'ITC Ltd.',
      '384.00',
      'https://groww.in/stocks/itc-ltd'
    ],
    [
      'images/jsw-logo.png',
      'JSW Steel Ltd.',
      '680.00',
      'https://groww.in/stocks/jsw-steel-ltd'
    ],
    [
      'images/tech-m-logo.png',
      'Tech Mahendra',
      '₹1150.00',
      'https://groww.in/stocks/tech-mahindra-ltd'
    ],
  ];

  final crypto_list = [
    [
      'images/bitcoin-logo.png',
      'Bitcoin',
      '₹16000.00',
      'https://wazirx.com/exchange/ETH-INR'
    ],
    [
      'images/ethereum-logo.png',
      'Ethereum',
      '₹16000.00',
      'https://wazirx.com/exchange/ETH-INR'
    ],
    [
      'images/bnb-logo.png',
      'Binance Coin',
      '₹16000.00',
      'https://wazirx.com/exchange/ETH-INR'
    ],
    [
      'images/gala-logo.png',
      'Gala',
      '₹16000.00',
      'https://wazirx.com/exchange/ETH-INR'
    ],
    [
      'images/matic-logo.png',
      'Matic',
      '₹16000.00',
      'https://wazirx.com/exchange/ETH-INR'
    ],
    [
      'images/shib-logo.png',
      'Shiba Inu',
      '₹16000.00',
      'https://wazirx.com/exchange/ETH-INR'
    ],
    [
      'images/snx-logo.png',
      'SNX',
      '₹16000.00',
      'https://wazirx.com/exchange/ETH-INR'
    ],
    [
      'images/trx-logo.png',
      'TRON/TRX',
      '₹16000.00',
      'https://wazirx.com/exchange/ETH-INR'
    ],
    [
      'images/xrp-logo.png',
      'Ripple',
      '₹16000.00',
      'https://wazirx.com/exchange/ETH-INR'
    ],
  ];

  final safe_investment = [
    [
      'images/digitalgold-logo.png',
      'Digital Gold',
      '',
      'https://wazirx.com/exchange/ETH-INR'
    ],
    [
      'images/fd-logo.jpg',
      'Fixed Deposit',
      '',
      'https://wazirx.com/exchange/ETH-INR'
    ],
    [
      'images/mutualfund-logo.png',
      'Mutual Funds',
      '',
      'https://wazirx.com/exchange/ETH-INR'
    ],
    [
      'images/ppf-logo.jpg',
      'Public Provident Fund',
      '',
      'https://wazirx.com/exchange/ETH-INR'
    ],
    [
      'images/sip-logo.jpg',
      'Systematic Investment Plan',
      '',
      'https://wazirx.com/exchange/ETH-INR'
    ],
    
  ];

  Results(
      {super.key,
      required this.risk_factor,
      required this.amount,
      required this.duration});

  @override
  State<Results> createState() => _ResultsState();
}

class _ResultsState extends State<Results> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return Scaffold(
      backgroundColor: Color(0xff2B3460),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: width * 0.125,
            ),
            result_card(
              title: 'Stocks for you',
              card_inf: widget.stock_list,
            ),
            SizedBox(
              height: width * 0.07,
            ),
            result_card(
              title: 'Must Buy Cryptos',
              card_inf: widget.crypto_list,
            ),
            SizedBox(
              height: width * 0.07,
            ),
            result_card(
              title: 'Play Safe',
              card_inf: widget.safe_investment,
            ),
          ],
        ),
      ),
    );
  }
}
