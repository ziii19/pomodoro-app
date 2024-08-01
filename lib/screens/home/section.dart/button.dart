part of '../page.dart';

class _PomoButton extends StatelessWidget {
  const _PomoButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _BuildButton(
          icon: Icons.more_horiz_rounded,
          bgColor: Colors.red.withOpacity(.1),
          onTap: () {},
        ),
        const SizedBox(width: 20),
        _BuildButton(
          isBig: true,
          icon: Icons.play_arrow_rounded,
          bgColor: Colors.red.withOpacity(.3),
          onTap: () {},
        ),
        const SizedBox(width: 20),
        _BuildButton(
          icon: Icons.fast_forward_rounded,
          bgColor: Colors.red.withOpacity(.1),
          onTap: () {},
        ),
      ],
    );
  }
}

class _BuildButton extends StatelessWidget {
  const _BuildButton(
      {required this.icon,
      required this.bgColor,
      this.onTap,
      this.isBig = false});

  final IconData icon;
  final Color bgColor;
  final void Function()? onTap;
  final bool isBig;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: isBig ? 130 : 80,
        height: isBig ? 100 : 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: bgColor,
        ),
        child: Center(
          child: Icon(
            icon,
            size: isBig ? 50 : 30,
          ),
        ),
      ),
    );
  }
}
