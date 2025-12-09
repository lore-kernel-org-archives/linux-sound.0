Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A3851DF25F;
	Tue,  9 Dec 2025 10:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765277236; cv=fail; b=kwgmoPcNr69t79oM8i0euTYc/0f+CabfBtKw4WWSTGRnhN0HiEtb2XiOiVL9nU+rM/3ouIK+TLOXkhihRfMJlF7OwQJlDWP+wapIVxKEIqhi5KoxTTAFp6jAMof7LB+t473dye8Z50/M0wCLPn3HqoMhMWi2qssqYoFh+rGtBWM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765277236; c=relaxed/simple;
	bh=NCdjX4sW+ax9KqN6k3SpFE0vHWcMQccejLjdhY5/umI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=b6/m+Ba5JuQYeO1rY2/U0vgpqZqswUDzLWZ1YsoUZoUFNH0mgR0xzet03AoNJO8NxGZx+22cEpN9OcNIkBq719Fr/Bm+tRdDNsPOFRNHSEq7+3TMfLgp1QTMdKKvw14TcC8whcHmhuGuk6nJtZ/mQhll/vLcNrRourbxS1+hHWI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=qPJGtHFy; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=ZtuZrxee; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="qPJGtHFy";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="ZtuZrxee"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B97QBWH431415;
	Tue, 9 Dec 2025 04:47:04 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=udMfh94aSXtm9nk0
	GaG4+kxrZP/DICnVnHcNX68xn0A=; b=qPJGtHFyb3KgOVZQGaBPLqfQv7MOzXmZ
	xFOWf8FRxae1fD8pf5hG4rWzXTOx3RsmkQj6gvd9jmfVZh/LF4a5i3jphjtuzX6j
	emDpE6ToBSmGht13+5beuG4hQ+xftFfCgMIGQjH2R8WP+tq6cE4AYRNvRl9NBr8m
	HqFnMsn3ZvM3woN1ADhpEO7P/OnIr5/KgvEtM2Sqzo5z8fl6C9HXL3nj2Um2uKBe
	KGSbvswKMutaR83uteow73e0VNy2KtUy8/ZvtgABAmZOJGRTbnle8lpxio1WrqoF
	e3AfmtLS1QbFgJfJcs37t7S6A3Q0WYpbReTjhjqELovGkC2Oru7/Ag==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11021133.outbound.protection.outlook.com [40.93.194.133])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4avhskkb28-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 09 Dec 2025 04:47:04 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JXhjTiYzF9iVI1qE7Cgnnm4IVPv1QqwknoV5AlNa3TSSnyFMge+kAkS5u9KnKdOfD5DW6Hguk5r5PhhqrafIRpTKSkkwKfU3VpU8P1TfLMS67VQE+Y7eaHI0r0Cv02v32QpM06PsLTRkkzZo/zkUClxEAxPdXNnYFKfCif9qeTX/GEwjBdeuI8lggAwD8vCGEotrf4z3o5ArzhWX+YShQ75dOArn+EAR3YEKfbeC/dPgUApbfgO51on5ok4BdJD329BAIOePTM3k0P61ux1cDyItFh9wKf7i2NfRPmR/ODQw0RXyYt1YPcnEowGzZexNzQxSN/B5cxAmXWmIN0cgiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=udMfh94aSXtm9nk0GaG4+kxrZP/DICnVnHcNX68xn0A=;
 b=fi3OG+EAaDfy32vntkXY5dvpDUcSzOGgxyJ31TudA5FwKPxaldwpIKf6j6EOQGDCfrF31q9d5BwOyRGW6714gCrhRVSobKXNQvsEODwToCZreGQcUeQ4wcAIIUZteDcLKlNYN6M4GNP57IBhNwD7noGXriJv2hJvIM9kUVdvGqOhk/xZfmo5HRdUW6cSSB4+rPVPT3vPk/nxKWmG7vZruTvsAId4uy1zcU7CT2KxgdJHWoafFY/DQ65unl750gJB9oRLcMjwMP9hgOXms4JG7q0H8D/4yEJKoJ97FoK33OfO/VvIHUg+SH626n8I9+bHNOaWHRerHKFjz6S41BOLQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=udMfh94aSXtm9nk0GaG4+kxrZP/DICnVnHcNX68xn0A=;
 b=ZtuZrxee0GJAUVw1vgHXCPP7rhCGyLHe8BDl+9RAIBmC6EQVAI1n3h5f85yYSW/HTynBs49S4dg72SkZaDfV4JXYutZNVOp750xxqrkR1Ik4es/fazz5w6zolCnveGH3nCpA56lumgn6fVi+FJ23c7Ep6k/e6NoJ4GeJIoy00kA=
Received: from BYAPR07CA0063.namprd07.prod.outlook.com (2603:10b6:a03:60::40)
 by PH7PR19MB7409.namprd19.prod.outlook.com (2603:10b6:510:27f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.6; Tue, 9 Dec
 2025 10:47:00 +0000
Received: from SJ1PEPF00001CDC.namprd05.prod.outlook.com
 (2603:10b6:a03:60:cafe::3a) by BYAPR07CA0063.outlook.office365.com
 (2603:10b6:a03:60::40) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.14 via Frontend Transport; Tue,
 9 Dec 2025 10:46:18 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF00001CDC.mail.protection.outlook.com (10.167.242.4) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.4
 via Frontend Transport; Tue, 9 Dec 2025 10:46:59 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 0D13F406541;
	Tue,  9 Dec 2025 10:46:58 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id EA355820247;
	Tue,  9 Dec 2025 10:46:57 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH] ASoC: cs35l56: Fix incorrect select SND_SOC_CS35L56_CAL_SYSFS_COMMON
Date: Tue,  9 Dec 2025 10:46:57 +0000
Message-ID: <20251209104657.485541-1-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CDC:EE_|PH7PR19MB7409:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: c25539f0-b51b-4a81-02db-08de3710482e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|61400799027|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hEBvjWCSxuzHddyis3M1oeKbcVjYep111qmmc87Xgl792ap1C3JXbLo1MjTx?=
 =?us-ascii?Q?S+z6BTpRram55gR72SpiaIdTjtKUH3oJNyuIDzfZ+rzUf37f8R9wGd7GiA8l?=
 =?us-ascii?Q?aRjl0rlOnG7zg9zzgBGBjAQMOGULruuHHNlLUW/Gu1c+il3JgypmyumzJWTV?=
 =?us-ascii?Q?jhpNk7VQOmvokOwyEFQ9Z13Dk3xkHoogNeqCkSRCUm2NVGOTYhJ8arqTGoOJ?=
 =?us-ascii?Q?RmAKP+2s63pc+bBSNk3lM+XOvembuasJMlkqHHKwOYEHIU9ej0+BHPGbm13B?=
 =?us-ascii?Q?4ZbHRjm4OMFKR5nthqXB1dZYpLOlc4WY9/NTqPao65OHA8ULbslAzRb4czg8?=
 =?us-ascii?Q?ij79xV0JMZZSZFbUWm8IGTiYHT4j9CQugC1QeR0Mb47jOmmjgec+ar4lCyAh?=
 =?us-ascii?Q?o6f5x5jkkxT2FboEC46Excul3ktNITXcNIFEKl3xwSccW+V9sdrCA9lweUI8?=
 =?us-ascii?Q?K3Zoc+EvlntfRLeYr1NX766NXoWZkdoOLT5o6Qs6QEp9bCxeisiW4Bnxy/g5?=
 =?us-ascii?Q?TbZt5KtMkF8lxZTCcMUCjMO5dFcVSPF+6BBzjvVy/76mcVh2vzYCQK8POaQ4?=
 =?us-ascii?Q?yAVeaQFA4VHonYcDCFQ5kfGHem+/w+KFGPzWclCbEcRrC8KiVY+SWddDWAYL?=
 =?us-ascii?Q?1ecZ/k5dhiQU/sYsnlmfj15mp553iVXRbkZYMlGeYCATqk7Rgv446VkRpD71?=
 =?us-ascii?Q?HD4aWsC2pRByifNCj7v9OI4SiExCA7WU0SxP908cPzVusrsR0Q/PyolDM13w?=
 =?us-ascii?Q?Gl/rRoT4fRZkDMs9eL7r1pMQ018r31c2Tbb3OuTwz4uF01TVE7rW1BLfWjT6?=
 =?us-ascii?Q?iOPYp72u2VQdvnx8pf+o1OCBgY04Zsd/WzTNPcQdqzWxxrDNTYd38I85NjQd?=
 =?us-ascii?Q?6Q5JZF/84zCXzNqPhYGhbPASvbDdkTFiEINemaXdq5G0SO+1ujI4pSvW3CXU?=
 =?us-ascii?Q?7gsMgqVUlh9zD/VWHtxWkQCAeRRJAEDcJ2iWf5N5MP+UrhMMLQyVCczezc3e?=
 =?us-ascii?Q?fQwp91cfMbPHDrTDUi+szQhj7k9KSihHp2y1B9STt1H4Ussw8FuFceUlZo05?=
 =?us-ascii?Q?XiXb9Wb7ZFnW+rbQg9jlZ2BJqQrgtsXK+2VW5RdqwwhylPzX5DPIBWH2a9OZ?=
 =?us-ascii?Q?fuMdtUxgoq3amV7dxJM0MwTrGioAfbgwtm5+AbqEam7nwQ9lPJF22bLD0laj?=
 =?us-ascii?Q?6JpvRv1AfD12Yl/kKpGXlDpKe01y3Y1Ok3JEkO2wqD/NxvOe5eMc9KrrGZEx?=
 =?us-ascii?Q?4spqLU1/3CIbRVT9z72z2WLrzd1TDg4UbXvSnE8rBnMdgEDJOX0FZ/FxKrmA?=
 =?us-ascii?Q?Slp/2Mfka4zAVfDZOI2zlO3sfpDLbeWyfkNS86EnRK77fYXde9238qQ2sJjK?=
 =?us-ascii?Q?G85finIAwkirz5hF38l+rcLgOHYl1Nu9s7cBgLs1Uir6/yuu5X4KugB/MVD0?=
 =?us-ascii?Q?6u7G96Onji5jVPSblwwc2Sw9FQMe+DvRJGhc8XQbn9L1MMfsfXXT2cgA8Phx?=
 =?us-ascii?Q?D9WFiehubmyeQFTQijLHCcfSOhouJyrf924U2IwkJPXFKbLKGTY4b6roC43E?=
 =?us-ascii?Q?BY1WF/mhKn7ubawE3zE=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(61400799027)(376014)(13003099007);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 10:46:59.9744
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c25539f0-b51b-4a81-02db-08de3710482e
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF00001CDC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR19MB7409
X-Proofpoint-ORIG-GUID: HDnr88BUxs0qu7vpbiUvCjW379iku73M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA5MDA3NSBTYWx0ZWRfX9oBTsi8+XJkm
 saeNBHAgBR3H29HowM05Ar1DXgOBv2iOyBxBxnFldMBALRxSh5bbWzblPaFId/E2kkiGoqw4S8a
 PJ7mo80YTLWpuIw/zt8izhnix2di3N+6ww0W4fX2DVrVAzcMBOyFolZlxCVC1G1kEKE0N1GWIx0
 yCcY0EerqmtHUDoIKrwxfE5JLF1r9uZ6pvcu6H/I2mmCsDFejBq8pt14Vl1iQAgrnjnFQKsKbXR
 cfWMSuJbKOrkgtzxFdthFeUwgnEN/FkKIXWIjPZrhKZBKgUfALKlb0QxHobXtG97O5YwRIdr64P
 0aeIRtnJjHvOE31sYDmCVt3y7WKJcz3Td3CYLDOGRqqQ99OmCX0UjizPH41KpYneNCGdDRfS+GC
 ExM+Oxygg9FQL+v6LoeAr0ayq5PntQ==
X-Authority-Analysis: v=2.4 cv=DJ6CIiNb c=1 sm=1 tr=0 ts=6937fe28 cx=c_pps
 a=ypmqvA/i/yzbxHxvB85sdw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=JfrnYn6hAAAA:8 a=w1d2syhTAAAA:8
 a=AcWkP3hLEyixq0j2XUUA:9 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-GUID: HDnr88BUxs0qu7vpbiUvCjW379iku73M
X-Proofpoint-Spam-Reason: safe

KConfig SND_SOC_CS35L56_CAL_SET_CTRL must select
SND_SOC_CS35L56_CAL_DEBUGFS_COMMON.

It incorrectly selected SND_SOC_CS35L56_CAL_SYSFS_COMMON.

Fixes: 32172cf3cb54 ("ASoC: cs35l56: Allow restoring factory calibration through ALSA control")
Reported-by: Randy Dunlap <rdunlap@infradead.org>
Link: https://lore.kernel.org/lkml/22b92ddf-6321-41b5-8073-f9c7064d3432@infradead.org/T/#u
Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 6087ebde9523..72ecb1c3d200 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -918,7 +918,7 @@ config SND_SOC_CS35L56_CAL_DEBUGFS
 config SND_SOC_CS35L56_CAL_SET_CTRL
 	bool "CS35L56 ALSA control to restore factory calibration"
 	default N
-	select SND_SOC_CS35L56_CAL_SYSFS_COMMON
+	select SND_SOC_CS35L56_CAL_DEBUGFS_COMMON
 	help
 	  Allow restoring factory calibration data through an ALSA
 	  control. This is only needed on platforms without UEFI or
-- 
2.47.3

