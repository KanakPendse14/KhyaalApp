import 'package:flutter/material.dart';
import 'package:khyaalapp/pages/games_page.dart';
import 'package:khyaalapp/pages/login_page.dart';
import 'package:khyaalapp/pages/profile_page.dart';
import 'package:khyaalapp/pages/register_for_workshop.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  // Logout function
  void logout(BuildContext context) async {
    try {
      // Your logout implementation
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
            builder: (context) => LoginPage(
                  onTap: () {},
                )),
      );
    } catch (e) {
      print("Error logging out: $e");
    }
  }

  void goToProfilePage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ProfilePage()),
    );
  }

  void goToGamePage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const GamePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hello, sir!"),
        centerTitle: true,
        backgroundColor: Colors.green.shade500,
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: AssetImage('lib/images/homepageimg1.png'),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => logout(context), // Call logout function
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Join Our Workshops',
                style: TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.green.shade900),
              ),
            ),
            WorkshopOptions(),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {
                // Add functionality for the 'Home' button
              },
              icon: Icon(Icons.home),
            ),
            IconButton(
              onPressed: () {
                // Add functionality for the 'New Programs' button
              },
              icon: Icon(Icons.add),
            ),
            IconButton(
              onPressed: () {
                goToGamePage(context);
              },
              icon: Icon(Icons.gamepad),
            ),
            IconButton(
              onPressed: () {
                goToProfilePage(context);
                // Add functionality for the 'Profile' button
              },
              icon: Icon(Icons.person),
            ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: () {
      //     // Add functionality for registration button
      //   },
      //   label: Text('Register'),
      //   icon: Icon(Icons.add),
      //   backgroundColor: Colors.green,
      // ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class WorkshopOptions extends StatelessWidget {
  const WorkshopOptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: const [
        WorkshopOption(
          title: 'Yoga Sessions',
          description: 'Join our yoga sessions for relaxation and fitness.',
          imagePath: 'lib/images/Yogasessionworkshop1.png',
        ),
        WorkshopOption(
          title: 'Meditation Sessions',
          description: 'Learn to meditate and find inner peace.',
          imagePath: 'lib/images/Meditationworkshop2.png',
        ),
        WorkshopOption(
          title: 'Fitness Workshops',
          description: 'Get fit and stay healthy with our fitness workshops.',
          imagePath: 'lib/images/exercisesworkshop3.png',
        ),
        WorkshopOption(
          title: 'Art and Craft Classes',
          description:
              'Explore your creativity with our art and craft classes.',
          imagePath: 'lib/images/artandcraftworkshop4.png',
        ),
        WorkshopOption(
          title: 'Cooking Classes',
          description: 'Master the art of cooking with our cooking classes.',
          imagePath: 'lib/images/cookingworkshop5.png',
        ),
      ],
    );
  }
}

class WorkshopOption extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;

  const WorkshopOption({
    Key? key,
    required this.title,
    required this.description,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  RegisterForWorkshopPage(workshopTitle: title),
            ),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(255, 67, 66, 66).withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.asset(
                  imagePath,
                  width: double.infinity,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  title,
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.green.shade900),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  description,
                  style: TextStyle(fontSize: 16.0, color: Colors.black87),
                ),
              ),
              SizedBox(height: 8.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          RegisterForWorkshopPage(workshopTitle: title),
                    ),
                  );
                },
                child: Text('Register', style: TextStyle(fontSize: 16.0)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
