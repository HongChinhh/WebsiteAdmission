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
                foreach (var imagePath in Directory.GetFiles(localPath))
                {
                    listViewName.Add(Path.GetFileName(imagePath));
                }
                SelectList selectLists = new SelectList(listViewName);
                return selectLists;
            }
            return new SelectList(new List<string>());
        }
    }
}