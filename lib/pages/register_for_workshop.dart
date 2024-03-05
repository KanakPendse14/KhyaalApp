// import 'package:flutter/material.dart';

// class RegisterForWorkshopPage extends StatefulWidget {
//   final String workshopTitle;

//   const RegisterForWorkshopPage({Key? key, required this.workshopTitle})
//       : super(key: key);

//   @override
//   _RegisterForWorkshopPageState createState() =>
//       _RegisterForWorkshopPageState();
// }

// class _RegisterForWorkshopPageState extends State<RegisterForWorkshopPage> {
//   // Define your form fields and variables here

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Register for ${widget.workshopTitle}'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Add your form fields here
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class RegisterForWorkshopPage extends StatefulWidget {
  final String workshopTitle;

  const RegisterForWorkshopPage({Key? key, required this.workshopTitle})
      : super(key: key);

  @override
  _RegisterForWorkshopPageState createState() =>
      _RegisterForWorkshopPageState();
}

class _RegisterForWorkshopPageState extends State<RegisterForWorkshopPage> {
  final _formKey = GlobalKey<FormState>();

  late String _name;
  late int _age;
  late String _address;
  late String _location;
  late String _contactNo;
  late String _bloodGroup;
  late String _aadharNo;
  late String _familyContactNo;
  late String _familyMemberName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register for ${widget.workshopTitle}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
                onSaved: (value) {
                  _name = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Age'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your age';
                  }
                  return null;
                },
                onSaved: (value) {
                  _age = int.parse(value!);
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Address'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your address';
                  }
                  return null;
                },
                onSaved: (value) {
                  _address = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Location'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your location';
                  }
                  return null;
                },
                onSaved: (value) {
                  _location = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Contact Number'),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty || value.length != 10) {
                    return 'Please enter a valid 10-digit contact number';
                  }
                  return null;
                },
                onSaved: (value) {
                  _contactNo = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Blood Group'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your blood group';
                  }
                  return null;
                },
                onSaved: (value) {
                  _bloodGroup = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Aadhar Number'),
                validator: (value) {
                  if (value == null || value.isEmpty || value.length != 12) {
                    return 'Please enter a valid 12-digit Aadhar number';
                  }
                  return null;
                },
                onSaved: (value) {
                  _aadharNo = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Family Contact Number'),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty || value.length != 10) {
                    return 'Please enter a valid 10-digit contact number';
                  }
                  return null;
                },
                onSaved: (value) {
                  _familyContactNo = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Family Member Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the family member name';
                  }
                  return null;
                },
                onSaved: (value) {
                  _familyMemberName = value!;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // You can handle form submission here
                    // For now, let's just show a success message
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                            'Successfully registered for ${widget.workshopTitle}'),
                      ),
                    );
                  }
                },
                child: Text('Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
