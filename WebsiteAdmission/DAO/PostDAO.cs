using HtmlAgilityPack;
using System;
using System.IO;
using WebsiteAdmission.Common;

namespace Models.DAO
{
    public class PostDAO
    {
        public void SaveImages(string bodyHtml, int id)
        {
            HtmlDocument htmlDocument = new HtmlDocument();
            htmlDocument.LoadHtml(bodyHtml);
            int i = 0;
            foreach (var item in htmlDocument.DocumentNode.SelectNodes("//img"))
            {
                i++;
                var bytes = Convert.FromBase64String(item.Attributes["src"].Value.Split(',')[1]);
                using (var imageFile = new FileStream(Constants.ImagesPosts.GetDescription() + id + "/", FileMode.Create))
                {
                    imageFile.Write(bytes, 0, bytes.Length);
                    imageFile.Flush();
                }
                item.Attributes["src"].Value = id + "_" + i;
            }
            var s = htmlDocument.DocumentNode.OuterHtml;
        }
    }
}
