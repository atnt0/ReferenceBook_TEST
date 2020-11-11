
select com.CompanyId, com.CreatedOn, com.CompanyName, com.Director,
	cts.CityName, zc.ZipCode, strs.StreetName, ad.House, ad.[Block], ad.Apartment, ad.Latitude, ad.Longitude, 
	com.DescriptionShort, com.DescriptionFull, com.WebSite, em.Email, ph.PhoneNumber, sn.SocialNetURL,
	c.CategoryName, s.SubcategoryName --, *
--select com.CompanyId, com.CreatedOn, com.CompanyName, com.Director, cts.CityName, 
--	zc.ZipCode, strs.StreetName, ad.House, ad.[Block], ad.Apartment, ad.Latitude, ad.Longitude
from dbo.Companies as com
	left join dbo.Addresses as ad on com.AddressId = ad.AddressId
	left join dbo.Cities as cts on ad.CityId = cts.CityId
	left join dbo.ZipCodes as zc on ad.ZipCodeId = zc.ZipCodeId
	left join dbo.Streets as strs on ad.StreetId = strs.StreetId
	
	left join dbo.CompaniesCategories as cc on com.CompanyId = cc.CompanyId
	left join dbo.Categories as c on cc.CategoryId = c.CategoryId
	left join dbo.CompaniesSubcategories as sc on com.CompanyId = sc.CompanyId
	left join dbo.Subcategories as s on sc.SubcategoryId = s.SubcategoryId

	left join dbo.Emails as em on com.CompanyId = em.CompanyId
	left join dbo.Phones as ph on com.CompanyId = ph.CompanyId
	left join dbo.SocialNets as sn on com.CompanyId = sn.CompanyId


--group by com.CreatedOn, com.CompanyId, com.CompanyName, com.Director, cts.CityName, 
--	zc.ZipCode, strs.StreetName, ad.House, ad.[Block], ad.Apartment, ad.Latitude, ad.Longitude
order by com.CreatedOn desc



--delete from dbo.Companies where dbo.Companies.CompanyId = '26997113-093C-4C78-AE2C-6E764C06D6CD'

