﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using WebsiteAdmission.Models;
using Newtonsoft.Json.Linq;

namespace WebsiteAdmission.Controllers
{
    public class PostsController : Controller
    {
        private WebsiteAdmissionDbContext db = new WebsiteAdmissionDbContext();

        // GET: Posts
        public ActionResult Index()
        {
            var posts = db.Posts.OrderBy(s => s.PublishedTime).Include(p => p.SubCategory).Include(p => p.User);
            return View(posts.ToList());
        }

        // GET: Posts/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Post post = db.Posts.Find(id);
            if (post == null)
            {
                return HttpNotFound();
            }
            return View(post);
        }

        // GET: Posts/Create
        public ActionResult Create()
        {
            ViewBag.SubCategory_SubCategoryID = new SelectList(db.SubCategories, "SubCategoryID", "Name");
            ViewBag.User_UserID = new SelectList(db.Users, "UserID", "UserName");
            return View();
        }

        // POST: Posts/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [ValidateInput(false)]
        [HttpPost]
        //[ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "PostID,Title,Body,CoverImage,Author,Status,User_UserID,SubCategory_SubCategoryID")] Post post, string upload, string ckCsrfToken)
        {
            if (ModelState.IsValid)
            {
                string bodyHtml = post.Body;
                post.Body = "temp";
                Post postSaved = db.Posts.Add(post);
                db.SaveChanges();
                //PostDAO()
                return RedirectToAction("Index");
            }

            ViewBag.SubCategory_SubCategoryID = new SelectList(db.SubCategories, "SubCategoryID", "Name", post.SubCategory_SubCategoryID);
            ViewBag.User_UserID = new SelectList(db.Users, "UserID", "UserName", post.User_UserID);
            return View(post);
        }

        // GET: Posts/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Post post = db.Posts.Find(id);
            if (post == null)
            {
                return HttpNotFound();
            }
            ViewBag.SubCategory_SubCategoryID = new SelectList(db.SubCategories, "SubCategoryID", "Name", post.SubCategory_SubCategoryID);
            ViewBag.User_UserID = new SelectList(db.Users, "UserID", "UserName", post.User_UserID);
            return View(post);
        }

        // POST: Posts/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "PostID,Title,Body,CoverImage,Author,Status,User_UserID,SubCategory_SubCategoryID")] Post post)
        {
            if (ModelState.IsValid)
            {
                if (post.Status == true && post.PublishedTime == null)
                {
                    post.PublishedTime = new DateTime();
                }
                db.Entry(post).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.SubCategory_SubCategoryID = new SelectList(db.SubCategories, "SubCategoryID", "Name", post.SubCategory_SubCategoryID);
            ViewBag.User_UserID = new SelectList(db.Users, "UserID", "UserName", post.User_UserID);
            return View(post);
        }

        // GET: Posts/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Post post = db.Posts.Find(id);
            if (post == null)
            {
                return HttpNotFound();
            }
            return View(post);
        }

        // POST: Posts/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Post post = db.Posts.Find(id);
            db.Posts.Remove(post);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        public object UploadIMG(HttpPostedFileBase upload, string ckCsrfToken)
        {
            dynamic response = new JObject();
            response.uploaded = true;

            string theFileName = Path.GetFileName(upload.FileName);
            byte[] thePictureAsBytes = new byte[upload.ContentLength];
            using (BinaryReader theReader = new BinaryReader(upload.InputStream))
            {
                thePictureAsBytes = theReader.ReadBytes(upload.ContentLength);
            }
            string thePictureDataAsString = Convert.ToBase64String(thePictureAsBytes);
            response.url = "data:" + upload.ContentType + ";base64," + thePictureDataAsString;
            return response;
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
