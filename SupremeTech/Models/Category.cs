using System;
using System.Collections.Generic;

namespace SupremeTech.Models;

public partial class Category
{
    public long CatId { get; set; }

    public string? CatName { get; set; }

    public long? ParentId { get; set; }

    public DateTime? CreatedDate { get; set; }

    public DateTime? UpdatedDate { get; set; }

    public bool? IsActive { get; set; }

    public virtual ICollection<ProductCategory> ProductCategories { get; set; } = new List<ProductCategory>();
}
