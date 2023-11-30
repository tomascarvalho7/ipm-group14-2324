import 'package:flutter/material.dart';

class ActionPopup extends StatefulWidget {
  final Function(String) onClick;
  final VoidCallback onClose;
  final bool isPopupVisible;
  final String buttonText;
  final String textFieldText;

  ActionPopup({
    required this.onClose,
    required this.onClick,
    required this.isPopupVisible,
    required this.buttonText,
    required this.textFieldText,
  });

  @override
  _ActionPopupState createState() => _ActionPopupState();
}

class _ActionPopupState extends State<ActionPopup> {
  late TextEditingController _listController;

  @override
  void initState() {
    super.initState();
    _listController = TextEditingController();
    _listController.addListener(_updateButtonState);
  }

  void _updateButtonState() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: AnimatedContainer(
        clipBehavior: Clip.hardEdge,
        duration: const Duration(milliseconds: 200),
        height: widget.isPopupVisible ? MediaQuery.of(context).size.height * 0.3 : 0,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: widget.isPopupVisible
            ? Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                maxLength: 40,
                controller: _listController,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: 15,
                    color: Theme.of(context).colorScheme.surfaceVariant
                ),
                decoration: InputDecoration(
                  counter: const SizedBox.shrink(),
                  filled: true,
                  fillColor: Theme.of(context).colorScheme.surface,
                  hintText: widget.textFieldText,
                  hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 15, color: Theme.of(context).colorScheme.surfaceVariant),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.surfaceVariant,
                      width: 2,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.surfaceVariant,
                      width: 1,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: widget.onClose,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.error,
                      padding: const EdgeInsets.all(16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      "Close",
                      style: Theme.of(context).textTheme.bodyMedium?.
                      copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: _listController.text.isNotEmpty ? () => widget.onClick(_listController.text) : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _listController.text.isNotEmpty
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).colorScheme.surfaceVariant,
                      padding: const EdgeInsets.all(16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      widget.buttonText,
                      style: Theme.of(context).textTheme.bodyMedium?.
                      copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
            : const SizedBox.shrink(),
      ),
    );
  }

  @override
  void dispose() {
    _listController.dispose();
    super.dispose();
  }
}
