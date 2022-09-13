use ServiceManagement;
Go

CREATE OR ALTER VIEW ANALYTICS_WORKITEMS AS
select 'SRQ' as Class, WorkItemId as Id, Status, Title, AssignedUser, AffectedUser, Tier, Created, ClosedDate from CiresonAnalytics.dbo.SM_WorkItem_ServiceRequest
union
select 'INC' as Class, WorkItemId as Id, Status, Title, AssignedUser, AffectedUser, Tier, Created, ClosedDate from CiresonAnalytics.dbo.SM_WorkItem_Incident
