
package eshop.entity;

public class Item {
    
    private Product product;
    private int quantity;
    private Category category;

    public Item() {
    }

    public Item(Product product, int quantity, Category category) {
        this.product = product;
        this.quantity = quantity;
        this.category = category;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }
}