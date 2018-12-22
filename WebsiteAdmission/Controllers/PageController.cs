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
        public ActionResult Index(string ParentCatPath)
        {
            ViewBag.ParentCategories = db.ParentCategories.OrderBy(s => s.Position).ToList();
            var subCategories = db.SubCategories.Where(s => s.ParentCategory_ParentCatPath == ParentCatPath).OrderBy(s => s.Position).ToList();
            return View(subCategories);
        }
    }
}