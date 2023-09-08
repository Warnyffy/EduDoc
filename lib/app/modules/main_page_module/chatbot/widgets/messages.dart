import 'package:edudoc/app/utils/app_colors.dart';
import 'package:flutter/material.dart';

class MessagesScreen extends StatefulWidget {
  final List messgaes;
  const MessagesScreen({super.key, required this.messgaes});

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return ListView.separated(
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: widget.messgaes[index]['isUserMessage']
                  ? MainAxisAlignment.end
                  : MainAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 14, horizontal: 14),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(
                          20,
                        ),
                        topRight: Radius.circular(20),
                        bottomRight: Radius.circular(
                            widget.messgaes[index]['isUserMessage'] ? 0 : 20),
                        topLeft: Radius.circular(
                            widget.messgaes[index]['isUserMessage'] ? 20 : 0),
                      ),
                      color: widget.messgaes[index]['isUserMessage']
                          ? AppColors.primaryColor
                          : AppColors.secondaryColorshade1),
                  constraints: BoxConstraints(maxWidth: w * 2 / 3),
                  child: Text(
                    widget.messgaes[index]['message'].text.text[0],
                    style: TextStyle(
                        color: widget.messgaes[index]['isUserMessage']
                            ? AppColors.customWhite
                            : AppColors.customBlack),
                  ),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (_, i) => Padding(padding: EdgeInsets.only(top: 10)),
        itemCount: widget.messgaes.length);
  }
}
