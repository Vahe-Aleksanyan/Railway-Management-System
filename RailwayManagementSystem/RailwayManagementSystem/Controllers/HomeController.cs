using Microsoft.AspNetCore.Mvc;
using RailwayManagementSystem.Data;
using System.Linq;

namespace RailwayManagementSystem.Controllers
{
    public class HomeController : Controller
    {
        private readonly RailwayContext _context;

        public HomeController(RailwayContext context)
        {
            _context = context;
        }

        public IActionResult Index()
        {
            var countries = _context.Countries.ToList();
            return View(countries);
        }
    }
}