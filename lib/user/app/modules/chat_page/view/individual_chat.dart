import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:propertyfinder/user/app/modules/chat_page/controller/chat_page_controller.dart';

class IndividualChat extends GetView<ChatPageController> {
   IndividualChat({Key? key}) : super(key: key);
  final List<String> messages = [];
  final TextEditingController _controller = TextEditingController();

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
     // setState(() {
        messages.add(_controller.text);
        _controller.clear();
     // });
    }
  }

//build message
  Widget _buildMessage(String message, bool isMe) {

    final alignment = isMe ? CrossAxisAlignment.start : CrossAxisAlignment.end;
    final backgroundColor = isMe ? Colors.blue : Colors.grey[300];
    final textColor = isMe ? Colors.white : Colors.black;

    return Container(
      
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),

      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: 
      Text(
        message,
        style: TextStyle(color: textColor),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
  //   final alignment = isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start;
 //   final backgroundColor = isMe ? Colors.blue : Colors.grey[300];
 //   final textColor = isMe ? Colors.white : Colors.black;
    // TODO: implement build
   return Scaffold(appBar: AppBar(
backgroundColor: Colors.red,
leading: GestureDetector(
  onTap: (){
    Get.back();
  },
  child: Icon(Icons.arrow_back,color: Colors.white,)),title: Text('Robin',style: TextStyle(color: Colors.white),),
   ),
    body:  Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[messages.length - 1 - index];
                final isMe = index % 2 == 0;
                return _buildMessage(message, isMe);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Enter a message...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: _sendMessage,
                ),
              ],
            ))])
   );
  }
   
   }