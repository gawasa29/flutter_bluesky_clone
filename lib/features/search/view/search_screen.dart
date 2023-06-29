import 'package:flutter/material.dart';
import 'package:flutter_bluesky_clone/common/widgets/custom_drawer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchScreen extends ConsumerWidget {
  const SearchScreen({super.key});
  static const routePath = '/Search';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('📱 build SearchScreen ');
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final typography = theme.textTheme;
    final searchController = TextEditingController();
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: AppBar(
          title: SizedBox(
            height: 40,
            child: TextField(
              controller: searchController,
              textInputAction: TextInputAction.search,
              decoration: InputDecoration(
                hintText: 'Search',
                fillColor: colors.secondary,
                filled: true,
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide.none,
                ),
                suffixIcon: IconButton(
                  onPressed: searchController.clear,
                  icon: const Icon(Icons.close),
                ),
              ),
            ),
          ),
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      'In Your Network',
                      style: typography.titleLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    height: 1,
                    color: colors.secondary,
                  ),
                ],
              )),
        ),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => const EachUser(),
      ),
    );
  }
}

class EachUser extends StatelessWidget {
  const EachUser({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final typography = theme.textTheme;
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(width: 10),
            const CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(
                  'https://images.unsplash.com/photo-1491349174775-aaafddd81942?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80'),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Column(
                        children: [
                          Text(
                            'UserName',
                            style: typography.titleMedium!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '@HandleName',
                            style: typography.bodySmall!
                                .copyWith(color: colors.onSecondary),
                          ),
                        ],
                      ),
                      Expanded(child: Container()),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: colors.onBackground,
                        ),
                        child: Text(
                          'Follow',
                          style: typography.bodySmall!.copyWith(
                            color: colors.background,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'Description will appear here.',
                    style: typography.bodyLarge!.copyWith(),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        const Divider(thickness: 0.5),
      ],
    );
  }
}
