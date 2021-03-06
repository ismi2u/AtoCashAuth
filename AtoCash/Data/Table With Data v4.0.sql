USE [master]
GO

CREATE DATABASE [AtoCashDB]
GO
USE [AtoCashDB]
GO


GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL PRIMARY KEY,
	[ProductVersion] [nvarchar](32) NOT NULL)
GO

CREATE TABLE [dbo].[AdvanceOrReimburseTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[ClaimType] [nvarchar](50) NOT NULL,
	[ClaimTypeDesc] [nvarchar](50) NOT NULL)
	
GO
CREATE TABLE [dbo].[ApprovalGroups](
	[Id] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[ApprovalGroupCode] [nvarchar](5) NOT NULL,
	[ApprovalGroupDesc] [nvarchar](150) NOT NULL)
GO

CREATE TABLE [dbo].[ApprovalRoleMaps](
	[Id] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[ApprovalGroupId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
	[ApprovalLevel] [int] NOT NULL)
	
GO
CREATE TABLE [dbo].[ApprovalStatusTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[Status] [nvarchar](25) NOT NULL,
	[StatusDesc] [nvarchar](100) NULL)
	
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL)
GO

CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL PRIMARY KEY,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL)
GO

CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL)
GO

CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL
	PRIMARY KEY ([LoginProvider] , [ProviderKey]))
	
	

GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	PRIMARY KEY ([UserId], [RoleId]))
GO

CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL PRIMARY KEY,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL)
GO

CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL ,
	[LoginProvider] [nvarchar](450) NOT NULL ,
	[Name] [nvarchar](450) NOT NULL ,
	[Value] [nvarchar](max) NULL,
	PRIMARY KEY ([UserId], [LoginProvider], [Name]))
GO


CREATE TABLE [dbo].[ClaimApprovalStatusTrackers](
	[Id] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[EmployeeId] [int] NOT NULL,
	[PettyCashRequestId] [int] NOT NULL,
	[ExpenseReimburseRequestId] [int] NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[ProjectId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
	[ReqDate] [datetime2](7) NOT NULL,
	[FinalApprovedDate] [datetime2](7) NULL,
	[ApprovalStatusTypeId] [int] NOT NULL)
GO

CREATE TABLE [dbo].[CostCentres](
	[Id] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[CostCentreCode] [nvarchar](10) NOT NULL,
	[CostCentreDesc] [nvarchar](30) NOT NULL)
GO

CREATE TABLE [dbo].[Departments](
	[Id] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[DeptCode] [nvarchar](10) NOT NULL,
	[DeptName] [nvarchar](30) NOT NULL,
	[CostCentreId] [int] NOT NULL)
GO

CREATE TABLE [dbo].[DisbursementsAndClaimsMasters](
	[Id] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[EmployeeId] [int] NOT NULL,
	[PettyCashRequestId] [int] NULL,
	[ExpenseReimburseReqId] [int] NULL,
	[AdvanceOrReimburseId] [int] NOT NULL,
	[ProjectId] [int] NULL,
	[SubProjectId] [int] NULL,
	[WorkTaskId] [int] NULL,
	[RecordDate] [datetime2](7) NOT NULL,
	[Amount] [decimal](7, 2) NOT NULL,
	[CostCentreId] [int] NOT NULL,
	[ApprovalStatusId] [int] NOT NULL)
GO

CREATE TABLE [dbo].[EmpCurrentPettyCashBalances](
	[Id] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[EmployeeId] [int] NOT NULL,
	[CurBalance] [decimal](7, 2) NOT NULL,
	[UpdatedOn] [datetime2](7) NOT NULL)
GO

CREATE TABLE [dbo].[Employees](
	[Id] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[FirstName] [nvarchar](200) NOT NULL,
	[MiddleName] [nvarchar](100) NULL,
	[LastName] [nvarchar](100) NOT NULL,
	[EmpCode] [nvarchar](30) NOT NULL,
	[BankAccount] [nvarchar](30) NOT NULL,
	[BankCardNo] [nvarchar](50) NULL,
	[NationalID] [nvarchar](max) NULL,
	[PassportNo] [nvarchar](20) NULL,
	[TaxNumber] [nvarchar](20) NULL,
	[Nationality] [nvarchar](50) NULL,
	[DOB] [datetime2](7) NOT NULL,
	[DOJ] [datetime2](7) NOT NULL,
	[Gender] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[MobileNumber] [nvarchar](20) NULL,
	[EmploymentTypeId] [int] NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
	[ApprovalGroupId] [int] NOT NULL)
GO

CREATE TABLE [dbo].[EmploymentTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[EmpJobTypeCode] [nvarchar](10) NOT NULL,
	[EmpJobTypeDesc] [nvarchar](50) NOT NULL)
GO

CREATE TABLE [dbo].[ExpenseReimburseRequests](
	[Id] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[EmployeeId] [int] NOT NULL,
	[ExpenseReimbClaimAmount] [decimal](7, 2) NOT NULL,
	[Documents] [nvarchar](max) NULL,
	[ExpReimReqDate] [datetime2](7) NOT NULL,
	[ExpenseTypeId] [int] NULL,
	[ProjectId] [int] NULL,
	[SubProjectId] [int] NULL,
	[WorkTaskId] [int] NULL)
GO

CREATE TABLE [dbo].[ExpenseTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[ExpenseTypeName] [nvarchar](50) NOT NULL,
	[ExpenseTypeDesc] [nvarchar](50) NOT NULL)
GO

CREATE TABLE [dbo].[JobRoles](
	[Id] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[RoleCode] [nvarchar](10) NOT NULL,
	[RoleName] [nvarchar](20) NOT NULL,
	[MaxPettyCashAllowed] [decimal](7, 2) NOT NULL)
GO

CREATE TABLE [dbo].[PettyCashRequests](
	[Id] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[EmployeeId] [int] NOT NULL,
	[PettyClaimAmount] [decimal](7, 2) NOT NULL,
	[PettyClaimRequestDesc] [nvarchar](150) NOT NULL,
	[CashReqDate] [datetime2](7) NOT NULL,
	[ProjectId] [int] NULL,
	[SubProjectId] [int] NULL,
	[WorkTaskId] [int] NULL)
GO

CREATE TABLE [dbo].[ProjectManagements](
	[Id] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[ProjectId] [int] NOT NULL,
	[EmployeeId] [int] NOT NULL)
GO

CREATE TABLE [dbo].[Projects](
	[Id] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[ProjectName] [nvarchar](25) NOT NULL,
	[CostCentreId] [int] NOT NULL,
	[ProjectDesc] [nvarchar](200) NOT NULL)
GO

CREATE TABLE [dbo].[SubProjects](
	[Id] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[ProjectId] [int] NOT NULL,
	[SubProjectName] [nvarchar](25) NOT NULL,
	[SubProjectDesc] [nvarchar](200) NOT NULL)
GO

CREATE TABLE [dbo].[TravelApprovalRequests](
	[Id] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[EmployeeId] [int] NOT NULL,
	[TravelStartDate] [datetime2](7) NOT NULL,
	[TravelEndDate] [datetime2](7) NOT NULL,
	[ProjectId] [int] NULL,
	[SubProjectId] [int] NULL,
	[WorkTaskId] [int] NULL)
GO

CREATE TABLE [dbo].[TravelApprovalStatusTrackers](
	[Id] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[EmployeeId] [int] NOT NULL,
	[TravelApprovalRequestId] [int] NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[ProjectId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
	[ReqDate] [datetime2](7) NOT NULL,
	[FinalApprovedDate] [datetime2](7) NULL,
	[ApprovalStatusTypeId] [int] NOT NULL)
GO

CREATE TABLE [dbo].[WorkTasks](
	[Id] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[SubProjectId] [int] NOT NULL,
	[TaskName] [nvarchar](25) NOT NULL,
	[TaskDesc] [nvarchar](200) NOT NULL)
GO



ALTER TABLE [dbo].[ApprovalRoleMaps]  WITH CHECK ADD  CONSTRAINT [FK_ApprovalRoleMaps_ApprovalGroups_ApprovalGroupId] FOREIGN KEY([ApprovalGroupId])
REFERENCES [dbo].[ApprovalGroups] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ApprovalRoleMaps] CHECK CONSTRAINT [FK_ApprovalRoleMaps_ApprovalGroups_ApprovalGroupId]
GO
ALTER TABLE [dbo].[ApprovalRoleMaps]  WITH CHECK ADD  CONSTRAINT [FK_ApprovalRoleMaps_JobRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[JobRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ApprovalRoleMaps] CHECK CONSTRAINT [FK_ApprovalRoleMaps_JobRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[ClaimApprovalStatusTrackers]  WITH CHECK ADD  CONSTRAINT [FK_ClaimApprovalStatusTrackers_ApprovalStatusTypes_ApprovalStatusTypeId] FOREIGN KEY([ApprovalStatusTypeId])
REFERENCES [dbo].[ApprovalStatusTypes] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ClaimApprovalStatusTrackers] CHECK CONSTRAINT [FK_ClaimApprovalStatusTrackers_ApprovalStatusTypes_ApprovalStatusTypeId]
GO
ALTER TABLE [dbo].[ClaimApprovalStatusTrackers]  WITH CHECK ADD  CONSTRAINT [FK_ClaimApprovalStatusTrackers_Departments_DepartmentId] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Departments] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ClaimApprovalStatusTrackers] CHECK CONSTRAINT [FK_ClaimApprovalStatusTrackers_Departments_DepartmentId]
GO
ALTER TABLE [dbo].[ClaimApprovalStatusTrackers]  WITH CHECK ADD  CONSTRAINT [FK_ClaimApprovalStatusTrackers_Employees_EmployeeId] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employees] ([Id])
GO
ALTER TABLE [dbo].[ClaimApprovalStatusTrackers] CHECK CONSTRAINT [FK_ClaimApprovalStatusTrackers_Employees_EmployeeId]
GO
ALTER TABLE [dbo].[ClaimApprovalStatusTrackers]  WITH CHECK ADD  CONSTRAINT [FK_ClaimApprovalStatusTrackers_ExpenseReimburseRequests_ExpenseReimburseRequestId] FOREIGN KEY([ExpenseReimburseRequestId])
REFERENCES [dbo].[ExpenseReimburseRequests] ([Id])
GO
ALTER TABLE [dbo].[ClaimApprovalStatusTrackers] CHECK CONSTRAINT [FK_ClaimApprovalStatusTrackers_ExpenseReimburseRequests_ExpenseReimburseRequestId]
GO
ALTER TABLE [dbo].[ClaimApprovalStatusTrackers]  WITH CHECK ADD  CONSTRAINT [FK_ClaimApprovalStatusTrackers_JobRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[JobRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ClaimApprovalStatusTrackers] CHECK CONSTRAINT [FK_ClaimApprovalStatusTrackers_JobRoles_RoleId]
GO
ALTER TABLE [dbo].[ClaimApprovalStatusTrackers]  WITH CHECK ADD  CONSTRAINT [FK_ClaimApprovalStatusTrackers_PettyCashRequests_PettyCashRequestId] FOREIGN KEY([PettyCashRequestId])
REFERENCES [dbo].[PettyCashRequests] ([Id])
GO
ALTER TABLE [dbo].[ClaimApprovalStatusTrackers] CHECK CONSTRAINT [FK_ClaimApprovalStatusTrackers_PettyCashRequests_PettyCashRequestId]
GO
ALTER TABLE [dbo].[ClaimApprovalStatusTrackers]  WITH CHECK ADD  CONSTRAINT [FK_ClaimApprovalStatusTrackers_Projects_ProjectId] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Projects] ([Id])
GO
ALTER TABLE [dbo].[ClaimApprovalStatusTrackers] CHECK CONSTRAINT [FK_ClaimApprovalStatusTrackers_Projects_ProjectId]
GO
ALTER TABLE [dbo].[Departments]  WITH CHECK ADD  CONSTRAINT [FK_Departments_CostCentres_CostCentreId] FOREIGN KEY([CostCentreId])
REFERENCES [dbo].[CostCentres] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Departments] CHECK CONSTRAINT [FK_Departments_CostCentres_CostCentreId]
GO
ALTER TABLE [dbo].[DisbursementsAndClaimsMasters]  WITH CHECK ADD  CONSTRAINT [FK_DisbursementsAndClaimsMasters_AdvanceOrReimburseTypes_AdvanceOrReimburseId] FOREIGN KEY([AdvanceOrReimburseId])
REFERENCES [dbo].[AdvanceOrReimburseTypes] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DisbursementsAndClaimsMasters] CHECK CONSTRAINT [FK_DisbursementsAndClaimsMasters_AdvanceOrReimburseTypes_AdvanceOrReimburseId]
GO
ALTER TABLE [dbo].[DisbursementsAndClaimsMasters]  WITH CHECK ADD  CONSTRAINT [FK_DisbursementsAndClaimsMasters_ApprovalStatusTypes_ApprovalStatusId] FOREIGN KEY([ApprovalStatusId])
REFERENCES [dbo].[ApprovalStatusTypes] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DisbursementsAndClaimsMasters] CHECK CONSTRAINT [FK_DisbursementsAndClaimsMasters_ApprovalStatusTypes_ApprovalStatusId]
GO
ALTER TABLE [dbo].[DisbursementsAndClaimsMasters]  WITH CHECK ADD  CONSTRAINT [FK_DisbursementsAndClaimsMasters_CostCentres_CostCentreId] FOREIGN KEY([CostCentreId])
REFERENCES [dbo].[CostCentres] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DisbursementsAndClaimsMasters] CHECK CONSTRAINT [FK_DisbursementsAndClaimsMasters_CostCentres_CostCentreId]
GO
ALTER TABLE [dbo].[DisbursementsAndClaimsMasters]  WITH CHECK ADD  CONSTRAINT [FK_DisbursementsAndClaimsMasters_Employees_EmployeeId] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employees] ([Id])
GO
ALTER TABLE [dbo].[DisbursementsAndClaimsMasters] CHECK CONSTRAINT [FK_DisbursementsAndClaimsMasters_Employees_EmployeeId]
GO
ALTER TABLE [dbo].[DisbursementsAndClaimsMasters]  WITH CHECK ADD  CONSTRAINT [FK_DisbursementsAndClaimsMasters_ExpenseReimburseRequests_ExpenseReimburseReqId] FOREIGN KEY([ExpenseReimburseReqId])
REFERENCES [dbo].[ExpenseReimburseRequests] ([Id])
GO
ALTER TABLE [dbo].[DisbursementsAndClaimsMasters] CHECK CONSTRAINT [FK_DisbursementsAndClaimsMasters_ExpenseReimburseRequests_ExpenseReimburseReqId]
GO
ALTER TABLE [dbo].[DisbursementsAndClaimsMasters]  WITH CHECK ADD  CONSTRAINT [FK_DisbursementsAndClaimsMasters_PettyCashRequests_PettyCashRequestId] FOREIGN KEY([PettyCashRequestId])
REFERENCES [dbo].[PettyCashRequests] ([Id])
GO
ALTER TABLE [dbo].[DisbursementsAndClaimsMasters] CHECK CONSTRAINT [FK_DisbursementsAndClaimsMasters_PettyCashRequests_PettyCashRequestId]
GO
ALTER TABLE [dbo].[DisbursementsAndClaimsMasters]  WITH CHECK ADD  CONSTRAINT [FK_DisbursementsAndClaimsMasters_Projects_ProjectId] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Projects] ([Id])
GO
ALTER TABLE [dbo].[DisbursementsAndClaimsMasters] CHECK CONSTRAINT [FK_DisbursementsAndClaimsMasters_Projects_ProjectId]
GO
ALTER TABLE [dbo].[DisbursementsAndClaimsMasters]  WITH CHECK ADD  CONSTRAINT [FK_DisbursementsAndClaimsMasters_SubProjects_SubProjectId] FOREIGN KEY([SubProjectId])
REFERENCES [dbo].[SubProjects] ([Id])
GO
ALTER TABLE [dbo].[DisbursementsAndClaimsMasters] CHECK CONSTRAINT [FK_DisbursementsAndClaimsMasters_SubProjects_SubProjectId]
GO
ALTER TABLE [dbo].[DisbursementsAndClaimsMasters]  WITH CHECK ADD  CONSTRAINT [FK_DisbursementsAndClaimsMasters_WorkTasks_WorkTaskId] FOREIGN KEY([WorkTaskId])
REFERENCES [dbo].[WorkTasks] ([Id])
GO
ALTER TABLE [dbo].[DisbursementsAndClaimsMasters] CHECK CONSTRAINT [FK_DisbursementsAndClaimsMasters_WorkTasks_WorkTaskId]
GO
ALTER TABLE [dbo].[EmpCurrentPettyCashBalances]  WITH CHECK ADD  CONSTRAINT [FK_EmpCurrentPettyCashBalances_Employees_EmployeeId] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employees] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EmpCurrentPettyCashBalances] CHECK CONSTRAINT [FK_EmpCurrentPettyCashBalances_Employees_EmployeeId]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_ApprovalGroups_ApprovalGroupId] FOREIGN KEY([ApprovalGroupId])
REFERENCES [dbo].[ApprovalGroups] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_ApprovalGroups_ApprovalGroupId]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_Departments_DepartmentId] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Departments] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_Departments_DepartmentId]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_EmploymentTypes_EmploymentTypeId] FOREIGN KEY([EmploymentTypeId])
REFERENCES [dbo].[EmploymentTypes] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_EmploymentTypes_EmploymentTypeId]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_JobRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[JobRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_JobRoles_RoleId]
GO
ALTER TABLE [dbo].[ExpenseReimburseRequests]  WITH CHECK ADD  CONSTRAINT [FK_ExpenseReimburseRequests_Employees_EmployeeId] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employees] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ExpenseReimburseRequests] CHECK CONSTRAINT [FK_ExpenseReimburseRequests_Employees_EmployeeId]
GO
ALTER TABLE [dbo].[ExpenseReimburseRequests]  WITH CHECK ADD  CONSTRAINT [FK_ExpenseReimburseRequests_ExpenseTypes_ExpenseTypeId] FOREIGN KEY([ExpenseTypeId])
REFERENCES [dbo].[ExpenseTypes] ([Id])
GO
ALTER TABLE [dbo].[ExpenseReimburseRequests] CHECK CONSTRAINT [FK_ExpenseReimburseRequests_ExpenseTypes_ExpenseTypeId]
GO
ALTER TABLE [dbo].[ExpenseReimburseRequests]  WITH CHECK ADD  CONSTRAINT [FK_ExpenseReimburseRequests_Projects_ProjectId] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Projects] ([Id])
GO
ALTER TABLE [dbo].[ExpenseReimburseRequests] CHECK CONSTRAINT [FK_ExpenseReimburseRequests_Projects_ProjectId]
GO
ALTER TABLE [dbo].[ExpenseReimburseRequests]  WITH CHECK ADD  CONSTRAINT [FK_ExpenseReimburseRequests_SubProjects_SubProjectId] FOREIGN KEY([SubProjectId])
REFERENCES [dbo].[SubProjects] ([Id])
GO
ALTER TABLE [dbo].[ExpenseReimburseRequests] CHECK CONSTRAINT [FK_ExpenseReimburseRequests_SubProjects_SubProjectId]
GO
ALTER TABLE [dbo].[ExpenseReimburseRequests]  WITH CHECK ADD  CONSTRAINT [FK_ExpenseReimburseRequests_WorkTasks_WorkTaskId] FOREIGN KEY([WorkTaskId])
REFERENCES [dbo].[WorkTasks] ([Id])
GO
ALTER TABLE [dbo].[ExpenseReimburseRequests] CHECK CONSTRAINT [FK_ExpenseReimburseRequests_WorkTasks_WorkTaskId]
GO
ALTER TABLE [dbo].[PettyCashRequests]  WITH CHECK ADD  CONSTRAINT [FK_PettyCashRequests_Employees_EmployeeId] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employees] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PettyCashRequests] CHECK CONSTRAINT [FK_PettyCashRequests_Employees_EmployeeId]
GO
ALTER TABLE [dbo].[PettyCashRequests]  WITH CHECK ADD  CONSTRAINT [FK_PettyCashRequests_Projects_ProjectId] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Projects] ([Id])
GO
ALTER TABLE [dbo].[PettyCashRequests] CHECK CONSTRAINT [FK_PettyCashRequests_Projects_ProjectId]
GO
ALTER TABLE [dbo].[PettyCashRequests]  WITH CHECK ADD  CONSTRAINT [FK_PettyCashRequests_SubProjects_SubProjectId] FOREIGN KEY([SubProjectId])
REFERENCES [dbo].[SubProjects] ([Id])
GO
ALTER TABLE [dbo].[PettyCashRequests] CHECK CONSTRAINT [FK_PettyCashRequests_SubProjects_SubProjectId]
GO
ALTER TABLE [dbo].[PettyCashRequests]  WITH CHECK ADD  CONSTRAINT [FK_PettyCashRequests_WorkTasks_WorkTaskId] FOREIGN KEY([WorkTaskId])
REFERENCES [dbo].[WorkTasks] ([Id])
GO
ALTER TABLE [dbo].[PettyCashRequests] CHECK CONSTRAINT [FK_PettyCashRequests_WorkTasks_WorkTaskId]
GO
ALTER TABLE [dbo].[ProjectManagements]  WITH CHECK ADD  CONSTRAINT [FK_ProjectManagements_Employees_EmployeeId] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employees] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProjectManagements] CHECK CONSTRAINT [FK_ProjectManagements_Employees_EmployeeId]
GO
ALTER TABLE [dbo].[ProjectManagements]  WITH CHECK ADD  CONSTRAINT [FK_ProjectManagements_Projects_ProjectId] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Projects] ([Id])
GO
ALTER TABLE [dbo].[ProjectManagements] CHECK CONSTRAINT [FK_ProjectManagements_Projects_ProjectId]
GO
ALTER TABLE [dbo].[Projects]  WITH CHECK ADD  CONSTRAINT [FK_Projects_CostCentres_CostCentreId] FOREIGN KEY([CostCentreId])
REFERENCES [dbo].[CostCentres] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Projects] CHECK CONSTRAINT [FK_Projects_CostCentres_CostCentreId]
GO
ALTER TABLE [dbo].[SubProjects]  WITH CHECK ADD  CONSTRAINT [FK_SubProjects_Projects_ProjectId] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Projects] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SubProjects] CHECK CONSTRAINT [FK_SubProjects_Projects_ProjectId]
GO
ALTER TABLE [dbo].[TravelApprovalRequests]  WITH CHECK ADD  CONSTRAINT [FK_TravelApprovalRequests_Employees_EmployeeId] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employees] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TravelApprovalRequests] CHECK CONSTRAINT [FK_TravelApprovalRequests_Employees_EmployeeId]
GO
ALTER TABLE [dbo].[TravelApprovalRequests]  WITH CHECK ADD  CONSTRAINT [FK_TravelApprovalRequests_Projects_ProjectId] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Projects] ([Id])
GO
ALTER TABLE [dbo].[TravelApprovalRequests] CHECK CONSTRAINT [FK_TravelApprovalRequests_Projects_ProjectId]
GO
ALTER TABLE [dbo].[TravelApprovalRequests]  WITH CHECK ADD  CONSTRAINT [FK_TravelApprovalRequests_SubProjects_SubProjectId] FOREIGN KEY([SubProjectId])
REFERENCES [dbo].[SubProjects] ([Id])
GO
ALTER TABLE [dbo].[TravelApprovalRequests] CHECK CONSTRAINT [FK_TravelApprovalRequests_SubProjects_SubProjectId]
GO
ALTER TABLE [dbo].[TravelApprovalRequests]  WITH CHECK ADD  CONSTRAINT [FK_TravelApprovalRequests_WorkTasks_WorkTaskId] FOREIGN KEY([WorkTaskId])
REFERENCES [dbo].[WorkTasks] ([Id])
GO
ALTER TABLE [dbo].[TravelApprovalRequests] CHECK CONSTRAINT [FK_TravelApprovalRequests_WorkTasks_WorkTaskId]
GO
ALTER TABLE [dbo].[TravelApprovalStatusTrackers]  WITH CHECK ADD  CONSTRAINT [FK_TravelApprovalStatusTrackers_ApprovalStatusTypes_ApprovalStatusTypeId] FOREIGN KEY([ApprovalStatusTypeId])
REFERENCES [dbo].[ApprovalStatusTypes] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TravelApprovalStatusTrackers] CHECK CONSTRAINT [FK_TravelApprovalStatusTrackers_ApprovalStatusTypes_ApprovalStatusTypeId]
GO
ALTER TABLE [dbo].[TravelApprovalStatusTrackers]  WITH CHECK ADD  CONSTRAINT [FK_TravelApprovalStatusTrackers_Departments_DepartmentId] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Departments] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TravelApprovalStatusTrackers] CHECK CONSTRAINT [FK_TravelApprovalStatusTrackers_Departments_DepartmentId]
GO
ALTER TABLE [dbo].[TravelApprovalStatusTrackers]  WITH CHECK ADD  CONSTRAINT [FK_TravelApprovalStatusTrackers_Employees_EmployeeId] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employees] ([Id])
GO
ALTER TABLE [dbo].[TravelApprovalStatusTrackers] CHECK CONSTRAINT [FK_TravelApprovalStatusTrackers_Employees_EmployeeId]
GO
ALTER TABLE [dbo].[TravelApprovalStatusTrackers]  WITH CHECK ADD  CONSTRAINT [FK_TravelApprovalStatusTrackers_JobRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[JobRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TravelApprovalStatusTrackers] CHECK CONSTRAINT [FK_TravelApprovalStatusTrackers_JobRoles_RoleId]
GO
ALTER TABLE [dbo].[TravelApprovalStatusTrackers]  WITH CHECK ADD  CONSTRAINT [FK_TravelApprovalStatusTrackers_Projects_ProjectId] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Projects] ([Id])
GO
ALTER TABLE [dbo].[TravelApprovalStatusTrackers] CHECK CONSTRAINT [FK_TravelApprovalStatusTrackers_Projects_ProjectId]
GO
ALTER TABLE [dbo].[TravelApprovalStatusTrackers]  WITH CHECK ADD  CONSTRAINT [FK_TravelApprovalStatusTrackers_TravelApprovalRequests_TravelApprovalRequestId] FOREIGN KEY([TravelApprovalRequestId])
REFERENCES [dbo].[TravelApprovalRequests] ([Id])
GO
ALTER TABLE [dbo].[TravelApprovalStatusTrackers] CHECK CONSTRAINT [FK_TravelApprovalStatusTrackers_TravelApprovalRequests_TravelApprovalRequestId]
GO
ALTER TABLE [dbo].[WorkTasks]  WITH CHECK ADD  CONSTRAINT [FK_WorkTasks_SubProjects_SubProjectId] FOREIGN KEY([SubProjectId])
REFERENCES [dbo].[SubProjects] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[WorkTasks] CHECK CONSTRAINT [FK_WorkTasks_SubProjects_SubProjectId]
GO
USE [master]
GO
ALTER DATABASE [AtoCashDB] SET  READ_WRITE 
GO


Use AtoCashDB
GO

SET IDENTITY_INSERT [dbo].[AdvanceOrReimburseTypes] ON 
INSERT INTO [dbo].[AdvanceOrReimburseTypes] ([Id],[ClaimType],[ClaimTypeDesc]) VALUES (1,'Cash Claim Reques','All Cash claimed request')
INSERT INTO [dbo].[AdvanceOrReimburseTypes] ([Id],[ClaimType],[ClaimTypeDesc]) VALUES (2,'Expense Reimbursement Request','Expense reimbursement request')
SET IDENTITY_INSERT [dbo].[AdvanceOrReimburseTypes] OFF 
GO

SET IDENTITY_INSERT [dbo].[ApprovalGroups] ON 
INSERT INTO [dbo].[ApprovalGroups] ([Id],[ApprovalGroupCode],[ApprovalGroupDesc]) VALUES (1,'GRP1','Group 1')
INSERT INTO [dbo].[ApprovalGroups] ([Id],[ApprovalGroupCode],[ApprovalGroupDesc]) VALUES (2,'GRP2','Group 2')
INSERT INTO [dbo].[ApprovalGroups] ([Id],[ApprovalGroupCode],[ApprovalGroupDesc]) VALUES (3,'GRP3','Group 3')
INSERT INTO [dbo].[ApprovalGroups] ([Id],[ApprovalGroupCode],[ApprovalGroupDesc]) VALUES (4,'GRP4','Group 4')
INSERT INTO [dbo].[ApprovalGroups] ([Id],[ApprovalGroupCode],[ApprovalGroupDesc]) VALUES (5,'GRP5','Group 5')
INSERT INTO [dbo].[ApprovalGroups] ([Id],[ApprovalGroupCode],[ApprovalGroupDesc]) VALUES (6,'GRP6','Group 6')
SET IDENTITY_INSERT [dbo].[ApprovalGroups] OFF 
GO



SET IDENTITY_INSERT [dbo].[CostCentres] ON 
INSERT INTO [dbo].[CostCentres] ([Id],[CostCentreCode],[CostCentreDesc]) VALUES (1,'TR001128','Cost centre for 201')
INSERT INTO [dbo].[CostCentres] ([Id],[CostCentreCode],[CostCentreDesc]) VALUES (2,'WUD8992','Cost centre for cyx ')
INSERT INTO [dbo].[CostCentres] ([Id],[CostCentreCode],[CostCentreDesc]) VALUES (3,'XUC500','Cost centre for ddd')
SET IDENTITY_INSERT [dbo].[CostCentres] OFF 
GO


SET IDENTITY_INSERT [dbo].[EmploymentTypes] ON 
INSERT INTO [dbo].[employmentTypes] ([Id],[EmpJobTypeCode],[EmpJobTypeDesc]) VALUES (1,'Full-Time','Full time Job')
INSERT INTO [dbo].[employmentTypes] ([Id],[EmpJobTypeCode],[EmpJobTypeDesc]) VALUES (2,'Part-Time','Part time Job')
SET IDENTITY_INSERT [dbo].[EmploymentTypes] OFF 
GO



SET IDENTITY_INSERT [dbo].[JobRoles] ON 
INSERT INTO [dbo].[JobRoles] ([ID],[RoleCode],[RoleName],[MaxPettyCashAllowed]) VALUES (1,'HR001','EMPLOYEE',10000)
INSERT INTO [dbo].[JobRoles] ([ID],[RoleCode],[RoleName],[MaxPettyCashAllowed]) VALUES (2,'HR002','MANAGER',15000)
INSERT INTO [dbo].[JobRoles] ([ID],[RoleCode],[RoleName],[MaxPettyCashAllowed]) VALUES (3,'HR003','HRHEAD',20000)
INSERT INTO [dbo].[JobRoles] ([ID],[RoleCode],[RoleName],[MaxPettyCashAllowed]) VALUES (4,'HR004','VICEPRESIDENT',30000)
INSERT INTO [dbo].[JobRoles] ([ID],[RoleCode],[RoleName],[MaxPettyCashAllowed]) VALUES (5,'MKT001','EMPLOYEE',10000)
INSERT INTO [dbo].[JobRoles] ([ID],[RoleCode],[RoleName],[MaxPettyCashAllowed]) VALUES (6,'MKT002','MANAGER',15000)
INSERT INTO [dbo].[JobRoles] ([ID],[RoleCode],[RoleName],[MaxPettyCashAllowed]) VALUES (7,'MKT003','MKTHEAD',20000)
INSERT INTO [dbo].[JobRoles] ([ID],[RoleCode],[RoleName],[MaxPettyCashAllowed]) VALUES (8,'MKT004','VICEPRESIDENT',30000)
INSERT INTO [dbo].[JobRoles] ([ID],[RoleCode],[RoleName],[MaxPettyCashAllowed]) VALUES (9,'SALES001','EMPLOYEE',10000)
INSERT INTO [dbo].[JobRoles] ([ID],[RoleCode],[RoleName],[MaxPettyCashAllowed]) VALUES (10,'SALES002','MANAGER',15000)
INSERT INTO [dbo].[JobRoles] ([ID],[RoleCode],[RoleName],[MaxPettyCashAllowed]) VALUES (11,'SALES003','SALESHEAD',20000)
INSERT INTO [dbo].[JobRoles] ([ID],[RoleCode],[RoleName],[MaxPettyCashAllowed]) VALUES (12,'SALES004','VICEPRESIDENT',30000)
INSERT INTO [dbo].[JobRoles] ([ID],[RoleCode],[RoleName],[MaxPettyCashAllowed]) VALUES (13,'FIN001','EMPLOYEE',10000)
INSERT INTO [dbo].[JobRoles] ([ID],[RoleCode],[RoleName],[MaxPettyCashAllowed]) VALUES (14,'FIN002','FINHEAD',20000)
INSERT INTO [dbo].[JobRoles] ([ID],[RoleCode],[RoleName],[MaxPettyCashAllowed]) VALUES (15,'FIN003','VICEPRESIDENT',30000)
INSERT INTO [dbo].[JobRoles] ([ID],[RoleCode],[RoleName],[MaxPettyCashAllowed]) VALUES (16,'PROJ001','EMPLOYEE',10000)
INSERT INTO [dbo].[JobRoles] ([ID],[RoleCode],[RoleName],[MaxPettyCashAllowed]) VALUES (17,'PROJ002','MANAGER',15000)
INSERT INTO [dbo].[JobRoles] ([ID],[RoleCode],[RoleName],[MaxPettyCashAllowed]) VALUES (18,'PROJ003','DELIVERYMGR',20000)
INSERT INTO [dbo].[JobRoles] ([ID],[RoleCode],[RoleName],[MaxPettyCashAllowed]) VALUES (19,'PROJ004','OPSHEAD',25000)
INSERT INTO [dbo].[JobRoles] ([ID],[RoleCode],[RoleName],[MaxPettyCashAllowed]) VALUES (20,'PROJ005','VICEPRESIDENT',30000)
INSERT INTO [dbo].[JobRoles] ([ID],[RoleCode],[RoleName],[MaxPettyCashAllowed]) VALUES (21,'FINCONTR','FINANCECONTROLLER',50000)
SET IDENTITY_INSERT [dbo].[JobRoles] OFF 
GO



SET IDENTITY_INSERT [dbo].[ApprovalStatusTypes] ON 
INSERT INTO [dbo].[ApprovalStatusTypes] ([Id],[Status],[StatusDesc]) VALUES (1,'Pending','Claim in process')
INSERT INTO [dbo].[ApprovalStatusTypes] ([Id],[Status],[StatusDesc]) VALUES (2,'Approved','Claim approved')
INSERT INTO [dbo].[ApprovalStatusTypes] ([Id],[Status],[StatusDesc]) VALUES (3,'Rejected','Claim Rejected')
SET IDENTITY_INSERT [dbo].[ApprovalStatusTypes] OFF 
GO



SET IDENTITY_INSERT [dbo].[Departments] ON 
INSERT INTO [dbo].[Departments] ([Id],[DeptCode],[DeptName],[CostCentreId]) VALUES (1,'HRD','HUMANRESOURCES',1)
INSERT INTO [dbo].[Departments] ([Id],[DeptCode],[DeptName],[CostCentreId]) VALUES (2,'MTG','MARKETING',2)
INSERT INTO [dbo].[Departments] ([Id],[DeptCode],[DeptName],[CostCentreId]) VALUES (3,'SLS','SALES',3)
INSERT INTO [dbo].[Departments] ([Id],[DeptCode],[DeptName],[CostCentreId]) VALUES (4,'FIN','FINANCE',3)
INSERT INTO [dbo].[Departments] ([Id],[DeptCode],[DeptName],[CostCentreId]) VALUES (5,'PRJ','PROJECT',2)
SET IDENTITY_INSERT [dbo].[Departments] OFF 
GO
/* **************************************************** */

/* ROLE*/
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'cb6275b1-3886-4d46-bf94-85130c11b6c7', N'AtominosAdmin', N'ATOMINOSADMIN', N'80e041b7-a4ad-4373-8e61-b013e9a9cfd0')
GO

/* ATOMINOS USER* password is "!Atominos123!" */

INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'd7c75c42-5908-4a3d-881c-936085d41de7', N'Atominos', N'ATOMINOS', N'atominos@gmail.com', N'ATOMINOS@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEN/zK46SbWvW4JlM3Mdp5j6AeUvJYlQSLAIdpZnxr4DoO+zdrDeVmtLYZALGB/0C+Q==', N'Q6XHHSE7HTLUEZWJYDD3JR4MK2LLCGPQ', N'f5fb0540-c09b-4783-8d97-eebaf187e15b', NULL, 0, 0, NULL, 1, 0)
GO

/* USER-assigned-to-ROLE*/
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'd7c75c42-5908-4a3d-881c-936085d41de7', N'cb6275b1-3886-4d46-bf94-85130c11b6c7')
GO


