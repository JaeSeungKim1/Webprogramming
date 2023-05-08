package com.shop.service;

import com.shop.dto.ItemDto;

import java.util.HashMap;

public interface ItemServiceForm {
    void createItem(ItemDto item);
    ItemDto getItem(Long id);
    HashMap<Long,ItemDto> getItemAll();
    Long update(ItemDto item);
    void deleteItem(Long id);
}
