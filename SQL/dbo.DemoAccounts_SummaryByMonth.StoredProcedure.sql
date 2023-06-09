USE [Immersed]
GO
/****** Object:  StoredProcedure [dbo].[DemoAccounts_SummaryByMonth]    Script Date: 3/8/2023 2:00:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: <William Chung>
-- Create date: <02/28/2023>
-- Description: <Inserts into dbo.TrialAccounts table>
-- Code Reviewer: <Mackenzie Williams>

-- MODIFIED BY: author
-- MODIFIED DATE:12/1/2020
-- Code Reviewer:
-- Note:
-- =============================================

CREATE PROC [dbo].[DemoAccounts_SummaryByMonth]
				
AS

/*

EXECUTE dbo.DemoAccounts_SummaryByMonth


*/

BEGIN

	DECLARE @Months TABLE (Month INT)

	INSERT INTO @Months
		(Month)
	SELECT 
		StartMonth = (MONTH(StartDate))
		  
	FROM dbo.DemoAccounts
	WHERE StartDate > DATEADD(MM, -6, GETUTCDATE())

	SELECT
		Month
		,COUNT(*) as Count
	FROM @Months
	GROUP BY Month
	

END
GO
