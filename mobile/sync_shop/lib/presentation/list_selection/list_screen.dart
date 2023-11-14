import 'package:flutter/material.dart';
import 'package:sync_shop/presentation/list_selection/action_pop_up.dart';
import 'package:sync_shop/presentation/list_selection/add_buttons.dart';
import 'package:sync_shop/presentation/list_selection/list_item.dart';
import 'package:sync_shop/screen_template.dart';

class ListSelectionScreen extends StatefulWidget {
  const ListSelectionScreen({Key? key}) : super(key: key);

  @override
  _ListSelectionScreenState createState() => _ListSelectionScreenState();
}

class _ListSelectionScreenState extends State<ListSelectionScreen> {
  bool _isJoinPopupVisible = false;
  bool _isCreatePopupVisible = false;

  @override
  Widget build(BuildContext context) {
    return buildScreenTemplateWidget(
      context,
      "My Lists",
      [
        // TODO add logic to get the lists and present them
        Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
            child: GridView.builder(
              physics: const ClampingScrollPhysics(), //not sure mas se der asneira logo se vê
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Adjust the number of columns as needed
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              itemCount: 5,
              itemBuilder: (context, index) {
                return ListItem(
                  imageUrl: 'https://media.discordapp.net/attachments/801462552709038113/1165715383970439188/Screenshot_20231022_191601_Instagram.jpg?ex=65638b8d&is=6551168d&hm=debf91f881ef03042c5492b3589bfc477ff7b1d40dd6a042b613c080e6304dc7&=&width=683&height=662',
                  text: 'Test',
                  backgroundColor: Theme.of(context).colorScheme.secondary, // Set your desired background color
                );
              },
            ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
          padding: const EdgeInsets.only(left: 30, bottom: 20),
          child: ListButton(text: "Join", onClick: (){
              setState(() {
                _isJoinPopupVisible = true;
              });
            })
          )
        ),
        Align(
            alignment: Alignment.bottomRight,
            child: Padding(
                padding: const EdgeInsets.only(right: 30, bottom: 20),
                child: ListButton(text: "Create", onClick: (){
                  setState(() {
                    _isCreatePopupVisible = true;
                  });
                })
            )
        ),
        ActionPopup(
          onClose: () {
            setState(() {
              _isJoinPopupVisible = false;
            });
            },
          onClick: () {},
          isPopupVisible: _isJoinPopupVisible,
          buttonText: "Join!",
          textFieldText: "Paste Code",
        ),
        ActionPopup(
          onClose: () {
            setState(() {
              _isCreatePopupVisible = false;
            });
          },
            onClick: () {},
          isPopupVisible: _isCreatePopupVisible,
          buttonText: "Create!",
          textFieldText: "List Name",
        )
      ]
    );
  }
}
