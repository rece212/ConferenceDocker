using ConferenceAPI.Models;
using Microsoft.EntityFrameworkCore;

namespace ConferenceAPI.Data
{
    public class ApplicationDbConnect : DbContext
    {
        public ApplicationDbConnect(DbContextOptions<ApplicationDbConnect> options)
            : base(options)
        {

        }
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.ApplyConfigurationsFromAssembly(typeof(ApplicationDbConnect).Assembly);
            base.OnModelCreating(modelBuilder);
        }
        public DbSet<Session> Sessions { get; set; }
        public DbSet<Attendee> Attendees { get; set; }
        public DbSet<Registration> Registrations { get; set; }
    }
}
