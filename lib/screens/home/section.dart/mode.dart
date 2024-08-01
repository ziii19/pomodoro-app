part of '../page.dart';

class _PomoMode extends StatelessWidget {
  const _PomoMode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(99),
        color: Colors.red.withOpacity(.1),
      ),
      child: const Center(
        child: Text(
          'Focus',
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 24),
        ),
      ),
    );
  }
}
