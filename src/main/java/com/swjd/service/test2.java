package com.swjd.service;

import com.swjd.dao.McqDao;
import com.swjd.dao.McsDao;
import com.swjd.dao.PwpsDao;
import com.swjd.dao.WpsDao;
import com.swjd.domain.Pwps;
import com.swjd.domain.Wps;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.ArrayList;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:conf/*.xml")
public class test2 {

   @Test
    public void a() {
       int i=10;
       i=i++;
       System.out.println(i);
       i=++i;
      System.out.println(i);
   }
}
