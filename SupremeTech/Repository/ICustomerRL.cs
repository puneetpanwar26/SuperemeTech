using Microsoft.VisualBasic;
using SupremeTech.Models;

namespace SupremeTech.Repository
{
    public interface ICustomerRL
    {

        public List<User> GetAll();
        public User GetById(long id);
        public User saveUser(User user);
        public bool deleteUser(long id);
        public User updateUser(User user);
    }
}
