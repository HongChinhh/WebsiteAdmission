using System;
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
using Models.DAO;
using WebsiteAdmission.Common;
using PagedList;

namespace WebsiteAdmission.Controllers
{
    public class PostsController : Controller
    {
        private WebsiteAdmissionDbContext db = new WebsiteAdmissionDbContext();

        // GET: Posts
        public ActionResult Index(string search = "", int page = 1, int pageSize = 10)
        {
            var posts = db.Posts
                .OrderBy(s => s.SubCategory.ParentCategory.NameParentCat)
                .ThenBy(s=> s.SubCategory.Name)
                .ThenByDescending(s => s.PublishedTime)
                .Include(p => p.SubCategory)
                .Include(p => p.User)
                .Include(p => p.SubCategory.ParentCategory);
            return View(posts.ToPagedList(page, pageSize));
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
            // -1 selected value
            ViewBag.SubCategory_SubCategoryID = new SelectList(db.SubCategories.OrderBy(s => s.ParentCategory.Position), "SubCategoryID", "Name", "ParentCategory.NameParentCat", -1);
            ViewBag.User_UserID = new SelectList(db.Users, "UserID", "UserName");
            return View();
        }

        // POST: Posts/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [ValidateInput(false)]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "PostID,Title,Body,Author,Status,User_UserID,SubCategory_SubCategoryID")] Post post, HttpPostedFileBase CoverImage)
        {
            if (ModelState.IsValid)
            {
                string bodyHtml = post.Body;
                post.Body = "temp";
                Post postSaved = db.Posts.Add(post);
                db.SaveChanges();

                PostDAO postDAO = new PostDAO();
                post.Body = postDAO.SaveImages(bodyHtml, post.PostID, null);

                string coverImageName = postDAO.SaveCoverImage(CoverImage, post.PostID);
                post.CoverImage = coverImageName;
                post.CreatedTime = DateTime.Now;
                post.PublishedTime = DateTime.Now;
                db.SaveChanges();
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
            ViewBag.SubCategory_SubCategoryID = new SelectList(db.SubCategories.OrderBy(s => s.ParentCategory.Position), "SubCategoryID", "Name", "ParentCategory.NameParentCat", post.SubCategory_SubCategoryID);
            ViewBag.User_UserID = new SelectList(db.Users, "UserID", "UserName", post.User_UserID);
            return View(post);
        }

        // POST: Posts/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [ValidateInput(false)]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "PostID,Title,Body,Author,Status,User_UserID,SubCategory_SubCategoryID")] Post post, HttpPostedFileBase CoverImage, string currentCoverImage)
        {
            if (ModelState.IsValid)
            {
                string bodyHtml = post.Body;
                post.Body = new PostDAO().SaveImages(bodyHtml, post.PostID, currentCoverImage);
                if (CoverImage != null)
                {
                    PostDAO postDAO = new PostDAO();
                    postDAO.DeleteCoverImage(currentCoverImage, post.PostID);
                    post.CoverImage = postDAO.SaveCoverImage(CoverImage, post.PostID);
                }
                else
                {
                    post.CoverImage = currentCoverImage;
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

        public object UploadIMG(HttpPostedFileBase upload)
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
            response.url = "data:" + upload.ContentType + ";base64;" + Path.GetExtension(upload.FileName) + ";," + thePictureDataAsString;
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
