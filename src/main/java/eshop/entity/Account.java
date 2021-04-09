package eshop.entity;

import java.io.Serializable;
import java.util.ArrayList;
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
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import org.hibernate.validator.constraints.Range;

/**
 *
 * @author alkinoos
 */
@Entity
@Table(name = "account", uniqueConstraints = @UniqueConstraint(columnNames = {"username", "email"}))
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Account.findAll", query = "SELECT a FROM Account a")
    , @NamedQuery(name = "Account.findById", query = "SELECT a FROM Account a WHERE a.id = :id")
    , @NamedQuery(name = "Account.findByFirstname", query = "SELECT a FROM Account a WHERE a.firstname = :firstname")
    , @NamedQuery(name = "Account.findByLastname", query = "SELECT a FROM Account a WHERE a.lastname = :lastname")
    , @NamedQuery(name = "Account.findByUsername", query = "SELECT a FROM Account a WHERE a.username = :username")
    , @NamedQuery(name = "Account.findByPassword", query = "SELECT a FROM Account a WHERE a.password = :password")
    , @NamedQuery(name = "Account.findByEmail", query = "SELECT a FROM Account a WHERE a.email = :email")
    , @NamedQuery(name = "Account.findByAddress", query = "SELECT a FROM Account a WHERE a.address = :address")
    , @NamedQuery(name = "Account.findByCity", query = "SELECT a FROM Account a WHERE a.city = :city")
    , @NamedQuery(name = "Account.findByPostalcode", query = "SELECT a FROM Account a WHERE a.postalcode = :postalcode")})
public class Account implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @NotNull(message = "Firstname must not be null!")
    @NotEmpty(message = "Firstname must not be empty!")
    @Size(min = 2, max = 30, message = "Firstname size must be between 2 and 30 characters")
    @Column(name = "firstname")
    private String firstname;
    @Basic(optional = false)
    @NotNull(message = "Lastname must not be null!")
    @NotEmpty(message = "Lastname must not be empty!")
    @Size(min = 1, max = 30, message = "Lastname size must be between 1 and 30 characters!")
    @Column(name = "lastname")
    private String lastname;
    @Basic(optional = false)
    @NotNull(message = "Username must not be null!")
    @NotEmpty(message = "Username must not be empty!")
    @Size(min = 1, max = 20, message = "Username size must be between 1 and 20 characters!")
    @Column(name = "username")
    private String username;
    @Basic(optional = false)
    @NotNull(message = "Password must not be null!")
    @NotEmpty(message = "Password must not be empty!")
    @Size(min = 1, max = 68, message = "Password size must be between 1 and 68 characters!")
    @Column(name = "password")
    private String password;
    // @Pattern(regexp="[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?", message="Invalid email")//if the field contains email address consider using this annotation to enforce field validation
    @Basic(optional = false)
    @NotNull(message = "Email must not be null!")
    @NotEmpty(message = "Email must not be empty!")
    @Size(min = 1, max = 50, message = "Email size must be between 1 and 50 characters!")
    @Column(name = "email")
    private String email;
    @Basic(optional = false)
    @NotNull(message = "Address must not be null!")
    @NotEmpty(message = "Address must not be empty!")
    @Size(min = 1, max = 50, message = "Address size must be between 1 and 50 characters!")
    @Column(name = "address")
    private String address;
    @Basic(optional = false)
    @NotNull(message = "City must not be null!")
    @NotEmpty(message = "City must not be empty!")
    @Size(min = 1, max = 50, message = "City size must be between 1 and 50 characters!")
    @Column(name = "city")
    private String city;
    @Basic(optional = false)
    @NotNull(message = "Postalcode must not be null!")
    @Pattern(regexp = "^[0-9]{5}", message = "Invalid Zip Code")
    @Column(name = "postalcode")
    private String postalcode;
    @ManyToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
//    @Cascade(value = {org.hibernate.annotations.CascadeType.DETACH,org.hibernate.annotations.CascadeType.SAVE_UPDATE})
    @JoinTable(name = "account_has_role", joinColumns = {
        @JoinColumn(name = "account_id", referencedColumnName = "id")}, inverseJoinColumns = {
        @JoinColumn(name = "role_id", referencedColumnName = "id")})
    private List<Role> roles;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "account", fetch = FetchType.LAZY)
    private List<Orderr> orderrs;

    public Account() {
    }

    public Account(Integer id) {
        this.id = id;
    }

    public Account(Integer id, String firstname, String lastname, String username, String password, String email, String address, String city, String postalcode) {
        this.id = id;
        this.firstname = firstname;
        this.lastname = lastname;
        this.username = username;
        this.password = password;
        this.email = email;
        this.address = address;
        this.city = city;
        this.postalcode = postalcode;
    }

    public Account(Integer id, String firstname, String lastname, String username, String password, String email, String address, String city, String postalcode, List<Role> roles) {
        this.id = id;
        this.firstname = firstname;
        this.lastname = lastname;
        this.username = username;
        this.password = password;
        this.email = email;
        this.address = address;
        this.city = city;
        this.postalcode = postalcode;
        this.roles = roles;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getPostalcode() {
        return postalcode;
    }

    public void setPostalcode(String postalcode) {
        this.postalcode = postalcode;
    }

    public List<Role> getRoles() {
        return roles;
    }

    public void setRoles(List<Role> roles) {
        this.roles = roles;
    }

    public List<Orderr> getOrderrs() {
        return orderrs;
    }

    public void setOrderrs(List<Orderr> orderrs) {
        this.orderrs = orderrs;
    }

    public void AddRole(Role role) {
        if (roles == null) {
            roles = new ArrayList();
        }
        roles.add(role);
        role.getAccounts().add(this);
    }

    public void RemoveRole(Role role) {
        roles.remove(role);
        role.getAccounts().remove(this);
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Account)) {
            return false;
        }
        Account other = (Account) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "eshop.entity.Account[ id=" + id + " ]";
    }

}
