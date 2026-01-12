Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC9E335BA8;
	Mon, 12 Jan 2026 14:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768226890; cv=fail; b=GI4LX6Ch3GqU68W9Qp7kWtKNWs8OFXpjzoACeujjXKMG55W6MvlZNArLNmrlWtkDVfKw6aXUrA7Por2pWf9F03tNwrXU6KVH5gu/4Chxo7W+Pt73qRGjlhRnB4iaNJ+MQlkae6xpHV6DNwemWA2uNB84lWKfLx8fRMswP1c+zHE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768226890; c=relaxed/simple;
	bh=BHQqmTOI3KI1cY7cbrKumtmgJKbWesvGprEp97CEVN8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=o1u1MVG+15x8FTdqi9wx4TdxnV96eVjDoduhRM8a7z76jOiH4p8qUDayY0fWh31jxxSwNRzwAVU2tg/etitrqwSL8Jzzf/1pEzPqUwtdl8iLcRifyvnU3XE5er6pGcmNlfIs0GZ02S+314wwZvzYNYJ+4eVIr0b7/bB8pTvHiQ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=KzIn3V9X; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=rigZ6EDI; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="KzIn3V9X";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="rigZ6EDI"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60C6R5Oh2406337;
	Mon, 12 Jan 2026 08:08:03 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=ci1Cx63rVTtion/mMUR2bjoplL9LuW7IpLQkI8dQLfY=; b=
	KzIn3V9X2xgQ3nC/rE7WBniP/hb7lqBhE3sUHBAGtPBP9YHyyJa1kkQgx+TRPj1x
	4K2CmQGHW+favS0OYS5i8VaGq9KHJYLzapDKuIr4YqMAH83hF0hxcVKcTEs/f/Tx
	Eaynr53zllKmRJaq7EZF1KJH2qBgeM54j0vekMLtkE4grAq3gy/52yup2mbW1rQk
	dlu3FJvEFr5Cvoa4PsiVNM4hY8pJPAdml6+oqCbEmzHx3tMiR0237x+o/xhst78C
	Mnt0CKenptX8+ronvCPigU9EUksZtkudjA4ilKchcN7zkn4+hNc4+Iza2YLdCm5E
	P2b+OoezuCnal12IW5+Anw==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11021131.outbound.protection.outlook.com [40.93.194.131])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4bkm2n1r3m-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 12 Jan 2026 08:08:02 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yTaBoRM64xJc9IqUz2DxSLXCg+vcIwK1uzAJRklom/MHtC4AOJZZ+N0t4trrL/fpaYKbYujl9AzP7xK+61sar7RqFWVNYNAmlgbzbJrrEyh6GN4nefTTcGdeDFvaeo60UOKXy4dcwyxJ4eT4cqAX/7INZibpPcXPArqUmXYNviEDay/1lncSp4mtZzGh1Rm4YvnmGTpi3ooQN58GhGEGPOZrGwHiFBYcczMDsfVscUbDR+ebTm6+/WtOn30+DBRvsZcSoOSHHejj+/pg6SkI7K9MS25snBz+CpTeJL59TrT5Ddwoto78VHFtvZaWGwNBep4JiCOq8ux+IEVKLeTTbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ci1Cx63rVTtion/mMUR2bjoplL9LuW7IpLQkI8dQLfY=;
 b=hGovew94RlggCNQaagr/WqbeT9R45RyvIYkzze4JoWKXYb70X9psXK2Ao0ex9llM+JCkd1ToGqoMOlYAuQ9WPHlnvJkPOvijdeqv2FBzNgVVjJR2jLid0rqxAANbjtOx9OeNIjxI0nrMoSQ6QpxZBrbluNo+aCfUNDK7m+ox1yLgU7Hn4J6YSczQM8RhNed4t0MOnUB5CNELhf8tfGMKL1p1SukQwFmG16THMkfU0eIJgOHBIs/tXxm5o9J61k0G+LOnDNeNrw9+vQkckjQp9nvTrnL3kay+zCPGIQM/tmWiBsAExhiBeAcVRyNgIZs6fonsm1iFlkwyHsdnlvBMOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ci1Cx63rVTtion/mMUR2bjoplL9LuW7IpLQkI8dQLfY=;
 b=rigZ6EDI6wlY6cVMPkuOOuTwnvs8UwmavZoM0S1rgQLJy6u02wYA8bVtRQwWHtY5ACQ2lfS55zkJFmnmuqNO5rTgR0HoD3GZAKKkU+TTBmW9wvEAPWj+o1GiQb03q58E0ELpytcbNpDKIOUIPv7rO3EeyICi4q1xBGt2Cz877eM=
Received: from PH8PR21CA0003.namprd21.prod.outlook.com (2603:10b6:510:2ce::14)
 by LV0PR19MB9477.namprd19.prod.outlook.com (2603:10b6:408:325::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 14:08:00 +0000
Received: from CY4PEPF0000FCC1.namprd03.prod.outlook.com
 (2603:10b6:510:2ce:cafe::f0) by PH8PR21CA0003.outlook.office365.com
 (2603:10b6:510:2ce::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.1 via Frontend Transport; Mon,
 12 Jan 2026 14:07:57 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CY4PEPF0000FCC1.mail.protection.outlook.com (10.167.242.103) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.1
 via Frontend Transport; Mon, 12 Jan 2026 14:07:59 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 72D9440654E;
	Mon, 12 Jan 2026 14:07:58 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 6054C82024A;
	Mon, 12 Jan 2026 14:07:58 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: vkoul@kernel.org, broonie@kernel.org, yung-chuan.liao@linux.intel.com
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 1/2] soundwire: Add missing EXPORT for sdw_slave_type
Date: Mon, 12 Jan 2026 14:07:56 +0000
Message-ID: <20260112140758.215799-2-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112140758.215799-1-rf@opensource.cirrus.com>
References: <20260112140758.215799-1-rf@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC1:EE_|LV0PR19MB9477:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 39503b6c-3a6a-4d33-83da-08de51e3fe75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|61400799027|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?o5yI9eOi+jSK/R9eaXmVKwa5RuemCrAGxGJIDlONFuhTmeg2JZz7UIxanHLy?=
 =?us-ascii?Q?PPmWIcTl46s3pNsXJHsf6wHeahdglpywHuwQJ/tGYAKyaGNvR1X8XihOw+Qg?=
 =?us-ascii?Q?iuFfREdP+nzx0jAeGta3pxkijR8TVRuXIciHxOr1nBzNubzLXzBHLZGtSA2C?=
 =?us-ascii?Q?5zf/9wZ/CgBJiJdF4PLgB0vwW9di+c+LUaFmbxU1TrWUnj9+SZJitK+cNzyx?=
 =?us-ascii?Q?Ubd3Ti/P4insoOUB43pp+O7oAL996BCuwSA78gq5WURRqmljmve30AOdsuM6?=
 =?us-ascii?Q?dh4ex49xv+lKZhB8zpmJqCsWyMGSBdIWBTC1hsNJY9iESKa5yVPhhYTVg1XY?=
 =?us-ascii?Q?2L3mw/+JzY9M6LmQ6ixt/Pd+5l0zoGWxdiYSUxnX4bXG7QC1SOS6bhflox9c?=
 =?us-ascii?Q?/6cTcO02PPkEA1rFtk2h75y+uxpaC1fwAm+PHO35WRKIJKhPT+ePGiAlv7Wn?=
 =?us-ascii?Q?FIyw8PUZO3YRcQM3i26wHLiIBGQo7/Dzk1vuPtlJxJfHlLsGlZk5f8FHmPby?=
 =?us-ascii?Q?CPYgRvXdDZEP83G+YUjfypAgYvbvJ1ukYZncy8D2xz3g/+ugQm6gx7ww09V0?=
 =?us-ascii?Q?B9WydeLqoA9IW7DngDbuJm57Lbd3QCYXVC+2lS20VuY0V84nk3yKcvCO1jmx?=
 =?us-ascii?Q?FTsP8pJdYYpnZwYFlX9ZqOI+r4PmvfryaeZaP7XOHBDK2QjUgQCXY2kNIz5k?=
 =?us-ascii?Q?fA8410tei3sPuUOI2spx3o4nsrjYeE9035ZvKOXn5tBs619rNcsH/Ehn0EaM?=
 =?us-ascii?Q?2OotSOY5i7uUXSu92PwabalIGVb7jVZaF5hdC+qn2FIh6MK2btFYuN+ROa7Q?=
 =?us-ascii?Q?bACUuWxLZ7RgQAmdQfKEQiq4/p3iBkwK+0Vlrwx5Z07DhYuSwA5SNKNOjs+L?=
 =?us-ascii?Q?HHCM+Lp5KP9Jvvuo4kN/e6wSHBx57KyuX5spIbqcseVuPtbblhBJT+cfrMBm?=
 =?us-ascii?Q?e/JfacryQ0kPcDzFjO39t4gPyJjQPkmGxZk5tFrwf/ypH40BuI6oL8OfqudE?=
 =?us-ascii?Q?YmHDRwVGLwJ7HeL2qNZU8DIhfoR+Xc4UwhqBbOj90p6wnP/MTZSJwutoSkVV?=
 =?us-ascii?Q?OFEUADOJx+PemrkW7wFJrDlz2MV1rRnfPo5T4I2xsQAIEiIFVCcP+T1I5TuC?=
 =?us-ascii?Q?E/8nwO2Y2nGPFNCIdnJ30Q1XNSYTCbE4n7sLQGJwLD4JBS0g3pmOtKUVQEGD?=
 =?us-ascii?Q?k/XyvGsNDOtoWmhJbnMCRqxs1gZX3eVYWMrNiK72ashYfewjuUF5gUGDjKas?=
 =?us-ascii?Q?aHRX+SD/XLww2e5704XpV/RPW1fMbM1FprJPMaiX7N7APRq7byYUEbb6KYML?=
 =?us-ascii?Q?WXTw5b65U80Ns3RQwyy5E5X8/hUEyh6sHTf0+6mUw9C+Wr5CUdbtr43b9FbP?=
 =?us-ascii?Q?Juqrq9nxzRUKobatyd5LciHp8QTzB6rnD7foHNmJNqYPwsO/u0hK+CQhgD3E?=
 =?us-ascii?Q?+fx/tDjXEgGGhVx9lVzFoOjZ0nSz+qUH029DXTyuBKr8yKf4V4yCtz4uehbq?=
 =?us-ascii?Q?snjCSkVyEHQ2Oj/6EGZqVnuqkeSTXQo3S2nhJJv+lS9V7keEg2JRdaeCGu4U?=
 =?us-ascii?Q?iPjbl1k/fLpjiYPgmWI=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(61400799027)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 14:07:59.8889
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 39503b6c-3a6a-4d33-83da-08de51e3fe75
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CY4PEPF0000FCC1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR19MB9477
X-Proofpoint-GUID: aUqdKx6cyiWfPmOz7nsr1XRmcXWqVDe4
X-Authority-Analysis: v=2.4 cv=JZ2xbEKV c=1 sm=1 tr=0 ts=69650042 cx=c_pps
 a=p09nrIMaU8oQorgrX9pGYA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=w1d2syhTAAAA:8 a=F2PcrE0C7O6NPrfA6FYA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDExNCBTYWx0ZWRfX1yoUByThUOvy
 KNdNyRFPyqo/yiMlGuMuTUCdr9a+aUtmrSccMc1MqfFI5n96bdfQ+XeEwprgK2PG62HyPBq/08E
 /Vx+ZkZ4DeQu4YNSb2UbLyqJ3yRDE11hnpnPuO1agaGm4iuMB7jmaM1UMDGmGo9tqZ2GF5CjkjU
 HTCMlFRHUj+ufHqaUdHOIqX6eB1S1ktO6oHtfkbok04FGflJi5MIPNb8t9MSA3uz2tkiO8wUozF
 2EwMdkSJzk7P7SoVf10xsiSjFAe0Nix4Fi4dBSSaMOqaYVxQYbXAk/hSLltwXb2gK3fBgmIcNoO
 79gDwgV3fiyl6ekzifT4DCEL2wqWVjNI01u2sUwrtp2/HOd0UjM27WCw6h9MCraDJZUa3F8FWqX
 fsIZp64HuFYxJeSA3JphGYfnd/fpF/UrB3Pv9pqWunG38/KjEHKRAmr4ucj2ytL6WJWwcDWmTB4
 CkJW+1/Q34uqp50jf7A==
X-Proofpoint-ORIG-GUID: aUqdKx6cyiWfPmOz7nsr1XRmcXWqVDe4
X-Proofpoint-Spam-Reason: safe

include/sdw_type.h provides the function is_sdw_slave() which
requires sdw_slave_type. But sdw_slave_type was not exported.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 drivers/soundwire/slave.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soundwire/slave.c b/drivers/soundwire/slave.c
index 3d4d00188c26..d933cebad52b 100644
--- a/drivers/soundwire/slave.c
+++ b/drivers/soundwire/slave.c
@@ -23,6 +23,7 @@ const struct device_type sdw_slave_type = {
 	.release =	sdw_slave_release,
 	.uevent =	sdw_slave_uevent,
 };
+EXPORT_SYMBOL_GPL(sdw_slave_type);
 
 int sdw_slave_add(struct sdw_bus *bus,
 		  struct sdw_slave_id *id, struct fwnode_handle *fwnode)
-- 
2.47.3

