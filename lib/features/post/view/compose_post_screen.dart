import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bluesky_clone/common/widgets/custom_scaffold.dart';
import 'package:go_router/go_router.dart';

class ComposePostScreen extends StatefulWidget {
  const ComposePostScreen({super.key});
  static const routePath = '/ComposePost';
  @override
  State<ComposePostScreen> createState() => _ComposePostScreenState();
}

class _ComposePostScreenState extends State<ComposePostScreen> {
  int currentCharacters = 0;
  @override
  Widget build(BuildContext context) {
    print('📱 build ComposePostScreen ');
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final typography = theme.textTheme;

    const maxCharacters = 300;
    return CustomScaffold(
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
                // const Padding(
                //   padding: EdgeInsets.all(8),
                //   child: UserPic(radius: 35),
                // ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: TextFormField(
                      autofocus: true,
                      minLines: 1,
                      maxLines: null,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(maxCharacters),
                      ],
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "What's up?",
                      ),
                      onChanged: (text) {
                        currentCharacters = text.length;
                        setState(() {});
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
