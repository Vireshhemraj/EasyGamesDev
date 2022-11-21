using AutoMapper;
using EasyGamesDev.Business.Business.Client;
using EasyGamesDev.Business.Business.Transaction;
using EasyGamesDev.Business.MappingConfiguration;
using EasyGamesDev.Data.Data.Client;
using EasyGamesDev.Data.Data.Transaction;
using EasyGamesDev.Data.DBAccess;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddRazorPages();
builder.Services.AddControllers();

#region DI scopes https://stackoverflow.com/questions/38138100/addtransient-addscoped-and-addsingleton-services-differences
builder.Services.AddScoped<IClientBusiness, ClientBusiness>();
builder.Services.AddScoped<ITransactionBusiness, TransactionBusiness>();

builder.Services.AddScoped<IClientData, ClientData>();
builder.Services.AddScoped<ITransactionData, TransactionData>();

builder.Services.AddScoped<ISqlDataAccess, SqlDataAccess>();
#endregion

// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

// Auto Mapper Configurations
var mapperConfig = new MapperConfiguration(mc =>
{
    mc.AddProfile(new MappingProfile());
});

IMapper mapper = mapperConfig.CreateMapper();
builder.Services.AddSingleton(mapper);

var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Error");
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}
else
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();
app.UseStaticFiles();

app.UseRouting();

app.UseAuthorization();

app.MapControllers();

app.MapRazorPages();

app.Run();
