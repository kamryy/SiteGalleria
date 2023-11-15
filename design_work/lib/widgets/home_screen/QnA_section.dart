import 'package:flutter/material.dart';

class QnASection extends StatefulWidget {
  const QnASection({super.key});

  @override
  _QnASectionState createState() => _QnASectionState();
}

class _QnASectionState extends State<QnASection> {
  // Controller for the PageView.
  final PageController _controller = PageController(initialPage: 0);

  // Variable to track the current page in the PageView.
  int _currentPage = 0;

  // A list of questions to be displayed in the PageView.
  static final List<String> _questions = [
    "Which IITs do not conduct interviews for MTech admission in Civil Engineering Specializations?",
    "How much marks get cucet exams?",
    "In KCET counselling, i got this college... i need to know this college placement."
  ];

  @override
  Widget build(BuildContext context) {
    // Building the main column layout.
    return Column(
      children: [
        // Header row with the title 'QnA' and 'View All' action.
        Row(
          children: [
            // Title 'QnA'.
            Text(
              "QnA",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                height: 1.5,
                color: Theme.of(context).colorScheme.secondary.withOpacity(0.75),
              ),
            ),
            const Spacer(),
            // 'View All' action.
            _buildViewAll(context),
          ],
        ),
        const SizedBox(height: 15),
        // PageView to display questions.
        _buildQuestionsPageView(context),
        const SizedBox(height: 10),
        // Row of dots to indicate the current page.
        _buildPageIndicator(context),
      ],
    );
  }

  // Method to build the 'View All' section.
  Widget _buildViewAll(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Theme.of(context).colorScheme.primary.withOpacity(1),
            width: 1,
          ),
        ),
      ),
      padding: const EdgeInsets.only(bottom: 2),
      child: Row(
        children: [
          Text(
            "View All",
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              height: 1.33,
              color: Theme.of(context).colorScheme.primary.withOpacity(1),
            ),
          ),
          const SizedBox(width: 3),
          Icon(
            Icons.arrow_forward_ios,
            size: 16,
            color: Theme.of(context).colorScheme.primary.withOpacity(1),
          ),
        ],
      ),
    );
  }

  // Method to build the PageView for questions.
  Widget _buildQuestionsPageView(BuildContext context) {
    return Expanded(
      child: PageView.builder(
        controller: _controller,
        onPageChanged: (int page) {
          setState(() {
            _currentPage = page;
          });
        },
        itemCount: _questions.length,
        itemBuilder: (context, index) => _buildQuestionCard(context, index),
      ),
    );
  }

  // Method to build each question card.
  Widget _buildQuestionCard(BuildContext context, int index) {
    return Container(
      height: 75,
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 5,
            height: double.infinity,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.75),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              _questions[index],
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                height: 1.5,
                color: Theme.of(context).colorScheme.secondary.withOpacity(1),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Method to build the page indicator.
  Widget _buildPageIndicator(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List<Widget>.generate(3, (int index) {
        return Container(
          width: _currentPage == index ? 10 : 5,
          height: _currentPage == index ? 10 : 5,
          margin: const EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _currentPage == index
                ? Theme.of(context).colorScheme.secondary.withOpacity(0.75)
                : Theme.of(context).colorScheme.secondary.withOpacity(0.20),
          ),
        );
      }),
    );
  }
}
