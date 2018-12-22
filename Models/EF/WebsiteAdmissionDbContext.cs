namespace Models.EF
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class WebsiteAdmissionDbContext : DbContext
    {
        public WebsiteAdmissionDbContext()
            : base("name=WebsiteAdmissionDbContext")
        {
        }

        public virtual DbSet<FeedBack> FeedBacks { get; set; }
        public virtual DbSet<ParentCategory> ParentCategories { get; set; }
        public virtual DbSet<Post> Posts { get; set; }
        public virtual DbSet<Privilege> Privileges { get; set; }
        public virtual DbSet<SlideImage> SlideImages { get; set; }
        public virtual DbSet<SubCategory> SubCategories { get; set; }
        public virtual DbSet<User> Users { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<ParentCategory>()
                .Property(e => e.ParentCatPath)
                .IsUnicode(false);

            modelBuilder.Entity<ParentCategory>()
                .HasMany(e => e.SubCategories)
                .WithRequired(e => e.ParentCategory)
                .HasForeignKey(e => e.ParentCategory_ParentCatPath);

            modelBuilder.Entity<Post>()
                .Property(e => e.CoverImage)
                .IsUnicode(false);

            modelBuilder.Entity<Privilege>()
                .HasMany(e => e.Users)
                .WithRequired(e => e.Privilege)
                .HasForeignKey(e => e.Privilege_PrivilegeID)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<SlideImage>()
                .Property(e => e.Url)
                .IsUnicode(false);

            modelBuilder.Entity<SubCategory>()
                .Property(e => e.ViewName)
                .IsUnicode(false);

            modelBuilder.Entity<SubCategory>()
                .Property(e => e.ParentCategory_ParentCatPath)
                .IsUnicode(false);

            modelBuilder.Entity<SubCategory>()
                .HasMany(e => e.Posts)
                .WithRequired(e => e.SubCategory)
                .HasForeignKey(e => e.SubCategory_SubCategoryID);

            modelBuilder.Entity<User>()
                .Property(e => e.UserName)
                .IsUnicode(false);

            modelBuilder.Entity<User>()
                .Property(e => e.PassWord)
                .IsUnicode(false);

            modelBuilder.Entity<User>()
                .Property(e => e.Email)
                .IsUnicode(false);

            modelBuilder.Entity<User>()
                .HasMany(e => e.FeedBacks)
                .WithRequired(e => e.User)
                .HasForeignKey(e => e.User_UserID)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<User>()
                .HasMany(e => e.Posts)
                .WithRequired(e => e.User)
                .HasForeignKey(e => e.User_UserID)
                .WillCascadeOnDelete(false);
        }
    }
}
