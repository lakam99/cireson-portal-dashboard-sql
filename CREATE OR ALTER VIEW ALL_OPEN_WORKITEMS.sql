Use ServiceManagement;
Go

CREATE OR ALTER VIEW ALL_OPEN_WORKITEMS as
select distinct wi.Id, enum.DisplayName as Status, supt.DisplayName as SupportGroup, wi.Created as Created from ServiceManagement.dbo.All_WorkItems_And_Cached_Date as wi 
join [ServiceManagement].dbo.ENU_DISPLAY_STRINGS_VIEW as enum 
on wi.StatusId = enum.LTStringId
join ServiceManagement.dbo.ENU_DISPLAY_STRINGS_VIEW as supt
on wi.SupportGroupId = supt.LTStringId
where enum.DisplayName != 'Completed' and enum.[DisplayName] != 'Cancelled' and enum.DisplayName != 'Closed'