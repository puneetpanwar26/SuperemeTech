using System;
using System.Collections.Generic;

namespace SupremeTech.Models;

public partial class UserType
{
    public long UserTypeId { get; set; }

    public string? UserTypeName { get; set; }

    public DateTime? CreatedDate { get; set; }

    public DateTime? UpdatedDate { get; set; }

    public bool? IsActive { get; set; }

    public virtual ICollection<User> Users { get; set; } = new List<User>();
}
