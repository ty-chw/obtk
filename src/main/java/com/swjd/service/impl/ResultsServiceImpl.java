package com.swjd.service.impl;

import com.swjd.dao.ResultsDao;
import com.swjd.domain.Result;
import com.swjd.service.ResultsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class ResultsServiceImpl implements ResultsService {

    @Autowired
    private ResultsDao resultsDao;

    @Override
    public int insertResult(Result result) {
        return resultsDao.insertResult(result);
    }

     @Override
    public int selectResultId() {
        return resultsDao.selectResultId();
    }

    @Override
    public int updateResult(Result result) {
        return resultsDao.updateResult(result);
    }

    @Override
    public List<String> selectStudentResultsTets(String studentId) {
        return resultsDao.selectStudentResultsTets(studentId);
    }

    @Override
    public int updateStudentResult(Result result) {
        return resultsDao.updateStudentResult(result);
    }

    @Override
    public int deleteStudentResult(String resultId) {
        return resultsDao.deleteStudentResult(resultId);
    }

    @Override
    public List<Result> selectStudentTetResults(Result result) {
        if(result.getTet().equals("all")){
            return resultsDao.selectStudentTetResults(result);
        }else {
            List<Result> list=new ArrayList<>();
            for (Result result1:resultsDao.selectStudentTetResults(result)){
                if(result1.getTet().equals(result.getTet())){
                    list.add(result1);
                }
            }
            return list;
        }

    }
}
