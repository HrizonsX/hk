package com.hk.controller;

import com.hk.mapper.AirLineMapper;
import com.hk.mapper.FightMapper;
import com.hk.mapper.ShippingSpaceMapper;
import com.hk.pojo.AirLine;
import com.hk.pojo.Fight;
import com.hk.pojo.ShippingSpace;
import com.hk.service.SearchTicketService;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/admin")
//管理系统不需要考虑高并发
public class AdminController {

    @Autowired
    private AirLineMapper airLineMapper = null;
    @Autowired
    private FightMapper fightMapper = null;
    @Autowired
    private ShippingSpaceMapper shippingSpaceMapper = null;
    @Autowired
    private SearchTicketService searchTicketService = null;

    //添加航线
    @RequestMapping(value = "/addAirLine", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView addAirLine(AirLine airLine){
        ModelAndView mv = new ModelAndView();
        airLineMapper.addAirLine(airLine);
        mv.setViewName("");
        return mv;
    }

    //返回fight
    @RequestMapping(value = "/getFights", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView getFights(){
        ModelAndView mv = new ModelAndView();
        List<Fight> fightList = fightMapper.getAllFights();
        mv.addObject("fights",fightList);
        mv.setViewName("admin/admin");
        return mv;
    }

    //添加航班
    @RequestMapping(value = "/addFight", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView addFight(Fight fight){
        ModelAndView mv = new ModelAndView();
        fightMapper.addFight(fight);
        mv.setViewName("");
        return mv;
    }


    //修改航班
    @RequestMapping(value = "/modifyFight", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView modifyFight(Fight fight){
        ModelAndView mv = new ModelAndView();
        System.out.println(fight);
        fightMapper.updateFight(fight);
        List<Fight> fightList = fightMapper.getAllFights();
        mv.addObject("fights",fightList);
        mv.setViewName("admin/admin");
        return mv;
    }

    //ajax查看alCode是否重复
    @RequestMapping(value = "/checkAlCode", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public String checkAlCode(@RequestBody String alCode){
        alCode = alCode.replace("\"", "");
        int searchResult = searchTicketService.checkAlCode(alCode);
        if(searchResult != 0){
            return "no";
        }
        else{
            return "yes";
        }
    }

    //添加餐位
    @RequestMapping(value = "/addShippingSpace", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView addShippingSpace(ShippingSpace shippingSpace){
        ModelAndView mv = new ModelAndView();
        shippingSpaceMapper.addShippingSpace(shippingSpace);
        mv.setViewName("");
        return mv;
    }


    //修改航班
    @RequestMapping(value = "/modifyShippingSpace", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView modifyShippingSpace(ShippingSpace shippingSpace){
        ModelAndView mv = new ModelAndView();
        shippingSpaceMapper.updateShippingSpace(shippingSpace);
        mv.setViewName("");
        return mv;
    }
}
