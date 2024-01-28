using System;
using System.Collections.Generic;

namespace SupremeTech.Models;

public partial class Address
{
    public long AddressId { get; set; }

    public string? FirstName { get; set; }

    public string? LastName { get; set; }

    public string? Line1 { get; set; }

    public string? Line2 { get; set; }

    public string? CountryName { get; set; }

    public string? StateName { get; set; }

    public string? MobileNo { get; set; }

    public long? UserId { get; set; }

    public virtual ICollection<Order> Orders { get; set; } = new List<Order>();

    public virtual User? User { get; set; }
}
