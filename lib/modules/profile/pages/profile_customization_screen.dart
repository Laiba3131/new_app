import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ProfileCustomizationScreen extends StatefulWidget {
  const ProfileCustomizationScreen({Key? key}) : super(key: key);

  @override
  State<ProfileCustomizationScreen> createState() =>
      _ProfileCustomizationScreenState();
}

class _ProfileCustomizationScreenState
    extends State<ProfileCustomizationScreen> {
  bool _hidePhoneNumber = true;
  bool _privateProfile = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        toolbarHeight: 60,
        title: Column(
          children: [
            // Status bar time and icons
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    '8:00',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(Icons.signal_cellular_4_bar,
                          size: 16, color: Colors.black),
                      const SizedBox(width: 4),
                      Icon(Icons.wifi, size: 16, color: Colors.black),
                      const SizedBox(width: 4),
                      Icon(Icons.battery_full, size: 16, color: Colors.black),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Back button
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Row(
                        children: [
                          Icon(Icons.chevron_left,
                              size: 20, color: Colors.black),
                          const Text(
                            'Back',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Profile title and avatar
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Customize Your Profile',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            shape: BoxShape.circle,
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.person_outline,
                              size: 24,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // Profile fields
                    // Name field
                    _buildProfileField(
                      label: 'Name',
                      value: 'Jade Smith',
                    ),

                    // Username field
                    _buildProfileField(
                      label: 'Username',
                      value: '@jadesmith',
                    ),

                    // Date of Birth field
                    _buildProfileField(
                      label: 'Date of Birth',
                      value: '12/25/1988',
                    ),

                    // Bio field
                    _buildProfileField(
                      label: 'Bio',
                      value: 'Add a bio here (optional)',
                      valueColor: Colors.grey[400],
                    ),

                    // Interests field
                    _buildProfileField(
                      label: 'Interests',
                      value: 'Add your interest here',
                      valueColor: Colors.grey[400],
                    ),

                    // URL field
                    _buildProfileField(
                      label: 'URL',
                      value: 'Add a link here (optional)',
                      valueColor: Colors.grey[400],
                    ),

                    // Country field
                    _buildProfileField(
                      label: 'Country',
                      value: 'United States',
                    ),

                    // Language field
                    _buildProfileField(
                      label: 'Language',
                      value: 'English',
                    ),

                    // Gender field
                    _buildProfileField(
                      label: 'Gender',
                      value: 'Female',
                    ),

                    // Phone number field
                    _buildProfileField(
                      label: 'Phone number',
                      value: 'Number',
                      valueColor: Colors.grey[400],
                    ),

                    // Private info toggle
                    _buildToggleSetting(
                      title: 'Private info',
                      subtitle: 'Hide phone number & DOB',
                      value: _hidePhoneNumber,
                      onChanged: (value) {
                        setState(() {
                          _hidePhoneNumber = value;
                        });
                      },
                    ),

                    // Private profile toggle
                    _buildToggleSetting(
                      title: 'Private profile',
                      subtitle: 'Your content is public',
                      value: _privateProfile,
                      onChanged: (value) {
                        setState(() {
                          _privateProfile = value;
                        });
                      },
                    ),

                    const SizedBox(height: 80), // Space for the button
                  ],
                ),
              ),
              // Save button
              Positioned(
                bottom: 20,
                left: 0,
                right: 0,
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: TextButton(
                    onPressed: () {
                      // Save profile information
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Profile updated successfully!'),
                          backgroundColor: Colors.green,
                        ),
                      );
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      "Save",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileField({
    required String label,
    required String value,
    Color? valueColor,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey[200]!,
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 90,
            child: Text(
              label,
              style: TextStyle(
                fontSize: 15,
                color: Colors.black87,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                fontSize: 15,
                color: valueColor ?? Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildToggleSetting({
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey[200]!,
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          CupertinoSwitch(
            value: value,
            onChanged: onChanged,
            activeColor: Colors.blue,
          ),
        ],
      ),
    );
  }
}
