import 'package:flutter/material.dart';
import 'package:khyaalapp/pages/editprofile_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  // Sample user data (replace it with actual user data)
  final String name = 'John Doe';
  final int age = 30;
  final String address = '123 Main St, City';
  final String contactNo = '+1234567890';
  final String bloodGroup = 'O+';
  final String doctorNo = '+9876543210';
  final String hospitalAddress = '456 Hospital St, City';
  final String referenceNo = '+91 123456789';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 251, 251),
      appBar: AppBar(
        title: Text('Profile'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop(); // Navigate back to previous screen
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              // Navigate to edit profile page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EditProfilePage()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: Icon(Icons.person),
              title: Text(
                'Name',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                name,
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(height: 10),
            ListTile(
              leading: Icon(Icons.calendar_today),
              title: Text(
                'Age',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                age.toString(),
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(height: 10),
            ListTile(
              leading: Icon(Icons.location_on),
              title: Text(
                'Address',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                address,
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(height: 10),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text(
                'Contact No',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                contactNo,
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(height: 10),
            ListTile(
              leading: Icon(Icons.local_hospital),
              title: Text(
                'Blood Group',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                bloodGroup,
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(height: 10),
            ListTile(
              leading: Icon(Icons.local_hospital),
              title: Text(
                'Doctor\'s Number',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                doctorNo,
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(height: 10),
            ListTile(
              leading: Icon(Icons.local_hospital),
              title: Text(
                'Hospital Address',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                hospitalAddress,
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(height: 10),
            ListTile(
              leading: Icon(Icons.person_add),
              title: Text(
                'Family Contact No:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                referenceNo,
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
