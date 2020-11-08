package chukhnovm.questionnaire.Services;

import java.util.*;

public class QuestionnaireService {

    public static String[] parseParameterMap(Map<String, String[]> parameterMap) {

        // Parse form/data array param
        Map<String, String> answersMap = new TreeMap<>();

        for (Map.Entry<String, String[]> answer : parameterMap.entrySet()) {
            for (String answerValue : answer.getValue()) {
                answersMap.put(answer.getKey(), answerValue);
            }
        }

        String[] answersArray = new String[answersMap.size()];

        int i = 0;
        for (Map.Entry<String, String> answer: answersMap.entrySet()) {
            answersArray[i] = answer.getValue();
            i++;
        }

        return answersArray;
    }
}
