using AtoCash.Authentication;
using AtoCash.Data;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.HttpsPolicy;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using Microsoft.OpenApi.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

//"SQLConnectionString": "server=DESKTOP-SMJTEA9\\SQLEXPRESS; database=AtoCashDB; User=sa; Password=Pa55word2019!123;trusted_connection=false; MultipleActiveResultSets=true",
//    "WithinContainerSQLConnectionString": "server=sqldata; database=AtoCashDB; User=sa; Password=Pa55word2019!123;trusted_connection=false; MultipleActiveResultSets=true",
//    "LocalSQLConnectionString": "server=host.docker.internal,1433; database=AtoCashDB; User=sa; Password=Pa55word2019!123;trusted_connection=false; MultipleActiveResultSets=true"




namespace AtoCash
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddDbContextPool<AtoCashDbContext>(options => options.UseSqlServer(Configuration.GetConnectionString("WithinContainerSQLConnectionString")));
            services.AddIdentity<ApplicationUser, IdentityRole>()
                .AddEntityFrameworkStores<AtoCashDbContext>();



            services.AddControllers();
            services.AddCors(options => options.AddDefaultPolicy(
              builder => builder.AllowAnyOrigin()));

            services.AddSwaggerGen(c =>
            {
                c.SwaggerDoc("v1", new OpenApiInfo { Title = "AtoCash", Version = "v1" });
            });
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
                app.UseSwagger();
                app.UseSwaggerUI(c => c.SwaggerEndpoint("/swagger/v1/swagger.json", "AtoCash v1"));
            }

            app.UseHttpsRedirection();

            app.UseRouting();
            
            app.UseAuthentication(); //add before MVC
            app.UseAuthorization();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });
        }
    }
}
