Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2DB72D738B
	for <linux-sound@vger.kernel.org>; Thu, 27 Nov 2025 16:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764261297; cv=fail; b=BbH+FzF7fYHneGOuy0+g4P5odDxL9r3NiXYZSMfTzhQcfXIQMyPucBioaYDEeugmip+DlllsJSysZW/srP9h2DwbyXuXjuesYWMZLUYHsvQnznJSkp8EbgM5sPvgrMD4kYhMxPzWPcRaItV4G9kPJx7EM6iEE0hZ+veG5fm2BKo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764261297; c=relaxed/simple;
	bh=HyYIuB89Gaj1h/9TWLeNHMBFUenNNMp8pcHzQTAe2Fg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gIjO/jgVMpJwaEY4IDuLwVSlrK8l9vzDkDkbFYO3y1zZkGrOUZxlf38hxAeXJGP+OOjVm/wARLfWVjSnbEjOhERLRiOSajHytIct1WgUSrMa3wjTrZSlnahlQPrbk22RRvQ5MM1gBZukWofzASpz6z+zC1niyF12nNcu37w7jhE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Dxyc21Ul; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=TP/ga+Sa; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Dxyc21Ul";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="TP/ga+Sa"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AR5NWaq122994;
	Thu, 27 Nov 2025 10:34:39 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=SeXyjuuwNg7kB2aRbkZmczu8NmQu+QkjtqZB1Zt8JIs=; b=
	Dxyc21UlKAMipMY7rvDY4cOdG0lFzQlYW0PnaeK7rpXQY4dz3OjG40rJZ4VdT9yy
	O74ZzteCcDRWqAkDyubaMwyrYW5jttFxAWjuxJt97JTddtwds1YQBTWKSu6kTLT7
	K4vKv6piOPavJDxQJe/u25lYrKhTOHiHKeHym/a9BODKDEHzGhrvnSoWcUqzmegF
	X+6U0u+CLbQE1zavjj0I43teZVhpM41a3F4qRQ9CKUz3kGg4ETxbuPcK8Q8dQ1mn
	3/n2wV2hqY1hna7BzaZDVXsYGIpbstEV3MsqXbIY+vuMiXlqC0p0WaYwmtlPf3Md
	o3YqwAhqGVQdbcTjzqIF7g==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11021121.outbound.protection.outlook.com [40.93.194.121])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4anjw5jeve-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 27 Nov 2025 10:34:39 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I5OcujEUkor4yxmQ3IquwJmMAQuR0E93T3Dr1MY8uWn1sF3iZK/sTYcHy7sZXvVm8Q8NEB4VLysWXG8L2llqdcMvfnnXVg6Zq9nhuITBWnlKX85LPli5YXZdXYN1G45FeQZGIEgZ9XVeSQnX6swyE6ZPIInlMQLjDhSYaLptsh7gAdtG5+234vAfQH1zdUsRCRDTs64U4XeUGUOMaC8tAzJ8izY0VZRquR483k+11gH5zCSgZtkgVf4axWYpuXNHUs11gBuZuRA2Tby2F+9iYKJnbNT/hZmvwP8e5k9hqsHxv6aIQlK/yinn+GSZqf3qV/TP1G0nsM63H2C/GNcC4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SeXyjuuwNg7kB2aRbkZmczu8NmQu+QkjtqZB1Zt8JIs=;
 b=hR1Bt+bJeAtj9BjQyHPN5I17JOCigLqqPMtZ34Ws2AQTcowWjFaw9Ar+fdtH7TeLU5sKxlGQy8dMfGfUWY1Y4Y8hNkyLX+aaS5KAPK9LXHeTaSQWlShCNNLVSrt4KXXPfiQGCmAAV2iZ5lHXNLgKg+5yW/ix43JCUh8ps0upnUSFsS0X7dvmLVOriVA7V9tvVU4GjbY6uWPcN04F+rzPoJxHFzxoL4pddCNkHBeHG3kilneKNtRTUGimadcFwU1Ugr2HNyqZboq8jzO2ArYmm3TGwiCvQ6rBbmCL3Az+DEDl7bD/eqk/Xz2zWub1lhBNLDQFInBFuv/mfsiWaYnZxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SeXyjuuwNg7kB2aRbkZmczu8NmQu+QkjtqZB1Zt8JIs=;
 b=TP/ga+SaFDpLnpB10e47zqdQRRmB5NfcRKVwzGLjQb3Iee10P2fYenJQ6N3hXKLG5bLmCKrfV3eBTEiaIxtI5xWIyTDLlHVJx4b4eJeNpnJ5OBMneYoJKWnnkl7ax3FBDwjqe7HA+4OeFFBB6WVHrB2uBIPE9DepmMnh5uX1N1Q=
Received: from CH3P221CA0026.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:1e7::27)
 by DS0PR19MB7622.namprd19.prod.outlook.com (2603:10b6:8:dc::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.11; Thu, 27 Nov 2025 16:34:35 +0000
Received: from CH2PEPF0000013D.namprd02.prod.outlook.com
 (2603:10b6:610:1e7:cafe::ea) by CH3P221CA0026.outlook.office365.com
 (2603:10b6:610:1e7::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.14 via Frontend Transport; Thu,
 27 Nov 2025 16:34:35 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH2PEPF0000013D.mail.protection.outlook.com (10.167.244.69) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.7
 via Frontend Transport; Thu, 27 Nov 2025 16:34:33 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 451BF406557;
	Thu, 27 Nov 2025 16:34:30 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 25FE3822548;
	Thu, 27 Nov 2025 16:34:30 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        lgirdwood@gmail.com, peter.ujfalusi@linux.intel.com,
        linux-sound@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH 7/7] ASoC: intel: sof_sdw: Add codec_info for cs42l45
Date: Thu, 27 Nov 2025 16:34:26 +0000
Message-ID: <20251127163426.2500633-8-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251127163426.2500633-1-ckeepax@opensource.cirrus.com>
References: <20251127163426.2500633-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013D:EE_|DS0PR19MB7622:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 9b66be28-34bd-4f46-6784-08de2dd2d8bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|61400799027|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UHuFfMy7GJ3q4ZcXUHf7Vw61cRWY3Uys1yKPTEXD6Ckh3Kfo0T7nrsZFE8jw?=
 =?us-ascii?Q?G84DKIDETMVaswGAb6CQ80ONvHQr3n/HFZmZdhIzf/vjf42COttOCTpgdGEU?=
 =?us-ascii?Q?EuJeBkBxISQ3gJiuBCSgGTMIZzakMlmbtXR5PbZuW5pvBi/eXwnEU7F2d+3S?=
 =?us-ascii?Q?rQ7v1ocnHjJZKo/+yyne0YwLJ874457Amp01yBlXsxmjLxw1uIuvJ2dg8fEJ?=
 =?us-ascii?Q?afHjQKU2dyfGVLNYa0D0RUzEAjXRsu+xacQRLjJKZSOF8TbcNA5KO00Qis3X?=
 =?us-ascii?Q?kNL9egl90Madp0QK2CuNNNLyADV9Wh20CDSMFrgYK0J9lLvJrs0yKkdLpf97?=
 =?us-ascii?Q?aL07FRiTZQOPh3d4uidEZMmFhrzRwTMx0PyuDcpbw3nGsp1UErA/BusYDttO?=
 =?us-ascii?Q?FOUDi4ViSI6UIPFtRADRDUhMnWM9PM7lz6tbUC5bWpQILkbdTC+wQc+BK0Dj?=
 =?us-ascii?Q?yDuTOLTilEcT1Nn8gZlu/0kyvFNjCJQmle3A84L+rXMHMqWKVj5AkZLcoTWH?=
 =?us-ascii?Q?DTglLThH4qsb9tDv5u7LQjOr9ANZWVpKsH8JUKF0+z0J5AMmpTA7kvlrHrgE?=
 =?us-ascii?Q?K3EmQH1Igr6rWRQStC+wgNYOATa87ReukklhdgOO8spfM4XgwfQMjoiPYDX/?=
 =?us-ascii?Q?6zApk8sAONztNDl7M9LkAEBmRPRiXjvqa50AsVe9NTWQ22vI5g97FPB3HVzp?=
 =?us-ascii?Q?UkWdFrRr45NIXpKYkmcrQ9Sp1Kmt6bR8uGLLU38ZqCmcTJOaC8wSKAfJpESE?=
 =?us-ascii?Q?pGBdW/JfpUyfldSFSL+KFpYq7RduZYS9O8c3PXPW3Bu2VbZCVJ+DtbLZCa84?=
 =?us-ascii?Q?5dn29z1HsGI2D4DGO1kV6fc17gLrxy7zdwbUMFDjvl4MoWQfnRPs3SxUhxyO?=
 =?us-ascii?Q?nnlTyJE1gqDVAinI6PlMkBzayDhJxQ3MVJIf3na02tGNvO9YjOsRnPGLYbX9?=
 =?us-ascii?Q?v3lrQWkq6pRVeT+cKGPACE9aVhnrhABIq4z/APk4iod9oudUOJNuTZZ5vsrr?=
 =?us-ascii?Q?ytaVxSgg3z4EwsrSIY/nnx4KRkL7yTDLcmTiLOdxw6i6cdMFBWRXNc9lo1+6?=
 =?us-ascii?Q?fKsT6fbExEPzmt8K+MB0+meuVY8wxryRAr70fvT4BNGMkiuDNx1HNtwOYBjz?=
 =?us-ascii?Q?kfrsVF0VaMHgbm8TXLbDa0cgQrOJp/ym8FY0rWGA8KbeCn7c5jRS07RdE/Nf?=
 =?us-ascii?Q?dWe0hm40WqDE+GjxQ36ZLG+uYw953ldbKM042L0bVbs12VZ8tYZ1o6qyGo9z?=
 =?us-ascii?Q?NN+ADTTpez9WyeMA/d3IGu6kUZFIiDC5idCJE+s4tpHKiAZqD9PVmZm8Zw9C?=
 =?us-ascii?Q?N489qmVuz8VU5UK1J84Us+T1GT/u/yZ6mGmYDNWl5sfhXKANt54FOWVv+q44?=
 =?us-ascii?Q?u5ujZ/rboCSNn7W9O+U+WGHHa5L6TkteTzEHItWMpdPsF7S9XI4P7w5MKix5?=
 =?us-ascii?Q?EPz9mfWB0dI0iNoukOXHs7ewOS7g7sTv8yKNeZ0BwVm8p/sWT2x4WG2TwZjT?=
 =?us-ascii?Q?9fTon1Cz3aO13kBboMLFT93NofajOJEhBUhlwwcNuw7+ppRSb043/QvBNCDy?=
 =?us-ascii?Q?av5q26aXw95MJe7KOYI=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(61400799027)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2025 16:34:33.3289
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b66be28-34bd-4f46-6784-08de2dd2d8bd
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH2PEPF0000013D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR19MB7622
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI3MDEyMyBTYWx0ZWRfX5wXt5sQI0tCb
 Y0IzAl5W6XaBjYes56XNucr+4TDQ779Z1QkIzE96g4Nv2dsOPk7hsjaSiuzWsHlv3JTAg+IgNN/
 JeXWLIfdJb8YLY+fimqDa/62gkl3yzepDFnOCwLNzXMdWl/chlTL6sWDSKKbZM4HIwqOlj+Gz/a
 NC0DWJreVEJMfvBTWJDcAU9HkgmO1/MC27ofgcXTzvCOaJTRtCLiNX1n8+836JD1NkyISn5Tmm1
 +YFdiG/f+FET0gblJTK2WXThvp1X83X1j2vpXztyzbeHpQYLUx4tcl3TWPRvWenpkw1FWyMfDGL
 Djxi9w3KbSoofxmgN/E6R2neS+AkzH6gESV3GOlFwfzIGyodM6Q2pEHS9Csu93FM3Pp2lhBhFXD
 rwn5eTl0jPqcc4k0kZw1MQ5DffFqWQ==
X-Proofpoint-GUID: BjBYgM2vlVia5AuaOABFif1viC6NJzSw
X-Proofpoint-ORIG-GUID: BjBYgM2vlVia5AuaOABFif1viC6NJzSw
X-Authority-Analysis: v=2.4 cv=V4JwEOni c=1 sm=1 tr=0 ts=69287d9f cx=c_pps
 a=GRNSBXvNJw0HWouCR8jgEQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=QyXUC8HyAAAA:8 a=w1d2syhTAAAA:8
 a=Hq12kg6g_HeDPEb4OQUA:9
X-Proofpoint-Spam-Reason: safe

Add support for the Cirrus Logic CS42L45 standalone using SoundWire.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/sdw_utils/soc_sdw_utils.c | 36 +++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/sound/soc/sdw_utils/soc_sdw_utils.c b/sound/soc/sdw_utils/soc_sdw_utils.c
index f57e02bea5b4e..6c656b2f7f3ae 100644
--- a/sound/soc/sdw_utils/soc_sdw_utils.c
+++ b/sound/soc/sdw_utils/soc_sdw_utils.c
@@ -707,6 +707,42 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 		},
 		.dai_num = 4,
 	},
+	{
+		.part_id = 0x4245,
+		.name_prefix = "cs42l45",
+		.dais = {
+			{
+				.direction = {true, false},
+				.codec_name = "snd_soc_sdca.UAJ.1",
+				.dai_name = "IT 41",
+				.dai_type = SOC_SDW_DAI_TYPE_JACK,
+				.dailink = {SOC_SDW_JACK_OUT_DAI_ID, SOC_SDW_UNUSED_DAI_ID},
+				.rtd_init = asoc_sdw_cs42l45_hs_rtd_init,
+			},
+			{
+				.direction = {false, true},
+				.codec_name = "snd_soc_sdca.SmartMic.0",
+				.dai_name = "OT 113",
+				.dai_type = SOC_SDW_DAI_TYPE_MIC,
+				.dailink = {SOC_SDW_UNUSED_DAI_ID, SOC_SDW_DMIC_DAI_ID},
+				.rtd_init = asoc_sdw_cs42l45_dmic_rtd_init,
+			},
+			{
+				.direction = {false, true},
+				.codec_name = "snd_soc_sdca.UAJ.1",
+				.dai_name = "OT 36",
+				.dai_type = SOC_SDW_DAI_TYPE_JACK,
+				.dailink = {SOC_SDW_UNUSED_DAI_ID, SOC_SDW_JACK_IN_DAI_ID},
+			},
+		},
+		.dai_num = 3,
+		.auxs = {
+			{
+				.codec_name = "snd_soc_sdca.HID.2",
+			},
+		},
+		.aux_num = 1,
+	},
 	{
 		.part_id = 0xaaaa, /* generic codec mockup */
 		.name_prefix = "sdw_mockup_mmulti-function",
-- 
2.47.3

