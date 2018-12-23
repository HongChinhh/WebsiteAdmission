using System.Data.Entity;
using System.Linq;
using System.Web.Mvc;
using Models.EF;

namespace WebsiteAdmission.Controllers
{
    public class PageController : Controller
    {
        private WebsiteAdmissionDbContext db = new WebsiteAdmissionDbContext();
        // GET: Home
        public ActionResult Index(string id)
        {
            ViewBag.ParentCategories = db.ParentCategories.OrderBy(s => s.Position).ToList();
            var subCategories = db.SubCategories.Where(s => s.ParentCategory_ParentCatPath == id).OrderBy(s => s.Position).ToList();
            return View(subCategories);
        }

        public ActionResult Detail(int id)
        {
            ViewBag.ParentCategories = db.ParentCategories.OrderBy(s => s.Position).ToList();
            var post = db.Posts.Where(s => s.PostID == id).ToList();
            return View(post);
        }
    }
}