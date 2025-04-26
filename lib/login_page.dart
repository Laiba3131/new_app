ElevatedButton(
  onPressed: (emailController.text.trim().isNotEmpty && 
              passwordController.text.trim().isNotEmpty) 
      ? () {
          // Perform login action here
          String email = emailController.text.trim();
          String password = passwordController.text.trim();

          if (email.isEmpty || password.isEmpty) {
            _showErrorDialog(context);
           
          } else {
             isAuthenticated = true;
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    const PreProfileEditPage(),
              ),
            );
            // Call your login function here
            // For example: login(email, password);
          }
        }
      : null, // Button is disabled when fields are empty
  style: ElevatedButton.styleFrom(
    backgroundColor: (emailController.text.trim().isNotEmpty && 
                     passwordController.text.trim().isNotEmpty)
        ? Colors.blue // Active color when fields are not empty
        : Colors.grey.shade300, // Inactive color when fields are empty
    // ... existing style properties ...
  ),
  child: // ... existing code ...
) 