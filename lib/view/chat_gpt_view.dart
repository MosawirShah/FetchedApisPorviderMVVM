import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider_api_mvvm/resources/common/custom_app_bar.dart';
import 'package:provider_api_mvvm/resources/common/text_widget.dart';
import 'package:provider_api_mvvm/resources/components/chat_gpt_widgets/chat_widget.dart';
import 'package:provider_api_mvvm/services/manager/asset_manager.dart';
import 'package:provider_api_mvvm/services/manager/bottom_sheet_manager.dart';
import 'package:provider_api_mvvm/utils/app_utils.dart';
import 'package:provider_api_mvvm/utils/constants/app_colors.dart';

class ChatGptView extends StatefulWidget {
  const ChatGptView({Key? key}) : super(key: key);

  @override
  State<ChatGptView> createState() => _ChatGptViewState();
}

class _ChatGptViewState extends State<ChatGptView> {
  late TextEditingController textEditingController;
  @override
  void initState() {
    // TODO: implement initState
    textEditingController = TextEditingController();
  }

  final List myList = [
    {
      "msg": "Here is user1 msg",
      "index": 0,
    },
    {
      "msg":
          "This is the chat chpt reponse1 to your msg, note it that this is a dumy text",
      "index": 1
    },
    {
      "msg": "Here is user msg2",
      "index": 0,
    },
    {
      "msg":
          "This is the chat chpt reponse2 to your msg, note it that this is a dumy text",
      "index": 1
    },
    {
      "msg": "Here is user msg3",
      "index": 0,
    },
    {
      "msg":
          "This is the chat chpt reponse3 to your msg, note it that this is a dumy text",
      "index": 1
    },
    {
      "msg": "Here is user msg4",
      "index": 0,
    },
    {
      "msg":
          "This is the chat chpt reponse5 to your msg, note it that this is a dumy text",
      "index": 1
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kChatGptScaffoldColor,
      appBar: AppBar(
        backgroundColor: kChatGptCardColor,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image(
            image: AssetImage(AssetManager.chatGptLogo),
          ),
        ),
        title: const Text(
          "ChatGPT",
          style: TextStyle(color: kWhiteColor),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.home,
                  color: kWhiteColor,
                  size: 35,
                )),
          ),
          IconButton(
              onPressed: () async {
               await BottomSheetManager.bottomSheetManager(context);
              },
              icon: const Icon(
                Icons.more_vert_outlined,
                color: kWhiteColor,
                size: 30,
              ))
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Flexible(
              child: ListView.builder(
                  itemCount: myList.length,
                  itemBuilder: (context, index) {
                    return ChatWidget(
                      chatMessage: myList[index]["msg"].toString(),
                      messageIndex:
                          int.parse(myList[index]["index"].toString()),
                    );
                  }),
            ),
            AppUtils.flutterSpinkKitLoader(kWhiteColor),
            const SizedBox(
              height: 30,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              color: kChatGptCardColor,
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      onSubmitted: (value) {},
                      style: const TextStyle(color: Colors.grey),
                      controller: textEditingController,
                      decoration: const InputDecoration.collapsed(
                          hintText: "How may I can help",
                          hintStyle: TextStyle(color: Colors.grey)),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.send,
                      color: kWhiteColor,
                      size: 30,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
