import 'package:flutter/material.dart';

class DescriptionHeader extends StatelessWidget {
  const DescriptionHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: Stack(
        children: [
          Container(
            height: 130,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    "https://www.figma.com/file/PFYZdiyJG6oJc5uv10yBTu/image/c630fa59017c0f16161502e909c87b236bd8c1c6"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 68,
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                        border: Border.all(
                            width: 1,
                            color: Theme.of(context)
                                .colorScheme
                                .secondary
                                .withOpacity(0.5))),
                    width: 68,
                    padding: const EdgeInsets.all(10),
                    height: 68,
                    child: Center(
                      child: Image.network(
                          "https://s3-alpha-sig.figma.com/img/bdfe/9dcd/72debe2dc122e945faac620c94f8a959?Expires=1701043200&Signature=J-cIfPoRa~VUTiE4tupbJaYZTN2osZgdfkJTYlRGaie71UCcTkLySkF2F7XXmRCGu7pwd9zN8ZpBacmNP54unqJdpNtliZaERJ4wla8tQwCnGktNHIrhYxZ~3EpS7yamU61glknWllGeQKW2xiqt5L6dDdjENyzGcnt~d4Sjb54jObmE14bYVqEUNMeCVKzgihFXkydqSjhY7qIgm-VHBNnWg3zX6cG7NWppYd7OK3b6K8~VBECsDPDldqFVtVdC~uCdx4hJqXhYa45zWpLrpEVXgh-BQMUHTo3YKeFQnRuu9aeFJfg~E~dsTtVTO08l2Uu-pKH2RZzSnXIBADWxNQ__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4"),
                    ),
                  ),
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 3),
                        decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(18)),
                        child: const Row(
                          children: [
                            Text(
                              "12",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  height: 1,
                                  fontWeight: FontWeight.w500),
                            ),
                            Icon(
                              Icons.photo_outlined,
                              size: 16,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            size: 16,
                            color: Colors.amber,
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          Text(
                            "4.3/5",
                            style: TextStyle(
                                fontSize: 13,
                                color: Theme.of(context)
                                    .colorScheme
                                    .secondary
                                    .withOpacity(0.5)),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            "(803 Reviews)",
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
