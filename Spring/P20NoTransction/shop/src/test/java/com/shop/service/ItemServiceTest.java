package com.shop.service;

import com.shop.constant.ItemSellStatus;
import com.shop.dto.ItemFormDto;
import com.shop.entity.Cart;
import com.shop.entity.Item;

import com.shop.entity.ItemImg;
import com.shop.repository.ItemImgRepository;
import com.shop.repository.ItemRepository;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.mock.web.MockMultipartFile;
import org.springframework.security.test.context.support.WithMockUser;
import org.springframework.test.context.TestPropertySource;
import org.springframework.web.multipart.MultipartFile;

import javax.persistence.EntityManager;
import javax.persistence.EntityNotFoundException;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import java.util.ArrayList;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
@TestPropertySource(locations = "classpath:application-test.properties")
@Transactional
class ItemServiceTest {
    @Autowired
    ItemService itemService;
    @Autowired
    ItemRepository itemRepository;
    @Autowired
    ItemImgRepository itemImgRepository;
    @PersistenceContext
    EntityManager em;

    List<MultipartFile> createMultipartFiles() throws Exception{
        List<MultipartFile> multipartFiles = new ArrayList<>();
        for(int i=0; i<5; i++){
            String path="C:/storage/item/";
            String imageName="image"+i+".jpg";
            MockMultipartFile mockMultipartFile = new MockMultipartFile(path,imageName,"image/jpg",new byte[]{1,2,3,4});
            multipartFiles.add(mockMultipartFile);
        }
        return multipartFiles;
    }

    @Test
    @DisplayName("상품 및 이미지 업로드 실행 테스트")
    @WithMockUser(username = "sultan", roles = "ADMIN")
    public void saveItem() throws Exception{
        ItemFormDto itemFormDto = new ItemFormDto();
        itemFormDto.setItemNm("테스트 상품");
        itemFormDto.setItemSellStatus(ItemSellStatus.SELL);
        itemFormDto.setItemDetail("테스트 상품 정보");
        itemFormDto.setPrice(1000);
        itemFormDto.setStockNumber(100);

        List<MultipartFile> multipartFileList = createMultipartFiles();
        Long itemId = itemService.saveItem(itemFormDto,multipartFileList);
        List<ItemImg> itemImageList = itemImgRepository.findByItemIdOrderByIdAsc(itemId);

        em.flush();
        em.clear();

        Item item = itemRepository.findById(itemId).orElseThrow(EntityNotFoundException::new);



        assertEquals(itemFormDto.getItemNm(),item.getItemNm());
        assertEquals(itemFormDto.getItemSellStatus(),item.getItemSellStatus());
        assertEquals(itemFormDto.getItemDetail(),item.getItemDetail());
        assertEquals(itemFormDto.getPrice(),item.getPrice());
        assertEquals(itemFormDto.getStockNumber(),item.getStockNumber());
        assertEquals(multipartFileList.get(0).getOriginalFilename(),itemImageList.get(0).getOriImgName());

    }


}