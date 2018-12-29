namespace WebsiteAdmission.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Feedback")]
    public partial class Feedback
    {
        public int FeedbackID { get; set; }

        [Required]
        [StringLength(250)]
        public string Content { get; set; }

        public int User_UserID { get; set; }

        public int Post_PostID { get; set; }

        public virtual User User { get; set; }
    }
}
