namespace Models.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Post")]
    public partial class Post
    {
        public int PostID { get; set; }

        [Required]
        [StringLength(250)]
        public string Title { get; set; }

        [Column(TypeName = "ntext")]
        [Required]
        public string Body { get; set; }

        [StringLength(250)]
        public string CoverImage { get; set; }

        [StringLength(250)]
        public string Author { get; set; }

        public DateTime? CreatedTime { get; set; }

        public DateTime? PublishedTime { get; set; }

        public bool? Status { get; set; }

        public int User_UserID { get; set; }

        public int SubCategory_SubCategoryID { get; set; }

        public virtual SubCategory SubCategory { get; set; }

        public virtual User User { get; set; }
    }
}
