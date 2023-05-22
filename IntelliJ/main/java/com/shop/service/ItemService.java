package com.shop.service;

import com.shop.dto.ItemFormDto;
import com.shop.dto.ItemImgDto;
import com.shop.dto.ItemSearchDto;
import com.shop.dto.MainItemDto;
import com.shop.entity.Item;
import com.shop.entity.ItemImg;
import com.shop.repository.ItemImgRepository;
import com.shop.repository.ItemRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import javax.persistence.EntityExistsException;
import javax.persistence.EntityNotFoundException;
import java.util.ArrayList;
import java.util.List;


@Service
@Transactional
@RequiredArgsConstructor
public class ItemService {
    private final ItemRepository itemRepository;
    private final ItemImgService itemImgService;
    private final ItemImgRepository itemImgRepository;

    public Long saveItem(ItemFormDto itemFormDto, List<MultipartFile> itemImgFileList)
        throws Exception{
        //상품 등록
        Item item = itemFormDto.createItem();
        itemRepository.save(item);

        //이미지 등록
        for(int i=0;i<itemImgFileList.size();i++){
            ItemImg itemImg = new ItemImg();
            itemImg.setItem(item);
            if(i==0){
                itemImg.setRepimgYn("Y");
            }else{
                itemImg.setRepimgYn("N");
            }
            itemImgService.saveItemImg(itemImg,itemImgFileList.get(i));
        }
        return item.getId();
    }
    /*
        기능명: 상세 설명 풀어서 해주면 좋음
    */
    /*데이터를 주고 받을 때 entity를 사용하면 데이터 충돌날 수 있기 때문에 formDto를 사용해서 문제 해결 */
        public ItemFormDto getItemDtl(Long itemId) {
            //상품 이미지 정보
            List<ItemImg> itemImgList = itemImgRepository.findByItemIdOrderByIdAsc(itemId);
            List<ItemImgDto> itemImgDtoList = new ArrayList<>();
            for(ItemImg itemImg : itemImgList) {
                ItemImgDto itemImgDto = ItemImgDto.of(itemImg); /*itemImg를 받아서 ItemImgDto로 변환해주는 역할을 of가 함?*/
                itemImgDtoList.add(itemImgDto);
            }
            //상품 정보
            Item item = itemRepository.findById(itemId).orElseThrow(EntityNotFoundException::new);
            ItemFormDto itemFormDto = ItemFormDto.of(item);
            itemFormDto.setItemImgDtoList(itemImgDtoList);

            return itemFormDto;
        }

        public Long updateItem(ItemFormDto itemFormDto,List<MultipartFile> itemImgFileList) throws Exception {
            //상품 수정
            Item item = itemRepository.findById(itemFormDto.getId()).orElseThrow(EntityNotFoundException::new);
                item.updateItem(itemFormDto);
            List<Long> itemImgIds = itemFormDto.getItemImgIds();
            //이미지 재등록
            for (int i=0;i<itemImgFileList.size();i++){
                itemImgService.updateItemImg(itemImgIds.get(i),itemImgFileList.get(i));
            }
            return item.getId();
        }

        public Page<Item> getAdminItemPage(ItemSearchDto itemSearchDto, Pageable pageable){
            return itemRepository.getAdminItempage(itemSearchDto,pageable);
        }
     @Transactional(readOnly = true)
        public Page<MainItemDto> getMainItemPage(ItemSearchDto itemSearchDto, Pageable pageable){
        return itemRepository.getMainItemPage(itemSearchDto, pageable);
    }
}
