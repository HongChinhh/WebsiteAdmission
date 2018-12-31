namespace WebsiteAdmission.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("ParentCategory")]
    public partial class ParentCategory
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public ParentCategory()
        {
            SubCategories = new HashSet<SubCategory>();
        }

        [Key]
        [StringLength(50)]
        public string ParentCatPath { get; set; }

        [Required]
        [StringLength(250)]
        public string NameParentCat { get; set; }

        public int Position { get; set; }

        public bool? Status { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<SubCategory> SubCategories { get; set; }
    }
}
