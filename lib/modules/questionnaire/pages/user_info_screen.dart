import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../ui/button/primary_button.dart';
import '../cubit/questionnaire_cubit.dart';
import 'gender_selection_screen.dart';

class UserInfoScreen extends StatefulWidget {
  const UserInfoScreen({Key? key}) : super(key: key);

  @override
  State<UserInfoScreen> createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _usernameController = TextEditingController();
  final _countryController = TextEditingController();
  final _languageController = TextEditingController();
  final _searchFocusNode = FocusNode();
  
  String? _selectedMonth = 'December';
  String? _selectedDay = '25';
  String? _selectedYear = '1980';
  
  final List<String> _months = ['January', 'February', 'March', 'April', 'May', 'June', 
    'July', 'August', 'September', 'October', 'November', 'December'];
  final List<String> _days = List.generate(31, (index) => (index + 1).toString());
  final List<String> _years = List.generate(100, (index) => (DateTime.now().year - index).toString());
  
  final List<String> _countries = ['United States', 'United Kingdom', 'Canada', 'Australia', 'Germany', 'France', 'Spain', 'Italy', 'Japan', 'China', 'India'];
  List<String> _filteredCountries = [];
  bool _isCountryDropdownOpen = false;

  @override
  void initState() {
    super.initState();
    _nameController.text = 'Jade Smith';
    _usernameController.text = '@Jadesmith';
    _countryController.text = '';
    _filteredCountries = _countries;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _usernameController.dispose();
    _countryController.dispose();
    _languageController.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }

  void _filterCountries(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredCountries = _countries;
      } else {
        _filteredCountries = _countries
            .where((country) => country.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

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
                      Icon(Icons.signal_cellular_4_bar, size: 16, color: Colors.black),
                      const SizedBox(width: 4),
                      Icon(Icons.wifi, size: 16, color: Colors.black),
                      const SizedBox(width: 4),
                      Icon(Icons.battery_full, size: 16, color: Colors.black),
                    ],
                  ),
                ],
              ),
            ),
            // Progress indicator
            Container(
              margin: const EdgeInsets.only(top: 8),
              height: 4,
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 7,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: GestureDetector(
        onTap: () {
          // Close dropdown and keyboard when tapping outside
          FocusScope.of(context).unfocus();
          setState(() {
            _isCountryDropdownOpen = false;
          });
        },
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Form(
              key: _formKey,
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        Text(
                          "Let's Know You Better",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          "Let's get to know you—this helps us tailor your experience right away.",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                        ),
                        const SizedBox(height: 24),
                        _buildSimpleTextField(
                          controller: _nameController,
                          hint: "Name",
                        ),
                        const SizedBox(height: 16),
                        _buildSimpleTextField(
                          controller: _usernameController,
                          hint: "Username",
                        ),
                        const SizedBox(height: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Date of Birth",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              "You can choose to make this visible to others or keep it private in profile settings.",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[600],
                              ),
                            ),
                            const SizedBox(height: 12),
                            Row(
                              children: [
                                Expanded(
                                  child: _buildDropdownField(
                                    hint: "Month",
                                    value: _selectedMonth,
                                    items: _months,
                                    onChanged: (value) {
                                      setState(() {
                                        _selectedMonth = value;
                                      });
                                    },
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: _buildDropdownField(
                                    hint: "Day",
                                    value: _selectedDay,
                                    items: _days,
                                    onChanged: (value) {
                                      setState(() {
                                        _selectedDay = value;
                                      });
                                    },
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: _buildDropdownField(
                                    hint: "Year",
                                    value: _selectedYear,
                                    items: _years,
                                    onChanged: (value) {
                                      setState(() {
                                        _selectedYear = value;
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Country",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey[600],
                              ),
                            ),
                            const SizedBox(height: 4),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  _isCountryDropdownOpen = !_isCountryDropdownOpen;
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey[300]!),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 12),
                                      child: Icon(Icons.search, color: Colors.grey[700], size: 20),
                                    ),
                                    const SizedBox(width: 8),
                                    Expanded(
                                      child: TextField(
                                        controller: _countryController,
                                        focusNode: _searchFocusNode,
                                        decoration: InputDecoration(
                                          hintText: "Country",
                                          border: InputBorder.none,
                                          contentPadding: const EdgeInsets.symmetric(vertical: 16),
                                        ),
                                        onChanged: (value) {
                                          _filterCountries(value);
                                          setState(() {
                                            _isCountryDropdownOpen = true;
                                          });
                                        },
                                        onTap: () {
                                          setState(() {
                                            _isCountryDropdownOpen = true;
                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            if (_isCountryDropdownOpen)
                              Container(
                                constraints: BoxConstraints(
                                  maxHeight: 150,
                                ),
                                decoration: BoxDecoration(
                                  border: Border(
                                    left: BorderSide(color: Colors.grey[300]!),
                                    right: BorderSide(color: Colors.grey[300]!),
                                    bottom: BorderSide(color: Colors.grey[300]!),
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(8),
                                    bottomRight: Radius.circular(8),
                                  ),
                                ),
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  padding: EdgeInsets.zero,
                                  itemCount: _filteredCountries.length,
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: () {
                                        setState(() {
                                          _countryController.text = _filteredCountries[index];
                                          _isCountryDropdownOpen = false;
                                        });
                                        FocusScope.of(context).unfocus();
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 12,
                                          horizontal: 16,
                                        ),
                                        child: Text(
                                          _filteredCountries[index],
                                          style: const TextStyle(fontSize: 14),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Language",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey[600],
                              ),
                            ),
                            const SizedBox(height: 4),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey[300]!),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 12),
                                    child: Icon(Icons.search, color: Colors.grey[700], size: 20),
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: TextField(
                                      controller: _languageController,
                                      decoration: InputDecoration(
                                        hintText: "Search...",
                                        border: InputBorder.none,
                                        contentPadding: const EdgeInsets.symmetric(vertical: 16),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 70), // Space for the button
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.grey[500],
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: TextButton(
                        onPressed: _submitForm,
                        child: const Text(
                          "Next",
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
        ),
      ),
    );
  }

  Widget _buildSimpleTextField({
    required TextEditingController controller,
    required String hint,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey[300]!),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey[300]!),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.grey),
        ),
      ),
    );
  }

  Widget _buildDropdownField({
    required String hint,
    required String? value,
    required List<String> items,
    required Function(String?) onChanged,
  }) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          hint: Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Text(
              hint,
              style: TextStyle(color: Colors.grey[700]),
            ),
          ),
          icon: Icon(Icons.keyboard_arrow_down, color: Colors.grey[700]),
          isExpanded: true,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          borderRadius: BorderRadius.circular(8),
          items: items.map((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(item),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final dob = _selectedYear != null && _selectedMonth != null && _selectedDay != null
          ? "$_selectedYear-$_selectedMonth-$_selectedDay"
          : null;
          
      final cubit = context.read<QuestionnaireCubit>();
      cubit.updateName(_nameController.text);
      cubit.updateUsername(_usernameController.text);
      if (dob != null) {
        cubit.updateDob(dob);
      }
      cubit.submitBasicInfo();
      
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const GenderSelectionScreen(),
        ),
      );
    }
  }
} 