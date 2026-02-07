import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../theme/app_theme.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final double itemWidth = (MediaQuery.of(context).size.width - 48) / 3;
    const double horizontalMargin = 4.0;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      height: 60,
      decoration: BoxDecoration(
        color: AppColors.azul1,
        borderRadius: BorderRadius.circular(1000),
      ),
      child: Stack(
        children: [
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            left: (itemWidth * currentIndex) + horizontalMargin,
            top: 4,
            bottom: 4,
            child: Container(
              width: itemWidth - (horizontalMargin * 2),
              decoration: BoxDecoration(
                color: AppColors.azul2,
                borderRadius: BorderRadius.circular(100),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildNavItem(
                iconPath: 'assets/icons/mis_proyectos_icon.svg',
                label: 'Mis proyectos',
                index: 0,
                iconHeight: 22,
              ),
              _buildNavItem(
                iconPath: 'assets/icons/nuevo_icon.svg',
                label: 'Nuevo',
                index: 1,
                iconHeight: 22,
              ),
              _buildNavItem(
                iconPath: 'assets/icons/otros_icon.svg',
                label: 'Otros',
                index: 2,
                iconHeight: 16,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem({
    required String iconPath,
    required String label,
    required int index,
    required double iconHeight,
  }) {
    return GestureDetector(
      onTap: () => onTap(index),
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        width: 102,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              iconPath,
              height: iconHeight,
              colorFilter: const ColorFilter.mode(
                Colors.white,
                BlendMode.srcIn,
              ),
            ),
            const SizedBox(height: 3),
            Text(
              label,
              style: const TextStyle(color: Colors.white, fontSize: 10),
            ),
          ],
        ),
      ),
    );
  }
}
