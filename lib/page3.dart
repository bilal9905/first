import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class page3 extends StatefulWidget {
  @override
  State<page3> createState() => _page3State();
}

class _page3State extends State<page3> {
  @override
  File? _profileImage;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: ListView(
                  children: [
                    Center(
                      child: Stack(
                        children: [
                          CircleAvatar(
                            radius: 60,
                            backgroundImage: _profileImage != null
                                ? FileImage(_profileImage!)
                                : AssetImage('assets/profile_picture.jpg') as ImageProvider,

                          ),
                          Positioned(
                            top: 80,
                            left: 80,
                            child: GestureDetector(
                              onTap:_pickImage ,
                              child: CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.pink,
                                child: Icon(Icons.camera_alt,color: Colors.white,),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),

                    Text(
                      'bilal kanber',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),

                    Text(
                      'bilal8flutter@gmail.com',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.pink[200],
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 30),
                    _buildInfoTile(Icons.person, 'Full Name', 'bilal kanber'),
                    _buildInfoTile(Icons.phone, 'Phone Number', '+90 537 234 8591'),
                    _buildInfoTile(Icons.location_on, 'Location', 'azaz, sirya'),
                    _buildInfoTile(Icons.calendar_today, 'Joined', 'January 2023'),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  Widget _buildInfoTile(IconData icon, String title, String value) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.pink,
            size: 24,
          ),
          SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Colors.pink[200],
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 5),
              Text(
                value,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
