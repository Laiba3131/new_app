import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kulture/constants/constants.dart';
import 'package:kulture/modules/questionnaire/widgets/custom_progress_bar.dart';
import 'package:kulture/modules/questionnaire/widgets/dob_widget.dart';
import 'package:kulture/modules/questionnaire/widgets/searchable_dropdown_field.dart';
import 'package:kulture/ui/input/input_field.dart';
import '../../../ui/button/primary_button.dart';
import '../../../utils/heights_and_widths.dart';
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
  List<String> _filteredCountries = []; // Your logic to filter
  List<String> _filteredLanguages = []; // Your logic to filter

  FocusNode _countryFocusNode = FocusNode();
  FocusNode _languageFocusNode = FocusNode();
  String? _selectedMonth;
  String? _selectedDay;
  String? _selectedYear;

  final List<String> _months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];
  final List<String> _days =
      List.generate(31, (index) => (index + 1).toString());
  final List<String> _years =
      List.generate(100, (index) => (DateTime.now().year - index).toString());

  final List<String> _countries = [
    'United States',
    'United Kingdom',
    'Canada',
    'Australia',
    'Germany',
    'France',
    'Spain',
    'Italy',
    'Japan',
    'China',
    'India'
  ];
  final List<String> _allLanguages = [
    'English',
    'Spanish',
    'French',
    'German',
    'Hindi'
  ];
  bool isCountryDropdownOpen = false;
bool get isFormFilled {
  return _nameController.text.isNotEmpty &&
         _usernameController.text.isNotEmpty &&
         _countryController.text.isNotEmpty &&
         _languageController.text.isNotEmpty;
}

  @override
  void initState() {
    super.initState();
    _countryController.text = '';
    _filteredCountries = _countries;
    _filteredLanguages = _allLanguages;
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
            .where((country) =>
                country.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  void _filterLanguages(String query) {
    setState(() {
      _filteredLanguages = _allLanguages
          .where((lang) => lang.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final dob = _selectedYear != null &&
              _selectedMonth != null &&
              _selectedDay != null
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        toolbarHeight: 60,
        title: const Column(
          children: [
            CustomProgressBar(
              segmentColors: [
                AppColors.primaryColor,
                AppColors.textFieldBorderColor
              ],
              flexValues: [1, 1],
            ),
          ],
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
          setState(() {
            isCountryDropdownOpen = false;
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
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    fontSize: 32,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.textblackColor,
                                  ),
                        ),
                        h0P2,
                        Text(
                          "Let's get to know you—this helps us tailor your experience right away.",
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.searchBarTextColor,
                                  ),
                        ),
                        h4,
                        InputField(
                          controller: _nameController,
                          label: 'Name',
                          borderColor: AppColors.textFieldBorderColor,
                          boxConstraints: 20,
                        ),
                        h1,
                        InputField(
                          controller: _usernameController,
                          label: 'Username',
                          borderColor: AppColors.textFieldBorderColor,
                          boxConstraints: 20,
                        ),
                        h2,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Date of Birth",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.black,
                                  ),
                            ),
                            h0P2,
                            Text(
                              "You can choose to make this visible to others or keep it private in profile settings.",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.searchBarTextColor,
                                  ),
                            ),
                            h2,
                            Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: DropdownField(
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
                                w1,
                                Expanded(
                                  flex: 1,
                                  child: DropdownField(
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
                                w1,
                                Expanded(
                                  flex: 1,
                                  child: DropdownField(
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
                        h2,
                        SearchableDropdownField(
                          title: "Country",
                          controller: _countryController,
                          items: _filteredCountries,
                          focusNode: _countryFocusNode,
                          onFilter: (value) {
                            _filterCountries(value);
                          },
                          onSelect: (value) {},
                        ),
                        h2,
                        SearchableDropdownField(
                          title: "Language",
                          controller: _languageController,
                          items: _filteredLanguages,
                          focusNode: _languageFocusNode,
                          onFilter: (value) {
                            _filterLanguages(value);
                          },
                          onSelect: (value) {},
                        ),
                        h2,
                        PrimaryButton(
                          onPressed: isFormFilled?_submitForm:(){},
                          title: 'Next',
                          height: 60,
                          backgroundColor:isFormFilled ?AppColors.primaryColor: AppColors.disableColor,
                          borderRadius: 50,
                          width: double.infinity,
                          shadowColor: AppColors.transparent,
                          hMargin: 0,
                          titleColor: AppColors.white,
                        ),
                      ],
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
}
