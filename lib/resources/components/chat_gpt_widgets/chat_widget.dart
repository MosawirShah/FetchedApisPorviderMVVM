import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider_api_mvvm/resources/common/text_widget.dart';
import 'package:provider_api_mvvm/services/manager/asset_manager.dart';
import 'package:provider_api_mvvm/utils/constants/app_colors.dart';

class ChatWidget extends StatelessWidget {
  ChatWidget({Key? key,required this.chatMessage, required this.messageIndex}) : super(key: key);

  String chatMessage;
  int messageIndex;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          color: messageIndex ==0? kChatGptScaffoldColor : kChatGptCardColor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image(
                  image: AssetImage(messageIndex == 0 ? AssetManager.personLogo : AssetManager.chatGptLogo),
                  height: 30,
                  width: 30,
                ),
                const SizedBox(width: 8,),
                Expanded(child: TextWidget(label: chatMessage)),
               const SizedBox(width: 5,),
                messageIndex == 0 ? const SizedBox.shrink():
                    const Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                      Icon(Icons.thumb_up_alt_outlined,color: kWhiteColor,),
                       SizedBox(width: 8,),
                      Icon(Icons.thumb_down_alt_outlined,color: kWhiteColor,)
                    ],),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
