
package eshop.entity;

import javax.persistence.Entity;

public class Item {
    
    private Product product;
    private int quantity;
    private float quality;

    public Item(Product product, int quantity, float quality) {
        this.product = product;
        this.quantity = quantity;
        this.quality = quality;
    }

    public Item() {
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

    public float getQuality() {
        return quality;
    }

    public void setQuality(float quality) {
        this.quality = quality;
    }
}