import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui';

class MessangerPeople extends StatelessWidget {
  const MessangerPeople({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            const _TopBar(),
            const _SearchBar(),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  const _YourStoryTile(),
                  _PersonTile(
                    name: 'Martha Craig',
                    imagePath: 'assets/images/318_216.png',
                    isOnline: true,
                    onTap: () => context.go('/messanger_swipe_actions'),
                  ),
                  const _CustomDivider(),
                  _PersonTile(
                    name: 'Kieron Dotson',
                    imagePath: 'assets/images/318_240.png',
                    status: '8 min.',
                    onTap: () => context.go('/messanger_swipe_actions'),
                  ),
                  const _CustomDivider(),
                  _PersonTile(
                    name: 'Zack John',
                    imagePath: 'assets/images/318_254.png',
                    status: '10 min.',
                    onTap: () => context.go('/messanger_swipe_actions'),
                  ),
                  const _CustomDivider(),
                  _PersonTile(
                    name: 'Jamie Franco',
                    imagePath: 'assets/images/318_228.png',
                    isOnline: true,
                    onTap: () => context.go('/messanger_swipe_actions'),
                  ),
                  const _CustomDivider(),
                  _PersonTile(
                    name: 'Tabitha Potter',
                    imagePath: 'assets/images/318_268.png',
                    status: '10 min.',
                    onTap: () => context.go('/messanger_swipe_actions'),
                  ),
                  const _SectionHeader(title: 'RECENTLY ACTIVE'),
                  _PersonTile(
                    name: 'Albert Lasker',
                    imagePath: 'assets/images/318_283.png',
                    status: '30 min.',
                    onTap: () => context.go('/messanger_swipe_actions'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const _BottomNavBar(),
    );
  }
}

class _TopBar extends StatelessWidget {
  const _TopBar();

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
        child: Container(
          color: Colors.white.withOpacity(0.8),
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
          child: Row(
            children: [
              const CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage('assets/images/318_319.png'),
              ),
              const SizedBox(width: 12),
              Text(
                'People',
                style: GoogleFonts.sfProDisplay(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              const Spacer(),
              _CircularIconButton(
                icon: Icons.chat_bubble_outline_rounded,
                onPressed: () {},
              ),
              const SizedBox(width: 8),
              _CircularIconButton(
                icon: Icons.person_add_alt_1,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SearchBar extends StatelessWidget {
  const _SearchBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.fromLTRB(16, 4, 16, 8),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search',
          hintStyle: GoogleFonts.sfProText(
            color: const Color(0xFF8E8E93),
            fontSize: 17,
          ),
          prefixIcon: const Icon(Icons.search, color: Color(0xFF8E8E93)),
          filled: true,
          fillColor: Colors.black.withOpacity(0.05),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          contentPadding: EdgeInsets.zero,
          isDense: true,
        ),
      ),
    );
  }
}

class _YourStoryTile extends StatelessWidget {
  const _YourStoryTile();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: InkWell(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.04),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.add, color: Colors.black),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Your story',
                    style: GoogleFonts.sfProText(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                  Text(
                    'Add to your story',
                    style: GoogleFonts.sfProText(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: Colors.black.withOpacity(0.5)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PersonTile extends StatelessWidget {
  final String name;
  final String imagePath;
  final bool isOnline;
  final String? status;
  final VoidCallback onTap;

  const _PersonTile({
    required this.name,
    required this.imagePath,
    this.isOnline = false,
    this.status,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
          child: Row(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  CircleAvatar(
                      radius: 20, backgroundImage: AssetImage(imagePath)),
                  if (isOnline)
                    Positioned(
                      right: -3,
                      bottom: -3,
                      child: Container(
                        width: 16,
                        height: 16,
                        decoration: BoxDecoration(
                          color: const Color(0xFF5AD439),
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 3),
                        ),
                      ),
                    ),
                  if (status != null)
                    Positioned(
                      left: 2,
                      bottom: -8,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 1.5),
                        decoration: BoxDecoration(
                          color: const Color(0xFFC7F0BA),
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                        child: Text(
                          status!,
                          style: GoogleFonts.sfProText(
                              fontSize: 8,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  name,
                  style: GoogleFonts.sfProText(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
              ),
              _CircularIconButton(
                icon: Icons.waving_hand_outlined,
                onPressed: () {},
                size: 32,
                iconSize: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CircularIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final double size;
  final double iconSize;

  const _CircularIconButton({
    required this.icon,
    required this.onPressed,
    this.size = 40.0,
    this.iconSize = 22.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.04),
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: Icon(icon, color: Colors.black, size: iconSize),
        onPressed: onPressed,
        padding: EdgeInsets.zero,
        constraints: const BoxConstraints(),
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  const _SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Text(
        title,
        style: GoogleFonts.sfProText(
          fontSize: 13,
          fontWeight: FontWeight.w500,
          color: Colors.black.withOpacity(0.34),
        ),
      ),
    );
  }
}

class _CustomDivider extends StatelessWidget {
  const _CustomDivider();

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 0.5,
      thickness: 0.5,
      color: Colors.black.withOpacity(0.12),
      indent: 72,
    );
  }
}

class _BottomNavBar extends StatelessWidget {
  const _BottomNavBar();

  @override
  Widget build(BuildContext context) {
    final String currentPath = GoRouterState.of(context).uri.toString();
    int currentIndex = 1;

    if (currentPath == '/messanger_swipe_actions') {
      currentIndex = 0;
    } else if (currentPath == '/messanger_people') {
      currentIndex = 1;
    }

    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.8),
            border: Border(
              top: BorderSide(color: Colors.grey.withOpacity(0.3), width: 0.5),
            ),
          ),
          child: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(icon: Icon(Icons.chat_bubble), label: ''),
              BottomNavigationBarItem(icon: Icon(Icons.people), label: ''),
              BottomNavigationBarItem(
                  icon: Icon(Icons.explore_outlined), label: ''),
            ],
            currentIndex: currentIndex,
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.grey[600],
            showSelectedLabels: false,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.transparent,
            elevation: 0,
            onTap: (index) {
              switch (index) {
                case 0:
                  if (currentPath != '/messanger_swipe_actions') {
                    context.go('/messanger_swipe_actions');
                  }
                  break;
                case 1:
                  if (currentPath != '/messanger_people') {
                    context.go('/messanger_people');
                  }
                  break;
                case 2:
                  break;
              }
            },
          ),
        ),
      ),
    );
  }
}