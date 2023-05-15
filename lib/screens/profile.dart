import 'package:flutter/material.dart';

import 'HomeScreen.dart';

class UserProfileScreen extends StatefulWidget {
  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  bool _isEditing = false;
  String _name = 'Ahmed Ali';
  String _id = '1234';
  String _address = 'clifton khi';
  String _email = 'abc@gmail.com';
  String _contact = '12345678';

  final _nameController = TextEditingController();
  final _idController = TextEditingController();
  final _addressController = TextEditingController();
  final _emailController = TextEditingController();
  final _contactController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameController.text = _name;
    _idController.text = _id;
    _addressController.text = _address;
    _emailController.text = _email;
    _contactController.text = _contact;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _idController.dispose();
    _addressController.dispose();
    _emailController.dispose();
    _contactController.dispose();
    super.dispose();
  }

  void _toggleEdit() {
    setState(() {
      _isEditing = !_isEditing;
    });
  }

  void _saveChanges() {
    setState(() {
      _name = _nameController.text;
      _id = _idController.text;
      _address = _addressController.text;
      _email = _emailController.text;
      _contact = _contactController.text;
      _isEditing = false;
    });
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        decoration: InputDecoration(
          labelText: label,
        ),
        controller: controller,
        enabled: _isEditing,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => HomeScreen())),
          ),
          title: Text("ＰＲＯＦＩＬＥ"),
          centerTitle: true,
          backgroundColor: Color(0xFFD44C66),
          actions: [
            IconButton(
              icon: Icon(_isEditing ? Icons.save : Icons.edit),
              onPressed: _isEditing ? _saveChanges : _toggleEdit,
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 16,
              ),
              CircleAvatar(
                radius: 100,
                backgroundImage: AssetImage('assets/M.jpg'),
              ),
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildTextField('Name', _nameController),
                    _buildTextField('ID', _idController),
                    _buildTextField('Address', _addressController),
                    _buildTextField('Email', _emailController),
                    _buildTextField('Contact', _contactController),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

// import 'HomeScreen.dart';

// class UserProfileScreen extends StatefulWidget {
//   @override
//   _UserProfileScreenState createState() => _UserProfileScreenState();
// }

// class _UserProfileScreenState extends State<UserProfileScreen> {
//   final nameController = TextEditingController();
//   final emailController = TextEditingController();
//   final contactController = TextEditingController();
//   final nuidController = TextEditingController();
//   final addressController = TextEditingController();
//   String name = "ahmed", address = "gizri clifton", email = "abc@gmail.com";
//   int id = 123, con = 12312412;

//   @override
//   void initState() {
//     super.initState();
//     nameController.text = name;
//     nuidController.text = id.toString();
//     addressController.text = address;
//     contactController.text = con.toString();
//     emailController.text = email;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//           leading: IconButton(
//             icon: Icon(Icons.arrow_back),
//             onPressed: () => Navigator.pushReplacement(
//                 context, MaterialPageRoute(builder: (context) => HomeScreen())),
//           ),
//           title: Text("ＰＲＯＦＩＬＥ"),
//           centerTitle: true,
//           backgroundColor: Color(0xFFD44C66)),
//       body: ListView(
//         children: [
//           SizedBox(height: 16),
//           CircleAvatar(
//             radius: 100,
//             backgroundImage: AssetImage('assets/M.jpg'),
//           ),
//           SizedBox(height: 16),
//           ListTile(
//             leading: Icon(Icons.person),
//             title: Text('Ahmed Ali'),
//             //subtitle: Text('Ahmed@example.com'),
//           ),
//           Divider(),
//           ListTile(
//             leading: Icon(Icons.card_membership),
//             title: Text('k191479'),
//           ),
//           Divider(),
//           ListTile(
//             leading: Icon(Icons.phone),
//             title: Text('123-456-7890'),
//           ),
//           Divider(),
//           ListTile(
//             leading: Icon(Icons.email),
//             title: Text('ahmed@gmail.com'),
//             //subtitle: Text('Anytown, USA'),
//           ),
//           Divider(),
//           ListTile(
//             leading: Icon(Icons.location_city),
//             title: Text('Clifton gizri Khi'),
//             //subtitle: Text('Anytown, USA'),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               setState(() {
//                 name = nameController.text;
//                 id = int.parse(nuidController.text);
//                 address = addressController.text;
//               });
//             },
//             child: Text('Update'),
//           ),
//         ],
//       ),

//       // Navigate to the edit profile screen
//     );
//   }
// }
