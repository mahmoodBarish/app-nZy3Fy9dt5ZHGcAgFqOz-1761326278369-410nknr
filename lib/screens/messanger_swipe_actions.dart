import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'dart:ui';

class MessangerSwipeActions extends StatelessWidget {
  const MessangerSwipeActions({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> stories = [
      {'image': 'assets/images/318_100.png', 'name': 'Joshua'},
      {'image': 'assets/images/318_105.png', 'name': 'Martin'},
      {'image': 'assets/images/318_110.png', 'name': 'Karen'},
      {'image': 'assets/images/318_115.png', 'name': 'Martha'},
      {'image': 'assets/images/318_87.png', 'name': 'Steven'},
    ];

    final List<Map<String, String>> chats = [
      {
        'image': 'assets/images/318_78.png',
        'name': 'Martin Randolph',
        'message': 'You: What’s man! · 9:40 AM',
        'read': 'true'
      },
      {
        'image': 'assets/images/318_43.png',
        'name': 'Andrew Parker',
        'message': 'You: Ok, thanks! · 9:25 AM',
        'read': 'true'
      },
      {
        'image': 'assets/images/318_53.png',
        'name': 'Maisy Humphrey',
        'message': 'Have a good day, Jacob! · Fri',
        'read': 'true'
      },
      {
        'image': 'assets/images/318_63.png',
        'name': 'Karen Castillo',
        'message': 'You: Ok, See you in To… · Fri',
        'read': 'true'
      },
      {
        'image': 'assets/images/318_87.png',
        'name': 'Joshua Lawrence',
        'message': 'The business plan loo… · Thu',
        'read': 'false'
      },
      {
        'image': 'assets/images/318_146.png',
        'name': 'Pixsellz',
        'message': 'Make design process easier…',
        'read': 'false',
        'isAd': 'true'
      },
      {
        'image': 'assets/images/318_73.png',
        'name': 'Maximillian Jacobson',
        'message': 'Messenger UI · Thu',
        'read': 'false'
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white.withOpacity(0.8),
            elevation: 0,
            pinned: true,
            floating: true,
            expandedHeight: 156.0,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.pin,
              background: SafeArea(
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 16.0, right: 16.0, top: 12.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const CircleAvatar(
                        radius: 20,
                        backgroundImage:
                            AssetImage('assets/images/318_122.png'),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        'Chats',
                        style: GoogleFonts.lato(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const Spacer(),
                      _AppBarIconButton(
                          icon: Icons.camera_alt_outlined, onPressed: () {}),
                      const SizedBox(width: 8),
                      _AppBarIconButton(
                          icon: Icons.edit_outlined, onPressed: () {}),
                    ],
                  ),
                ),
              ),
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(48.0),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    hintStyle: GoogleFonts.lato(
                        color: const Color(0xFF8E8E93), fontSize: 17),
                    prefixIcon:
                        const Icon(Icons.search, color: Color(0xFF8E8E93)),
                    filled: true,
                    fillColor: Colors.black.withOpacity(0.05),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 106,
              color: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 16),
                itemCount: stories.length + 1,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return const _StoryItem(
                      name: 'Your story',
                      isAddStory: true,
                    );
                  }
                  final story = stories[index - 1];
                  return _StoryItem(
                    name: story['name']!,
                    imagePath: story['image']!,
                  );
                },
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final chat = chats[index];
                if (chat['isAd'] == 'true') {
                  return const _AdItem();
                }
                return _ChatItem(
                  imagePath: chat['image']!,
                  name: chat['name']!,
                  message: chat['message']!,
                  isRead: chat['read'] == 'true',
                );
              },
              childCount: chats.length,
            ),
          ),
        ],
      ),
      bottomNavigationBar: const _CustomBottomNavBar(),
    );
  }
}

class _AppBarIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const _AppBarIconButton({required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.04),
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: Icon(icon, color: Colors.black, size: 22),
        onPressed: onPressed,
      ),
    );
  }
}

class _StoryItem extends StatelessWidget {
  final String name;
  final String? imagePath;
  final bool isAddStory;

  const _StoryItem({
    required this.name,
    this.imagePath,
    this.isAddStory = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 18),
      child: SizedBox(
        width: 60,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 52,
              height: 52,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isAddStory
                          ? Colors.black.withOpacity(0.04)
                          : Colors.transparent,
                      image: isAddStory
                          ? null
                          : DecorationImage(
                              image: AssetImage(imagePath!), fit: BoxFit.cover),
                    ),
                    child: isAddStory
                        ? const Center(child: Icon(Icons.add, size: 28))
                        : null,
                  ),
                  if (!isAddStory)
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        width: 18,
                        height: 18,
                        decoration: BoxDecoration(
                          color: const Color(0xFF5AD439),
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 3),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 7),
            Text(
              name,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.lato(
                fontSize: 13,
                color: Colors.black.withOpacity(0.5),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ChatItem extends StatelessWidget {
  final String imagePath;
  final String name;
  final String message;
  final bool isRead;

  const _ChatItem({
    required this.imagePath,
    required this.name,
    required this.message,
    required this.isRead,
  });

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: ValueKey(name),
      startActionPane: ActionPane(
        motion: const StretchMotion(),
        extentRatio: 0.6,
        children: [
          SlidableAction(
            onPressed: (context) {},
            backgroundColor: Colors.black.withOpacity(0.04),
            foregroundColor: Colors.black,
            icon: Icons.menu,
          ),
          SlidableAction(
            onPressed: (context) {},
            backgroundColor: Colors.black.withOpacity(0.04),
            foregroundColor: Colors.black,
            icon: Icons.notifications,
          ),
          SlidableAction(
            onPressed: (context) {},
            backgroundColor: const Color(0xFFFE294D),
            foregroundColor: Colors.white,
            icon: Icons.delete,
          ),
        ],
      ),
      endActionPane: ActionPane(
        motion: const StretchMotion(),
        extentRatio: 0.6,
        children: [
          SlidableAction(
            onPressed: (context) {},
            backgroundColor: const Color(0xFF0084FE),
            foregroundColor: Colors.white,
            icon: Icons.camera_alt,
          ),
          SlidableAction(
            onPressed: (context) {},
            backgroundColor: Colors.black.withOpacity(0.04),
            foregroundColor: Colors.black,
            icon: Icons.call,
          ),
          SlidableAction(
            onPressed: (context) {},
            backgroundColor: Colors.black.withOpacity(0.04),
            foregroundColor: Colors.black,
            icon: Icons.videocam,
          ),
        ],
      ),
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(imagePath),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: GoogleFonts.lato(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    message,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.lato(
                      fontSize: 14,
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ),
                ],
              ),
            ),
            if (isRead)
              const Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Icon(Icons.check_circle,
                    color: Color(0xFFC2C5CC), size: 16),
              ),
          ],
        ),
      ),
    );
  }
}

class _AdItem extends StatelessWidget {
  const _AdItem();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      color: Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage('assets/images/318_146.png'),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Pixsellz',
                      style: GoogleFonts.lato(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 4, vertical: 1),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(3),
                      ),
                      child: Text(
                        'Ad',
                        style: GoogleFonts.lato(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                Text(
                  'Make design process easier…',
                  style: GoogleFonts.lato(
                      fontSize: 14, color: Colors.black.withOpacity(0.5)),
                ),
                const SizedBox(height: 2),
                Text(
                  'View More',
                  style: GoogleFonts.lato(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF0084FE),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              'assets/images/318_153.png',
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}

class _CustomBottomNavBar extends StatelessWidget {
  const _CustomBottomNavBar();

  @override
  Widget build(BuildContext context) {
    final currentPath = GoRouterState.of(context).uri.toString();

    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Container(
          height: 86,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.8),
            border: Border(
              top: BorderSide(color: Colors.grey.shade300, width: 0.5),
            ),
          ),
          child: SafeArea(
            top: false,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavItem(
                    Icons.chat_bubble,
                    currentPath == '/messanger_swipe_actions',
                    () => context.go('/messanger_swipe_actions')),
                _buildNavItem(
                    Icons.people, currentPath == '/messanger_people',
                    () => context.go('/messanger_people'),
                    badgeCount: 2),
                _buildNavItem(Icons.explore, false, () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, bool isActive, VoidCallback onTap,
      {int? badgeCount}) {
    final color = isActive ? Colors.black : const Color(0xFFA4AAB9);
    Widget iconWidget = Icon(icon, color: color, size: 28);

    if (badgeCount != null && badgeCount > 0) {
      iconWidget = Stack(
        clipBehavior: Clip.none,
        children: [
          iconWidget,
          Positioned(
            top: -2,
            right: -10,
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: const Color(0xFF5AD439),
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2),
              ),
              constraints: const BoxConstraints(
                minWidth: 18,
                minHeight: 18,
              ),
              child: Text(
                '$badgeCount',
                style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      );
    }

    return IconButton(
      icon: iconWidget,
      onPressed: onTap,
    );
  }
}