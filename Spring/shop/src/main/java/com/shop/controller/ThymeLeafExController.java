package com.shop.controller;

import com.shop.dto.ItemDto;
import com.shop.service.ItemServiceForm;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import javax.servlet.http.HttpServletRequest;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping(value = "/thymeleaf")
public class ThymeLeafExController {

    @Autowired
    private ItemServiceForm itemservice;

    @GetMapping(value="/ex01")
    public String thymeleafExam01(Model model){
        System.out.println("test update");
        model.addAttribute("data","타임리프 예제");
        return "ThymeLeafEX/thymeLeafEx01";
    }

    @GetMapping(value = "/ex02")
    public String thymeleafExam02(Model model){
        ItemDto itemDto = new ItemDto();
        itemDto.setItemDetail("상품의 상세한 설명");
        itemDto.setItemNm("더미 상품");
        itemDto.setPrice(10000);
        itemDto.setRegTime(LocalDateTime.now());
        model.addAttribute("itemDto",itemDto);
        return "ThymeLeafEX/thymeLeafEx02";
    }

    @GetMapping(value = "/ex03")
    public String thymeLeafExam03(Model model){
        List<ItemDto> itemDtoList = new ArrayList<>();
        for(int i=1; i<=10; i++){
            ItemDto itemDto = new ItemDto();
            itemDto.setItemNm("더미상품"+i);
            itemDto.setItemDetail("더미상품 정보"+i);
            itemDto.setPrice(1000+i);
            itemDto.setRegTime(LocalDateTime.now());
            itemDtoList.add(itemDto);
        }
        model.addAttribute("itemDtoList",itemDtoList);
        return "ThymeLeafEX/thymeLeafEx03";
    }

    @GetMapping(value="/ex04")
    public String thymeLeafExam04(Model model) {
        List<ItemDto> itemDtoList = new ArrayList<>();
        for (int i = 1; i <= 5; i++) {
            ItemDto itemDto = new ItemDto();
            itemDto.setItemNm("더미상품" + i);
            itemDto.setItemDetail("더미상품 정보" + i);
            itemDto.setPrice(1000 + i);
            itemDto.setRegTime(LocalDateTime.now());
            itemDtoList.add(itemDto);
        }
        model.addAttribute("itemDtoList", itemDtoList);
        return "ThymeLeafEX/thymeLeafEx04";
    }

    @GetMapping(value="/ex05")
    public String thymeleafExam05(){
        return "ThymeLeafEX/thymeLeafEx05";
    }

    @GetMapping(value="/ex06")
    public String thymeleafExam06(String param1, String param2, Model model){
        model.addAttribute("param1",param1);
        model.addAttribute("param2",param2);
        return "ThymeLeafEX/thymeLeafEx06";
    }

    @GetMapping(value="/ex07")
    public String thymeleafExam07(){
        return "ThymeLeafEX/thymeLeafEx07";
    }

    @GetMapping(value = "/ex08")
    public String thymeleafExam08(Model model){
        model.addAttribute("items",itemservice.getItemAll());
        return "ThymeLeafEX/thymeLeafEx08";
    }

    @GetMapping(value="/ex09")
    public String thymeleafExam09(Model model,ItemDto item){
        return "ThymeLeafEX/thymeLeafEx09";
    }

    @PostMapping(value="/ex09r")
    public String thymeleafExam09R(HttpServletRequest req, Model model, ItemDto item){
        itemservice.createItem(item);
        model.addAttribute("items",itemservice.getItemAll());
        return"ThymeLeafEX/thymeLeafEx09r";
    }

}
