using RB.DAL.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace RB.MVC.Models
{
    public class SocnetPoco
    {
        public string SocNetUrl { get; set; }
        public SocialNetNames socialNetNames { get; set; }
    }
}
