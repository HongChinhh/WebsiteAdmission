using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Models.EF;

namespace WebsiteAdmission.Controllers
{
    public class FeedbacksController : Controller
    {
        private WebsiteAdmissionDbContext db = new WebsiteAdmissionDbContext();

        // GET: Feedbacks
        public ActionResult Index()
        {
            var feedBacks = db.Feedbacks.Include(f => f.User);
            return View(feedBacks.ToList());
        }

        // GET: Feedbacks/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Feedback feedBack = db.Feedbacks.Find(id);
            if (feedBack == null)
            {
                return HttpNotFound();
            }
            return View(feedBack);
        }

        // GET: Feedbacks/Create
        public ActionResult Create()
        {
            ViewBag.User_UserID = new SelectList(db.Users, "UserID", "UserName");
            return View();
        }

        // POST: Feedbacks/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "FeedbackID,Content,User_UserID,Post_PostID")] Feedback feedBack)
        {
            if (ModelState.IsValid)
            {
                db.Feedbacks.Add(feedBack);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.User_UserID = new SelectList(db.Users, "UserID", "UserName", feedBack.User_UserID);
            return View(feedBack);
        }

        // GET: Feedbacks/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Feedback feedBack = db.Feedbacks.Find(id);
            if (feedBack == null)
            {
                return HttpNotFound();
            }
            ViewBag.User_UserID = new SelectList(db.Users, "UserID", "UserName", feedBack.User_UserID);
            return View(feedBack);
        }

        // POST: Feedbacks/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "FeedbackID,Content,User_UserID,Post_PostID")] Feedback feedBack)
        {
            if (ModelState.IsValid)
            {
                db.Entry(feedBack).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.User_UserID = new SelectList(db.Users, "UserID", "UserName", feedBack.User_UserID);
            return View(feedBack);
        }

        // GET: Feedbacks/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Feedback feedBack = db.Feedbacks.Find(id);
            if (feedBack == null)
            {
                return HttpNotFound();
            }
            return View(feedBack);
        }

        // POST: Feedbacks/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Feedback feedBack = db.Feedbacks.Find(id);
            db.Feedbacks.Remove(feedBack);
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
