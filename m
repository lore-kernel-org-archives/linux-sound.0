Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C6982D77E6
	for <linux-sound@vger.kernel.org>; Fri,  5 Sep 2025 14:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757082724; cv=fail; b=hCsjLxvfmN+sm2UI6Rs+gbgUWHsx+k6L5CHL0XgWm+jnDXsZ2kC13Aw5/4eS/9GOjOg2ixEUZyimA4xOgcpI4Bh7ro3OkvYLeTSZBixXztyJu+6m/oVUQN47IXJRHcj7xEHDzsVeHgAujUkLFgS2SLOKm5PLb9cQx5TIIC5P7Ns=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757082724; c=relaxed/simple;
	bh=qf5AohNE8sXCjhNbOQnasV9vuIvVt1pxsMFgfEvr5FI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Y3ND0a3s7Gls3/rg8iuD0uZHFbWh5/o6GrAiqOWZ/Ja79H4WEExg4fxaRy8TvoQ6J6mIlYvDLt7iUQZ0KTqWHAa9uMeE1y8YbUlNO6wCMfW/DXhC23DjrA34HrcNRc+55eeLIrP8Pe61m8INx7bHHcO3OcxtXNr8hGhfI+vQCJw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=U5RLTZVK; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=F6QHoYRC; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="U5RLTZVK";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="F6QHoYRC"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5859A66l3552591;
	Fri, 5 Sep 2025 09:31:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=sVi0eejBbS2JOt4uJWx+qUnwZIohEpgfU7emQufb85U=; b=
	U5RLTZVK4H/vsjOKLJJ5Xp8YvVexa9kfg1DANXWl0dc96Cp3tFr6RZeX4l0fkQm5
	vvpXgC1hcxSWvxY6GlNMcsKzW3h2lHuMmLyinhd0vsmHM9ByGOhAF7Uet4IErpwm
	Dh/tvcLWyEUcJSg6GNfFmz9HWyuMlcQGk3Lp9GgqRbI57xM7sUiAOWR9r2LP337Z
	4BJI84MK2xroQ16NWuBSgsfq902lvdVB+bqjT9gOCHxxQ3rWIe8ANet181nhP/WM
	JAMwjiq5LQK+7dnfWntTDgUrwUIk9fRrGFieEh5d5YT+sypbMlkaNqQyECtrlAl8
	JSSgbf04YuFv240h48RKDA==
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11hn2205.outbound.protection.outlook.com [52.100.173.205])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 48yw0b0bk3-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 05 Sep 2025 09:31:34 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nfxiWljsdZHWANcm4gTU3kQb0pKsCZ5fGil2pPpGl9sddYrgXFAXe8XygMs8/sgrxHcGRMEl/IqyG7s6S2jUE388ru+o+rQtJhhuW0Zix3p/l11P/RLurQZXPABjsE1oLaqj5pO7iCAAYhzU2DokJGtidAfQyjhbVPlOyOw7BmK4zImgDVRKAbByGoh8t3Um2WQjY8uJnad1GufPLZpDuKGlgGbqS4DoK/SlylZyZ/jWMebbWDSMKlm781hhpNR9T6BjmIra/qhtGDBhaDupz8jS3FoKIyDsgDEhTqz7D0K9iT8b+OSHh7OhjmmdqncL7B4gXkOBL6qFQJ8/QIG1ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sVi0eejBbS2JOt4uJWx+qUnwZIohEpgfU7emQufb85U=;
 b=Mn7lXBoUae8i180Ev2aCMYRf31qw4BK8Sf30kRudcLMcoaAYpTcWC5SE8jhrjtplCzicoxGGvXOuQrlHVGcyhJalodCmf9f/dKw2MFrVkizWmY6IL5C+G3mjRvpmkE4zlrw4prHlaf0V9jnRVXSrlpw6pOvkS4vbTHbVy9Krl1u92zpFR6JUYFptrN+vrc1/bousIeGAEohkgr9p9W+Ei75wdLu20hmXi2IVt66rw+zHB3Egs27lS38mURJKDGAjGPEX/UH9o08FX4j+fDyo/sH7czsyZjb5Ot2JvOGiKmRu5QoIrKSH/yzAcOFO1iNRgvDsqCDKBxP/UIlF2lbjSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sVi0eejBbS2JOt4uJWx+qUnwZIohEpgfU7emQufb85U=;
 b=F6QHoYRC083Sb4NjWu+3ljrndL8A0jy0jrmqhpF0vliTAzMA+Ipbz9EcOz0WXsaPMoYfUtN36DMKvdxxBP8LhE7aedOuOd3U2KKSEYbaTCVDtF/1Ob//lV3evMxSdJTJzBRVG1WMybaJAqFcWSKwKdEwOP19zzRgOxcgZmnnQR8=
Received: from DM6PR02CA0146.namprd02.prod.outlook.com (2603:10b6:5:332::13)
 by DS7PR19MB6206.namprd19.prod.outlook.com (2603:10b6:8:9d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Fri, 5 Sep
 2025 14:31:30 +0000
Received: from DS1PEPF00017090.namprd03.prod.outlook.com
 (2603:10b6:5:332:cafe::81) by DM6PR02CA0146.outlook.office365.com
 (2603:10b6:5:332::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.17 via Frontend Transport; Fri,
 5 Sep 2025 14:31:30 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS1PEPF00017090.mail.protection.outlook.com (10.167.17.132) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.14
 via Frontend Transport; Fri, 5 Sep 2025 14:31:28 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id C422140654E;
	Fri,  5 Sep 2025 14:31:27 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id A2DE9820273;
	Fri,  5 Sep 2025 14:31:27 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: rafael@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 04/15] ASoC: SDCA: Pass device register map from IRQ alloc to handlers
Date: Fri,  5 Sep 2025 15:31:12 +0100
Message-ID: <20250905143123.3038716-5-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250905143123.3038716-1-ckeepax@opensource.cirrus.com>
References: <20250905143123.3038716-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017090:EE_|DS7PR19MB6206:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 48368041-e391-45e8-43ae-08ddec88e6ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|61400799027|34020700016|376014|82310400026|12100799063;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?BItMvKRs4XoeunsiVyQwZM9pfkMKJ0hPo4Tr8NPvYXj5BX/eyO8veauhKY/G?=
 =?us-ascii?Q?8K0QQT7cvkIforvzwtZ7/+Gu8NFKp2vLIxzDfAVW5gyvVR1NTuPBCDlm6WIv?=
 =?us-ascii?Q?KdFVPrKVq07hMm9KckpB0ClS1vjYsnaO5NTWh18Eccxw6w4EmK705mWz+zIZ?=
 =?us-ascii?Q?uwbDb/1DZhRauI8snW7adkIm2g7pNODl+m5hkKbjY1ZotRBiKQ+1sSWHC3b2?=
 =?us-ascii?Q?vF/Ampv0WaOWDCaR4LIZt/yCpkALZyDfg8MrJacGe8hVNxRFOIySWGOV/CmF?=
 =?us-ascii?Q?1lenxAHBF3XJPnY73hay6iMi3Q7SdhL+PvCGk6lHUTpm5QDKP4RH01T5N1z8?=
 =?us-ascii?Q?XYL8cN6ZhcWp51IUP8POofOUsUCdCXOFX92lA8UQDn4rYwZmKGZOoUIxLbFP?=
 =?us-ascii?Q?JOvNyoGk3OqiLISZaUYbxxy1C40ria4tdt8mIZny7alR+0hPQ02QVOpR2YUe?=
 =?us-ascii?Q?nFx0CYvd5QKvvkxJdENJt9damu7mw164qRPBuIE+2gnG2F016pT5fNlM9vh6?=
 =?us-ascii?Q?BYrZWGap2oka/FHj/g+sjJv0JHSapCZ6szEA81fci2F8C950+ic6gDCWqAGK?=
 =?us-ascii?Q?M0k/61gnNNUrHk96Q2SxQlvHJ9Upk711lRgz6/L9cQk48UTUAo2KYUp6IKxD?=
 =?us-ascii?Q?HUW5cA0/tbahxRm17zdOetbEz/zVsAEJvwiweGxpcF+PA51mEc331Dc+n0x5?=
 =?us-ascii?Q?T/qkNB209PwaxMOpDuVs6JlSH1Sm+O3LjmC6RwalyOS7QeI/7TQdZUkHDVbq?=
 =?us-ascii?Q?cP5/HFd+pcWBb2Tl/InA2S00viFa94rpEUDN7Zs+9NMbI8v2P35QUwxrjzpQ?=
 =?us-ascii?Q?vIruTFUcBWa7QFZlKHIUYQMwGWi686FR+HRkTn48LacqshL00Q3BVf3TYUkB?=
 =?us-ascii?Q?uOg+zE59jAwGGqV7kTJNJc2mmnxBFBeA4WtutEJjR+0HnU2+CsXkfZFhZhMV?=
 =?us-ascii?Q?LEPSoCTSyI5lctzGP1ZGoRwvtxkLNAgZvB/fpMA8+eE0ep2BzRuz4qIK00tz?=
 =?us-ascii?Q?v9tx8Dl8O94EbloxVVsJ9tlmXfdSI76THupYm0dO8/WmNGx7PiXsmsd2gVuA?=
 =?us-ascii?Q?AJCj0ajUMbBpaqMe6pYyZ+H/PAo5pi6hj9J558kCLH7avw21etnreMFkXtJH?=
 =?us-ascii?Q?u8lkQ7hlTbvH19LBGyFbwf+Gj2jnLu7Ssr3MhDn8EVlxoWMf77iebdUXYjan?=
 =?us-ascii?Q?qC6lnYgED3qwlUV+DAcU+VST8qOPemovAkmaaAvBLrCD6A3uB2QR80YFc29i?=
 =?us-ascii?Q?Zlks6TWZwFM3bmKE+21NZG7E65XiS0pQv4+QL+tezAaLv0psR4ubr5wXnoyl?=
 =?us-ascii?Q?AttTLKrO1+g87+FdEJWoS7IE5JjBKcYC7tiTHZ1pANKtZJA+uLru02ELUPMX?=
 =?us-ascii?Q?+TNEy3QNF9zfw//0UR0dgE3IyFdDGl6QG01p928MBQOiCE3NMy90mUpAdCLg?=
 =?us-ascii?Q?RBiDadXaOEA0F1K2Zbn68v6GNXVYzfo0uZL6Z2PwGuUy+CzPQMOQYLxTHenx?=
 =?us-ascii?Q?Jw/WE03Wq+jm2WzoXGSh7U6X/Iek6Nl95LIp?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(61400799027)(34020700016)(376014)(82310400026)(12100799063);DIR:OUT;SFP:1501;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2025 14:31:28.8974
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 48368041-e391-45e8-43ae-08ddec88e6ff
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DS1PEPF00017090.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR19MB6206
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA1MDE0MiBTYWx0ZWRfX7dYbrKdbUKER
 l3s3v8vpwN1RRs6EKhbzIoIuPKcj4utWXKs9/AiWmdU4HmmosJE4ZsoLdQA+FkreF0QSF7o/kJR
 G0MmMKrCXYfdRZy/mqgiEAqbZTeYOYVuW4pmNKLWnELfPrfw742a9RhJYnY7IZoCsHRQLDaWM9f
 14HIPwNw8yQxg3ah0MJjHQm6NTEKQcHLnm/JnRyz2a578s4lYJRHB7JU2eTmBHAstXfX9/XK+eS
 I98PKjNxbHJ4K/0uhw70YGHg+sWm1s73HEBkZ4SEH9dJaOexr2VNASvsnH2WlyW+P45dK5LuM9p
 ne54H21M2uzPesZUNPllbD+f1JY99jams5XNl8bAryPDLaYAga5inDZ9YA+F4w=
X-Authority-Analysis: v=2.4 cv=YJufyQGx c=1 sm=1 tr=0 ts=68baf446 cx=c_pps
 a=20EQJ0uoxqo30Y+ZFMW2Cg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=yJojWOMRYYMA:10 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8 a=38gYyO_Oba7BUjtA73QA:9
 a=jZz-an6Pvt0H8_Yc_ROU:22
X-Proofpoint-ORIG-GUID: Pk6jDdRIbigsN7TUnHC-kU31CozaCJUp
X-Proofpoint-GUID: Pk6jDdRIbigsN7TUnHC-kU31CozaCJUp
X-Proofpoint-Spam-Reason: safe

Store a copy of the device register map in the structure for the IRQ
handlers. This will allow the individual IRQ handlers access to the
device level register map if required.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 include/sound/sdca_interrupts.h  | 2 ++
 sound/soc/sdca/sdca_interrupts.c | 5 ++++-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/include/sound/sdca_interrupts.h b/include/sound/sdca_interrupts.h
index bbbc3ab27ebae..d652c6e94ddcb 100644
--- a/include/sound/sdca_interrupts.h
+++ b/include/sound/sdca_interrupts.h
@@ -23,6 +23,7 @@ struct sdca_function_data;
 /**
  * struct sdca_interrupt - contains information about a single SDCA interrupt
  * @name: The name of the interrupt.
+ * @device_regmap: Pointer to the IRQ regmap.
  * @component: Pointer to the ASoC component owns the interrupt.
  * @function: Pointer to the Function that the interrupt is associated with.
  * @entity: Pointer to the Entity that the interrupt is associated with.
@@ -35,6 +36,7 @@ struct sdca_function_data;
 struct sdca_interrupt {
 	const char *name;
 
+	struct regmap *device_regmap;
 	struct snd_soc_component *component;
 	struct sdca_function_data *function;
 	struct sdca_entity *entity;
diff --git a/sound/soc/sdca/sdca_interrupts.c b/sound/soc/sdca/sdca_interrupts.c
index 6775f0f7b5659..944d4713f56d9 100644
--- a/sound/soc/sdca/sdca_interrupts.c
+++ b/sound/soc/sdca/sdca_interrupts.c
@@ -437,7 +437,7 @@ struct sdca_interrupt_info *sdca_irq_allocate(struct device *dev,
 					      struct regmap *regmap, int irq)
 {
 	struct sdca_interrupt_info *info;
-	int ret;
+	int ret, i;
 
 	info = devm_kzalloc(dev, sizeof(*info), GFP_KERNEL);
 	if (!info)
@@ -445,6 +445,9 @@ struct sdca_interrupt_info *sdca_irq_allocate(struct device *dev,
 
 	info->irq_chip = sdca_irq_chip;
 
+	for (i = 0; i < ARRAY_SIZE(info->irqs); i++)
+		info->irqs[i].device_regmap = regmap;
+
 	ret = devm_mutex_init(dev, &info->irq_lock);
 	if (ret)
 		return ERR_PTR(ret);
-- 
2.47.2

