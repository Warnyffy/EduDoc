import 'package:edudoc/app/models/user_model.dart';
import 'package:edudoc/app/utils/app_colors.dart';
import 'package:flutter/material.dart';

class MessagesScreen extends StatefulWidget {
  final List messgaes;
  final UserModel user;
  const MessagesScreen({super.key, required this.messgaes, required this.user});

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
                Row(
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(widget.messgaes[index]
                                    ['isUserMessage']
                                ? 20
                                : 0),
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(widget.messgaes[index]
                                    ['isUserMessage']
                                ? 0
                                : 20),
                            topLeft: Radius.circular(20),
                          ),
                          color: widget.messgaes[index]['isUserMessage']
                              ? AppColors.customWhite
                              : AppColors.secondaryColorshade1),
                      constraints: BoxConstraints(maxWidth: w * 2 / 3),
                      child: Text(
                        widget.messgaes[index]['message'].text.text[0],
                        style: TextStyle(
                            color: widget.messgaes[index]['isUserMessage']
                                ? AppColors.primaryColor
                                : AppColors.customBlack),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    widget.messgaes[index]['isUserMessage']
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(174.0 / 2),
                            child: SizedBox(
                              width: 45,
                              height: 45,
                              child: Image(
                                image: NetworkImage(
                                  widget.user.profileImage ??
                                      'https://upload.wikimedia.org/wikipedia/commons/7/7c/Profile_avatar_placeholder_large.png',
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          )
                        : SizedBox(),
                  ],
                ),
              ],
            ),
          );
        },
        separatorBuilder: (_, i) => Padding(padding: EdgeInsets.only(top: 10)),
        itemCount: widget.messgaes.length);
  }
}
