Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE4DF3AF67C;
	Tue,  7 Apr 2026 12:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775565286; cv=fail; b=kUmdau5mLWsoyyWyx2PB4ecwysgLguZl2myd6rro2k6/aep2B6xf8g9nfzPO0UFkeeU1n+Y+4NnHV5XoLaiDInpRgOcNlMADG2QPq0+/sqMGOQd/wsg5SNxp3/Y/+/CrnJ619L6LfNT8wcFC8NXJZBr9zBnFZyaoaUcMGaGUf1I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775565286; c=relaxed/simple;
	bh=1odZaHtVxXK6sKru5fPH4lKAsSMmQWvVOhb6T2twq0I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=HsVcLEfBVhq1cw8dE/imWiTHeOb6iulTfUzjRoKwFaHyGZGHrTdpVSJMNhFZ9fWkiIZM6PlJ6uQ5nR8gXvFHYMl/o4A3stu9gmfSlDtNnRDNBIedzxPNNKaMGfjqiOroe6wqaTQ3iQljoaWz1rdYRipcFEQcZCy9ljxLMhUqKZQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=f8YzFCJu; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=l7RPpP5s; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="f8YzFCJu";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="l7RPpP5s"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6375d4GN2167846;
	Tue, 7 Apr 2026 07:34:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=H//6v/+8E8osSHVP
	gC7tDbtC6jwHy5RZ4UK2ztbVY2o=; b=f8YzFCJu3DkkeSucl5gNhQwoCo87lUHJ
	TPfRxIt9eP95ccbgSjMp4JCB9aEkvuYrVgZWT0mYXxMART0K10EtOi9suwnh18gj
	TzEMm96Na3Xr88beoKGH7z88quiWbgvhfceWUx3QXF9u4kLp/zczN/0aGca+igsL
	gpVHZaVqc+avWKPgqv72FDObiHKjLibaVnHrabOWE0hYvI8uXRSbxbIeJxOS4mFd
	6Fhu4VKCCiWynGCHDX5gTHqd2BoSO78WrYM6fta9F9DHJ7Odg5p60Qc2tM5nUHiB
	GBG0ZcAJwfRUa5KWlJsY1irHVMUEhUsjSZHwfsabJ6hrVlCGZkVpcw==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11022133.outbound.protection.outlook.com [40.107.200.133])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4dcmr7gqpc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 07 Apr 2026 07:34:19 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L93GtZ46QZbmBcDxK33aTM9mPvb8NGhr+Pcw9TIdIIMTBPV688uPysY3813yo9NobX784HaoktewteOhWCduo8dJweggnfnGyUYkAnXwTOUk/aBzu4GcjBTl5uVLZVGkPnj5SDk4Uyd7Kk2NHPYdPFs4Umvpjn/gNRMfHL2ALc9E99STk4xTVozupBdC0rbK37ck/UgICMv5GmTbtxY+SVxX+3axBl3irZUWwMnTulAtUKYWyI+N+X83SNBYVsAHYokd+N0OenWbNc8+yT5lX9YcT3LSp2Iy87MZyy5oaTN7KpY/lOdETtitcsmW6Jwt2KlSlcxPIPhx5jZhVuggsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H//6v/+8E8osSHVPgC7tDbtC6jwHy5RZ4UK2ztbVY2o=;
 b=tKNGrzwBoEc/q3ErGUI0ytcTOqFyQ7Mi7L4w2f9EY+DlZLAWqP0oeVvCk1H+G8m7qDetFfCaR+z1JRetZYv8KW/UWggHHoSiMo86ACYGkykL1nBkIbYKx42lrMXnFy3bU9NdQm3KvSaupeoY0m1FYWxR3OG4krKx25hmu0PkfAfRVl8fg8cOinXGiSegx0hESBIldBTgV21fYT9h4wDSWXf8wcsCaKJU9Jk80Madvl+Cz+ZlhF1TEbY8PS+aRFpZO3yiupS5O7gVn8bDrQvCHmhfYRIiU0r5WpsE2WFPCWIleCYivMnjdlPjVgVICOkoOLRcI6QWQhaoYSFcyMiNEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H//6v/+8E8osSHVPgC7tDbtC6jwHy5RZ4UK2ztbVY2o=;
 b=l7RPpP5sz4lig3OjFSxD2H41HPxKSzTiITQumJWdW5V6MDuY82GLgRWfZY77CTlUR3kbbM+kQjhfc1PrqgHret7UweHuEbtke2nNDllhMag1Hz1eiwvMM2ZGW3WQXbjvhw1jQYXBar08HkXbOvAuxiiATYWOxc+ES3fypAjtGDU=
Received: from DSSP221CA0003.NAMP221.PROD.OUTLOOK.COM (2603:10b6:8:3d5::15) by
 DS4PR19MB9148.namprd19.prod.outlook.com (2603:10b6:8:2aa::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.19; Tue, 7 Apr 2026 12:34:16 +0000
Received: from DS1PEPF00017090.namprd03.prod.outlook.com
 (2603:10b6:8:3d5:cafe::7b) by DSSP221CA0003.outlook.office365.com
 (2603:10b6:8:3d5::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.33 via Frontend Transport; Tue,
 7 Apr 2026 12:34:20 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS1PEPF00017090.mail.protection.outlook.com (10.167.17.132) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.17
 via Frontend Transport; Tue, 7 Apr 2026 12:34:15 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 83FC7406540;
	Tue,  7 Apr 2026 12:34:14 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 6289982024A;
	Tue,  7 Apr 2026 12:34:14 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: vkoul@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH] soundwire: intel_auxdevice: Add cs42l43b to wake_capable_list
Date: Tue,  7 Apr 2026 13:34:10 +0100
Message-ID: <20260407123410.2326606-1-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF00017090:EE_|DS4PR19MB9148:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 0048f9cf-33c2-40f3-9729-08de94a1fb6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|82310400026|61400799027|18002099003|56012099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	DE6jjg7x6J/m4yAYBuZV2fDuckkk9sx0QCQa9e6/XTelLF8feR32HscxoXn7CEmOX3HFKZwab41uLAOpNS6foiKpsnAdC6MRJmehd/RM13yI45n5dc22cvW48yaH5OTdQq0rtfeuzBON7eA3+Uv4PtaJEHWvg/c97N1BS8neZ70spvmqkdeSRnaO5Ffd/YTaajadvfX/BSC/eDEIsCGuG81RJ49I4I535X1auubIEN7E9EF1UpAvUf8Kvtb1GzEfwTpe5ARQBXitLTP+3JZZD7BiS2dYPycD71JipfFXoi9oauk0TdwlyDheDRR9L57NhPC87Agzn2RYzWyVmH6W78mOnU+dyVwIqBFAm/D+Jm9mW1p717KXq+k3enNsVoCK8Tskl4tvMY7/Y5o0bIYz/Oh9qLWKlRUb/dY5GcwoGiMkFxWVqUzs1QQbqDqooC5A/+20b/nlSxfEeRsumWll5BqcbjoJzd7VkgvB2xrLzY1C7C70ZPniFdTpB7aNlkdRHG9ySvV3fgQxrxLDzLQpGLz0ivUQHcuiQqudNKHYTe5BO0B5rxbKluXk78047x7H84RLFBjXmBRMcagBv2vlP7fXlrlMLVbF4UBoHtY62n/UFcTrt9V9BOIPyugs2cPcbzwMLRzJJkC5sOHDZGpvzed1cPDvzslcnazBHZty2O4KKjnnWrF+FC0lU4ZtZAHg5Ttx1ZSpYmyReZLFm4VQXVG2ab5KDmOAY1uVlZ1aNpAP9nWAIA3kOhxJi6V/T4QhncRxte+rmUtGRTqoJXMTng==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(61400799027)(18002099003)(56012099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	WwDeEhlHdspXcQ1gmVBq2DRASji/acr4IOd8NWRKsm1lffNh75CBE6dxHaPRnZ9wsoLVcCzNIly61puIYrXl3SKB9uOicvTPnR4RT0FWz6/ETSP5Twuwnz4FKoPuCXT6c8+I5TCJQ7FpegGPf1uTc5ljJHz9drw95dvmPzUfwi8dLBmR3phv5GEu0gUk7U1PFT6Gqn1PemvWRgxv26eOYQ/2LATM1JgOwGnhiLr+IVZKdGPQqPIUYE4uqqadvvH92o7aCz7ZeqvhSsrgo8FpFSa/8WOs/exYIzjzl8Z5PdbZWOsv8RTS4thjXbIVjdjoA47KNnm/+MEEr2d3/tBGqSKWPRvagscxPEdRBbLMn3AWNoRZ2Re6FXSvU0m8eLWzLlP+h+nHpEzKABGPM0joyuBXapPZ9n+j+PwgGWF9gLecBuZYB6HDVWq2jZqfdPhq
X-Exchange-RoutingPolicyChecked:
	AwVxazl5CbLwmyJMD8fhXswLJIKsq/Q2BO8x1hDbrZu54zY07j5GiiSJpD5lnbnjG6dFclxetTvrnjU8YR1HePIgJfukAZum02RDo0hmvHeeegpWvIJucIqIo9NhDH8sV4HsT44smBdAQxeW54rUHp2QkzprwK1HQFaOthKVxPKgVt2VMe7M3BvLhTOLhsaNdJkBip2GNVxZ7K9bOgRxErLOZdFu4S10Fleldwe/hlbLvJRbVub/OUX9WC0bWHNis56I+zz6+2gWk+IDidHIkzyt33YWtcOnlxM1C3lFU2XTvtsHE6D4qgMmh9hvjXbqXd3CpEG+2li6e0TRmIrOfQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2026 12:34:15.9231
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0048f9cf-33c2-40f3-9729-08de94a1fb6d
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DS1PEPF00017090.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR19MB9148
X-Authority-Analysis: v=2.4 cv=LMhWhpW9 c=1 sm=1 tr=0 ts=69d4f9cb cx=c_pps
 a=zIlxSkAlgAN8/7mUobs3rA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=A5OVakUREuEA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=kFP-keo1MtmMe6x_3zYA:9
X-Proofpoint-GUID: __-Y39abku4_akOn7ShLLlqW73l7lBws
X-Proofpoint-ORIG-GUID: __-Y39abku4_akOn7ShLLlqW73l7lBws
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDExNyBTYWx0ZWRfXwInWlW2druXy
 wN0xO/x7kqLulnxEyXfC35LGRX18lDlpvH9oHLNWq8HG7qn138jM87jcGbKRqT7PlzZtnUuEWfx
 Q/z0iJgwEocK/tQa7Dp3jidNFGafvv7xEFfIQTWSmMDLIw3Mggq13CGIThFZUun2UbMMKG51nYi
 CeKT98d3SWTfIhqeLkUiuEi2iLTWRZE9RooNSAffS6YmPn+o90iEB1/uR44wcTCKc8RflnDb0Ai
 bACkpUuSaf/i9IkmhNiUoMKI7ESwISwWROAN5y9PgzfQNqAMeDdiRtSXgD9oEITbSfc1Pj4ItDV
 jvmOWMwGTAg2m6MrRT3fLtLkystc8neYYTAwS4sosRWi8HnH0FnIuzO5QF6V0sq5dplGzZ7K6dH
 73JymibfL6yMgaVjU01RhESysGpGHIwGLa7xx6xTwSrYO/UUmcKvccSaKre3mY2RDcip3yvHTYS
 mlRVfqJZ+/iEp2nRlrw==
X-Proofpoint-Spam-Reason: safe

Add cs42l43b to the wake_capable_list because it can generate jack
events whilst the bus is stopped.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 drivers/soundwire/intel_auxdevice.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soundwire/intel_auxdevice.c b/drivers/soundwire/intel_auxdevice.c
index 913e95207ee1a..7a9d023dd9947 100644
--- a/drivers/soundwire/intel_auxdevice.c
+++ b/drivers/soundwire/intel_auxdevice.c
@@ -51,6 +51,7 @@ struct wake_capable_part {
 };
 
 static struct wake_capable_part wake_capable_list[] = {
+	{0x01fa, 0x2A3B},
 	{0x01fa, 0x4243},
 	{0x01fa, 0x4245},
 	{0x01fa, 0x4249},
-- 
2.47.3

