part of '../page.dart';

class SettingsMenu extends StatefulWidget {
  const SettingsMenu({super.key});

  @override
  State<SettingsMenu> createState() => _SettingsMenuState();
}

class _SettingsMenuState extends State<SettingsMenu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(24)),
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Setting',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(Icons.close_rounded))
                ],
              ),
              const SizedBox(height: 10),
              SwitchTile(
                title: 'Dark mode',
                initialValue: false,
                onChanged: (value) {
                  // Logic to change theme
                },
              ),
              CustomNumberInputTile(
                title: 'Focus length',
                initialValue: 25,
                minValue: 10,
                maxValue: 60,
                onChanged: (value) {
                  // Logic to change focus length
                },
              ),
              CustomNumberInputTile(
                title: 'Short break length',
                initialValue: 5,
                minValue: 1,
                maxValue: 15,
                onChanged: (value) {
                  // Logic to change short break length
                },
              ),
              CustomNumberInputTile(
                title: 'Long break length',
                initialValue: 15,
                minValue: 10,
                maxValue: 30,
                onChanged: (value) {
                  // Logic to change long break length
                },
              ),
              SwitchTile(
                title: 'Sound',
                initialValue: false,
                onChanged: (value) {
                  // Logic to change sound setting
                },
              ),
              SwitchTile(
                title: 'Notifications',
                initialValue: false,
                onChanged: (value) {
                  // Logic to change notifications setting
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
