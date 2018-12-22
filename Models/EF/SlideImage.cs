namespace Models.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("SlideImage")]
    public partial class SlideImage
    {
        public int SlideImageID { get; set; }

        [Required]
        [StringLength(250)]
        public string Url { get; set; }

        [StringLength(250)]
        public string Descri { get; set; }
    }
}
