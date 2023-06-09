USE [Immersed]
GO
/****** Object:  StoredProcedure [dbo].[DemoAccounts_Update_ExpirationDate]    Script Date: 3/7/2023 2:26:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: <William Chung>
-- Create date: <03/03/2023>
-- Description: <Allow only SysAdmin to extend ExpirationDate>
-- Code Reviewer: <Mackenzie Williams>

-- MODIFIED BY: author
-- MODIFIED DATE: mm/dd/yyyy
-- Code Reviewer: 
-- Note:
-- =============================================


CREATE PROC [dbo].[DemoAccounts_Update_ExpirationDate]
			@Id int
			,@ExpirationDate datetime2

AS

/*

	Declare @Id int = 159
			,@ExpirationDate datetime2 = DATEADD(dd,30,getutcdate())
			
	Execute [dbo].[DemoAccounts_Update_ExpirationDate]
			@Id
			,@ExpirationDate
			

	--Declare @Id int = 159
	Execute dbo.DemoAccounts_SelectById @Id

*/

BEGIN


	UPDATE dbo.DemoAccounts
	SET
		[ExpirationDate] = @ExpirationDate
		
	Where Id = @Id
END 
GO
