import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:loginpage/user_form/users.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Admission Form',
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: 'Roboto',
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const UsersListFormScreen(),
    );
  }
}

class AdmissionFormPage extends StatefulWidget {
  const AdmissionFormPage({super.key, this.userFormData});

  final Map<String, dynamic>? userFormData;

  @override
  State<AdmissionFormPage> createState() => _AdmissionFormPageState();
}

class _AdmissionFormPageState extends State<AdmissionFormPage> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
@override
  void initState() {
    if(widget.userFormData?.isNotEmpty ?? false){
       enquiryNoController.text = widget.userFormData?["enquiryNumber"];
       submissionDateController.text = widget.userFormData?["submissionDate"];
       admissionIntoClassController.text = widget.userFormData?["admissionOnClass"];
       studentNameController.text = widget.userFormData?["StudentName"];
       dateOfBirthController.text = widget.userFormData?["DateOfBirth"];
       motherTongueController.text = widget.userFormData?["MotherTongue"];
       classPresentlyStudyingController.text =widget.userFormData?["presentClass"];
       nameAndLocationController.text = widget.userFormData?["location"];
       secondLanguageController.text = widget.userFormData?["secondLanguage"];
       thirdLanguageController.text = widget.userFormData?["thirdLang"];
       percentageController.text = widget.userFormData?["percentage"];
       schoolChangeReasonController.text = widget.userFormData?["reasonForSchoolChange"];
       specialTalentsController.text = widget.userFormData?["specialTalents"];
       chooseImageController.text= widget.userFormData?["chooseImage"];
    }

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Delhi World Public School',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.green[700],
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // School Logo Placeholder (Text as a substitute)
            Center(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.green[700],
                    child: const Text(
                      'DWPS Logo',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const Text(
                    'Under the aegis of Delhi World Foundation\nManneguada Campus, Hyderabad',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // Admission Form Title
            const Center(
              child: Text(
                'Admission Form',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ),
            const SizedBox(height: 32),

            // Enquiry Details Section
            const Text(
              'Enquiry Details',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildTextField(
              enquiryNoController,
              label: 'Enquiry No.',
              value: '100115',
            ),
            const SizedBox(height: 16),
            _buildTextField(
              submissionDateController,
              label: 'Submission date',
              value: '13-03-2025',
            ),
            const SizedBox(height: 16),
            _buildTextField(
              admissionIntoClassController,
              label: 'Admission into Class',
              value: '-- Select Option --',
              enabled: false,
            ),
            const SizedBox(height: 16),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text('Local/Othercity Transfer'),
                const SizedBox(width: 16),
                Expanded(
                  child: Wrap(
                    spacing: 8.0, // Space between items
                    runSpacing: 4.0, // Space between lines
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Radio(
                            value: 'LOCAL',
                            groupValue: null,
                            onChanged: (value) {},
                          ),
                          const Text('LOCAL'),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Radio(
                            value: 'OTHERCITY',
                            groupValue: null,
                            onChanged: (value) {},
                          ),
                          const Text('OTHERCITY'),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),

            // Student Details Section
            const Text(
              'Student Details',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildTextField(
              studentNameController,
              label: 'Name of the Student',
              hint: 'Enter name',
            ),
            const SizedBox(height: 16),
            _buildTextField(
              dateOfBirthController,
              label: 'Date of Birth',
              hint: 'dd-mm-yyyy',
            ),
            const SizedBox(height: 16),
            _buildTextField(
              motherTongueController,
              label: 'Mother Tongue',
              hint: 'Enter mother tongue',
            ),
            const SizedBox(height: 16),
            _buildTextField(
              classPresentlyStudyingController,
              label: 'Class Presently Studying',
              hint: '-- Select Option --',
              enabled: false,
            ),
            const SizedBox(height: 16),
            _buildTextField(
              nameAndLocationController,
              label: 'Name and Location of the Present School',
              hint: 'Enter school name and location',
            ),
            const SizedBox(height: 16),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text('Syllabus (Please specify)'),
                const SizedBox(width: 16),
                Expanded(
                  child: Wrap(
                    spacing: 8.0, // Space between items
                    runSpacing: 4.0, // Space between lines
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Radio(
                            value: 'CBSE',
                            groupValue: null,
                            onChanged: (value) {},
                          ),
                          const Text('CBSE'),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Radio(
                            value: 'STATE',
                            groupValue: null,
                            onChanged: (value) {},
                          ),
                          const Text('STATE'),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Radio(
                            value: 'ICSE',
                            groupValue: null,
                            onChanged: (value) {},
                          ),
                          const Text('ICSE'),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Radio(
                            value: 'IGCSE',
                            groupValue: null,
                            onChanged: (value) {},
                          ),
                          const Text('IGCSE'),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Radio(
                            value: 'OTHERS',
                            groupValue: null,
                            onChanged: (value) {},
                          ),
                          const Text('OTHERS'),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _buildTextField(
              secondLanguageController,
              label: 'II Language',
              hint: 'Enter second language',
            ),
            const SizedBox(height: 16),
            _buildTextField(
              thirdLanguageController,
              label: 'III Language',
              hint: 'Enter third language',
            ),
            const SizedBox(height: 16),
            _buildTextField(
              percentageController,
              label: 'Percentage / Grade in Present Class',
              hint: 'Enter grade or percentage',
            ),
            const SizedBox(height: 16),
            _buildTextField(
              schoolChangeReasonController,
              label: 'Reason for Change of School',
              hint: 'Enter reason',
            ),
            const SizedBox(height: 16),
            _buildTextField(
              specialTalentsController,
              label: 'Any Special Talent(s) of the Child',
              hint: 'Enter special talents',
            ),
            const SizedBox(height: 16),
            _buildTextField(
              chooseImageController,
              label: 'Photo',
              hint: 'Choose File',
              enabled: false,
            ),
            const SizedBox(height: 32),

            // Parent Details Section
            // const Text(
            //   'Parent Details',
            //   style: TextStyle(
            //     fontSize: 18,
            //     fontWeight: FontWeight.bold,
            //   ),
            // ),
            // const SizedBox(height: 16),
            // _buildTextField(label: 'Father - Name', hint: 'Enter name'),
            // const SizedBox(height: 16),
            // _buildTextField(label: 'Father - Company Name', hint: 'Enter company name'),
            // const SizedBox(height: 16),
            // _buildTextField(label: 'Father - Annual Income', hint: 'Enter income'),
            // const SizedBox(height: 16),
            // _buildTextField(label: 'Father - Email', hint: 'Enter email'),
            // const SizedBox(height: 16),
            // _buildTextField(label: 'Father - Qualification', hint: 'Enter qualification'),
            // const SizedBox(height: 16),
            // _buildTextField(label: 'Father - Designation', hint: 'Enter designation'),
            // const SizedBox(height: 16),
            // _buildTextField(label: 'Father - Phone No.', hint: 'Enter phone number'),
            // const SizedBox(height: 16),
            // _buildTextField(label: 'Father - Address for Communication', hint: 'Enter address'),
            // const SizedBox(height: 16),
            // _buildTextField(label: 'Mother - Name', hint: 'Enter name'),
            // const SizedBox(height: 16),
            // _buildTextField(label: 'Mother - Qualification', hint: 'Enter qualification'),
            // const SizedBox(height: 16),
            // _buildTextField(label: 'Mother - Company Name', hint: 'Enter company name'),
            // const SizedBox(height: 16),
            // _buildTextField(label: 'Mother - Designation', hint: 'Enter designation'),
            // const SizedBox(height: 32),

            // Submit Button
            Center(
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    await _firestore.collection('userForm').add({
                      'enquiryNumber': enquiryNoController.text.trim(),
                      'submissionDate': submissionDateController.text.trim(),
                      'admissionOnClass':
                          admissionIntoClassController.text.trim(),
                      'StudentName': studentNameController.text.trim(),
                      'DateOfBirth': dateOfBirthController.text.trim(),
                      'MotherTongue': motherTongueController.text.trim(),
                      'presentClass':
                          classPresentlyStudyingController.text.trim(),
                      'location': nameAndLocationController.text.trim(),
                      'secondLanguage': secondLanguageController.text.trim(),
                      'thirdLang': thirdLanguageController.text.trim(),
                      'percentage': percentageController.text.trim(),
                      'reasonForSchoolChange':
                          schoolChangeReasonController.text.trim(),
                      'specialTalents': specialTalentsController.text.trim(),
                      'chooseImage': chooseImageController.text.trim(),
                      'createdAt': Timestamp.now(),
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Submit',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextEditingController enquiryNoController = TextEditingController();
  TextEditingController submissionDateController = TextEditingController();
  TextEditingController admissionIntoClassController = TextEditingController();
  TextEditingController studentNameController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();
  TextEditingController motherTongueController = TextEditingController();
  TextEditingController classPresentlyStudyingController =
      TextEditingController();
  TextEditingController nameAndLocationController = TextEditingController();
  TextEditingController secondLanguageController = TextEditingController();
  TextEditingController thirdLanguageController = TextEditingController();
  TextEditingController percentageController = TextEditingController();
  TextEditingController schoolChangeReasonController = TextEditingController();
  TextEditingController specialTalentsController = TextEditingController();
  TextEditingController chooseImageController = TextEditingController();

  Widget _buildTextField(
    TextEditingController controller, {
    required String label,
    String? value,
    String? hint,
    bool enabled = true,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black87,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          enabled: enabled,
          controller: controller,
          decoration: InputDecoration(
            hintText: hint,
            filled: true,
            fillColor: Colors.grey[100],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey[400]!),
            ),
          ),
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
