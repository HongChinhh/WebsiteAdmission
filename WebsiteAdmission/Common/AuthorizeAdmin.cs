using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace WebsiteAdmission.Common
{
    public class AuthorizeAdmin : AuthorizeAttribute
    {
        //public string AccessLevel { get; set; }

        //protected override bool AuthorizeCore(HttpContextBase httpContext)
        //{
        //    var isAuthorized = base.AuthorizeCore(httpContext);
        //    if (!isAuthorized)
        //    {
        //        return false;
        //    }

        //    return true;
        //}

        //protected override void HandleUnauthorizedRequest(AuthorizationContext filterContext)
        //{
        //    filterContext.Result = new RedirectToRouteResult(
        //                new RouteValueDictionary(
        //                    new
        //                    {
        //                        controller = "Users",
        //                        action = "Index"
        //                    })
        //                );
        //}

        private string _controllerTypeName = string.Empty;

        public override void OnAuthorization(AuthorizationContext filterContext)
        {
            _controllerTypeName = filterContext.Controller.GetType().FullName;

            // The following line calls the AuthorizeCore method, below.
            base.OnAuthorization(filterContext);
        }
        /// <returns>True if the user is authorized; false otherwise.</returns>
        protected override bool AuthorizeCore(HttpContextBase httpContext)
        {
            var userLoginName = httpContext.User.Identity.Name;
            // TODO: write specialized authorization code here based on _controllerTypeName and userLoginName
            return base.AuthorizeCore(httpContext);
        }
    }
}