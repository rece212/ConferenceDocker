using System.ComponentModel.DataAnnotations;

namespace ConferenceAPI.Models
{
    public class Attendee
    {
        [Key]
        public int AttendeeID { get; set; }

        [Required]
        [StringLength(50)] // Maximum 50 characters for FirstName
        public string FirstName { get; set; }

        [Required]
        [StringLength(50)] // Maximum 50 characters for LastName
        public string LastName { get; set; }

        [Required]
        [StringLength(100)] // Maximum 100 characters for Email
        public string Email { get; set; }

        // Navigation property for related Registrations
        public ICollection<Registration> Registrations { get; set; }
    }
}
