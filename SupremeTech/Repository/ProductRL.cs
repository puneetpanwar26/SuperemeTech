using Microsoft.EntityFrameworkCore;
using SupremeTech.Models;

namespace SupremeTech.Repository
{
    public class ProductRL : IProductRL
    {
        private readonly OnlineShoppingContext _context;
        public ProductRL(OnlineShoppingContext context)
        {
            _context = context;
        }
        public bool deleteProduct(long id)
        {
            try
            {
                bool isDeleted = false;
                Product? product = _context.Products.Find(id);
                if (product != null)
                {
                    _context.Products.Remove(product);
                    _context.SaveChanges();
                    isDeleted = true;
                    return isDeleted;
                }
                else
                {
                    return isDeleted;
                }
            }
            catch
            {
                throw;
            }
        }

        public List<Product> GetAll()
        {
            return _context.Products.ToList();
        }

        public Product GetById(long id)
        {
            try
            {
                Product? product = _context.Products.Find(id);
                if (product != null)
                {
                    return product;
                }
                else
                {
                    return product;
                }
            }
            catch
            {
                throw;
            }
        }

        public Product saveProduct(Product product)
        {
            try
            {
                if (product != null)
                {
                    _context.Products.Add(product);
                    _context.SaveChanges();

                    return product;
                }
                else
                {
                    throw new Exception("Data Can't blank ");
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public Product updateProduct(Product product)
        {
            try
            {
                if (product.UserId > 0)
                {
                    _context.Entry(product).State = EntityState.Modified;
                    _context.Entry(product).Property(x => x.CreatedDate).IsModified = false;
                    _context.SaveChanges();
                }
                else
                {
                    throw new Exception("Data Can't blank ");
                }
            }
            catch
            {
                throw new InvalidOperationException();
            }
            return product;
        }
    }
}
