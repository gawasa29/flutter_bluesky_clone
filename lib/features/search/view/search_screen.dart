import 'package:flutter/material.dart';
import 'package:flutter_bluesky_clone/common/widgets/custom_drawer.dart';
import 'package:flutter_bluesky_clone/common/widgets/custom_scaffold.dart';
import 'package:flutter_bluesky_clone/features/search/repository/search_repository.dart';
import 'package:flutter_bluesky_clone/features/user/view/widgets/user_pic.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});
  static const routePath = '/Search';
  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  final searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('📱 build SearchScreen ');
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final typography = theme.textTheme;

    final actorList = ref.watch(
      fetchSearchTypeaheadProvider(
        term: searchController.text.trim(),
      ),
    );

    return CustomScaffold(
      drawer: const CustomDrawer(),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: AppBar(
          title: SizedBox(
            height: 40,
            child: TextField(
              controller: searchController,
              textInputAction: TextInputAction.search,
              autofocus: true,
              decoration: InputDecoration(
                hintText: 'Search',
                fillColor: colors.secondary,
                filled: true,
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide.none,
                ),
              ),
              onChanged: (text) {
                setState(() {});
              },
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
            ),
          ),
        ),
      ),
      body: actorList.when(
        error: (error, stackTrace) => Text('Error $error'),
        loading: () => const SizedBox(),
        data: (actors) {
          return ListView.builder(
            itemCount: actors.length,
            itemBuilder: (context, index) {
              final actor = actors[index];

              final avatar = actor.avatar;
              final handle = actor.handle;
              final displayName = actor.displayName;
              final description = actor.description;

              return EachUser(
                avatar: avatar,
                handle: handle,
                displayName: displayName,
                description: description,
              );
            },
          );
        },
      ),
    );
  }
}

class EachUser extends StatelessWidget {
  const EachUser({
    required this.avatar,
    required this.handle,
    required this.displayName,
    required this.description,
    super.key,
  });

  final String? avatar;
  final String handle;
  final String? displayName;
  final String? description;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final typography = theme.textTheme;
    return Column(
      children: [
        const SizedBox(height: 5),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(width: 10),
            UserPic(
              radius: 20,
              avatar: avatar,
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    displayName ?? handle,
                    style: typography.titleMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    '@$handle',
                    style: typography.bodyMedium!.copyWith(
                      color: colors.onSecondary,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 5),
        const Divider(thickness: 0.5),
      ],
    );
  }
}
