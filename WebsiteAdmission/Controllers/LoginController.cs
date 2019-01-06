using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Security.Principal;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using WebsiteAdmission.Models;

namespace WebsiteAdmission.Controllers
{
    public class LoginController : Controller
    {
        // GET: Login
        public ActionResult Index()
        {
            var user = new GenericPrincipal(new ClaimsIdentity("Nhat"), new string[] { "No" });
            HttpContext.User = user;

            return View();
        }

        //var model = new UserModel() { Password = "password", UserName = "ItsMe", RememberMe = true };
        //var serializedUser = Newtonsoft.Json.JsonConvert.SerializeObject(model);

        //var ticket = new FormsAuthenticationTicket(1, model.UserName, DateTime.Now, DateTime.Now.AddHours(3), model.RememberMe, serializedUser);
        //var encryptedTicket = FormsAuthentication.Encrypt(ticket);
        //var isSsl = Request.IsSecureConnection; // if we are running in SSL mode then make the cookie secure only

        //var cookie = new HttpCookie(FormsAuthentication.FormsCookieName, encryptedTicket)
        //{
        //    HttpOnly = true, // always set this to true!
        //    Secure = isSsl,
        //};

        //    if (model.RememberMe) // if the user needs to persist the cookie. Otherwise it is a session cookie
        //        cookie.Expires = DateTime.Today.AddMonths(3); // currently hard coded to 3 months in the future

        //Response.Cookies.Set(cookie);

        //    return View(); // return something
    }
}