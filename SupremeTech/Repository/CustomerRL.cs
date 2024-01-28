using Microsoft.EntityFrameworkCore;
using SupremeTech.Models;
using System.Collections;
using System.ComponentModel;

namespace SupremeTech.Repository
{
    public class CustomerRL : ICustomerRL
    {
        private readonly OnlineShoppingContext _context;
        public CustomerRL(OnlineShoppingContext context)
        {

            _context = context;

        }
        public bool deleteUser(long id)
        {
            try
            {
                bool isDeleted = false;
                User? user = _context.Users.Find(id);
                if (user != null)
                {
                    _context.Users.Remove(user);
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

        public List<User> GetAll()
        {
            return _context.Users.ToList();
        }

        public User GetById(long id)
        {
            try
            {
                User? user = _context.Users.Find(id);
                if (user != null)
                {
                    return user;
                }
                else
                {
                    return user;
                }
            }
            catch
            {
                throw;
            }
        }

        public User saveUser(User user)
        {
            try
            {
                if (user != null)
                {
                    _context.Users.Add(user);
                    _context.SaveChanges();

                    return user;
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

        public User updateUser(User user)
        {

            try
            {
                if (user.UserId > 0)
                {
                    _context.Entry(user).State = EntityState.Modified;
                    _context.Entry(user).Property(x => x.CreateDate).IsModified = false;
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
            return user;

        }
    }
}
