Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 869D5238C09
	for <linux-sound@vger.kernel.org>; Mon, 23 Jun 2025 09:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750672078; cv=fail; b=Ejd7zgPT1rtnupQx5mfNBuxH794KgvHvr8KIi3W64ZiFLNrwoaFWrkIfZ/oO8eFmZRDjXO0XArPGYkLRg5l9dYIVcsfN5gooQK16CmQzodmFt467SI8N2oNrEGI47gvQjjdCL/ZdNvsX0Yv7oSJUeIoy+TBjABK7wIL1HNyM+do=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750672078; c=relaxed/simple;
	bh=B3GhPbNH9KR2teMbhBfdvr66K0L7GVUuDdlDuPoOYI8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XaVW5zL8bfUuCVn5gxGuqt37Iu8uL042CFkX8YDlRwlV+yc5v0gc4unWnGQroHynfoanduZ+HL7Miyfo7UOW0rD8p3d9yNe18ZHqn81S2jZmHY3wqjyjRe9K/KRYzkLyYgAKdKuWePP8+4v/0iBXLkIN445/3dLiJDA4sy7VZMY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Suh/fWlX; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=klDp9by+; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Suh/fWlX";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="klDp9by+"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N4SIfl020023;
	Mon, 23 Jun 2025 04:47:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=QN7/pTkoW9e7zBr4jh0zWn3fMNTYgtOqwd4mXZ0xYak=; b=
	Suh/fWlX5XgTv0l8uFK2vQPbB5Ju9y2ccjMpZw7QF07jPGaog6JgaIQWvOwtOJ2w
	Obdzd0/kP7jB0V9wedTcPcoC4+j3ZEu7lPLEccf68ZcKos2bRf1l8bLrqKqpLTL2
	j8OWQNOewK4xnZa60xxX8XLZtvIOmmh4nrsDVjqypfpi1kmVLuaSlb1zKOGPBO6A
	Z/D6ZJBF/oDLzSSuaSIENkfDRKh29qeL6jk74Eb1Kq0BQC+gqfhJGVCgUwGSunLx
	AQ1B8oUKpCcAFXs8O86ie2qvuXhB1mwcV1n4eev9W02m1pSmhfHLU/ng387oG++3
	NY+wDtFSZ94jW6n+YaXn/A==
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2134.outbound.protection.outlook.com [40.107.244.134])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 47enk9gt8e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Jun 2025 04:47:28 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FqLhVSL/61v/UqlrIRcU7g9GGXr/1toJfioV8iZGuEsWy9We8DZ7Izh0DJpmuDCpNXra0TgpUHZphfv3GjFtyVNlwsLtqzvWXLD+tQsIQSnAzKezMYa4UhjnHuCnbQBK4669kdQ7pDIc/qjferctdZzVVfBvlR5bCeYzbA8S7cumZu3ngUx8nzJF178fR+D9xMD+lj5JVBCBnZ7gVhmacb8FfuAJoeXZSmVCYOelN9Myr9Kh+7j6ybqU7sJXeU5sFYQ+NtkjRkzdvm3r32m6nb2SNfoO6SuDpqn4PabSCbDVjj2KkcIoYMTpZtnVPNiE08pD0j3YGW1fLhjBfql79Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QN7/pTkoW9e7zBr4jh0zWn3fMNTYgtOqwd4mXZ0xYak=;
 b=doILJhk/D0aEKlOGapzQYtbFQ44eEJ7q60ZEEO5gNAO+KQTCvOV5LeEj/3Legu6zn36nc10ZPXsA0w1KEh7PZhKNPEz/+MEYxdPHDOYnKEXx9707sWfvftLHb3ncq1fNoNAvfdjDc5HjqO4CPRPFoJ/aBWDhNWMmHsBiK4NpGtfi86SNB2VlMfdKtXenUZDil6QNhg82JEzMUNK7gShENhTidkxQuyOq8QyC0pzG7AhdbeUMT689DxosdkyN9N7Xrj99oCfWn7wq69WOSHWgw/oSIDp7ocuspegSjBc+gAqdga0ErQ2MDTP8nfzR4CFkvfLiCHlPB79aoOTgkhfd8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QN7/pTkoW9e7zBr4jh0zWn3fMNTYgtOqwd4mXZ0xYak=;
 b=klDp9by+596s0+nf2VGhyB0jWc+M0L45lVS2HCd49t5TVW4SW5vv02pxEyEakt3ZzBA8V9sbr3JXwOl3WdFcf0lJAU5joNuDiO6TAWjxCrMzApDHJ4M9z4AsknyQTR4PK6DS+v+Pw8OiPYpnGHe6Dbo9JdUUrZZt+QCWe8GKgX0=
Received: from SJ0PR03CA0010.namprd03.prod.outlook.com (2603:10b6:a03:33a::15)
 by DM6PR19MB4041.namprd19.prod.outlook.com (2603:10b6:5:229::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.13; Mon, 23 Jun
 2025 09:47:24 +0000
Received: from SJ5PEPF000001EC.namprd05.prod.outlook.com
 (2603:10b6:a03:33a:cafe::d5) by SJ0PR03CA0010.outlook.office365.com
 (2603:10b6:a03:33a::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.29 via Frontend Transport; Mon,
 23 Jun 2025 09:47:24 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ5PEPF000001EC.mail.protection.outlook.com (10.167.242.200) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.14
 via Frontend Transport; Mon, 23 Jun 2025 09:47:23 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id D002C406556;
	Mon, 23 Jun 2025 09:47:20 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id A85F3822560;
	Mon, 23 Jun 2025 09:47:20 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        patches@opensource.cirrus.com, linux-sound@vger.kernel.org
Subject: [PATCH v2 5/7] ASoC: SDCA: Add flag for unused IRQs
Date: Mon, 23 Jun 2025 10:47:14 +0100
Message-Id: <20250623094716.1874443-6-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250623094716.1874443-1-ckeepax@opensource.cirrus.com>
References: <20250623094716.1874443-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EC:EE_|DM6PR19MB4041:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 8ac06cc4-380b-44b6-3026-08ddb23af4df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|61400799027|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/uOQHJ2vG3jsKDeYbSxoTs40Se/Vul8SGJcbBFy5Oxq+5dZ2ZX79f3f8OeRa?=
 =?us-ascii?Q?b+LuWsuxbUnO66WS95DJn/xWSxJD2auA31mT4kubTzyN15uHZfiBcNVWmuMX?=
 =?us-ascii?Q?IJkyHqlxaz6gRXDYJld6hftqwOmr1Ep1F/XVoQQGPSyN+BqF/Q7tHAzEEPOj?=
 =?us-ascii?Q?BEqqgjz0RAjAthcQN0CgcaBQwiUKUeFsnj6FeDznrJIcvgcfuBqTxW6l9uwI?=
 =?us-ascii?Q?QBO8XnZMFFcJaNHiiADlDHry4hMbUgG8OlxDFkn4k+p4unMfQDwbkfY9Jn1b?=
 =?us-ascii?Q?RUJ2UQhVtppw0rsfcMzmGd9MVT4MTG6FxuFb/HsZr3Ij9pmWsmMteyrJeTDA?=
 =?us-ascii?Q?rBfyLZcLbW0Gu5C5YRGhH6OJC65T/+HN0Rj8uoEmbMW6LXDwWdYLdPuUBcQE?=
 =?us-ascii?Q?VsWe/1YKzpnwtNbAyXMMJyW2CK/Y3/gTGlLmSIjpIr233CpOcgnqjBQj77Me?=
 =?us-ascii?Q?2NqZ39owN/7ldB4kRGo+GRuHsjNqWUSI2m8lt2WHW6xNZQL3qfJfiAv+3HSD?=
 =?us-ascii?Q?w1PYprfw+ByXim82xFaM7LG8NymGGqXIGhE2ufVhNVQJxa2NRtGb20KRG6o6?=
 =?us-ascii?Q?B/1IvVAZkhVYD2OxJWL5NAurFHxKBMJ8cgPEKFS8X27peb81LNwJZ0av1KhS?=
 =?us-ascii?Q?B0JEsXhhirRtpCE4N4HYGnaqzYr7eGdy/7odzIuI3YcgkO+Y18iPpO5NGCo8?=
 =?us-ascii?Q?9E2llnw6qsJYSp5Mz7/8+yQfja19QTxFDhTRGXlbDt2wdP6CoL7o9kmKPYHK?=
 =?us-ascii?Q?BnZrws6cXXkxcHbm0gc4ADkfFip3IxcXfOWjPws107gTexXAuiKHulPVkipA?=
 =?us-ascii?Q?Bl+QHPPPHspRNo87LwUD60fXr9GclUaq27bgLd0CRoCju7Ay8cGNKdpC9eAU?=
 =?us-ascii?Q?XiD+lKgbuS6suhTBt57NhtCOiwVScFcO6/IsWCfuDhaMK9bS2G9GHIozmKZD?=
 =?us-ascii?Q?MRmu/UH1z3ATQs+wbDFiDvEKXu89vaRL8bFL0kbw0aR8I4qTFICIC5Ye9G9y?=
 =?us-ascii?Q?y+51WDzo3r/ZF6rqGYj4DnEN+c2MhSX7OASVpcdXiTMRgcU4NxImULWa01OB?=
 =?us-ascii?Q?ImxhrsteV5RcIe+3eYW+LPIkjwfVrKAKuMnAbqT+9bBGaNWhUl8NcGj3IaVR?=
 =?us-ascii?Q?GwUdqJXpEAqH5wBIZDZ/6HjZbT9YpBpDN6sGcOgkMZVwT0GChgnXM0t7b+ld?=
 =?us-ascii?Q?7jqxH7A0ZD0yIsbpC91rhklhfMXPy0jQfsI6POCVljw7c240x3OO/LE6tuBF?=
 =?us-ascii?Q?Ht14PDJVtIBbSgRIfRmps1ReIQZBgOxrExKZlOULaZLEKo61NqOC0Os+rCRh?=
 =?us-ascii?Q?noY47AlRri5xmWxo8zyituyVmS6k9Rlnpuc2ZVN2kBf9EvdWpmoCtJiypBhZ?=
 =?us-ascii?Q?xw4/bABEvoBzqbFq+a1vtLOBhzWb+P2uMggU/KWhF6q4sti3zFfz+mFmXNu9?=
 =?us-ascii?Q?ubjnLhJw9oFtNUHMjY1s/LwYxcIAq1ivVjcAMt4BQmLIZRxz/cF8AAzaYW6F?=
 =?us-ascii?Q?d557V9FnLziBD74DC7sdZLduDt8xe0wZ4aBG?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(61400799027)(376014)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 09:47:23.9207
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ac06cc4-380b-44b6-3026-08ddb23af4df
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001EC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR19MB4041
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA1NyBTYWx0ZWRfX5YOJJnvHYglx 0WZQ43kq+Egrkw+LADkVcYgR+gWv1pm4wMauI+mVzYlAawO5hLNzk1kLD64uTr4cH4OA/MAA2f1 HR5DwFGryOoiv/cTK1K2jmsyhvZOkD0FEMQglS1ID8OAptuvko0e3h6uCIl1vtSbm2wOcTNsTKW
 TyKwuV66iHKk6rHAEpkTtw2IuoW2kB3flUABK1anjP3ZdNSgvqZd0e673nrMVB/wEMojm7QDHDf Q6rDGloy6Vs/l0SmMCtp/5ipEaUzUumY9eqqTis8RtKjIX8pvTnNvlVm1CSSuezbcLQDIhrZ9DY rOaDByM5QIJk+MdLsIpffVyTUgX3+k+TixlYht6+vrjqosJ6b+nzBHxVimZJDBj5mjhxoPtUfVW
 LeUG55a/D2ldaW4ixbYfvZlwXujjQ7d6OjfAXteNdmL6vFm7zg0athCo7uQpdn8uxu2qy83f
X-Authority-Analysis: v=2.4 cv=da+A3WXe c=1 sm=1 tr=0 ts=685922b0 cx=c_pps a=GDrhuTzPiPrUrIysEZmwqw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=6IFa9wvqVegA:10
 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=QyXUC8HyAAAA:8 a=w1d2syhTAAAA:8 a=AM9GnGaWrZfCuFnm-nwA:9
X-Proofpoint-ORIG-GUID: q-MjQexwq04ODlHBrD-4OiaCka2Inxcq
X-Proofpoint-GUID: q-MjQexwq04ODlHBrD-4OiaCka2Inxcq
X-Proofpoint-Spam-Reason: safe

Zero is a valid SDCA IRQ interrupt position so add a special value to
indicate that the IRQ is not used.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v1.

 include/sound/sdca_function.h   | 2 ++
 sound/soc/sdca/sdca_functions.c | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/include/sound/sdca_function.h b/include/sound/sdca_function.h
index e5166583d2581..f208d8f03db4e 100644
--- a/include/sound/sdca_function.h
+++ b/include/sound/sdca_function.h
@@ -16,6 +16,8 @@ struct device;
 struct sdca_entity;
 struct sdca_function_desc;
 
+#define SDCA_NO_INTERRUPT -1
+
 /*
  * The addressing space for SDCA relies on 7 bits for Entities, so a
  * maximum of 128 Entities per function can be represented.
diff --git a/sound/soc/sdca/sdca_functions.c b/sound/soc/sdca/sdca_functions.c
index 64ac264438907..3afe9a24e4e45 100644
--- a/sound/soc/sdca/sdca_functions.c
+++ b/sound/soc/sdca/sdca_functions.c
@@ -911,6 +911,8 @@ static int find_sdca_entity_control(struct device *dev, struct sdca_entity *enti
 				       &tmp);
 	if (!ret)
 		control->interrupt_position = tmp;
+	else
+		control->interrupt_position = SDCA_NO_INTERRUPT;
 
 	control->label = find_sdca_control_label(dev, entity, control);
 	if (!control->label)
-- 
2.39.5

