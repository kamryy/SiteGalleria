import 'dart:async';
import 'package:flutter/material.dart';

class HomeScreenSearchBar extends StatefulWidget {
  const HomeScreenSearchBar({super.key});

  @override
  State<HomeScreenSearchBar> createState() => _HomeScreenSearchBarState();
}

class _HomeScreenSearchBarState extends State<HomeScreenSearchBar>
    with SingleTickerProviderStateMixin {
  // Controller and animations for the search icon effects.
  late AnimationController _controller;
  late Animation<double> _animationOffsetX;
  late Animation<double> _animationOffsetY;
  late Animation<double> _animationSize;
  late Animation<double> _animationRotation;

  // Controller for page view and focus node for text field.
  PageController controller = PageController();
  FocusNode focusNode = FocusNode();

  // List of strings for the page view.
  final List<String> _list = ["Colleges", "Fees", "Exams", "and more!"];

  @override
  void initState() {
    super.initState();

    // Initialization of animations for the search icon.
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    _animationOffsetX = Tween<double>(begin: 0, end: 5).animate(_controller);
    _animationOffsetY = TweenSequence(
      <TweenSequenceItem<double>>[
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0, end: -5),
          weight: 50,
        ),
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: -5, end: 5),
          weight: 50,
        ),
      ],
    ).animate(_controller);
    _animationSize = Tween<double>(begin: 1, end: 0.8).animate(_controller);
    _animationRotation = Tween<double>(begin: 0, end: 1).animate(_controller);

    // Periodic timer to trigger animation and page view changes.
    Timer.periodic(const Duration(seconds: 3), (Timer t) {
      _controller.forward().then((value) => _controller.reverse());
      if (!contain) {
        if (controller.page == _list.length - 1) {
          controller.animateTo(0,
              duration: const Duration(milliseconds: 350),
              curve: Curves.easeIn);
        } else {
          controller.nextPage(
              duration: const Duration(milliseconds: 350),
              curve: Curves.easeIn);
        }
      }
    });
  }

  bool contain = false; // Flag to check if the search field contains text.

  @override
  Widget build(BuildContext context) {
    // Style for the text in the search bar.
    TextStyle textStyle = TextStyle(
      color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
      fontSize: 16,
      fontWeight: FontWeight.w400,
      height: 1.5,
    );

    return GestureDetector(
      onTap: () {
        focusNode
            .requestFocus(); // Focus the text field when the container is tapped.
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: !contain
                  ? MediaQuery.of(context).size.width * 0.28
                  : MediaQuery.of(context).size.width * 0.6,
              child: TextField(
                focusNode: focusNode,
                style: textStyle,
                onChanged: (value) {
                  setState(() {
                    contain = value
                        .isNotEmpty; // Update contain flag based on if the text field has content.
                  });
                },
                decoration: InputDecoration(
                    hintStyle: textStyle,
                    icon: AnimatedBuilder(
                      animation: _controller,
                      builder: (context, child) {
                        return Transform.translate(
                          offset: Offset(
                            _animationOffsetX.value,
                            _animationOffsetY.value,
                          ),
                          child: SizedBox(
                            width: 20,
                            child: Transform.rotate(
                              angle: _animationRotation.value * 0.1 * 3.14,
                              child: Icon(
                                Icons.search,
                                size: 25 * _animationSize.value,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    hintText: 'Search for ',
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(vertical: 15)),
              ),
            ),
            !contain
                ? Expanded(
                    child: SizedBox(
                    height: 16 * 1.5,
                    child: PageView.builder(
                      controller: controller,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) => Text(
                        _list[index],
                        style: textStyle,
                      ),
                    ),
                  ))
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
