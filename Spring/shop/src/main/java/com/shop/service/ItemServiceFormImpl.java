package com.shop.service;

import com.shop.dto.ItemDto;
import com.shop.repository.ItemRepositoryForm;
import com.shop.repository.ItemRepositoryFormImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;

@Service
public class ItemServiceFormImpl implements ItemServiceForm{

    @Autowired
    private ItemRepositoryForm items;

    @Override
    public void createItem(ItemDto item) {
        items.createItem(item);
    }

    @Override
    public ItemDto getItem(Long id) {
        return items.getItem(id);
    }

    @Override
    public HashMap<Long, ItemDto> getItemAll() {
        return items.getItemAll();
    }

    @Override
    public Long update(ItemDto item) {
        return items.updateItem(item);
    }

    @Override
    public void deleteItem(Long id) {
        items.deleteItem(id);
    }
}
