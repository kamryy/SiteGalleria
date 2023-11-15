import 'package:flutter/material.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animationOffset;
  late Animation<double> _animationSize;
  late Animation<Color?> _animationColor;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    )..repeat(reverse: true);

    _animationOffset =
        Tween<double>(begin: -0.15, end: 0.15).animate(_controller);
    _animationSize = Tween<double>(begin: 50, end: 15).animate(_controller);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Now that the context is fully established, create the color tween
    _animationColor = ColorTween(
      begin: Theme.of(context).colorScheme.primary,
      end: Theme.of(context).colorScheme.inversePrimary,
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 50,
            alignment: Alignment.center,
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(
                    MediaQuery.of(context).size.width * _animationOffset.value,
                    0,
                  ),
                  child: Container(
                    width: _animationSize.value,
                    height: _animationSize.value,
                    decoration: BoxDecoration(
                      color: _animationColor.value,
                      shape: BoxShape.circle,
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          Text(
            "Please Wait \n Your Account is being created!",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Theme.of(context).colorScheme.primary.withOpacity(0.75),
                fontSize: 16,
                fontWeight: FontWeight.w500,
                height: 1.5),
          )
        ],
      ),
    );
  }
}
