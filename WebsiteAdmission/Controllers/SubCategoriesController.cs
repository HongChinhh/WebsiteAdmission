using PagedList;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using WebsiteAdmission.Common;
using WebsiteAdmission.DAO;
using WebsiteAdmission.Models;

namespace WebsiteAdmission.Controllers
{
    public class SubCategoriesController : Controller
    {
        private WebsiteAdmissionDbContext db = new WebsiteAdmissionDbContext();

        // GET: SubCategories
        public ActionResult Index(string search = "", int page = 1, int pageSize = 10)
        {
            search = search.Trim();
            var subCategories = db.SubCategories
                .Where(s => s.ParentCategory.NameParentCat.Contains(search) 
                || s.Name.Contains(search) 
                || s.ViewName.Contains(search)
                || s.Position.ToString().Contains(search))
                .OrderBy(s => s.ParentCategory.Position)
                .ThenBy(s => s.ParentCategory_ParentCatPath)
                .ThenBy(s => s.Position);
            return View(subCategories.ToPagedList(page, pageSize));
        }

        // GET: SubCategories/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SubCategory subCategory = db.SubCategories.Find(id);
            if (subCategory == null)
            {
                return HttpNotFound();
            }
            return View(subCategory);
        }

        // GET: SubCategories/Create
        public ActionResult Create()
        {
            ViewBag.ParentCategory_ParentCatPath = new SelectList(db.ParentCategories, "ParentCatPath", "NameParentCat");
            ViewBag.ListViewName = new SubCategoryDAO().GetListViewName();
            return View();
        }

        // POST: SubCategories/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "SubCategoryID,Name,ViewName,Position,ParentCategory_ParentCatPath")] SubCategory subCategory)
        {
            if (ModelState.IsValid)
            {
                subCategory.Position = db.SubCategories
                    .Where(s => s.ParentCategory_ParentCatPath == subCategory.ParentCategory_ParentCatPath).Count() + 1;
                db.SubCategories.Add(subCategory);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.ParentCategory_ParentCatPath = new SelectList(db.ParentCategories.OrderBy(s => s.Position), "ParentCatPath", "NameParentCat", subCategory.ParentCategory_ParentCatPath);
            return View(subCategory);
        }

        // GET: SubCategories/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SubCategory subCategory = db.SubCategories.Find(id);
            if (subCategory == null)
            {
                return HttpNotFound();
            }
            ViewBag.ParentCategory_ParentCatPath = new SelectList(db.ParentCategories.OrderBy(s => s.Position), "ParentCatPath", "NameParentCat", subCategory.ParentCategory_ParentCatPath);
            ViewBag.ListViewName = new SubCategoryDAO().GetListViewName();
            return View(subCategory);
        }

        // POST: SubCategories/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "SubCategoryID,Name,ViewName,Position,ParentCategory_ParentCatPath")] SubCategory subCategory)
        {
            if (ModelState.IsValid)
            {
                db.Entry(subCategory).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.ParentCategory_ParentCatPath = new SelectList(db.ParentCategories, "ParentCatPath", "NameParentCat", subCategory.ParentCategory_ParentCatPath);
            return View(subCategory);
        }

        // GET: SubCategories/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SubCategory subCategory = db.SubCategories.Find(id);
            if (subCategory == null)
            {
                return HttpNotFound();
            }
            return View(subCategory);
        }

        // POST: SubCategories/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            SubCategory subCategory = db.SubCategories.Find(id);
            db.SubCategories.Remove(subCategory);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        [HttpPost]
        public void ChangePositionValue([Bind(Include = "SubCategoryID,Position")] SubCategory subCategory)
        {
            if (subCategory.Position > 0)
            {
                int tempPosition = subCategory.Position;
                subCategory = db.SubCategories.Where(s => s.SubCategoryID == subCategory.SubCategoryID).FirstOrDefault();
                subCategory.Position = tempPosition;
                db.Entry(subCategory).State = EntityState.Modified;
                db.SaveChanges();
            }
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
