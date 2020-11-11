
use DB_A69E5E_refbook;
go






SET IDENTITY_INSERT [dbo].[Categories] ON 
INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (6, N'Производители полиграфической продукции')
INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (7, N'Производители и поставщики оборудования для полиграфии')
INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (8, N'Производители и поставщики расходных материалов')
INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (9, N'Производители и поставщики бумаги и картона')
SET IDENTITY_INSERT [dbo].[Categories] OFF








--insert [dbo].[Streets](StreetId, StreetName)values 
--	(N'8262F6CF-E19C-4CBF-8333-0C456C17EE07', N'ул. Фанерная')

--insert [dbo].[ZipCodes](ZipCodeId, CityId, ZipCode)values 
--	(1, N'Киев')

--insert [dbo].[Cities] (CityId, CityName)values 
--	(N'CBB13FCE-DB4D-4CA1-BF8D-521B37CF5CC1', N'Киев')

--insert [dbo].[Addresses](AddressId, CityId, ZipCode, StreetId, House, [Block], Apartment, Latitude, Longitude)values 
--	(N'9DEF3849-02B3-47B4-B585-B4E889AC4A80', N'CBB13FCE-DB4D-4CA1-BF8D-521B37CF5CC1', 1, N'8262F6CF-E19C-4CBF-8333-0C456C17EE07', N'4', NULL, NULL, 0.11, 0.22)

--INSERT [dbo].[Companies] ([CompanyId], [CompanyName], [ParentCompanyId], [Director], [DescriptionShort], [DescriptionFull], [WebSite], [AddressId]) VALUES 
--	(N'1683CBB5-BF2C-4DEC-B18D-8BC3C7A3B20B', N'Баленко, ЧП', NULL, N'Борис Федорович Баленко', N'описание', N'полное описание', N'balenko.com', NULL)


--INSERT [dbo].[CompanySubcategories] ([CompanySubcategories], [CompanyId], [SubcategoryId]) VALUES 
--	(N'60A6FB64-767E-443B-B12B-5816F93623FF', N'1683CBB5-BF2C-4DEC-B18D-8BC3C7A3B20B', 2)




--INSERT [dbo].[Emails] ([EmailsId], [CompanyId], [Email]) VALUES 
--	(N'144f4bd7-a045-4478-b697-01320f00ba24', N'1ab81ad2-193b-46b4-a378-6137a432296e', N'admin@shop-pm.com.ua')
--INSERT [dbo].[Emails] ([EmailsId], [CompanyId], [Email]) VALUES 
--	(N'975a1274-a536-43ca-bdd2-ba3aa4197626', N'1ab81ad2-193b-46b4-a378-6137a432296e', N'spm.xerox@gmail.com')
--INSERT [dbo].[Phones] ([PhonesId], [CompanyId], [PhoneNumber]) VALUES 
--	(N'740c10c5-07d4-4c7b-bdb9-66f4cdca2ea9', N'1ab81ad2-193b-46b4-a378-6137a432296e', N'+380980267963')
--INSERT [dbo].[Phones] ([PhonesId], [CompanyId], [PhoneNumber]) VALUES 
--	(N'15a6d618-6441-4116-bcff-82815d3bee6a', N'1ab81ad2-193b-46b4-a378-6137a432296e', N'+380980267963')


--SET IDENTITY_INSERT [dbo].[Subcategories] ON 
--INSERT [dbo].[Subcategories] ([SubcategoryId], [SubcategoryName]) VALUES (1, N'Запчасти')
--INSERT [dbo].[Subcategories] ([SubcategoryId], [SubcategoryName]) VALUES (2, N'Ремонт оборудования')
--SET IDENTITY_INSERT [dbo].[Subcategories] OFF

