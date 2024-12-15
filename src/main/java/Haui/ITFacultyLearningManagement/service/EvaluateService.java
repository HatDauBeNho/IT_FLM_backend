package Haui.ITFacultyLearningManagement.service;

import Haui.ITFacultyLearningManagement.custom.evaluate.request.EvaluateRequest;
import Haui.ITFacultyLearningManagement.entities.Evaluate;
import Haui.ITFacultyLearningManagement.entities.Question;

import java.util.List;

public interface EvaluateService extends Generate<Evaluate> {
    List<Question> findAllQuestion();

    boolean evaluateLecture(EvaluateRequest evaluateRequest, int accountId);
}
