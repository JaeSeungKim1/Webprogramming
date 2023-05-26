package com.refrigerator.controller;



import com.refrigerator.model.SearchParam;
import com.refrigerator.model.network.Header;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api") // localhost:8090/api
public class GetController {

    @RequestMapping(method = RequestMethod.GET, path = "/getMethod") // localhost:8090/api/getMethod
    public String getRequest(){
        return "Hi GetMethod";
    }

    @GetMapping("/getParameter") // localhost:8090/api/getParameter?id=1234&password=abcd
    public String getParameter(@RequestParam String id, @RequestParam(name = "password") String pwd){
        System.out.println("ID : " + id);
        System.out.println("PW : " + pwd);

        return id + pwd;
    }

    @GetMapping("/getMultiParameter") // localhost:8090/api/getMultiParameter?account=abcd&email=study@gmail.com&page=10
    public SearchParam getMultiParameter(SearchParam searchParam){
        System.out.println(searchParam.getAccount());
        System.out.println(searchParam.getEmail());
        System.out.println(searchParam.getPage());
        // {"account" : "", "email" : "", page : 0}
        return searchParam;
    }

    @GetMapping("/header")
    public Header getHeader(){

        // {"resultCode" : "OK", "description" : "OK"}
        return Header.builder().resultCode("OK").description("OK").build();
    }
}