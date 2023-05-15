import 'package:flutter/material.dart';
import 'package:unipay/screens/Uni_fees.dart';
import 'package:unipay/screens/paynumpad.dart';
import 'package:unipay/screens/point_fees.dart';

import 'HomeScreen.dart';

class Payments extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFFD44C66),
        title: Text(
          "Payments",
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => HomeScreen())),
        ),
      ),
      body: Center(
        child: GridView.count(
          crossAxisCount: 3,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          padding: EdgeInsets.all(20),
          children: [
            _buildButton(context, 'Cafe', Icons.local_cafe, Paynum()),
            _buildButton(context, 'Uni Fees', Icons.school, Unifees()),
            _buildButton(context, 'Point Fees', Icons.account_balance_wallet,
                Pointfees()),
            _buildButton(context, 'Stationary Shop', Icons.book, Paynum()),
            _buildButton(context, 'Pizza Fast', Icons.local_pizza, Paynum()),
            _buildButton(context, 'Shawarma Shop', Icons.fastfood, Paynum()),
            _buildButton(context, 'Dhaaba', Icons.local_dining, Paynum()),
          ],
        ),
      ),
    );
  }

  static Widget _buildButton(
      BuildContext context, String label, IconData icon, Widget onpressed) {
    return ElevatedButton(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 48),
          SizedBox(height: 16),
          Text(label),
        ],
      ),
      onPressed: () => Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => onpressed)),
      style: ElevatedButton.styleFrom(
        primary: Color(0xFFD44C66),
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';
// import 'package:unipay/screens/HomeScreen.dart';
// import 'package:unipay/screens/paynumpad.dart';
// import 'package:unipay/screens/send.dart';

// class Payments extends StatefulWidget {
//   Payments({Key? key}) : super(key: key);

//   @override
//   _Payments createState() => _Payments();
// }

// class _Payments extends State<Payments> {
//   // 'Cafe',
//   //   'Uni Fees',
//   //   'Stationary Shop',
//   //   'Shawarma',
//   //   'Point Fees'

//   @override
//   String? value;
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           centerTitle: true,
//           backgroundColor: Color(0xFFD44C66),
//           title: Text(
//             "Payments",
//             style: TextStyle(color: Colors.white),
//           ),
//           leading: IconButton(
//             icon: Icon(Icons.arrow_back),
//             onPressed: () => Navigator.pushReplacement(
//                 context, MaterialPageRoute(builder: (context) => HomeScreen())),
//           ),
//         ),
//         body: Row(
//           children: <Widget>[
//             Expanded(
//               child: SizedBox(
//                 child: new ListView.builder(
//                   shrinkWrap: true,
//                   scrollDirection: Axis.vertical,
//                   itemCount: choice.length,
//                   itemBuilder: (BuildContext ctxt, int index) {
//                     return Container(
//                       decoration: BoxDecoration(
//                           border: Border(
//                         top: BorderSide(color: Colors.grey),
//                       )),
//                       child: new ListTile(
//                         leading: Icon(choice_icon[index]),
//                         title: Text(choice[index]),
//                         onTap: () => Navigator.pushReplacement(context,
//                             MaterialPageRoute(builder: (context) => Paynum())),
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             ),
//           ],
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         ));
//   }
// }

// class Choice {
//   const Choice({required this.title, required this.icon});
//   final String title;
//   final IconData icon;
// }

// List<String> choice = [
//   "Cafe",
//   "Uni Fees",
//   "Point Fees",
//   "Stationary Shop",
//   "Pizza Fast",
//   "Shawarma Shop",
//   "Dhaaba"
// ];
// List<IconData> choice_icon = [
//   Icons.food_bank,
//   Icons.school,
//   Icons.bus_alert,
//   Icons.inventory,
//   Icons.local_pizza,
//   Icons.restaurant,
//   Icons.restaurant_menu
// ];
// const List<Choice> choices = const <Choice>[
//   const Choice(title: 'Cafe', icon: Icons.food_bank),
//   const Choice(title: 'Uni Fees', icon: Icons.school),
//   const Choice(title: 'Point Fees', icon: Icons.bus_alert),
//   const Choice(title: 'Stationary shop', icon: Icons.inventory),
//   const Choice(title: 'Shawarma Shop', icon: Icons.restaurant),
//   const Choice(title: 'Pizza Fast', icon: Icons.local_pizza),
//   const Choice(title: 'Dhaaba', icon: Icons.restaurant_menu),
// ];

// class SelectCard extends StatelessWidget {
//   const SelectCard({Key? key, required this.choice}) : super(key: key);
//   final Choice choice;

//   @override
//   Widget build(BuildContext context) {
//     //final TextStyle textStyle = Theme.of(context).textTheme.display1;
//     return Card(
//         //color: Colors.orange,
//         child: Center(
//       child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: <Widget>[
//             Expanded(child: Icon(choice.icon, size: 50.0)),
//             Text(choice.title),
//           ]),
//     ));
//   }
// }
