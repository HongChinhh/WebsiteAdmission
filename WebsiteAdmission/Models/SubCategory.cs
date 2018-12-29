namespace WebsiteAdmission.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("SubCategory")]
    public partial class SubCategory
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public SubCategory()
        {
            Posts = new HashSet<Post>();
        }

        public int SubCategoryID { get; set; }

        [StringLength(250)]
        public string Name { get; set; }

        [Required]
        [StringLength(250)]
        public string ViewName { get; set; }

        public int? Position { get; set; }

        [Required]
        [StringLength(50)]
        public string ParentCategory_ParentCatPath { get; set; }

        public virtual ParentCategory ParentCategory { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Post> Posts { get; set; }
    }
}
