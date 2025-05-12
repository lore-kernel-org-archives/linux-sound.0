Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFE65383A5
	for <linux-sound@vger.kernel.org>; Mon, 12 May 2025 12:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747053786; cv=fail; b=I20TVQOIZekuDG1TVoIUQgHfmpgcSLIn/J3gFix4uSfRRbQjVMywR6k+GkA24H9p9yQq2Ia/LUmD61ZjHeKSPUMOuJ79MZp6Wux+3ZyDdsfQpb97+XdF7ld3H0GOYR5Vyzo/EAU1lYNFVV+rUx1dg8ruDjVYo58QeJWiYBTC844=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747053786; c=relaxed/simple;
	bh=pqO7QrmZzQ5mpkKBm7AJ/ykYZpcIa7kjbm3vF5MCOAg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Xc8JOrQyNgPWtvqvK2CclrU9ocMrHzxAaR+eegmo8QrUsEl+Eb7+wDIvtmMNc3FBbINMEaonVOp3g8WB/+hBqpPGQdbMtBfd8zlPAaKWQesn/zlbX0/G/WBVBhaI/EYpVywm/KUV1+lnzPyupbsBGH/X4+C4Xslf6NsJ/UzTAP0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=bi7QG8qS; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=lcQA03+3; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="bi7QG8qS";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="lcQA03+3"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54C4o3cr017992;
	Mon, 12 May 2025 07:42:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=Acnuhg4uq+WuRnH1lLlgIbWoL0iRpLZocihN0M/aKgs=; b=
	bi7QG8qSx9R/9mG/6s1wzb2Is6unlEmplAvBjwBLAQC/XLRJtUFM+1SgwVLSFeBZ
	P18XridEduKPVxxynCecR71v6w1RhXAAgxqGN5IVOIinWqHqdAvOnq6E/G3ZOmLE
	K8nTytZOm38Gf87u91GtO9gcqtiL+14FM5+8AkY9ob6fezwGMyO6uShhSmFKkP4J
	q0uVPXY6yGIpq2xhVhqs8m9sbxEOnjpCtGSsmZBrC84I1BPeBpVnT2zrEvWxmNxj
	xtV1aSOj9quqrY6EGABBsghATTSNkl4OxDjoASngNUHfKNzkMa8GvYkN1nkizckZ
	FNRCcTHyiJo8s8s1W8elzw==
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2040.outbound.protection.outlook.com [104.47.58.40])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 46j471a6tb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 May 2025 07:42:44 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cbPD9SE5pz65LTx9S4KyajLdE8qwTI7uhtUrQWzJ64e3x/9q2eBWzd7mRdHxhn3L42T+kndY0WfjPUXy4mCsmPv04BP+ZVJOMgZP7BzEtMWWvTpwEGKtef4tXkjkJRJRZN141wDgxG8Vdc4ifI/V8ePs/5XfEKlQnOVUIuxThevAGhUYo5N+4VHxngBNsfwzyiq/+/KkXQOCMVWR5cz7OQMUzCnQt6Q8YKJhGEZpMlX4Op0YJe4zqgIsendf5ueJiOt3ydnAP5DQHLOo6AtygwKK5HUVaRsUcrnNum2zyX8MCgBb7mvnA55rsMvOUWXvhhoESFQTwz5XTpy0h9Y0Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Acnuhg4uq+WuRnH1lLlgIbWoL0iRpLZocihN0M/aKgs=;
 b=u5+yYBVuCphyr7jKYPPfW09QxPi+KMSIr46OHL5/DJuk1c5rcQkFL43jxuaZgNzlDQran7JKc7t/FA/FHShaWZxWFq6ZT9q8zUY/6m/0vTO+xieG4yS8QyByAJvVjygq+xwMPe+K3ekjf6DZ/EvXdSHUMpYZ+YlJL6z6BT9yc9WOk68xDgEv+uGYUHYMv1M+MFSY59BT/oQZBYiehcAVRPndrW0Bp3D7mzF3b4K53ZLG2zpY9JQaSq177BB5lYI5sPfyaXONaY+9T7UStoU4zVw8fLYfq93p0Vw/o7MKb8OxGh7o4O8z16LHbpltyPYRBerzVAtzoLKrEaOSw8HubQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Acnuhg4uq+WuRnH1lLlgIbWoL0iRpLZocihN0M/aKgs=;
 b=lcQA03+3R86WuT3C3aGHIWUlh4Mz0Fk5h9cKjqqFeIIswdOTBuUjAWzyDmiagzJKz96DmV3NzzP1r5itmXkxPmYfCj5eDNXmz2ftIGTr92ESQkLmrmq/eXkC3ZAihxhyn8TcHOSGdArmGST3bE5Sm5056ZOri0CQzPCSRCghzpw=
Received: from BN0PR07CA0002.namprd07.prod.outlook.com (2603:10b6:408:141::17)
 by DM6PR19MB4357.namprd19.prod.outlook.com (2603:10b6:5:2b2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Mon, 12 May
 2025 12:42:42 +0000
Received: from MN1PEPF0000F0DF.namprd04.prod.outlook.com
 (2603:10b6:408:141:cafe::6b) by BN0PR07CA0002.outlook.office365.com
 (2603:10b6:408:141::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.33 via Frontend Transport; Mon,
 12 May 2025 12:42:42 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MN1PEPF0000F0DF.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.18
 via Frontend Transport; Mon, 12 May 2025 12:42:41 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 06B5D40654E;
	Mon, 12 May 2025 12:42:41 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id E8E02820248;
	Mon, 12 May 2025 12:42:40 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        peter.ujfalusi@linux.intel.com, pierre-louis.bossart@linux.dev,
        linux-sound@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH v5 3/6] ASoC: dapm: Add component level pin switches
Date: Mon, 12 May 2025 13:42:37 +0100
Message-Id: <20250512124240.799509-4-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250512124240.799509-1-ckeepax@opensource.cirrus.com>
References: <20250512124240.799509-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0DF:EE_|DM6PR19MB4357:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 517a86cd-340d-41b3-5292-08dd91527c9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|61400799027|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tfwV0VJJqhqEf1I/MBEJqUFUlwjBsVQRU8Po8NxmZGjWiweZVOynwZqmnRk1?=
 =?us-ascii?Q?jczynRx1eNuYNgoHnA9xtFqM+vdCo4CvNm8XYKmEYei5h2cNaCoSXJXA5DSN?=
 =?us-ascii?Q?aCfFm1tFKQYKaOrStC+QL+QnGJ+H6FHtIrfyI6QcRVoZ9NQi4b9dSbA6byxj?=
 =?us-ascii?Q?BFS0dHbAvVY4PETA3KcvrZkxw8zx4FjXLJxfLQodeWj0GR+dkH9sTC7GRoZG?=
 =?us-ascii?Q?QvTzjdanXiEEvs0w30DCvwClq/kovSLLC1wixGXO8WfMNZnPBbgr5bYX8HjE?=
 =?us-ascii?Q?bzVp1Xtk51qBBlLmoMuBD23wA1kxuFe9J0cn1l0xOkmzS37Z9m8gcKk7Jywa?=
 =?us-ascii?Q?PvXCYigIMZ0Abr4RRyCEoj3tdO+fMeBiGl8OJ0r9cA4FOjUTq6xHRLVQbZR2?=
 =?us-ascii?Q?/6x20ALKg0JhL4xi5vrySBw6oOQKCaXp8dTm0imMjkds8sXhDtEWJSrTOY/c?=
 =?us-ascii?Q?KHIJLvG9HxOf70q/s72WuCEgUkWwjZ5jHsNWxsfxN5M1fOsSA4lBBNsYtqfB?=
 =?us-ascii?Q?mxD9Y0LE7SNBC62o6bjah6GpLGsnNp9+RVGc+S84SfZq4Mnl5Iq0qFUQt01F?=
 =?us-ascii?Q?hk6sJzXA19iebhJ5zTMHva9wyI0gLftiYzjAMSslams0YSslW9vCAhhzVK2f?=
 =?us-ascii?Q?k6XWocV+0xvLBHxvVxTQWG/kVFk8hGZLh1fIiZk0DESELv9LLQu9o0XHQ1FM?=
 =?us-ascii?Q?fVoh7r/rBB3MUDjox86KGHuNxEOeEhJwwR9h9EVCMiFRCuQHibOVvoAg2SRz?=
 =?us-ascii?Q?SUZtPOiDRZv5RuXqw5WGYH2HX9KSkHbLdpPmwRJPYm1G+SmDOMnSbxeGL8p6?=
 =?us-ascii?Q?9HO6Nj9oSRHwXg9Ir/Y0vjyFFaFRDE+1LIaFRRt2OnM4eWd3sOu2Usk7AAEC?=
 =?us-ascii?Q?/PVw38fZwWBoGXbN6WU7fmEMxTN9uxg/wNJwB0lxh3WxChj5/pxJ2S3vLKT/?=
 =?us-ascii?Q?qdTPpCGb/uwzVcHLH1OtowiSW0hx4EYo3zQMagTdavG8kW0BGgwkd7dW65gi?=
 =?us-ascii?Q?jMB+N7Wf+wkfeESeoDZiaxN9ukA4S2XvfArdqCzpSlmjU8PlmmjTTYkebdWM?=
 =?us-ascii?Q?lwBCHLWJodPSnlA5xJ25CiXKZ8tODXoxJ7+cYwWMDwX/1Pu6+I27uFgd5ab/?=
 =?us-ascii?Q?Qp5cMAm/P06hN+pkUibeGaSXA50sxFkLnHS66FhwLhDeE5rZkWfS8UAxbYTd?=
 =?us-ascii?Q?ejVdBDhlB65nraeN3QXGVFD3X8A6fYqVkk3omscDvyshnFXh++/SAfvhaRGP?=
 =?us-ascii?Q?9tpm+96OirBEra/Rkf7jzcyrRr3P1bci1W2k1epj+1J+0ZiUle9ADKfTnopD?=
 =?us-ascii?Q?wZl9kC0MV7in1bGn9ncPfgSbPT+OyYQaG4rDwd9EtLETG/QRTFnKBAiiGieB?=
 =?us-ascii?Q?zVbLW8TOcJHNhzAnM0B+qm5nGmGPpyD2zUO08SblYemEw9I6MBHKdZ/4F6S8?=
 =?us-ascii?Q?l63+O+qjJdM2a4LdozP9xPQ2FM1emm8lq5KqHJFJBZWA7tJWScf9FWaQInj6?=
 =?us-ascii?Q?vTR8lwJEFW8bT/WCKElhdZHVQzBS27caRTKp?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(61400799027)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 12:42:41.8576
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 517a86cd-340d-41b3-5292-08dd91527c9f
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0DF.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR19MB4357
X-Authority-Analysis: v=2.4 cv=EIMG00ZC c=1 sm=1 tr=0 ts=6821ecc5 cx=c_pps a=G+3U1htxrnhIFlrbIuZW0A==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=dt9VzEwgFbYA:10 a=s63m1ICgrNkA:10
 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8 a=SW88HgwpE6hd0ow_NxAA:9 a=BGLuxUZjE2igh1l4FkT-:22
X-Proofpoint-ORIG-GUID: y2_I8b5Y1COVym6bkNvkrQWJz7_QwCcr
X-Proofpoint-GUID: y2_I8b5Y1COVym6bkNvkrQWJz7_QwCcr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEyMDEzMiBTYWx0ZWRfXxw2KaIFa7rA+ 4NF0TnLlVPKnI/3UH7dlMeYtb3lFrzh3+SSTj0IAyg0ogNklKSLo2En/nCQvZ53ZCZVWjY+W8M4 qIUJ8xKITJxs2yoGWhj6h2BIU266hk/3KiGr/ui9i6yvBdC7MBrQKr2k+fvT2b1LJ6W/4o7Q/Ot
 ewQ3uOY1rTJCvF0tpRJhHqxDAi+8PNTVb6mQziS0E2HwEWyjG3r1pGdgAvOaLza2ZL3/mEsC8oX TrPU+VqdnflWvYxsGmdva74O8aMgpyGY1J4GIXBTawCzoAIbQTcK3JmCWzq9WXe7h1diasVnbUz gehUkjcMJx55xfVi+bB08zE0Dx+QrzLBfrKOfY8wCrOaxXiTrzUYI2Iq0qNS5aK5HhGdKuACZOZ
 Zc0vV3bnrmTTSr6eQEYEKz7azD0hWS1e9UiVdmqgDbg3O7403ZDMw0ythvtfW1OyC9kQHjws
X-Proofpoint-Spam-Reason: safe

The core currently supports pin switches for source/sink widgets, but
only at the card level. SDCA components specify the fabric at the
level of the individual components, to support this add helpers to
allow component level pin switches.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v4.

 include/sound/soc-dapm.h |  4 ++
 sound/soc/soc-dapm.c     | 84 +++++++++++++++++++++++++++++++++-------
 2 files changed, 74 insertions(+), 14 deletions(-)

diff --git a/include/sound/soc-dapm.h b/include/sound/soc-dapm.h
index af802ef536e73..400584474bc8b 100644
--- a/include/sound/soc-dapm.h
+++ b/include/sound/soc-dapm.h
@@ -445,6 +445,10 @@ int snd_soc_dapm_get_pin_switch(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *uncontrol);
 int snd_soc_dapm_put_pin_switch(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *uncontrol);
+int snd_soc_dapm_get_component_pin_switch(struct snd_kcontrol *kcontrol,
+					  struct snd_ctl_elem_value *uncontrol);
+int snd_soc_dapm_put_component_pin_switch(struct snd_kcontrol *kcontrol,
+					  struct snd_ctl_elem_value *uncontrol);
 int snd_soc_dapm_new_controls(struct snd_soc_dapm_context *dapm,
 	const struct snd_soc_dapm_widget *widget, unsigned int num);
 struct snd_soc_dapm_widget *snd_soc_dapm_new_control(struct snd_soc_dapm_context *dapm,
diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index b7818388984e3..f26f9e9d7ce74 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -3626,11 +3626,25 @@ int snd_soc_dapm_info_pin_switch(struct snd_kcontrol *kcontrol,
 }
 EXPORT_SYMBOL_GPL(snd_soc_dapm_info_pin_switch);
 
+static int __snd_soc_dapm_get_pin_switch(struct snd_soc_dapm_context *dapm,
+					 const char *pin,
+					 struct snd_ctl_elem_value *ucontrol)
+{
+	snd_soc_dapm_mutex_lock(dapm);
+	ucontrol->value.integer.value[0] = snd_soc_dapm_get_pin_status(dapm, pin);
+	snd_soc_dapm_mutex_unlock(dapm);
+
+	return 0;
+}
+
 /**
  * snd_soc_dapm_get_pin_switch - Get information for a pin switch
  *
  * @kcontrol: mixer control
  * @ucontrol: Value
+ *
+ * Callback to provide information for a pin switch added at the card
+ * level.
  */
 int snd_soc_dapm_get_pin_switch(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_value *ucontrol)
@@ -3638,40 +3652,82 @@ int snd_soc_dapm_get_pin_switch(struct snd_kcontrol *kcontrol,
 	struct snd_soc_card *card = snd_kcontrol_chip(kcontrol);
 	const char *pin = (const char *)kcontrol->private_value;
 
-	snd_soc_dapm_mutex_lock(card);
+	return __snd_soc_dapm_get_pin_switch(&card->dapm, pin, ucontrol);
+}
+EXPORT_SYMBOL_GPL(snd_soc_dapm_get_pin_switch);
 
-	ucontrol->value.integer.value[0] =
-		snd_soc_dapm_get_pin_status(&card->dapm, pin);
+/**
+ * snd_soc_dapm_get_component_pin_switch - Get information for a pin switch
+ *
+ * @kcontrol: mixer control
+ * @ucontrol: Value
+ *
+ * Callback to provide information for a pin switch added at the component
+ * level.
+ */
+int snd_soc_dapm_get_component_pin_switch(struct snd_kcontrol *kcontrol,
+					  struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	const char *pin = (const char *)kcontrol->private_value;
 
-	snd_soc_dapm_mutex_unlock(card);
+	return __snd_soc_dapm_get_pin_switch(&component->dapm, pin, ucontrol);
+}
+EXPORT_SYMBOL_GPL(snd_soc_dapm_get_component_pin_switch);
 
-	return 0;
+static int __snd_soc_dapm_put_pin_switch(struct snd_soc_dapm_context *dapm,
+					 const char *pin,
+					 struct snd_ctl_elem_value *ucontrol)
+{
+	int ret;
+
+	snd_soc_dapm_mutex_lock(dapm);
+	ret = __snd_soc_dapm_set_pin(dapm, pin, !!ucontrol->value.integer.value[0]);
+	snd_soc_dapm_mutex_unlock(dapm);
+
+	snd_soc_dapm_sync(dapm);
+
+	return ret;
 }
-EXPORT_SYMBOL_GPL(snd_soc_dapm_get_pin_switch);
 
 /**
  * snd_soc_dapm_put_pin_switch - Set information for a pin switch
  *
  * @kcontrol: mixer control
  * @ucontrol: Value
+ *
+ * Callback to provide information for a pin switch added at the card
+ * level.
  */
 int snd_soc_dapm_put_pin_switch(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_soc_card *card = snd_kcontrol_chip(kcontrol);
 	const char *pin = (const char *)kcontrol->private_value;
-	int ret;
-
-	snd_soc_dapm_mutex_lock(card);
-	ret = __snd_soc_dapm_set_pin(&card->dapm, pin,
-				     !!ucontrol->value.integer.value[0]);
-	snd_soc_dapm_mutex_unlock(card);
 
-	snd_soc_dapm_sync(&card->dapm);
-	return ret;
+	return __snd_soc_dapm_put_pin_switch(&card->dapm, pin, ucontrol);
 }
 EXPORT_SYMBOL_GPL(snd_soc_dapm_put_pin_switch);
 
+/**
+ * snd_soc_dapm_put_component_pin_switch - Set information for a pin switch
+ *
+ * @kcontrol: mixer control
+ * @ucontrol: Value
+ *
+ * Callback to provide information for a pin switch added at the component
+ * level.
+ */
+int snd_soc_dapm_put_component_pin_switch(struct snd_kcontrol *kcontrol,
+					  struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	const char *pin = (const char *)kcontrol->private_value;
+
+	return __snd_soc_dapm_put_pin_switch(&component->dapm, pin, ucontrol);
+}
+EXPORT_SYMBOL_GPL(snd_soc_dapm_put_component_pin_switch);
+
 struct snd_soc_dapm_widget *
 snd_soc_dapm_new_control_unlocked(struct snd_soc_dapm_context *dapm,
 			 const struct snd_soc_dapm_widget *widget)
-- 
2.39.5

