import 'package:flutter/material.dart';

class VideosSection extends StatefulWidget {
  const VideosSection({super.key});

  @override
  _VideosSectionState createState() => _VideosSectionState();
}

class _VideosSectionState extends State<VideosSection> {
  // Controller for the PageView.
  final PageController _controller = PageController(initialPage: 0);

  // Variable to track the current page in the PageView.
  int _currentPage = 0;

  // A list of questions to be displayed in the PageView.
  static final List<Map> _videos = [
    {
      "title":
          "Top 5 Tips for Excelling in Your Freshman Year: A Student's Guide",
      "image":
          "https://s3-alpha-sig.figma.com/img/f152/dafd/9b68c0c148f396ce6e99a902a415dedb?Expires=1701043200&Signature=icjvZCtBefODVKT5jqSlURkd3JZvf0a7pRXj-AXz7F2RrrgKH5thAWt585oHL9rVt3ofs81oL14MQyjcHuLndJ767muv1WEbjCiPJaqkq-1aPVPQnToVF~KjbEqx6HSj2hzqTe7fztDPpDbuCIcB3R5U08WI85gcxPbjJrUG~0AuvTv3MIfcHAnGYNDIpjRniQgSFSVXHWRD6VgxzdzKCLumlI-YHEtg5rQjIMYAfkj8emb9iCMO7gBFvvBN4t8g8qS~zOkv5NBpeTuHMpgawsqDuL-oTSUNAXXa8vLf~1JBmhtbAq05-SV7xypWtjmz3oxmbja8rAjV7tD6z-0DiQ__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4"
    },
    {
      "image":
          "https://s3-alpha-sig.figma.com/img/9625/3e77/9d5ab9f350de3912de8e57ced80e2ae7?Expires=1701043200&Signature=akLAFNjrP7ROTW1NeVcd2QiyUo3SplEMWHOaiLCKgJ0yqJhjUx16JB1uzNiJxjEWHODU-DKHzDsZoygU7wk3D9HZfp1bIf7LYMEJjVfF3wwZv8HZ5zqTBdQ2UxVTqdZDeWjm5GRHccbLplA3RoO9uy5J0pB9-qYf8aaTDoHKrc6J4J38ekZKrbnK3C8blpl4QJ5N8eWMShTmzmE~z8nIRH6rUcK~yOnPJYIBbNwgFEpAulyAowBLJwC7ssR4TNpzf2jFdytaBnXqMiUQ8cHXPVA1Cn7CwLhJuOlJ6JadJayvbrux0CTM67yAatq~SWfqQi0uLZatxA1GrV--qZOi5Q__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4",
      "title":
          "Campus Tour: A Virtual Walkthrough of Meenkashi college of engineering, KK Nagar"
    },
    {
      "image":
          "https://s3-alpha-sig.figma.com/img/6830/6ec5/85610aedb977cc0d92b3e44a0708dd88?Expires=1701043200&Signature=YDsFw8FV~SQY0eDz8JsP5MKJvT2-q4DLdX5m6zRtt-dNwJV3Vp4DUr2ZuzYge-q5FirS45gYCbPCdDLqB2LVxQQiXHnN5qTOeImD7yR-S4YhOc~z2OB0pgxpVqwfow6dqNgaE3HFZ7XCmbMPT1lNLv6Q2Fy08Yx57TsI6xl8UWNHvYt4eFb~adTWHYwyMq15LptS4GEjAZXoHfy15zKsFDnpNKxzLMCtNGnzVT~yYj5srxiPmQFUR4TzIdekl5H2XdleDWHzkO1yGpOJu~ZBis7~0cDGX6QwzqRWMR~LQRkTSXWXgX4z1GkozgXIJJUox09B6S9ky5NAJSZr3pSXnA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4",
      "title": "How to Prepare for Finals: Study Strategies that Work!"
    }
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
              "Videos",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                height: 1.5,
                color:
                    Theme.of(context).colorScheme.secondary.withOpacity(0.75),
              ),
            ),
            const Spacer(),
            // 'View All' action.
            _buildViewAll(context),
          ],
        ),
        const SizedBox(height: 15),
        // PageView to display videos.
        _buildVideosPageView(context),
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

  // Method to build the PageView for videos.
  Widget _buildVideosPageView(BuildContext context) {
    return Expanded(
      child: PageView.builder(
        controller: _controller,
        onPageChanged: (int page) {
          setState(() {
            _currentPage = page;
          });
        },
        itemCount: _videos.length,
        itemBuilder: (context, index) => _buildVideosCard(context, index),
      ),
    );
  }

  // Method to build each question card.
  Widget _buildVideosCard(BuildContext context, int index) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  _videos[index]["image"],
                  width: double.infinity,
                  height: 220,
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color.fromARGB(1, 124, 124, 124)
                        .withOpacity(0.5)),
                child: const Icon(
                  Icons.play_arrow_outlined,
                  size: 26,
                  color: Colors.white,
                ),
              )
            ],
          ),
          Expanded(
            child: Text(
              _videos[index]["title"],
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
