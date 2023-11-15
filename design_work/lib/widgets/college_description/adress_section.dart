import 'package:flutter/material.dart';

class AddressSection extends StatelessWidget {
  const AddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Address and contact Details",
          style:
              TextStyle(fontSize: 16, fontWeight: FontWeight.w500, height: 1.5),
        ),
        const SizedBox(height: 16),
        Stack(
          alignment: Alignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(2),
              child: Image.network(
                "https://s3-alpha-sig.figma.com/img/e1d6/446e/4299fc56dada01e7533dd73c7dde7ae3?Expires=1701043200&Signature=afqe6swFf2XG1GWRPqrjfvzQpe5RhfdBkvv84kayEofSSyl0UwNI02hQbawDf6o2LVVn67pkFF-op1bAgUXoEco5eC-UYrHYe2fcAX95kcxVmIgvp4ZaQVtfstqDH~WZczxwY-D5N8sDZHJ~B80RZd1V9P40-FJIjnzcC2IcbxvJvqXpeLLy6fM9u7bUGmuiyQt1idaRXxJ8AqDyGQNle9Kxff4Rrk~nVccGEEPVow69F3s0tiaYHQHOzkVjWJTHzw7ZyF8ShV~nQQ1eUbFZ9wLSNjegQq2Weg1eVmuU~dC-V4alupLif2xeVm0~xvod9ADNfWmDABTgq-fHsTFu2w__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4",
                height: 190,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Text(
                'View on Map',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
