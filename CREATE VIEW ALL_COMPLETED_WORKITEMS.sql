Use ServiceManagement;
Go

Create or Alter VIEW ALL_COMPLETED_WORKITEMS as

select 'SRQ' as Class, WorkItemId as Id, Title, ISNULL(AssignedUser, 'Unassigned') as 'Name', AffectedUser, Tier as SupportGroup, Created, CompletedDate as Completed from CiresonAnalytics.dbo.SM_WorkItem_ServiceRequest where [CompletedDate] is not NULL
union
select 'INC' as Class, WorkItemId as Id, Title, ISNULL(AssignedUser, 'Unassigned') as 'Name', AffectedUser, Tier as SupportGroup, Created, CompletedDate as Completed from CiresonAnalytics.dbo.SM_WorkItem_Incident where [CompletedDate] is not NULL
