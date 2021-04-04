/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package eshop.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.DecimalMax;
import javax.validation.constraints.DecimalMin;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author alkinoos
 */
@Entity
@Table(name = "product")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Product.findAll", query = "SELECT p FROM Product p")
    , @NamedQuery(name = "Product.findById", query = "SELECT p FROM Product p WHERE p.id = :id")
    , @NamedQuery(name = "Product.findByDescr", query = "SELECT p FROM Product p WHERE p.descr = :descr")
    , @NamedQuery(name = "Product.findByPath", query = "SELECT p FROM Product p WHERE p.path = :path")
    , @NamedQuery(name = "Product.findByBasePrice", query = "SELECT p FROM Product p WHERE p.basePrice = :basePrice")
    })
public class Product implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Size(max = 30)
    @Column(name = "descr")
    private String descr;
    @Size(max = 100)
    @Column(name = "path")
    private String path;
    @Basic(optional = false)
    @NotNull
    @DecimalMin(value = "0000.00")
    @DecimalMax(value = "9999.99")
    @Column(name = "base_price", precision=6, scale = 2)
    private BigDecimal basePrice;
    @JoinColumn(name = "product_category_id", referencedColumnName = "id")
    @ManyToOne(optional = false,fetch = FetchType.LAZY)
    private ProductCategory productcategory;
//    @OneToMany(cascade = CascadeType.ALL, mappedBy = "product", fetch = FetchType.LAZY)
//    private List<ProductHasCategory> productHasCategories;
    @OneToMany(mappedBy = "product", fetch = FetchType.LAZY)
    private List<OrderDetails> orderDetails;
    
//    @Column(nullable = true, length = 64)
//    private String files;

    public Product() {
    }

    public Product(Integer id) {
        this.id = id;
    }

    public Product(Integer id, BigDecimal basePrice) {
        this.id = id;
        this.basePrice = basePrice;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDescr() {
        return descr;
    }

    public void setDescr(String descr) {
        this.descr = descr;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public BigDecimal getBasePrice() {
        return basePrice;
    }

    public void setBasePrice(BigDecimal basePrice) {
        this.basePrice = basePrice;
    }

    public ProductCategory getProductcategory() {
        return productcategory;
    }

    public void setProductcategory(ProductCategory productcategory) {
        this.productcategory = productcategory;
    }

//    @XmlTransient
//    public List<ProductHasCategory> getProductHasCategories() {
//        return productHasCategories;
//    }
//
//    public void setProductHasCategories(List<ProductHasCategory> productHasCategories) {
//        this.productHasCategories = productHasCategories;
//    }

    @XmlTransient
    public List<OrderDetails> getOrderDetails() {
        return orderDetails;
    }

    public void setOrderDetails(List<OrderDetails> orderDetails) {
        this.orderDetails = orderDetails;
    }

//    public String getfiles() {
//        return files;
//    }
//
//    public void setfiles(String files) {
//        this.files = files;
//    }
    
    

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Product)) {
            return false;
        }
        Product other = (Product) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Product{" + "id=" + id + ", descr=" + descr + ", path=" + path + ", basePrice=" + basePrice + '}';
    }

}
