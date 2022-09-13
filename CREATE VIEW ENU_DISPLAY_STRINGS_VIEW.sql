Use ServiceManagement;
GO

Create or alter view ENU_DISPLAY_STRINGS_VIEW as
select * from [ServiceManager].[dbo].[DisplayStringView] where LanguageCode = 'ENU'