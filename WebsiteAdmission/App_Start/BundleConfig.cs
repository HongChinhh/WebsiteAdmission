using System.Web;
using System.Web.Optimization;

namespace WebsiteAdmission
{
    public class BundleConfig
    {
        // For more information on bundling, visit https://go.microsoft.com/fwlink/?LinkId=301862
        public static void RegisterBundles(BundleCollection bundles)
        {
            bundles.Add(new ScriptBundle("~/bundles/jquery").Include(
                        "~/Scripts/VendorJS/jquery-{version}.js"));

            bundles.Add(new ScriptBundle("~/bundles/jqueryval").Include(
                        "~/Scripts/VendorJS/jquery.validate*"));

            // Use the development version of Modernizr to develop with and learn from. Then, when you're
            // ready for production, use the build tool at https://modernizr.com to pick only the tests you need.
            bundles.Add(new ScriptBundle("~/bundles/modernizr").Include(
                        "~/Scripts/VendorJS/modernizr-*"));

            bundles.Add(new ScriptBundle("~/bundles/bootstrap").Include(
                      "~/Scripts/VendorJS/bootstrap.js"));

            bundles.Add(new ScriptBundle("~/bundles/datetimepicker").Include(
                      "~/Scripts/VendorJS/moment.js").Include(
                      "~/Scripts/VendorJS/bootstrap-datetimepicker.js"));

            bundles.Add(new StyleBundle("~/Content/css").Include(
                      "~/Content/VendorCSS/bootstrap.css").Include(
                      "~/Content/VendorCSS/site.css"));

            bundles.Add(new StyleBundle("~/Content/datetimepicker").Include(
                      "~/Content/VendorCSS/bootstrap-datetimepicker.css"));

            bundles.Add(new StyleBundle("~/Content/styles/common").Include(
                     "~/Content/styles/common.css"));
            // trang chu
            bundles.Add(new StyleBundle("~/Content/styles/trangchu").Include(
                     "~/Content/styles/trangchu.css"));
            bundles.Add(new ScriptBundle("~/Scripts/js/slide").Include(
                  "~/Scripts/js/slide.js"));
            // admin
            bundles.Add(new ScriptBundle("~/Scripts/js/change-position").Include(
                  "~/Scripts/js/change-position.js"));
        }
    }
}
