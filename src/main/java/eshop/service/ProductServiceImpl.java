package eshop.service;

import eshop.entity.Product;
import eshop.repository.ProductRepo;
import java.io.BufferedOutputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.Optional;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

@Transactional
@Service
public class ProductServiceImpl implements ProductService {

    @Autowired
    ProductRepo productRepo;

    @Override
    public List<Product> getProducts() {
        List<Product> products = productRepo.findAll();
        return products;
    }

    @Override
    public List<Product> getLandscapes() {
        List<Product> products = productRepo.findAllByCategoryId(1);
        return products;
    }

    @Override
    public List<Product> getAnimals() {
        List<Product> products = productRepo.findAllByCategoryId(2);
        return products;
    }

    @Override
    public List<Product> getPeople() {
        List<Product> products = productRepo.findAllByCategoryId(3);
        return products;
    }

    @Override
    public void addProduct(Product product) {
        productRepo.save(product);
    }

    @Override
    public void deleteProduct(int id) {
        productRepo.deleteById(id);
    }

    @Override
    public Optional<Product> getProductById(int id) {
        return productRepo.findById(id);
    }

    @Override
    public Product updateProduct(Product product) {
        return productRepo.save(product);
    }

    @Override
    public void save(Product product) {
        productRepo.save(product);
    }

    @Override
    public void saveImage(MultipartFile imageFile) throws Exception {
        String folder = "C:\\Users\\alkinoos\\Documents\\NetBeansProjects\\groupproject\\src\\main\\resources\\static\\Images\\";
        byte[] bytes = imageFile.getBytes();
        Path path = Paths.get(folder + imageFile.getOriginalFilename());
        Files.write(path, bytes);
    }

    @Override
    public void downloadImage(String filepath, HttpServletResponse response) {
        String folder = "C:\\Users\\alkinoos\\Documents\\NetBeansProjects\\groupproject\\src\\main\\resources\\static\\Images\\";
        String filename = new String(filepath.substring(8));
        
        System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"+filename);
        response.setHeader("Content-Disposition", "attachment; filename=" + filename);
        response.setHeader("Content-Transfer-Encoding", "binary");

        try {
            BufferedOutputStream bos = new BufferedOutputStream(response.getOutputStream());
            FileInputStream fis = new FileInputStream(folder + filename);
            int len;
            byte[] buf = new byte[1024];
            while ((len = fis.read(buf)) > 0) {
                bos.write(buf,0,len);
            }
            bos.close();
            response.flushBuffer();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
