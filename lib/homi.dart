import 'dart:io';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class homi extends StatefulWidget {
  const homi({super.key});

  @override
  State<homi> createState() => _homiState();
}

class _homiState extends State<homi> {
  final List<Map<String, dynamic>> _posts = [];
  File? _selectedImage;
  String? _imageUrl;
  final TextEditingController _textController = TextEditingController();
  final ImagePicker _picker = ImagePicker();

  // اختيار صورة
  Future<void> _pickImage() async {
    if (kIsWeb) {
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        setState(() {
          _imageUrl = pickedFile.path;
        });
      }
    } else {
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        setState(() {
          _selectedImage = File(pickedFile.path);
        });
      }
    }
  }

  // إضافة منشور
  void _addPost() {
    if (_textController.text.trim().isNotEmpty &&
        (_imageUrl != null || _selectedImage != null)) {
      setState(() {
        _posts.insert(0, {
          'text': _textController.text.trim(),
          'image': kIsWeb ? _imageUrl : _selectedImage,
          'date': DateTime.now(),
        });
        _textController.clear();
        _imageUrl = null;
        _selectedImage = null;
      });
      Navigator.of(context).pop(); // إغلاق الـ Dialog
    }
  }

  // عرض الصورة بناءً على المنصة
  Widget displayImage(dynamic image) {
    if (kIsWeb) {
      return image != null
          ? Image.network(image, fit: BoxFit.cover, height: 200, width: double.infinity)
          : SizedBox.shrink();
    } else {
      return image != null
          ? Image.file(image, fit: BoxFit.cover, height: 200, width: double.infinity)
          : SizedBox.shrink();
    }
  }

  // عرض حوار لإضافة منشور
  void _showAddPostDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add New Post'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: _textController,
                  decoration: InputDecoration(hintText: 'Write a caption...'),
                ),
                SizedBox(height: 10),
                ElevatedButton.icon(
                  onPressed: _pickImage,
                  icon: Icon(Icons.image),
                  label: Text('Pick Image'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: _addPost,
              child: Text('Post'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:  _posts.isEmpty
          ? Center(child: Text('No posts yet. Add your first post!'))
          : ListView.builder(
        itemCount: _posts.length,
        itemBuilder: (context, index) {
          final post = _posts[index];
          final date = post['date'] as DateTime;

          return Card(
            margin: EdgeInsets.all(10),
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '${date.toLocal()}'.split(' ')[0], // عرض التاريخ
                    style: TextStyle(
                        fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey),
                  ),
                ),
                displayImage(post['image']),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    post['text'],
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          );
        },
      ),
        floatingActionButton: FloatingActionButton(
          onPressed: _showAddPostDialog,
          child: Icon(Icons.add),
          backgroundColor: Colors.teal,
        ),
    );
  }
}
