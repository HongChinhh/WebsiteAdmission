namespace Models.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("FeedBack")]
    public partial class FeedBack
    {
        public int FeedBackID { get; set; }

        [Required]
        [StringLength(250)]
        public string Content { get; set; }

        public int User_UserID { get; set; }

        public int Post_PostID { get; set; }

        public virtual User User { get; set; }
    }
}
