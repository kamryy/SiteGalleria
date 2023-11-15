import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class TopUniversitiesSection extends StatelessWidget {
  const TopUniversitiesSection({super.key});

  static final List collegesList = [
    {
      "name": "Anna University",
      "location": "Adyar",
      "type": "Autonamous",
      "rank": "#10",
      "fees": "₹1.10",
      "icon":
          "https://s3-alpha-sig.figma.com/img/f3d5/8961/1a6d25c9bf5d06ff6d448b3a6bec5aeb?Expires=1701043200&Signature=Zdixcv4XX9MGUTYRlfTH3RUhLy3ouubaiivelIIWPYAi7rS67N9BsylytD3v5tvh-buSrhfud-3scsu9l09sP0InxNPOtM37yGP4RncnBR68m701WwwNVjF08AD7bEuq6yNSPRn3Kqb-yLTToTrBFLlz7po0rH~ZwHuzC4qGgEZyR4o1OrYuViqqvptRuIcalom8y8BKUljOgeS~eeAQa3pY64PrzPQOaASRZHZytUrQ~mgSf-dgcN9kv4TlKq5yeJChGcFWSdX6FncPA2KmdX-EPnbYnuFtyyilPBucARjuY4DqK8wSNnecSNbSci4~kaEf90fvi1onlkbLmNzDqA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4",
      "bgimage":
          "https://s3-alpha-sig.figma.com/img/aab2/ff95/d19e62a10bbaaf6fbf69bf7b209826ff?Expires=1701043200&Signature=mjyfDEecWiQUT~~sAg-lAGMhB-KiKYEL0RanF47oOegGIGh3hJqVg9NadSGxeECi1Mltc~HgSNoG7XzFh1qNzqkqnO-4GL06EHKp6FgeO-EkgS2iJR3lZ0Qa45eYe3dhXtF0PnTx8RXOMIQdATc916TrNBc9Mvak99XPgkofCjYf93Rjy4RziH5YsJJk6dGIbLzBVHir0JBmQbZdAOhtsWSPXq1P6Qig85RwpYse~SYz0n3WTBfKL4EAOTh3h5pEZNVHH5~zlG1B6ksJWSOrwQsWk84xShmsotMREprYIzbZPwnK208Wxnff3aglYK06OW~noSHFvEsfQLwcJBXQUQ__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4"
    },
    {
      "name": "IIT Madras - Indian Institute Of Technology Madras",
      "location": "Adyar",
      "type": "Autonamous",
      "rank": "#10",
      "fees": "₹2.10",
      "icon":
          "https://s3-alpha-sig.figma.com/img/bdfe/9dcd/72debe2dc122e945faac620c94f8a959?Expires=1701043200&Signature=J-cIfPoRa~VUTiE4tupbJaYZTN2osZgdfkJTYlRGaie71UCcTkLySkF2F7XXmRCGu7pwd9zN8ZpBacmNP54unqJdpNtliZaERJ4wla8tQwCnGktNHIrhYxZ~3EpS7yamU61glknWllGeQKW2xiqt5L6dDdjENyzGcnt~d4Sjb54jObmE14bYVqEUNMeCVKzgihFXkydqSjhY7qIgm-VHBNnWg3zX6cG7NWppYd7OK3b6K8~VBECsDPDldqFVtVdC~uCdx4hJqXhYa45zWpLrpEVXgh-BQMUHTo3YKeFQnRuu9aeFJfg~E~dsTtVTO08l2Uu-pKH2RZzSnXIBADWxNQ__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4",
      "bgimage":
          "https://s3-alpha-sig.figma.com/img/3a35/87db/70ce31245d5531dfb574ba8d8b030132?Expires=1701043200&Signature=ko6Rvnt53AwHejoGkccpGci3sX6VCaWj23O~XGvNnrI66NjxXSWakSTtsL7YJWEeogyorF87wO4k9txCn2cU4UjtJHVHkp9fXy3ZLBcKn4c-na1IUOXIJvS1E2fvRcEYcRVRaQ5PHuMxq5d1wCrqtd7DGiCuhJWlSVzL0PdBdQ7eQtgk7o5rhFMOzq~-Q~iPj2epo9Yms4oi4yiKRiRfpDez0Z2nxJIZwYr8dv00QEKuNJom5K~klYEdkP9CX3fUKIE6EbOlOO5CGY-tnhUvW8c3o1A5gtM-UDwDu3QuKWO86TVkgG~O6-cpPiJu62DBlOL~8lNOUxwvd-kTT5I7Ew__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("Top Universities / Colleges",
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Theme.of(context).colorScheme.secondary.withOpacity(0.75),
              height: 1.5)),
      const SizedBox(height: 15),
      SizedBox(
          height: 600,
          child: GridView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 6,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                childAspectRatio: 1.3,
              ),
              itemBuilder: (context, index) {
                int selectedIndex = Random().nextInt(collegesList.length);
                return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        width: 1,
                        color: Theme.of(context)
                            .colorScheme
                            .secondary
                            .withOpacity(0.1),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.1,
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              SizedBox(
                                height: double.infinity,
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10)),
                                  child: SizedBox(
                                    width: double.infinity,
                                    child: FittedBox(
                                      fit: BoxFit.cover,
                                      child: ShaderMask(
                                        blendMode: BlendMode.darken,
                                        shaderCallback: (bounds) {
                                          return LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [
                                              Colors.transparent,
                                              Colors.black.withOpacity(0.5),
                                            ],
                                          ).createShader(bounds);
                                        },
                                        child: Image.network(
                                            collegesList[selectedIndex]
                                                ["bgimage"]),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 9),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                        height: 28,
                                        width: 28,
                                        child: Image.network(
                                            collegesList[selectedIndex]
                                                ["icon"])),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Flexible(
                                      child: Text(
                                        collegesList[selectedIndex]["name"],
                                        style: const TextStyle(
                                            fontSize: 12,
                                            height: 1.33,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Ionicons.location_outline,
                                      size: 15,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary
                                          .withOpacity(0.50),
                                    ),
                                    const SizedBox(width: 5),
                                    Text(
                                      collegesList[selectedIndex]["location"],
                                      style: TextStyle(
                                          fontSize: 12,
                                          height: 1.33,
                                          fontWeight: FontWeight.w500,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary
                                              .withOpacity(0.50)),
                                    ),
                                    const SizedBox(width: 5),
                                    Container(
                                      height: 3,
                                      width: 3,
                                      decoration: BoxDecoration(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary
                                              .withOpacity(0.20),
                                          shape: BoxShape.circle),
                                    ),
                                    const SizedBox(width: 5),
                                    Text(
                                      collegesList[selectedIndex]["type"],
                                      style: TextStyle(
                                          fontSize: 12,
                                          height: 1.33,
                                          fontWeight: FontWeight.w500,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary
                                              .withOpacity(0.50)),
                                    ),
                                    const SizedBox(width: 5),
                                    Container(
                                      height: 3,
                                      width: 3,
                                      decoration: BoxDecoration(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary
                                              .withOpacity(0.20),
                                          shape: BoxShape.circle),
                                    ),
                                    const SizedBox(width: 5),
                                    Text(collegesList[selectedIndex]["rank"],
                                        style: TextStyle(
                                            fontSize: 12,
                                            height: 1.33,
                                            fontWeight: FontWeight.w500,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .tertiary
                                                .withOpacity(1)))
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      "Total fees Range",
                                      style: TextStyle(
                                        fontSize: 12,
                                        height: 1.33,
                                        fontWeight: FontWeight.w400,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary
                                            .withOpacity(0.50),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 2,
                                    ),
                                    Text(
                                      "${collegesList[selectedIndex]["fees"]} Lakhs",
                                      style: TextStyle(
                                        fontSize: 16,
                                        height: 1.33,
                                        fontWeight: FontWeight.w500,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary
                                            .withOpacity(1),
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  height: 30,
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              width: 1,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .secondary
                                                  .withOpacity(0.10)))),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "View all courses and fees",
                                        style: TextStyle(
                                          fontSize: 12,
                                          height: 1.33,
                                          fontWeight: FontWeight.w400,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary
                                              .withOpacity(0.75),
                                        ),
                                      ),
                                      Icon(
                                        CupertinoIcons.forward,
                                        size: 16,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary
                                            .withOpacity(0.75),
                                      )
                                    ],
                                  ),
                                ),
                                InkWell(
                                  onTap: () {},
                                  borderRadius: BorderRadius.circular(5),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 15),
                                    decoration: BoxDecoration(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary
                                            .withOpacity(0.10),
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Download brochure",
                                          style: TextStyle(
                                            fontSize: 14,
                                            height: 1.43,
                                            fontWeight: FontWeight.w400,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary
                                                .withOpacity(1),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Icon(
                                          Ionicons.download_outline,
                                          size: 24,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary
                                              .withOpacity(1),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ));
              })),
    ]);
  }
}
