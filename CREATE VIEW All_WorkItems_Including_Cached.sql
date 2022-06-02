Use ServiceManagement;
GO

CREATE VIEW All_WorkItems_And_Cached_Date
as
select cust_view.Id, CONVERT(varchar(10), cust_view.Created, 111) as Created from
(select WorkItemId as Id, Created from [CiresonAnalytics].[dbo].SM_WorkItem_ServiceRequest as srq
union
select WorkItemId as Id,Created from [CiresonAnalytics].[dbo].SM_WorkItem_Incident as inc
UNION
select WorkItemId as Id, Created from [CiresonAnalytics].dbo.SM_WorkItem_ManualActivity as mna
union 
select Source_Id as Id,CreatedDate as Created from [ServiceManagement].[cachert].[csnCached_MT_System_WorkItem_ServiceRequest] as portal_Srq
union
select Source_Id as Id, CreatedDate as Created from [ServiceManagement].[cachert].csnCached_MT_System_WorkItem_Incident as portal_inc
union
select Source_Id as Id, CreatedDate as Created from [ServiceManagement].[cachert].csnCached_MT_System_WorkItem_Activity_ManualActivity as portal_mna) cust_view