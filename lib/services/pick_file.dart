



import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:vakilyar/services/file_controller.dart';
FilePickerController filePickerController= Get.put(FilePickerController());
Future pickFile () async{
  FilePickerResult? result=await FilePicker.platform.pickFiles(type: FileType.media);
 filePickerController.file.value = result!.files.first;
}