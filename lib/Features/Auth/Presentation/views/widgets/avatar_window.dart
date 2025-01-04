import 'package:flutter/material.dart';
import 'package:game_dz_app/Features/Auth/Presentation/views/widgets/custom_button.dart';

class AvatarSelectionDialog extends StatefulWidget {
  const AvatarSelectionDialog({super.key});

  @override
  State<AvatarSelectionDialog> createState() => _AvatarSelectionDialogState();
}

class _AvatarSelectionDialogState extends State<AvatarSelectionDialog> {
  int? selectedAvatarIndex;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: double.infinity,
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.8,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'Choose an avatar',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFF1A1B35),
                ),
              ),
            ),
            Flexible(
              child: GridView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 1,
                ),
                itemCount: 15,
                itemBuilder: (context, index) {
                  return _AvatarOption(
                    index: index,
                    isSelected: selectedAvatarIndex == index,
                    onTap: () {
                      setState(() {
                        selectedAvatarIndex = index;
                      });
                    },
                  );
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16),
              child: SizedBox(
                  width: double.infinity, child: GetCodeButton(routename: '')),
            ),
          ],
        ),
      ),
    );
  }
}

class _AvatarOption extends StatelessWidget {
  final int index;
  final bool isSelected;
  final VoidCallback onTap;

  const _AvatarOption({
    required this.index,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xffB190B6),
          borderRadius: BorderRadius.circular(12),
          border: isSelected
              ? Border.all(
                  color: const Color(0xFF4CAF50),
                  width: 3,
                )
              : null,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            'assets/images/avatar.png',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
