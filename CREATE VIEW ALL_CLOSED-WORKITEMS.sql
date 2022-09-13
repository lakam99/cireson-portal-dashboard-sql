Use ServiceManagement;
Go

Create or Alter VIEW ALL_CLOSED_WORKITEMS as

select 'SRQ' as Class, WorkItemId as Id, Title, AssignedUser, AffectedUser, Tier as SupportGroup, Created, ClosedDate from CiresonAnalytics.dbo.SM_WorkItem_ServiceRequest where [Status] = 'Closed'
union
select 'INC' as Class, WorkItemId as Id, Title, AssignedUser, AffectedUser, Tier as SupportGroup, Created, ClosedDate from CiresonAnalytics.dbo.SM_WorkItem_Incident where [Status] = 'Closed'
