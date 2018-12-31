using HtmlAgilityPack;
using System;
using System.Collections.Generic;
using System.IO;
using System.Web;
using System.Web.Hosting;
using System.Web.Mvc;
using WebsiteAdmission.Common;

namespace Models.DAO
{
    public class PostDAO
    {
        public string SaveImages(string bodyHtml, int id, string coverImagename)
        {
            string localPathPost = HostingEnvironment.MapPath(Constants.ImagesPosts.GetDescription())+ id + "/";
            HtmlDocument htmlDocument = new HtmlDocument();
            htmlDocument.LoadHtml(bodyHtml);
            int i = 0;
            List<string> imagesName = new List<string>();
            if (coverImagename != null)
            {
                imagesName.Add(coverImagename);
            }
            string imageName;
            if (htmlDocument.DocumentNode.SelectNodes("//img") != null)
            {
                foreach (var item in htmlDocument.DocumentNode.SelectNodes("//img"))
                {
                    Directory.CreateDirectory(localPathPost);
                    if (item.Attributes["src"].Value.IndexOf(",") > -1)
                    {
                    //tạo ảnh mới
                    tt:
                        i++;
                        imageName = id + "_" + i + item.Attributes["src"].Value.Split(';')[2];
                        if (File.Exists(localPathPost + imageName))
                        {
                            goto tt;
                        }
                        var image = Convert.FromBase64String(item.Attributes["src"].Value.Split(',')[1]);
                        using (var imageFile = new FileStream(localPathPost + imageName, FileMode.Create))
                        {
                            imageFile.Write(image, 0, image.Length);
                            imageFile.Flush();
                        }
                        item.Attributes["src"].Value = Constants.ImagesPosts.GetDescription() + id + "/" + imageName;
                        imagesName.Add(imageName);
                    }
                    else
                    {
                        //ảnh đã có
                        imageName = item.Attributes["src"].Value.Substring(item.Attributes["src"].Value.LastIndexOf("/") + 1);
                        imagesName.Add(imageName);
                    }
                }
            }
            if (Directory.Exists(localPathPost))
            {
                // Xóa ảnh không cần dùng
                foreach (var imagePath in Directory.GetFiles(localPathPost))
                {
                    imageName = Path.GetFileName(imagePath);
                    if (imagesName.IndexOf(imageName) == -1)
                    {
                        File.Delete(imagePath);
                    }
                }
            }
            return htmlDocument.DocumentNode.OuterHtml;
        }

        public string SaveCoverImage(HttpPostedFileBase coverImage, int postID)
        {
            if (coverImage != null)
            {
                string localPath = HostingEnvironment.MapPath(Constants.ImagesPosts.GetDescription());
                Directory.CreateDirectory(localPath + postID);
                coverImage.SaveAs(localPath + postID + @"\" + postID + Path.GetExtension(coverImage.FileName));
                return postID + Path.GetExtension(coverImage.FileName);
            }
            return null;
        }

        public void DeleteCoverImage(string coverImageName, int postID)
        {
            if (!string.IsNullOrWhiteSpace(coverImageName))
            {
                string localPath = HostingEnvironment.MapPath(Constants.ImagesPosts.GetDescription());
                if (Directory.Exists(localPath + postID))
                {
                    File.Delete(localPath + postID + @"/" + coverImageName);
                }
            }
        }
    }
}
