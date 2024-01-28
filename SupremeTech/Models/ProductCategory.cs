using System;
using System.Collections.Generic;

namespace SupremeTech.Models;

public partial class ProductCategory
{
    public long Id { get; set; }

    public long? ProdId { get; set; }

    public long? CatId { get; set; }

    public DateTime? CreatedDate { get; set; }

    public DateTime? UpdatedDate { get; set; }

    public long? IsActive { get; set; }

    public virtual Category? Cat { get; set; }

    public virtual Product? Prod { get; set; }
}
