import 'package:flutter/material.dart';

class PrioritySelector extends StatefulWidget {
  const PrioritySelector({super.key});

  @override
  State<PrioritySelector> createState() => _PrioritySelectorState();
}

class _PrioritySelectorState extends State<PrioritySelector> {
  int selectedPriority = 0; // 0: Low, 1: Medium, 2: High

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Priority',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(
                color: Colors.black,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PriorityCircle(
                  color: Colors.green,
                  selected: selectedPriority == 0,
                  onPressed: () {
                    setState(() {
                      selectedPriority = 0;
                    });
                  },
                ),
                PriorityCircle(
                  color: Colors.yellow,
                  selected: selectedPriority == 1,
                  onPressed: () {
                    setState(() {
                      selectedPriority = 1;
                    });
                  },
                ),
                PriorityCircle(
                  color: Colors.red,
                  selected: selectedPriority == 2,
                  onPressed: () {
                    setState(() {
                      selectedPriority = 2;
                    });
                  },
                ),
              ],
            ),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Low'),
              Text('High'),
            ],
          )
        ],
      ),
    );
  }
}

class PriorityCircle extends StatelessWidget {
  final Color color;
  final bool selected;
  final VoidCallback onPressed;

  const PriorityCircle(
      {super.key,
      required this.color,
      required this.selected,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
          border: Border.all(
            color: selected ? Colors.black : Colors.transparent,
            width: 2.0,
          ),
        ),
      ),
    );
  }
}
