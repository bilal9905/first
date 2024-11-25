import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Page1 extends StatefulWidget {
  @override
  State<Page1> createState() => _Page1State();
}
bool isLiked = false;
class _Page1State extends State<Page1> {
  final List<Map<String, dynamic>> _posts = [];
  File? _selectedImage;
  String? _imageUrl;
  final TextEditingController _textController = TextEditingController();
  final ImagePicker _picker = ImagePicker();


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
      Navigator.of(context).pop();
    }
  }


  Widget displayImage(dynamic image) {
    if (kIsWeb) {
      return image != null
          ? Image.network(image,fit: BoxFit.fitWidth , height: 200, width: double.infinity)
          : SizedBox.shrink();
    } else {
      return image != null
          ? Image.file(image,   height: 200,fit: BoxFit.fitWidth , width: double.infinity)
          : SizedBox.shrink();
    }
  }


  void _showAddPostDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.grey.shade700,
          title: Text('Add New Post',style: TextStyle(color: Colors.white),),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: _textController,
                  decoration: InputDecoration(hintText: 'Write a caption...',hintStyle: TextStyle(color: Colors.white),),
                ),
                SizedBox(height: 10),
                ElevatedButton.icon(
                  onPressed: _pickImage,
                  icon: Icon(Icons.image,color: Colors.pink,),
                  label: Text('Pick Image',style: TextStyle(color: Colors.pink),),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Cancel',style: TextStyle(color: Colors.white),),
            ),
            ElevatedButton(
              onPressed: _addPost,
              child: Text('Post',style: TextStyle(color: Colors.pink),),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      body: _posts.isEmpty
          ? Center(child: Text('No posts yet. Add your first post!',style: TextStyle(color: Colors.grey),))
          :

              ListView.builder(
                      itemCount: _posts.length,
                      itemBuilder: (context, index) {
              final post = _posts[index];
              final date = post['date'] as DateTime;

              return Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white12,width: 2),
                ),
                child: Card(
                  color: Colors.black,
                  margin: EdgeInsets.all(10),
                  elevation: 5,

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(1),

                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              '${date.toLocal()}'.split(' ')[0],
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold, color: Colors.pink),
                            ),
                          ),
                          Row(
                            children: [
                              Text('profile name',style: TextStyle(color: Colors.white),),
                              Container(
                                margin: EdgeInsets.all(7),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.pink,width: 1.5),
                                  shape: BoxShape.circle,
                                ),
                                child: CircleAvatar(
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white12),
                          ),
                          child: displayImage(post['image'])),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                           //   mainAxisAlignment: MainAxisAlignment.end,
                              children: [

                                InkWell(
                                    child: Icon(Icons.save_alt,color: Colors.white,)
                                ),
                                SizedBox(width: 150,),
                                Icon(Icons.share_outlined,color: Colors.white,),
                                SizedBox(width: 50,),
                              Icon(Icons.mode_comment_outlined,color: Colors.white,),
                                SizedBox(width: 50,),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      isLiked = !isLiked;
                                    });
                                  },
                                  child: Icon(
                                    isLiked ? Icons.favorite : Icons.favorite_border,
                                    color: isLiked ? Colors.pink : Colors.grey,

                                  ),

                                ),

                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              post['text'],
                              style: TextStyle(fontSize: 16,color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
                      },
                    ),
    floatingActionButton:
             Container(
               margin: EdgeInsets.only(bottom: 70),
               child: FloatingActionButton(

                           onPressed: _showAddPostDialog,
                           child: Icon(Icons.add,color: Colors.white,),
                           backgroundColor: Colors.pink,
                           ),
             ),







    );
  }
}
// floatingActionButton: FloatingActionButton(
// onPressed: _showAddPostDialog,
// child: Icon(Icons.add),
// backgroundColor: Colors.teal,
// ),
