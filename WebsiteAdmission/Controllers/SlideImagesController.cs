using PagedList;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using WebsiteAdmission.Models;

namespace WebsiteAdmission.Controllers
{
    public class SlideImagesController : Controller
    {
        private WebsiteAdmissionDbContext db = new WebsiteAdmissionDbContext();

        // GET: SlideImages
        public ActionResult Index(string search = "", int page = 1, int pageSize = 10)
        {
            return View(db.SlideImages
                .Where(s => s.Url.Contains(search)
                || s.Descri.Contains(search))
                .OrderBy(s => s.SlideImageID)
                .ToPagedList(page, pageSize));
        }

        // GET: SlideImages/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SlideImage slideImage = db.SlideImages.Find(id);
            if (slideImage == null)
            {
                return HttpNotFound();
            }
            return View(slideImage);
        }

        // GET: SlideImages/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: SlideImages/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "SlideImageID,Url,Descri")] SlideImage slideImage)
        {
            if (ModelState.IsValid)
            {
                db.SlideImages.Add(slideImage);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(slideImage);
        }

        // GET: SlideImages/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SlideImage slideImage = db.SlideImages.Find(id);
            if (slideImage == null)
            {
                return HttpNotFound();
            }
            return View(slideImage);
        }

        // POST: SlideImages/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "SlideImageID,Url,Descri")] SlideImage slideImage)
        {
            if (ModelState.IsValid)
            {
                db.Entry(slideImage).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(slideImage);
        }

        // GET: SlideImages/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SlideImage slideImage = db.SlideImages.Find(id);
            if (slideImage == null)
            {
                return HttpNotFound();
            }
            return View(slideImage);
        }

        // POST: SlideImages/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            SlideImage slideImage = db.SlideImages.Find(id);
            db.SlideImages.Remove(slideImage);
            db.SaveChanges();
            return RedirectToAction("Index");
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
