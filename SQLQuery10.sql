USE [Begin]
GO
/****** Object:  StoredProcedure [dbo].[Practice1]    Script Date: 19/11/2021 09:51:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[Practice1]
AS
BEGIN
SELECT * FROM AGENTS
where WORKING_AREA='Hampshair';
END

EXEC Practice1