using System.Collections.Generic;
using System.IO;
using System.Web.Hosting;
using System.Web.Mvc;
using WebsiteAdmission.Common;

namespace WebsiteAdmission.DAO
{
    public class SubCategoryDAO : Controller
    {
        public SelectList GetListViewName()
        {
            string localPath = HostingEnvironment.MapPath(Constants.SubCategory.GetDescription());
            if (Directory.Exists(localPath))
            {
                List<string> listViewName = new List<string>();
                string fileName;
                foreach (var imagePath in Directory.GetFiles(localPath))
                {
                    fileName = Path.GetFileName(imagePath);
                    listViewName.Add(fileName.Substring(0, fileName.LastIndexOf(".")));
                }
                SelectList selectLists = new SelectList(listViewName);
                return selectLists;
            }
            return new SelectList(new List<string>());
        }
    }
}