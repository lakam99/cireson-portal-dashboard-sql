use ServiceManagement;
GO

create or alter view All_WorkItems_Source as
select allTickets.Created, enums.DisplayName as Source from [ServiceManager].[dbo].[fn_EnumerationsView]('ENU','ENU') enums
join [ServiceManagement].[dbo].[All_WorkItems_And_Cached_Date] allTickets 
on allTickets.TicketSourceId = enums.Id