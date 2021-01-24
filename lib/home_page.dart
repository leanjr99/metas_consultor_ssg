import 'package:flutter/material.dart';
import 'package:metas_consultor_ssg/transaction_model.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isIncome = false;

  static const Color _primaryColor = Colors.deepPurpleAccent;
  static const Color _secondaryColor = Colors.deepOrangeAccent;

  List<TransactionModel> _transactionList = [
    TransactionModel(
      name: "S20",
      date: '22.02.2020',
      amount: '4500',
    ),
    TransactionModel(
      name: "s20 fe",
      date: '22.02.2020',
      amount: '2500',
    ),
  ];

  /// **********************************************
  /// LIFE CYCLE METHODS
  /// **********************************************

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Column(
        children: <Widget>[
          _appBarBottomSection(),
          _mainBody(),
        ],
      ),
    );
  }

  /// **********************************************
  /// WIDGETS
  /// **********************************************

  /// App Bar
  AppBar _buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: _primaryColor,
      leading: Padding(
        padding: EdgeInsets.only(left: 20),
        child: IconButton(
          onPressed: () => print('Menu Tapped'),
          icon: Image.asset(
            'assets/images/menu.png',
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
      actions: <Widget>[
        Padding(
          padding: EdgeInsets.only(right: 20),
          child: GestureDetector(
            onTap: () => print('Profile Tapped'),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: ClipOval(
                child: Image.asset(
                  'assets/images/profile.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  /// App Bar Bottom Section
  Container _appBarBottomSection() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 50),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: _primaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50),
          bottomRight: Radius.circular(50),
        ),
      ),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                '\$',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  height: 1,
                ),
              ),
              Text(
                '25,400',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 50,
                  fontWeight: FontWeight.w600,
                  height: 0.9,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            'Faturamento total',
            style: TextStyle(
              color: Colors.white.withOpacity(0.8),
              fontSize: 20,
              fontWeight: FontWeight.w500,
              height: 1,
            ),
          ),
          SizedBox(
            height: 32,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              /// Eletronicos
              GestureDetector(
                onTap: () => setState(() {
                  _isIncome = !_isIncome;
                }),
                child: Text(
                  'Eletrônicos',
                  style: TextStyle(
                    color: _isIncome ? _secondaryColor : Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    height: 1,
                  ),
                ),
              ),

              /// Acessórios
              GestureDetector(
                onTap: () => setState(() {
                  _isIncome = !_isIncome;
                }),
                child: Text(
                  'Acessórios',
                  style: TextStyle(
                    color: _isIncome ? Colors.white : _secondaryColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    height: 1,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  /// Main Body
  Expanded _mainBody() {
    return Expanded(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        physics: ClampingScrollPhysics(),
        child: Column(
          children: <Widget>[
            _reportCell(
              isSavings: true,
              title: 'Percentual Atingido',
              deposit: '\$5,450',
              rate: '\$3,50',
              progress: 25,
            ),
            SizedBox(
              height: 16,
            ),
            _reportCell(
              isSavings: false,
              title: 'Para 100% da meta',
              deposit: '\$12,350',
              rate: 'R\$350,00',
              progress: 50,
            ),
            SizedBox(
              height: 32,
            ),
            Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Vendas',
                        style: TextStyle(
                          color: _primaryColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        'All',
                        style: TextStyle(
                          color: _primaryColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: _transactionList.map((tr) {
                    return Card(
                      child: Row(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black,
                                width: 2,
                              ),
                            ),
                        padding:EdgeInsets.all(10),
                            child: Text(tr.amount.toString()),
                          ),
                          Column(children: <Widget>[
                            Text(tr.name),
                            Text(tr.date),
                          ]),
                        ],
                      ),
                    );
                  }).toList(),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// Report Cell
  Container _reportCell({
    bool isSavings,
    String title,
    String deposit,
    String rate,
    int progress,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 16),
      decoration: BoxDecoration(
        color: isSavings ? Colors.white : _secondaryColor,
        borderRadius: BorderRadius.circular(30),
        border: isSavings
            ? Border.all(color: _primaryColor.withOpacity(0.1), width: 2)
            : null,
        boxShadow: isSavings
            ? []
            : [
                BoxShadow(
                  color: _secondaryColor.withOpacity(0.4),
                  offset: Offset(0, 8),
                  blurRadius: 10,
                ),
              ],
      ),
      child: Row(
        children: <Widget>[
          Stack(
            children: <Widget>[
              SizedBox(
                width: 60,
                height: 60,
                child: CircularProgressIndicator(
                  value: progress / 100,
                  strokeWidth: 6,
                  backgroundColor: isSavings
                      ? _primaryColor.withOpacity(0.2)
                      : _primaryColor.withOpacity(0.1),
                  valueColor: AlwaysStoppedAnimation<Color>(
                      isSavings ? _secondaryColor : Colors.white),
                ),
              ),
              Container(
                width: 60,
                height: 60,
                alignment: Alignment.center,
                child: Text(
                  progress.toString() + '%',
                  style: TextStyle(
                    color: isSavings ? _primaryColor : Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            width: 30,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                  color: isSavings ? _primaryColor : Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Row(
                children: <Widget>[
                  _reportInnerCell(
                    isSavings: isSavings,
                    title: 'Eletronico',
                    value: deposit,
                  ),
                  SizedBox(
                    width: 24,
                  ),
                  _reportInnerCell(
                    isSavings: isSavings,
                    title: 'Acessorio',
                    value: rate,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// Report Inner Cell
  Column _reportInnerCell({bool isSavings, String title, String value}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(
            color: isSavings ? _primaryColor.withOpacity(0.5) : Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Text(
          value,
          style: TextStyle(
            color: isSavings ? Colors.black87 : Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
