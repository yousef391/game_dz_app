import 'dart:io';

import 'package:flutter/material.dart';

import 'package:game_dz_app/Features/Auth/Presentation/views/widgets/custom_button.dart';

import 'widgets/Custom_text_field.dart';
import 'widgets/avatar_window.dart';
import 'package:image_picker/image_picker.dart';

class UserInfoScreen extends StatelessWidget {
  const UserInfoScreen({super.key});
  static const String routename = "user_info_screen";

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;

    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/images/bg_1.png',
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(
                  left: 24,
                  right: 24,
                  top: 24,
                  bottom: 24 + keyboardHeight,
                ),
                child: SizedBox(
                  height: screenSize.height -
                      MediaQuery.of(context).padding.vertical -
                      48,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: screenSize.height * 0.05),
                      const _HeaderSection(),
                      const Expanded(child: _ContentSection()),
                      const GetCodeButton(routename: routename)
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _HeaderSection extends StatelessWidget {
  const _HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "It looks like you're\nnew here!",
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                height: 1.2,
              ),
        ),
        const SizedBox(height: 8),
        Text(
          'Set up your account by filling in your\ndetails below to get started.',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.white.withOpacity(0.7),
              ),
        ),
      ],
    );
  }
}

class _ContentSection extends StatefulWidget {
  const _ContentSection({super.key});

  @override
  State<_ContentSection> createState() => _ContentSectionState();
}

class _ContentSectionState extends State<_ContentSection> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  bool get _isValid =>
      _firstNameController.text.isNotEmpty &&
      _lastNameController.text.isNotEmpty;

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(height: screenSize.height * 0.1),
        const _AvatarSection(),
        SizedBox(height: screenSize.height * 0.1),
        _InputFields(
          firstNameController: _firstNameController,
          lastNameController: _lastNameController,
          onChanged: () => setState(() {}),
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}

class _AvatarSection extends StatefulWidget {
  const _AvatarSection();

  @override
  State<_AvatarSection> createState() => _AvatarSectionState();
}

class _AvatarSectionState extends State<_AvatarSection> {
  int? selectedAvatarIndex;
  File? selectedImage;

  Future<void> _showAvatarSelection() async {
    final result = await showDialog<int>(
      context: context,
      builder: (BuildContext context) => const AvatarSelectionDialog(),
    );

    if (result != null) {
      setState(() {
        selectedAvatarIndex = result;
        selectedImage = null;
      });
    }
  }

  Future<void> _pickImageFromGallery() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        selectedImage = File(image.path);
        selectedAvatarIndex = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Center(
      child: Column(
        children: [
          Container(
            width: screenSize.width * 0.4,
            height: screenSize.width * 0.4,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xFF6E5DE7),
              border: Border.all(
                color: Colors.white.withOpacity(0.1),
                width: 4,
              ),
            ),
            child: ClipOval(
              child: selectedImage != null
                  ? Image.file(
                      selectedImage!,
                      fit: BoxFit.cover,
                    )
                  : selectedAvatarIndex != null
                      ? Image.asset(
                          'assets/images/avatar.png',
                          fit: BoxFit.cover,
                        )
                      : Image.asset(
                          'assets/images/avatar.png',
                          fit: BoxFit.cover,
                        ),
            ),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _AvatarActionButton(
                backgroundColor: const Color(0xFFFF6B6B),
                icon: Icons.person_outline,
                onTap: _showAvatarSelection,
              ),
              const SizedBox(width: 16),
              _AvatarActionButton(
                backgroundColor: const Color(0xFF4ECDC4),
                icon: Icons.image_outlined,
                onTap: () {
                  _pickImageFromGallery();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _AvatarActionButton extends StatelessWidget {
  final Color backgroundColor;
  final IconData icon;
  final VoidCallback onTap;

  const _AvatarActionButton({
    super.key,
    required this.backgroundColor,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            icon,
            color: Colors.white,
            size: 20,
          ),
        ),
      ),
    );
  }
}

class _InputFields extends StatelessWidget {
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final VoidCallback onChanged;

  const _InputFields({
    super.key,
    required this.firstNameController,
    required this.lastNameController,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          controller: firstNameController,
          hintText: 'Enter your first name...',
          onChanged: onChanged,
        ),
        const SizedBox(height: 16),
        CustomTextField(
          controller: lastNameController,
          hintText: 'Enter your last name...',
          onChanged: onChanged,
        ),
      ],
    );
  }
}

class _GetStartedButton extends StatelessWidget {
  final bool isValid;

  const _GetStartedButton({
    super.key,
    required this.isValid,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: isValid
            ? () {
                // Handle get started action
              }
            : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF6E5DE7),
          disabledBackgroundColor: const Color(0xFF6E5DE7).withOpacity(0.5),
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          elevation: 0,
        ),
        child: Text(
          'Get started!',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
        ),
      ),
    );
  }
}
