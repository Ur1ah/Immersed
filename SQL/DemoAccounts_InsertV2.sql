USE [Immersed]
GO
/****** Object:  StoredProcedure [dbo].[DemoAccounts_InsertV2]    Script Date: 4/17/2023 4:37:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author: <William Chung>
-- Create date: <03/01/2023>
-- Description: <Creates new Demo Account with updated expiration date>
-- Code Reviewer: <Mackenzie Williams>

-- MODIFIED BY: author
-- MODIFIED DATE: mm/dd/yyyy
-- Code Reviewer: 
-- Note:
-- =============================================

ALTER PROC [dbo].[DemoAccounts_InsertV2]
	@Id int OUTPUT
	,@CreatedBy int

AS

/*
	SELECT *
	FROM dbo.DemoAccounts

	DECLARE  @Id int = 0
			,@CreatedBy int = 268

	EXECUTE dbo.DemoAccounts_InsertV2
			@Id OUTPUT
			,@CreatedBy

	SELECT *
	FROM dbo.DemoAccounts

	DECLARE  @Id int = 
	EXECUTE dbo.DemoAccounts_SelectById @Id

	SELECT * FROM dbo.roles
	SELECT * FROM dbo.UserOrgRoles
*/

BEGIN

	DECLARE @traineeRole INT = 9
		,@orgAdminRole INT = 4
		,@orgTrainerRole INT = 8
		,@demoOrgId INT = 101

	INSERT INTO [dbo].[DemoAccounts]
				(
				 [CreatedBy]
				)
     VALUES		(
				 @CreatedBy
				)
	SET @Id = SCOPE_IDENTITY()

	INSERT INTO UserOrgRoles
		(UserId, RoleId, OrgId)
	VALUES
		(@CreatedBy, @orgAdminRole, @demoOrgId)
		,(@CreatedBy, @orgTrainerRole, @demoOrgId)
		,(@CreatedBy, @traineeRole, @demoOrgId)

END