Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B19CC332919;
	Mon, 15 Dec 2025 15:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765811941; cv=fail; b=EfJTADlDk/usXcnWngD/aae7B50WLtcxSUnzjsn5X67Cq0OpDe7x645QL1LNE4JrznYcv9m+dTETyEa0xNLfcfbHJoX7AymkjqPs0Y80MmWD9ctSQ691DJ8uE4SCwAW/AfXPatq/C8vBGYU+Rdzoagc8FaAt+O0WGZ8sISstrzM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765811941; c=relaxed/simple;
	bh=CvAeDVg/LAp0jOeC25w8jvhEYQqX02C1E9tv4X426Zo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=nR8vOSWtLqLh6HOwO4mKNVqiAHd6ZGv5mdR/NWq3ZGmpCyBY3D6WGlPV9sENicpeZR/8N1IGMkS+AomV3ZCOVMqq8Qwv7AucjEB8ODZkOzX8mn14LcUwaJs15jV8KkdqlUMXhbRHUlg15caXbMbXpEb/+YvwzXy4byzXQSdJwVg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Y9jczHuZ; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=zq3OrrkW; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Y9jczHuZ";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="zq3OrrkW"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BFErvVx3055523;
	Mon, 15 Dec 2025 09:17:38 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=6a7Dsa+JTn20OSX2
	LQ1y08YRXeRRxpVQDla2aiwuo48=; b=Y9jczHuZXO6dIEeqcYePD4BDxRT/3DR3
	7AsdW+ciMTd/+5CzDxjiMhqSDjja1PhptBEeW5SnmUo4B35qoHGFNwXCX0LdM5vO
	jTbLQZ6VMYlJbFozi8YqW9PP+puZTQsbSSlBybF8wWfX1r0I1MSnAtvE5Vvrh7lw
	qqKMk26sHQIR1gi/JMx4+N2Om/PQoiKZ8rjypCbCPGaFiUnv4tRpUe4efrrSdSkZ
	ROrVzAtIPnXGyVhHUJ9vR44knZeym0Xt+Q0mgh92hBFet7vX89khAO/pn6O6VG8R
	08o4PS4TVej7Q/FZes7U178x/DsHnmnjtss3MNHNneaHGyZJKaZ+kw==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11020108.outbound.protection.outlook.com [52.101.201.108])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4b15eja2rr-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 15 Dec 2025 09:17:38 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ocjgrKd2nbWL+cbp2a7L5NorR+yRd9KmvC6z9HXFnJkKlISJxzrTvF8B5la+emsrp/t3vwUVCblRBWTqOUNznFLXnWHZ9sdwxYfb/Jx4bHAPRmMjf28x1aF2FkMomHD4CuQdNbqXgIyU62iiwT7C5o21vEHHYp1/bhru3C6KRDbgDxZIjkdFlOuvcw+NvHe1vkgxTGniHHVTHe4GM/8PxoNhg3tm9qv26dptPHxyNw+wudo+iF7dYB1whIEypD8+cJuUcD22vevrgya0rlKnObErYBYiWh18FqbW9/vyA8bnFDJGIuPll1UhCraHShBBf3DFFEteEk5L6z0o5YVEyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6a7Dsa+JTn20OSX2LQ1y08YRXeRRxpVQDla2aiwuo48=;
 b=LVt4oJDThSWiC43kL9DhbWXn67c+0c4NoShEJsmjiZbzmEfSOok1UvbrAFg1el+s3KaLm4L8Q3n3rqsMODwOxmFufsEcL6Z5/4BkHuZ+0P2+9MnkbenSsWyQrO52Sg7KNsR3OdzT1TYXRh69UraQDleZUw1MaDC9w5o7X3caGsis0L6pwVsgrzDOiwPUBzt/yVE0RuVgxVWcjSARWDM658Y6D8TKLA25GBPd6S1ZS3zfEJE8SKICnszVyK9kBy58fcGPgdrK2iH+Rhp141EgzBkIsLjG1XxJnjw6nfyshVkZcja2ZoW/ZrWfkFjD832/co/sSvOCz3cqt4BMrMZoeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6a7Dsa+JTn20OSX2LQ1y08YRXeRRxpVQDla2aiwuo48=;
 b=zq3OrrkW18AQ3ladZlk6rwarV8pFvAf9ZVjRctk/8xopb3K8GpkKAkVmA0elA40kFs3HqkIwhaQ5l5Qgd9IwZYVHOIwYhpZbCzBSNFCShnDJGQjMt/kmDmHQdHUOMU7jOOqjq5Sx/roFA9HhO+4/EyWfoj+3i3ERmMWf4Go5ZL0=
Received: from SN6PR16CA0069.namprd16.prod.outlook.com (2603:10b6:805:ca::46)
 by MN2PR19MB4000.namprd19.prod.outlook.com (2603:10b6:208:1ee::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 15:17:35 +0000
Received: from SN1PEPF0002BA4F.namprd03.prod.outlook.com
 (2603:10b6:805:ca:cafe::bf) by SN6PR16CA0069.outlook.office365.com
 (2603:10b6:805:ca::46) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.13 via Frontend Transport; Mon,
 15 Dec 2025 15:17:32 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SN1PEPF0002BA4F.mail.protection.outlook.com (10.167.242.72) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.6
 via Frontend Transport; Mon, 15 Dec 2025 15:17:34 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 6791D406540;
	Mon, 15 Dec 2025 15:17:33 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 4AD7E820247;
	Mon, 15 Dec 2025 15:17:33 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: vkoul@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        liam.r.girdwood@linux.intel.com, peter.ujfalusi@linux.intel.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH RESEND] soundwire: intel_auxdevice: add cs42l45 codec to wake_capable_list
Date: Mon, 15 Dec 2025 15:17:29 +0000
Message-ID: <20251215151729.3911077-1-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4F:EE_|MN2PR19MB4000:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 5d0bf63f-3cb0-4bee-068c-08de3bed1336
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|61400799027|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8LF5DzeH0DMg4SqfxlRYx0FqtoJeEX6NSPTeiLH2Q/0xF9mVwfHRYR4OviBT?=
 =?us-ascii?Q?vDkrJeHzWMRjafHDIvjQ3dJpH4OE3ojNjeZVoKEOnm8YqIPWsOJOTlg0f7dY?=
 =?us-ascii?Q?mVC5iaDvsAiZBv9GfhMQ7v+j2mA5s1LZOx27uo1RtEQPCxwAz82pMfxDWKAr?=
 =?us-ascii?Q?DpcG4uUzcKCmvPQta0Olm55hVMVQMqqCdh6cNVa8JPxfWu7SMz30rB+G0lzh?=
 =?us-ascii?Q?qnvhvhQvUSnlYUcvul6MrJZeFxWS8Mq0AeV1SvMVJx2rFBLNGQ2GYip5PNz/?=
 =?us-ascii?Q?iSlV59HALcwmcEEyZu4qheUpo03+k/6Abagq/w63GpEsesO2EX1fRnBh65SE?=
 =?us-ascii?Q?pQ+L2ec63BviWXXjXg6Ovbq2mOpMyTO+Q2TmaRcwJ5kI0Gdl5p9IEo0W3vIg?=
 =?us-ascii?Q?5fZXGy2qh8wttE7YGSCfypw5VVWQqG5y9hiVOr75FgUlrrGbu12+I0M8gMvb?=
 =?us-ascii?Q?w8ceF/qTQ3bWL0CTVN1CXgxtuRJA871VfjiV5RiR0oEvZZrKUnWQ04vtIW1X?=
 =?us-ascii?Q?IdCOJYIjj2B69oJ75idkBwzG+51O+CB/tIRUtAm/40vqb3s3lrnpPIiXma9n?=
 =?us-ascii?Q?lwaDWk56ZzybadsWmRgFNt34tKAU2YvZvmnHR4fCKoM3iDY0T27qMcY1UTvM?=
 =?us-ascii?Q?YSFRMIVZnTg0rKb9jCDLUvRTffcsAlmPnYyBRL0P4T86ckpuRAL/bKAJBGAi?=
 =?us-ascii?Q?4csecaXS1nVOHyRP0sfj7LqwDuWNPaQbJWb9MSAJLYNRqtlJZdODNk0esEws?=
 =?us-ascii?Q?w39gYDnE34IQg+A4T5K8tbygp/GdpYInYWSzh8fF55Pihnxg3wAMg4RnW24s?=
 =?us-ascii?Q?wB9D7pIn7n6s8xB7sOJl8kbhyCdqqYkHEB/VpsCQ3YRlEMUkIwLL8ITqgHW9?=
 =?us-ascii?Q?+ZBkn11OpMOI032EMsWSXcAwZyMI6miWH5JHMeI7pOsGEfX/G5nt1t3eboLR?=
 =?us-ascii?Q?Zodb9bVwF88nZi5FwO+xgYJJlc3KZhuf8sC+b5DgMhO8aruqUzDCmK+OJZTm?=
 =?us-ascii?Q?EYELE2fyGrybFpxxLyxDVGFdO/8V9V43Lk1kDuWSS765hHJpCeNxB9QEctsV?=
 =?us-ascii?Q?TSfgpU8tDs6+XLbr/crks/3qB5IkKDCsHHMLNKaV10G3lWb7pKHD2vl/GsBv?=
 =?us-ascii?Q?ZpnSbjbLJffAX3SCrjBjCDNoUN0qF2iaPxHndarsrPDQUnDHekjg3RMqtrHf?=
 =?us-ascii?Q?QuBK/dmw8LQSvMAHPLzL/Tut61gTFK0+yvXrUnaMSscsWEjiWXPKqoRyHAzx?=
 =?us-ascii?Q?XTL7DOGTYDY13Dcx3HQu1uw5UQbQYYWKEiCazCTD43jJofOtoyLHdQgbjKrf?=
 =?us-ascii?Q?1UcWbQ0Q+IYzjQxDHAsQWo79UcGkFRc39oo0Nf2FCQhpryYy4RNc5+SmtFpQ?=
 =?us-ascii?Q?C6qL+KBjiAI3HgR1l2eJU9R9Dk6XEn0r6BG4D08lnBu5hvkZw2farOE7QO3a?=
 =?us-ascii?Q?O7hKbpbR0pIrZO5Gf6CvOeXcczFa7tGLVEVZCfwfbCPZMJjIvJ2rAXxzRFBX?=
 =?us-ascii?Q?6TXzQTuU9H4Rhl4zZwr4vCwdl/QVMm8Vtzy9+E+inmNhyyLJ0irlOqrvnlMk?=
 =?us-ascii?Q?Aw2lP61DKF7YM+dWbDQ=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(61400799027)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 15:17:34.5977
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d0bf63f-3cb0-4bee-068c-08de3bed1336
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SN1PEPF0002BA4F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR19MB4000
X-Authority-Analysis: v=2.4 cv=ZZUQ98VA c=1 sm=1 tr=0 ts=69402692 cx=c_pps
 a=92GwzG7YO648zpZZqM2iiA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=w1d2syhTAAAA:8 a=QyXUC8HyAAAA:8
 a=LoBzX-eTAcZSRYp6TZEA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE1MDEzMiBTYWx0ZWRfX7biO8KLmzrVa
 mUjAx+whSfXxMevBzGHGwSBHDlpYa25CFtGEnRzM2bNDRRjn3tsngB1zsMDUTJgoUaUnccPO+p6
 8uW85H2Co/LxMSW52S36em//Ou7+YBDLrYl9Q4IJY8aKPn1wXU1uY33V2nnVSWdC8J+zEM24y1T
 4dpWJm68ipPBL/uPxwsUvuWrFQ5hH2Q2FYlp0ydVzx2VweQpFt4oHZRWSakz77y4ykhtFAxkxkD
 3sG7D9MUrL/RKQGQGjtXsWuwDJWt2yc9zoE2jCJpm4WDAxICmxAexvtHMAb7AqUx8sSJoKZd7zW
 +q/7NeqnFpTG06eY9K/LvmtKw0RaW7EAveqjmeXlApkriYdw8giA5hZRR/JQ+DJkEDNrelH3T32
 Jyj9ZYgVeoKt4zw4oYnfA7/kfn43sg==
X-Proofpoint-ORIG-GUID: jQPIENZm2VH1sXfwDAgnUbn-nWRW5qM_
X-Proofpoint-GUID: jQPIENZm2VH1sXfwDAgnUbn-nWRW5qM_
X-Proofpoint-Spam-Reason: safe

From: Maciej Strozek <mstrozek@opensource.cirrus.com>

Add cs42l45 to the wake_capable_list because it can generate jack events
whilst the bus is stopped.

Signed-off-by: Maciej Strozek <mstrozek@opensource.cirrus.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 drivers/soundwire/intel_auxdevice.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soundwire/intel_auxdevice.c b/drivers/soundwire/intel_auxdevice.c
index 6df2601fff909..8752b0e3ce74c 100644
--- a/drivers/soundwire/intel_auxdevice.c
+++ b/drivers/soundwire/intel_auxdevice.c
@@ -52,6 +52,7 @@ struct wake_capable_part {
 
 static struct wake_capable_part wake_capable_list[] = {
 	{0x01fa, 0x4243},
+	{0x01fa, 0x4245},
 	{0x025d, 0x5682},
 	{0x025d, 0x700},
 	{0x025d, 0x711},
-- 
2.47.3

