Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20FAA3B6370;
	Mon, 20 Jul 2026 09:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784541487; cv=fail; b=C+YjVVgNOwEzuK1WLNvdlzWuC24migU+/r6ONqTvRWTxPafIy1QMy+JqnWQLDrZZkZF6mKOrX0+zoa3ENMfLgiBUyBBKTC1WbMQfo8TfHJDMeGZMlBBVheSM4cAua+CfvO3qNy3BaW41hOigb+NxTgPP3aWuqwz9MGCxR/vE8uY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784541487; c=relaxed/simple;
	bh=er6UFK9uWA6RaekPVqJ850UqpwJQTBaZgIy9F8Nt/cw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=BCPro10M9Ib6bvFvdOcNafhsb0Y+hY3Rl/rFboilVnSaFXAtvsZ8Z2VYE8NVAqkKJhgtUOu6q4iGFbkIC6px6NvuvG9u/Iz6U55Ak/4l3Td+Qdrsn3Y873zXQe1xY/o8DpupUHW2UIuUCiqQ2Khozb/OljtH3/nYCYZbUrHLFJ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=KTHAUueu; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=WqCHqwTV; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="KTHAUueu";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="WqCHqwTV"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66K5Ml7D3673241;
	Mon, 20 Jul 2026 04:57:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=5FAxVId8kcA44GNW
	g95YSeAtl0qZksaMpwElFF1pB6w=; b=KTHAUueuKmehb5+FpYA/CC4MxxEzDQLA
	DTsjywHZqFT+PZcBvzLuntiEcX9nKNxaODVxy7vxwRJ3PJf+XOdzRRvHrJg6lDA2
	G2kUUMhADpx4h95IPM/+QzAbirjeVE4ZjJtA76WItrnhPMMvsK9/M5wspgKVGbve
	WI9JEaaUokdEKhyJVGjToIvtPs3yCponm/oT0b9n+aNI21DNusIoppA34qZYTbC7
	+KjFWnv9AcJziwY8XjRANSyN0NEBSP124v1rCZD0dsFIz28tuBjXdNffWAi/8AaA
	N01ZhSG9Vw4NpZUIYfTUEs7zorOMt9gOxu9/cJWhli4Wp9gHRINVgQ==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11020130.outbound.protection.outlook.com [52.101.193.130])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4fg6vyj8bu-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 20 Jul 2026 04:57:52 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kqpJnwNa1wYakA+YMppfaywT5lJeJIIKzRUSlrQlpFclCCmJEPj8SNC9que112TFB6dXmVuVT+QctF4fn41AUYotVjibOfAzFzBv0aD7B3K9kSyNB1Hh9lK0LX067OesB6eFe+5Yabr7bsAihz0Iz1vHl0ByKEWuAJT38P1P+u63up1KsPvL0xY693TC0CIHalzPBNMtDK1It10/NJsGMaVYNHbSWSsQ9HGHkW9oHcXPSx7pYDNOKVC4vwYCumZbAO2OHrcKubvz7xkojwPzhjJ4KYn7Wy2rGPUOVX3KElFA8+NCtNmFiKONBIh3ncnP705iwca7+gEzL2jG4mxanA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5FAxVId8kcA44GNWg95YSeAtl0qZksaMpwElFF1pB6w=;
 b=rMAXXbZRPhwiQij8hnS1mEqacSHOaT53zlfrIIZYFRjT84xySkg1alCXrwA2iCZkcHBhknYqeiZEWiddoCOqNAnk70yU9IRdT9ZaMHr5fYEgt58UGXhWDNiorZHUmFjL79HZpD8eaodp7wvTtHdwYEIwCSU7EYi/A6XxYHIh8Z6XKaIjoXeKoKlWcpPtfxrBMiporCUIykPFERuuxmd9V6HBFgHUv8ZP23l9OBFxBnIWQv2dMLJI9oyAd5DqVshsMeNwR9gxH+tvH5h8o4M6RASaLLmoxE+qLd9u53hH6XXRO9hf36YmuhHF8Bq+Ns3oZO9pRJgZ4NUTYff8QnmizQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5FAxVId8kcA44GNWg95YSeAtl0qZksaMpwElFF1pB6w=;
 b=WqCHqwTVo9pyqqai5Mpnfw+eT3TZ+NJ5vm6J50PI3G0D+ExPg1xpyH5MDMjmcPdNIl2XKIQ5hNeWQKEnyIuPGw1JVYC/Hr1fNBEAyWkDqmP5cJ0FbpwW8vo6+cCiUS66m6I5ZI66x+xxOJSjaOCh5Ih6GOJX+0IG85IEE3UCI5o=
Received: from SJ0PR05CA0182.namprd05.prod.outlook.com (2603:10b6:a03:330::7)
 by LV3PR19MB8666.namprd19.prod.outlook.com (2603:10b6:408:26d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.15; Mon, 20 Jul
 2026 09:57:49 +0000
Received: from SJ1PEPF00002327.namprd03.prod.outlook.com
 (2603:10b6:a03:330:cafe::4f) by SJ0PR05CA0182.outlook.office365.com
 (2603:10b6:a03:330::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.3 via Frontend Transport; Mon, 20
 Jul 2026 09:57:49 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF00002327.mail.protection.outlook.com (10.167.242.90) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.5
 via Frontend Transport; Mon, 20 Jul 2026 09:57:48 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id EE03D406541;
	Mon, 20 Jul 2026 09:57:46 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id DF7A3820244;
	Mon, 20 Jul 2026 09:57:46 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: vkoul@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH] soundwire: dmi-quirks: Disable ghost Realtek on Asus Zenbook Duo
Date: Mon, 20 Jul 2026 10:57:41 +0100
Message-ID: <20260720095741.3592825-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002327:EE_|LV3PR19MB8666:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 8082678c-3f57-4d8c-3cb0-08dee6455b4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|82310400026|23010399003|376014|36860700016|18002099003|16102099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	n5K/6HH6JoQFvdCueq25roAPv2CY+6FJWG79IaNH05AcyVd82GCWwrJSdCVbWgwHeIUDMvpJi/0klaB/SrzaIoZHoJxY15SfSYoRVo4Q8nam+PDsDxkKmHmKBukCCAOsViPUNpjq2KBVUHDeZBip2A8Q4sXc9B5dzhlC8bHYkCclFAZPa5hAkTEGVCLtQRlTeWridIjtJwWS33/HBdywxjrlpX/fi5sy+mRzFb0Mv5CLvtzsriy5T3y/sZuerloztP/R4J7rqfOIq5yKUQIAeKFhbPRPiFKuSQ/0fzJkX162hvo4CQW66I8q0aUok9Vt1m2YhZRjsnQZIVif2BB4BKwz9/76hJBh4vI9Y1LllvRrM+KK1eIl2wGjj7fXh06SNCzOSYvQitX/PhUoroT2t1fwM9ivAkecw821yhzqH1RirrcBesEtkat8ggm41uhofTtL53yBHnv5TVXH3W8NsYL12BSmQnAuBtvTHq7GgCRCyw/yamxPPhGRiU58QBfGeI7A9POWk2PLTdV3fBa96kDpvVo3BpEdgYYolpHhThMU/TNT5UI/x797AemX2QhR7KrNo5gRhm9GIqYijjs7YnJwlKYHJWINbY97BTAopFvj9TR5FIDPqBjgACV8bzjOaVosE98oyoUNubmREq5bLNFyavrR3o4PHIoZN222xLxIoPEnH/8/5g8wTr1QHAfmC1j7JB/CP5WDARmpqhlxkg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(23010399003)(376014)(36860700016)(18002099003)(16102099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	aN4Yh+fXif0eoaJm5AraC/o9ouDUPII/w31v+b1cO+wMXtgKOnVtuTy6iTSO9BqzOR62hWJR/4RxFMfAKV7w3Tx15Rr4O3+xZkQOyTRoz+Uf+68CTmFVl0mHLgJ4A0GSOQ/mHbacQDM3NLZXsd+18iJwy1YF42jDJCyijBznCrYfYhghdldMPUzFDZrMlfJ602di4qjxyR1L44kB8oScfn8pYvo2yfu1TNKBkMt8VWu6NwKxoQAfbjt1hsFtw7sGPcRk3Ogp6InDrjKjsVO67mJPF25Vt5bQ700/IqTtmwIsiT2mAbQBWx+YKxlIE51/1eEjK0jvhyiPCsPOj9U6uGn4Qy6wUuVHbwSuhT261GRJMsOXLSc9rPbrrg+0dmS1zG4lw29gJta+KAkZMeYd3N+DvjTmcbOD/W9Vn9o7JfVzNgnVr0+XZdUJBI8v/BXq
X-Exchange-RoutingPolicyChecked:
	Ov/294FyavAahlBJK6BLkCgz6ymSJNMIgZrD/qyRlfDg6A20XIcdwGXVqRCDXfH5+pGVNNRC2LhNwN4dPdkCNgBUycbAYFkXKbIM4aL3/qcP7Z3uwPx3uaOzAJqdWCWe3v9x4O8g96pn5g5hnRbjr69VWyfc7KamXRkVNm6nQornUcutAoj04GuinTJYjGtawZ4ujbUiMgfuFigxgGz/fDgeKEXHzlP0+NYqfr4GskeMmtQeXhToUMNVpWIukBcMafMtsCRQozqVgDowze0/iTgFCJQWk+DtIkSiQ2inOP+7N+Jylgw71eVFy0+013vlxZNCADDQg5vpGkIsxN19vA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 09:57:48.8819
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8082678c-3f57-4d8c-3cb0-08dee6455b4d
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF00002327.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR19MB8666
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDEwOSBTYWx0ZWRfX/31TzTNJBGyn
 s3LZe06kkFcL2RJfnwO0mO/EOEqBqYWA48q5RrLnAeYWfqZU+UHlApcDSvqqLwV4VwRseWCXHK+
 A2JXDYNbxx8IqI4baKHS0iuDQVZUxHM=
X-Authority-Analysis: v=2.4 cv=f5l4wuyM c=1 sm=1 tr=0 ts=6a5df121 cx=c_pps
 a=dns+zr8aCb1XxuflM6NUAw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=IfTR_JQngAANcg8gUMQA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDEwOSBTYWx0ZWRfX77a4Gv8FxFHm
 M/t3OEO6Uw7oxK8NUIKsVuiaaQy+e0X/4JXHH7ZRsvnown0eaQG3WWtmE4nCGNy4ERloZoGS6tN
 1DgrVfVMAOSVaxCyA6zbJDxGsNu1jYkzhPcBxH6OLI2ub5gd2HcZCCxXvYxFOoVagabQy4ZVktE
 9zR2I0ZiY8M9TaSh/ZJ1Fzm83TdjYdfyDbzcR+r7A0+CW17OKF84GbEzr2KtgtWgq5/ozEWmtxy
 OJDzj6E+5nNxtQuTGrBRpPaP+sqjWvGUofEeJ++ZtBBp60CKjBig8ppkDzCjzWeTUPd0/JvUi14
 XiG4cKsr9wA//6YxXcKMwi7EN/0TCZScYus5XThdjHzfu4Sy7COpq7HyB+do3KwBvGS3TsvL2WY
 CIyX9HJmTcJEgl+nJ1uPkdkf6Po9ZDaDumZRhIvHMueYnlIG4eIhBLYW0LsVsFKuemRzr2tRTN5
 CreOoWT8IBk7rPaJ1Sg==
X-Proofpoint-ORIG-GUID: dFr3Rg4Ih77J5aOSNoefYoyLKqICDMHZ
X-Proofpoint-GUID: dFr3Rg4Ih77J5aOSNoefYoyLKqICDMHZ
X-Proofpoint-Spam-Reason: safe

The Asus Zenbook Duo also has a Realtek device in the ACPI that
doesn't exist in the physical hardware. This confuses the machine
driver into attempting to create DAI links for the device. Add a
quirk to remove this device.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 drivers/soundwire/dmi-quirks.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/soundwire/dmi-quirks.c b/drivers/soundwire/dmi-quirks.c
index 62cee6e2179da..f738e547a1f30 100644
--- a/drivers/soundwire/dmi-quirks.c
+++ b/drivers/soundwire/dmi-quirks.c
@@ -200,6 +200,13 @@ static const struct dmi_system_id adr_remap_quirk_table[] = {
 		},
 		.driver_data = (void *)ghost_realtek,
 	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "ASUS"),
+			DMI_MATCH(DMI_BOARD_NAME, "UX8407AA"),
+		},
+		.driver_data = (void *)ghost_realtek,
+	},
 	{
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
-- 
2.47.3

