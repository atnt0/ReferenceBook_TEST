

if OBJECT_ID('dbo.Logos', 'U') is not null
	drop table dbo.Logos
go

create table dbo.Logos(
	PhotoId uniqueidentifier primary key foreign key references Photos(PhotoId)
		on delete cascade
		on update cascade
)

