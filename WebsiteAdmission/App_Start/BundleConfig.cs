﻿using System.Web;
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

            bundles.Add(new StyleBundle("~/Content/css").Include(
                      "~/Content/VendorCSS/bootstrap.css",
                      "~/Content/VendorCSS/site.css"));
            // trang chu
            bundles.Add(new StyleBundle("~/Content/styles/trangchu").Include(
                     "~/Content/styles/trangchu.css"));
            bundles.Add(new ScriptBundle("~/Scripts/js/slide").Include(
                      "~/Scripts/js/slide.js"));
        }
    }
}
