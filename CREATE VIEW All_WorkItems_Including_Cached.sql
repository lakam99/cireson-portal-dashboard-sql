Use ServiceManagement;
GO

CREATE OR ALTER VIEW All_WorkItems_And_Cached_Date
as
select BaseId, cust_view.Id, CONVERT(varchar(10), cust_view.Created, 111) as Created, cust_view.ClassName, cust_view.TicketSourceId, cust_view.SupportGroupId, cust_view.StatusId, convert(varchar(10), cust_view.CompletedDate, 111) as CompletedDate from
(select convert(nvarchar(36), Id) as BaseId, WorkItemId as Id, Created, 'Service Request' as ClassName, SourceId as TicketSourceId, TierId as SupportGroupId, StatusId, CompletedDate from [CiresonAnalytics].[dbo].SM_WorkItem_ServiceRequest as srq
union
select convert(nvarchar(36), Id) as BaseId, WorkItemId as Id,Created, 'Incident' as ClassName, SourceId as TicketSourceId, TierId as SupportGroupId, StatusId, CompletedDate from [CiresonAnalytics].[dbo].SM_WorkItem_Incident as inc
UNION
select convert(nvarchar(36), Id) as BaseId, WorkItemId as Id, Created, 'Manual Activity' as ClassName, NULL as TicketSourceId, NULL as SupportGroupId, StatusId, ResolvedDate as CompletedDate from [CiresonAnalytics].dbo.SM_WorkItem_ManualActivity as mna
union 
select convert(nvarchar(36), Guid) as BaseId, Source_Id as Id,CreatedDate as Created, 'Service Request' as ClassName, SourceId as TicketSourceId, SupportGroupId, StatusId, CompletedDate from [ServiceManagement].[cachert].[csnCached_MT_System_WorkItem_ServiceRequest] as portal_Srq
union
select convert(nvarchar(36), Guid) as BaseId, Source_Id as Id, CreatedDate as Created, 'Incident' as ClassName, SourceId as TicketSourceId, TierQueueId as SupportGroupId, StatusId, ResolvedDate as CompletedDate from [ServiceManagement].[cachert].csnCached_MT_System_WorkItem_Incident as portal_inc
union
select convert(nvarchar(36), Guid) as BaseId, Source_Id as Id, CreatedDate as Created, 'Manual Activity' as ClassName, NULL as TicketSourceId, NULL as SupportGroupId, StatusId, ActualEndDate as CompletedDate from [ServiceManagement].[cachert].csnCached_MT_System_WorkItem_Activity_ManualActivity as portal_mna
UNION
SELECT convert(nvarchar(36), BaseManagedEntityId) as BaseId, Id_9A505725_E2F2_447F_271B_9B9F4F0D190C as Id, CreatedDate_6258638D_B885_AB3C_E316_D00782B8F688 as Created, 'Service Request', Source_3734511A_37D2_6E2C_3C8B_3C880AD8500D as TicketSourceId, SupportGroup_766D07C2_2680_CD38_4638_D3A7813E6488 as SupportGroupId, Status_6DBB4A46_48F2_4D89_CBF6_215182E99E0F as StatusId, CompletedDate_3116AB82_745B_654E_6B48_74E8AAF48065 as CompletedDate FROM [ServiceManager].[dbo].[MT_System$WorkItem$ServiceRequest] as scsm_srq
UNION
SELECT convert(nvarchar(36), BaseManagedEntityId) as BaseId, Id_9A505725_E2F2_447F_271B_9B9F4F0D190C as Id, CreatedDate_6258638D_B885_AB3C_E316_D00782B8F688 as Created, 'Incident', Source_96FD9295_16FA_3D7A_5995_F805B7B01F21 as TicketSourceId, TierQueue_1E9615C2_3386_2452_BA83_05B2169DF38C as SupportGroupId, Status_785407A9_729D_3A74_A383_575DB0CD50ED as StatusId, ResolvedDate_D2A4C73F_01B8_29C5_895B_5BE4C3DFAC4E as CompletedDate FROM [ServiceManager].[dbo].MT_System$WorkItem$Incident as scsm_inc
UNION
SELECT convert(nvarchar(36), BaseManagedEntityId) as BaseId, Id_9A505725_E2F2_447F_271B_9B9F4F0D190C as Id, CreatedDate_6258638D_B885_AB3C_E316_D00782B8F688 as Created, 'Manual Activity', NULL as TicketSourceId,
NULL as SupportGroupId, Status_8895EC8D_2CBF_0D9D_E8EC_524DEFA00014 as StatusId, ActualEndDate_A3C4A137_3FF8_39E2_BE65_2D070EEA2E78 as CompletedDate FROM [ServiceManager].[dbo].MT_System$WorkItem$Activity$ManualActivity as scsm_mna) cust_view