package com.papergen.service.impl;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.poifs.filesystem.OfficeXmlFileException;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.papergen.dao.QuestionDao;
import com.papergen.domain.Question;
import com.papergen.service.QuestionService;
import org.springframework.web.multipart.MultipartFile;

@Service
public class QuestionServiceImpl implements QuestionService {

    @Autowired
    private QuestionDao questionDao;

    public List<Question> getAllQuestions() {
        return questionDao.selectAllQuestions();
    }

    @Override
    public void delete(int id) {
        questionDao.deleteQuestionById(id);
    }

    @Override
    public Question addQuestion(Question question) {
        return questionDao.insertQuestion(question) > 0 ? question : null;
    }

    @Override
    public Question getQuestionById(String id) {
        return questionDao.selectQuestionById(id);
    }

    @Override
    public Question updateQuestion(Question question) {
        return questionDao.updateQuestion(question) > 0 ? question : null;
    }

    @Override
    public List<Question> getQuestionsByChapterSectionLevelType(String chapter, String section, List<String> level, int type) {
        return questionDao.selectQuestionsByChapterSectionLevelType(chapter, section, level, type);
    }

    @Override
    public List<Question> batchImport(MultipartFile excelFile) throws IOException {
        Workbook workbook;
        try {
            workbook = new HSSFWorkbook(excelFile.getInputStream());
        } catch (OfficeXmlFileException e) {
            try {
                workbook = new XSSFWorkbook(excelFile.getInputStream());
            } catch (Exception ex) {
                return null;
            }
        }
        Sheet sheet = workbook.getSheetAt(0);
        Row rowHead = sheet.getRow(0);
        System.out.println(rowHead.getPhysicalNumberOfCells());
        if (rowHead.getPhysicalNumberOfCells() != 15) {
            System.out.println("表头数量不正确！");
            return null;
        }
        int totalRowNum = sheet.getLastRowNum();
        Question question;
        List<Question> questions = new ArrayList<>();
        for (int i = 1; i <= totalRowNum; i++) {
            Row row = sheet.getRow(i);
            question = new Question();
            Cell chapterCell = row.getCell(0);
            chapterCell.setCellType(CellType.NUMERIC);
            question.setChapter((int)Math.round(chapterCell.getNumericCellValue()));
            Cell sectionCell = row.getCell(1);
            sectionCell.setCellType(CellType.NUMERIC);
            question.setSection((int)Math.round(sectionCell.getNumericCellValue()));
            Cell levelCell = row.getCell(2);
            levelCell.setCellType(CellType.NUMERIC);
            question.setLevel((int)Math.round(levelCell.getNumericCellValue()));
            Cell bodyCell = row.getCell(3);
            bodyCell.setCellType(CellType.STRING);
            question.setBody(bodyCell.getStringCellValue());
            Cell typeCell = row.getCell(4);
            typeCell.setCellType(CellType.NUMERIC);
            question.setType((int)Math.round(typeCell.getNumericCellValue()));
            Cell optionNumCell = row.getCell(5);
            optionNumCell.setCellType(CellType.NUMERIC);
            question.setOptionNum((int)Math.round(optionNumCell.getNumericCellValue()));
            Cell optionACell = row.getCell(6);
            optionACell.setCellType(CellType.STRING);
            question.setOptionA(optionACell.getStringCellValue());
            Cell optionBCell = row.getCell(7);
            optionBCell.setCellType(CellType.STRING);
            question.setOptionB(optionBCell.getStringCellValue());
            Cell optionCCell = row.getCell(8);
            optionCCell.setCellType(CellType.STRING);
            question.setOptionC(optionCCell.getStringCellValue());
            Cell optionDCell = row.getCell(9);
            optionDCell.setCellType(CellType.STRING);
            question.setOptionD(optionDCell.getStringCellValue());
            Cell optionECell = row.getCell(10);
            optionECell.setCellType(CellType.STRING);
            question.setOptionE(optionECell.getStringCellValue());
            Cell rightOptionCell = row.getCell(11);
            rightOptionCell.setCellType(CellType.STRING);
            question.setRightOption(rightOptionCell.getStringCellValue());
            Cell rightJudgeCell = row.getCell(12);
            rightJudgeCell.setCellType(CellType.BOOLEAN);
            question.setRightJudge(rightJudgeCell.getBooleanCellValue());
            Cell rightFillingCell = row.getCell(13);
            rightFillingCell.setCellType(CellType.STRING);
            question.setRightFilling(rightFillingCell.getStringCellValue());
            Cell rightEssayCell = row.getCell(14);
            rightEssayCell.setCellType(CellType.STRING);
            question.setRightEssay(rightEssayCell.getStringCellValue());
            questions.add(question);
            System.out.println(question);
        }
        return questions;
    }

    public static void main(String[] args) {
        double test = 1.4d;
        int round = (int)Math.round(test);
        System.out.println((int) test);
        System.out.println(round);
    }
}
