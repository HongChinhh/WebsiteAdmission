using HtmlAgilityPack;
using System;
using System.Collections.Generic;
using System.IO;
using System.Web;
using WebsiteAdmission.Common;

namespace Models.DAO
{
    public class PostDAO
    {
        public string SaveImages(string bodyHtml, int id, string localPath, string coverImagePath = null)
        {
            HtmlDocument htmlDocument = new HtmlDocument();
            htmlDocument.LoadHtml(bodyHtml);
            int i = 0;
            List<string> imagesName = new List<string>();
            if (coverImagePath != null)
            {
                imagesName.Add(coverImagePath);
            }
            string imageName;
            if (htmlDocument.DocumentNode.SelectNodes("//img") != null)
            {
                foreach (var item in htmlDocument.DocumentNode.SelectNodes("//img"))
                {
                    Directory.CreateDirectory(localPath);
                    if (item.Attributes["src"].Value.IndexOf(",") > -1)
                    {
                    //tạo ảnh mới
                    tt:
                        i++;
                        imageName = id + "_" + i + item.Attributes["src"].Value.Split(';')[2];
                        if (File.Exists(localPath + imageName))
                        {
                            goto tt;
                        }
                        var image = Convert.FromBase64String(item.Attributes["src"].Value.Split(',')[1]);
                        using (var imageFile = new FileStream(localPath + imageName, FileMode.Create))
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
            if (Directory.Exists(localPath))
            {
                // Xóa ảnh không cần dùng
                foreach (var imagePath in Directory.GetFiles(localPath))
                {
                    imageName = imagePath.Substring(imagePath.LastIndexOf(@"\") + 1);
                    if (imagesName.IndexOf(imageName) == -1)
                    {
                        File.Delete(imagePath);
                    }
                }
            }
            return htmlDocument.DocumentNode.OuterHtml;
        }

        public void SaveImage(HttpPostedFileBase CoverImage, string localPath, int postID)
        {
            Directory.CreateDirectory(localPath);
            CoverImage.SaveAs(localPath + postID + Path.GetExtension(CoverImage.FileName));
        }

        public void DeleteImage(string CoverImageName, string localPath, int postID)
        {
            if (Directory.Exists(localPath))
            {
                File.Delete(localPath + postID + CoverImageName);
            }
        }
    }
}
