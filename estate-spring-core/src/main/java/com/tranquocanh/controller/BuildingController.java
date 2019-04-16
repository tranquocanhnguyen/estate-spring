package com.tranquocanh.controller;

import com.tranquocanh.constant.SystemConstant;
import com.tranquocanh.dto.BuildingDTO;
import com.tranquocanh.util.BuildingUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BuildingController {

    @GetMapping("/admin/building/list")
    public ModelAndView showBuilding(@ModelAttribute(SystemConstant.MODEL) BuildingDTO model) {
        ModelAndView mav = new ModelAndView("building/list");
        mav.addObject("buildingTypes", BuildingUtils.getBuildingTypes());
        mav.addObject(SystemConstant.MODEL, model);
        return mav;
    }
}
