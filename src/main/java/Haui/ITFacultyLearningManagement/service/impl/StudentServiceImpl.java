package Haui.ITFacultyLearningManagement.service.impl;

import Haui.ITFacultyLearningManagement.custom.student.handle.SearchStudentHandle;
import Haui.ITFacultyLearningManagement.custom.student.request.CreateStudentRequest;
import Haui.ITFacultyLearningManagement.entities.Info;
import Haui.ITFacultyLearningManagement.entities.Student;
import Haui.ITFacultyLearningManagement.repository.AccountRepository;
import Haui.ITFacultyLearningManagement.repository.InfoRepository;
import Haui.ITFacultyLearningManagement.repository.StudentRepository;
import Haui.ITFacultyLearningManagement.service.AccountService;
import Haui.ITFacultyLearningManagement.service.StudentService;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Optional;


@Service
public class StudentServiceImpl implements StudentService {
    @Autowired
    private StudentRepository studentRepository;
    @Autowired
    private InfoRepository infoRepository;
    @Autowired
    private AccountRepository accountRepository;
    @Autowired
    private AccountService accountService;

    @Override
    public List<SearchStudentHandle> getStudentWithSearch(String keySearch, Pageable pageable) {
        return studentRepository.getStudentWithSearch(keySearch,pageable);
    }

    @Override
    public Integer getTotal(String keySearch) {
        return studentRepository.getTotal(keySearch);
    }

    @Override
    public Optional<Student> findByAccountId(int accountId) {
        return studentRepository.findByAccountId(accountId);
    }

    @Override
    public List<Student> findAll() {
        return studentRepository.findAll();
    }

    @Override
    public Optional<Student> findById(Integer id) {
        return studentRepository.findById(id);
    }

    @Override
    public Student save(Student student) {
        return studentRepository.save(student);
    }

    @Override
    public void deleteById(Integer id) {
        studentRepository.deleteById(id);
    }


//    @Override
//    public List<Student> saveStudentFromExcel(InputStream inputStream) throws Exception {
//        List<Student> studentList=new ArrayList<>();
//        Workbook workbook=new XSSFWorkbook(inputStream);
//        Sheet sheet=workbook.getSheetAt(0);
//        for (Row row:sheet)
//        {
//            if (row.getRowNum()==0) continue;
//
//            CreateStudentRequest createStudentRequest=new CreateStudentRequest(
//                    row.getCell(0).getStringCellValue(),
//                    row.getCell(1).getLocalDateTimeCellValue().toLocalDate(),
//                    (int)row.getCell(2).getNumericCellValue(),
//                    row.getCell(3).getStringCellValue(),
//                    row.getCell(4).getStringCellValue(),
//                    row.getCell(5).getStringCellValue(),
//                    row.getCell(6).getStringCellValue()
//            );
//            System.out.println(createStudentRequest);
//            Optional<Student> studentOptional=studentRepository.findByName(createStudentRequest.getFullName());
//            Optional<Info> inforOptional= infoRepository.findByPhoneNumber(createStudentRequest.getPhoneNumber());
//            Optional<Classroom> classroomOptional= classroomRepository.findByName(createStudentRequest.getClassName());
//            if (studentOptional.isPresent()||inforOptional.isPresent()||classroomOptional.isEmpty()) continue;
//            studentList.add(createStudentAccount(createStudentRequest));
//        }
//        workbook.close();
//        return  studentList;
//    }

}
