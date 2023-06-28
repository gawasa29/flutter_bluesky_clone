import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final circleIndicatorProvider = StateProvider.autoDispose<int>((ref) => 0);

class ComposePostScreen extends ConsumerWidget {
  const ComposePostScreen({super.key});
  static const routePath = '/ComposePost';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('📱 build ComposePostScreen ');
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final typography = theme.textTheme;
    final currentCharacters = ref.watch(circleIndicatorProvider);
    const maxCharacters = 300;
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 100,
        leading: TextButton(
          onPressed: () {
            context.pop();
          },
          child: Text(
            'Cancel',
            style: typography.titleMedium!.copyWith(
              color: colors.primary,
            ),
          ),
        ),
        actions: [
          ElevatedButton(
            onPressed: () {},
            child: const Text('Post'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8),
                  child: CircleAvatar(
                    radius: 35,
                    backgroundImage: NetworkImage(
                        'https://images.unsplash.com/photo-1491349174775-aaafddd81942?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80'),
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: TextFormField(
                      autofocus: true,
                      minLines: 1,
                      maxLines: null,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(maxCharacters)
                      ],
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "What's up?",
                      ),
                      onChanged: (text) {
                        ref
                            .read(circleIndicatorProvider.notifier)
                            .update((state) => text.length);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomSheet: Row(
        children: [
          const SizedBox(width: 10),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.image),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.photo_camera),
          ),
          const Spacer(),
          Text(
            '${maxCharacters - currentCharacters} ',
          ),
          CircularProgressIndicator(
            value: currentCharacters / maxCharacters,
            color: currentCharacters > maxCharacters
                ? colors.error
                : colors.primary,
          ),
          const SizedBox(width: 10),
        ],
      ),
    );
  }
}
