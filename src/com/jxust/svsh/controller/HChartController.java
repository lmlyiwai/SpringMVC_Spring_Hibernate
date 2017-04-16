package com.jxust.svsh.controller;

import com.jxust.svsh.service.HChartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.*;
import java.text.SimpleDateFormat;
/**
 * Created by mengleil on 4/6/2017.
 */
@Controller
@RequestMapping(value = "/test")
public class HChartController {
    public final static int num = 10;
    @Autowired
    public HChartService hChartService;
    @RequestMapping(value = "/option")
    public ModelAndView form() throws Exception{
        ModelAndView mav = new ModelAndView("option");
        return mav;
    }
    //HttpServletRequest
    @RequestMapping(value = "/commit",method = RequestMethod.POST)
    public  @ResponseBody  String  commit(@RequestBody String date){
        if(date == ""){
            return new String("this day no report!");
        }
        date = date.substring(0,date.length() - 1);
        Map<String ,Object> map = hChartService.getGitInfo(date);
        String str = "";
        if (map.size() == 0){
            return new String("this day no report!");
        } else {
            for (Map.Entry<String, Object> entry : map.entrySet()){
                str += entry.getKey() + ":" + entry.getValue() + "<br/>";
            }
            return str;
        }
    }
    @RequestMapping(value = "/hchart")
    public ModelAndView display(String startDate,String endDate) throws Exception {
        endDate = endDate==""?new SimpleDateFormat("yyyy-MM-dd").format(new Date()):endDate;
        startDate = startDate==""?endDate:startDate;
        ModelAndView mav = new ModelAndView("hchart");
        List<Map<String,Object>> list = hChartService.getResult(startDate,endDate);
        System.out.println("size ------------------" + list.size());
        if (list == null || list.size() == 0) {
            return new ModelAndView("option");
        } else {
            Map<String,String> map = new HashMap<String,String>();
            List<String> date = new ArrayList<String>();
            List<Double> mer64 = new ArrayList<Double>();
            List<Double> mer128 = new ArrayList<Double>();
            List<Double> mer256 = new ArrayList<Double>();
            List<Double> nor64 = new ArrayList<Double>();
            List<Double> nor128 = new ArrayList<Double>();
            List<Double> nor256 = new ArrayList<Double>();
            List<Double> vec64 = new ArrayList<Double>();
            List<Double> vec128 = new ArrayList<Double>();
            List<Double> vec256 = new ArrayList<Double>();
            for (int i = list.size()<=10?0:list.size() - 10;i<list.size();i++){
                Map<String,Object> tmp = list.get(i);
                date.add("'" + new SimpleDateFormat("MM-dd").format(tmp.get("mydate"))+ "'");
                mer64.add((Double) tmp.get("mer64"));
                mer128.add((Double) tmp.get("mer128"));
                mer256.add((Double) tmp.get("mer256"));
                nor64.add((Double) tmp.get("nor64"));
                nor128.add((Double) tmp.get("nor128"));
                nor256.add((Double) tmp.get("nor256"));
                vec64.add((Double) tmp.get("vec64"));
                vec128.add((Double) tmp.get("vec128"));
                vec256.add((Double) tmp.get("vec256"));
            }
            map.put("date",date.toString());
            System.out.println("date --------------" + date.toString());
            map.put("mer64",mer64.toString());
            map.put("mer128",mer128.toString());
            map.put("mer256",mer256.toString());
            map.put("nor64",nor64.toString());
            map.put("nor128",nor128.toString());
            map.put("nor256",nor256.toString());
            map.put("vec64",vec64.toString());
            map.put("vec128",vec128.toString());
            map.put("vec256",vec256.toString());
            mav.addAllObjects(map);
            return mav;
        }
    }
}


