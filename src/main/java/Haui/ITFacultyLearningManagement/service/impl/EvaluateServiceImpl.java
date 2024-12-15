package Haui.ITFacultyLearningManagement.service.impl;

import Haui.ITFacultyLearningManagement.custom.evaluate.request.AnswerQuestionRequest;
import Haui.ITFacultyLearningManagement.custom.evaluate.request.EvaluateRequest;
import Haui.ITFacultyLearningManagement.entities.*;
import Haui.ITFacultyLearningManagement.repository.*;
import Haui.ITFacultyLearningManagement.service.EvaluateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.DecimalFormat;
import java.util.List;
import java.util.Optional;

@Service
public class EvaluateServiceImpl implements EvaluateService {
    @Autowired
    private EvaluateRepository evaluateRepository;

    @Autowired
    private StudentRepository studentRepository;

    @Autowired
    private QuestionRepository questionRepository;

    @Autowired
    private CourseRegistrationRepository courseRegistrationRepository;

    @Autowired
    private LectureRepository lectureRepository;

    @Autowired
    private ClassroomRepository classroomRepository;

    @Override
    public List<Question> findAllQuestion() {
        return questionRepository.findAll();
    }

    @Override
    public boolean evaluateLecture(EvaluateRequest request, int accountId) {
        Optional<Student> studentOptional = studentRepository.findByAccountId(accountId);
        if (studentOptional.isEmpty())
            return false;

        Optional<Classroom> classroomOptional = classroomRepository.findById(request.getClassId());
        if(classroomOptional.isEmpty())
            return false;

        Optional<CourseRegistration> courseRegistrationOptional = courseRegistrationRepository.findByStuAndClass(studentOptional.get().getStudentId(), request.getClassId());
        if (courseRegistrationOptional.isEmpty())
            return false;

        Optional<Evaluate> evaluateOptional = evaluateRepository.findByStuAndClass(studentOptional.get().getStudentId(), request.getClassId());
        if (evaluateOptional.isPresent())
            return false;

        int totalRating = 0;
        for(AnswerQuestionRequest item: request.getAnswer()){
            totalRating = totalRating + item.getScore();
        }

        double result = (double) totalRating / request.getAnswer().size();
        DecimalFormat df = new DecimalFormat("#.##");
        double rating = Double.parseDouble(df.format(result));

        Evaluate evaluate = new Evaluate(
                request.getClassId(),
                studentOptional.get().getStudentId(),
                request.getContent(),
                rating
        );

        evaluateRepository.save(evaluate);
        return true;
    }

    @Override
    public List<Evaluate> findAll() {
        return evaluateRepository.findAll();
    }

    @Override
    public Optional<Evaluate> findById(Integer id) {
        return evaluateRepository.findById(id);
    }

    @Override
    public Evaluate save(Evaluate evaluate) {
        return evaluateRepository.save(evaluate);
    }

    @Override
    public void deleteById(Integer id) {
        evaluateRepository.deleteById(id);
    }
}
