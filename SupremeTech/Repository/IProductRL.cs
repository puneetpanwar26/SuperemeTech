using SupremeTech.Models;

namespace SupremeTech.Repository
{
    public interface IProductRL
    {
        public List<Product> GetAll();
        public Product GetById(long id);
        public Product saveProduct(Product product);
        public bool deleteProduct(long id);
        public Product updateProduct(Product product);
    }
}
