﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace AtoCash.Models
{
    public class EmpCurrentPettyCashBalance
    {
        [Key]
        [DatabaseGeneratedAttribute(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }

        [Required]
        [ForeignKey("EmployeeId")]
        public virtual Employee Employee { get; set; }
        public int EmployeeId { get; set; }

        [Required]
        [Column(TypeName = "decimal(7,2)")]
        public decimal CurBalance { get; set; }

        [Required]
        public DateTime UpdatedOn   { get; set; }

    }
}
