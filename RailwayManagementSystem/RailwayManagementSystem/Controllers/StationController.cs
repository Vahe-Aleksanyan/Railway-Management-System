using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using RailwayManagementSystem.Data;
using RailwayManagementSystem.Models;
using System.Threading.Tasks;

namespace RailwayManagementSystem.Controllers
{
    public class StationController : Controller
    {
        private readonly RailwayContext _context;

        public StationController(RailwayContext context)
        {
            _context = context;
        }

        // GET: Station
        public async Task<IActionResult> Index()
        {
            // Retrieve all stations
            var stations = await _context.Stations.ToListAsync();
            return View(stations);
        }

        // GET: Station/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var station = await _context.Stations
                .FirstOrDefaultAsync(m => m.StationID == id);

            if (station == null)
            {
                return NotFound();
            }

            return View(station);
        }

        // GET: Station/Create
        public IActionResult Create()
        {
            return View();
        }

        // POST: Station/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("StationID,StationName,Latitude,Longitude,StationCode,StationType,NumberOfPlatforms,Facilities,OperationalStatus,CityID")] Station station)
        {
            if (ModelState.IsValid)
            {
                _context.Add(station);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }

            return View(station);
        }

        // GET: Station/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var station = await _context.Stations.FindAsync(id);
            if (station == null)
            {
                return NotFound();
            }

            return View(station);
        }

        // POST: Station/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("StationID,StationName,Latitude,Longitude,StationCode,StationType,NumberOfPlatforms,Facilities,OperationalStatus,CityID")] Station station)
        {
            if (id != station.StationID)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(station);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!StationExists(station.StationID))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }

                return RedirectToAction(nameof(Index));
            }

            return View(station);
        }

        // GET: Station/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var station = await _context.Stations
                .FirstOrDefaultAsync(m => m.StationID == id);

            if (station == null)
            {
                return NotFound();
            }

            return View(station);
        }

        // POST: Station/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var station = await _context.Stations.FindAsync(id);
            _context.Stations.Remove(station);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool StationExists(int id)
        {
            return _context.Stations.Any(e => e.StationID == id);
        }
    }
}
