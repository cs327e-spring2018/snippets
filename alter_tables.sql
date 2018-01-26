alter table Product add FOREIGN KEY (category_id) REFERENCES Category(category_id);
alter table Product add FOREIGN KEY (subcategory_id) REFERENCES Subcategory(subcategory_id);
alter table Product_Store add FOREIGN KEY (sku) REFERENCES Product(sku);
alter table Product_Store add FOREIGN KEY (store) REFERENCES Store(id);