namespace SupremeTech.CommonDto
{
    public class CustomerDto
    {
        public long UserId { get; set; }

        public string FirstName { get; set; }

        public string LastName { get; set; }

        public string MoblieNo { get; set; }

        public string EmailId { get; set; }

        public string Pwd { get; set; }

        public long UserTypeId { get; set; }

        public DateTime CreateDate { get; set; }

        public DateTime UpdateDate { get; set; }

        public bool IsActive { get; set; }
    }
}
