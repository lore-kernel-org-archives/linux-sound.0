Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFDED2D0625;
	Tue, 16 Dec 2025 16:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765903744; cv=fail; b=iyi7zAs+pu6/q6n6FeptwLaFZ1+5OdXrycgFNxqzSqR/EE4CuaGyid/68eTWHnr/rK8pkhVejsunJkNr1CtKG8wwLeC1FmhmJCTuJE2/z45eCFXfAk0AJJGQE/N27oaik/epQyLPaGJDKY55tqdW22WB9xxsXOGlCZBcKL4PxzY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765903744; c=relaxed/simple;
	bh=pR0JzG9kt4EiRjJqhA3M4LAFqj3c73RYKP6aNMdyTos=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=prwJ9dhftcrVgZp/x5sRP8j6GGFdkl1rDMQJFpna5m6Ll6aFz2688R/LhoszgZSmrqWizxLevedUov4Cgq0A11xQJAkwJmCPoWyaWK+Rk/EV58iPzGg9Y9w42rHcfl3jofeyw3V/kwsnwGE5Ef1B3SvDdsUwmXXsxWhxX3JyWvw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=nKdpLFku; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=jN/fFwGx; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="nKdpLFku";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="jN/fFwGx"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BG5mx4A332091;
	Tue, 16 Dec 2025 10:48:55 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=FeRQRIvD454cLTm/pnw1VKJLkux6zFGuNS+UauflZOo=; b=
	nKdpLFkuxMAwCpfqN4yCdqFa2lcEJx7Tzejc2ZKSoVaafWuc/fWHeaW0YCEdQnvH
	aQENtweLVE2fMxm2k1QVP6bm15Hgn8Rt5DGshS24u54KI4Hxlf54dNgSwa/BeZvV
	XqJdVlpAttVQ9OYKpK/BrxFHqKU+IiiIdmt9nYOy4ld0LSJEA9tqoZViALdiVQ+y
	opF6ZyYumulU46iw8pmCwpQTJXHxo/UWvuIxzTxMSAFb46zq7+2r0x/FESBWO5/O
	RTcs0Uy3yIgolJ5BCm6N3Ts7uK4WeveeZHxTjfVvNjM1+2K1H+qjKwyhE5XW+6+x
	b3/q5sgVyWe9TnMlzjFq+w==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11020129.outbound.protection.outlook.com [52.101.85.129])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4b15ejbq14-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 16 Dec 2025 10:48:55 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LWnoUZn2k3kkBjHwYD4ZPhDZkv8smkq+WDJAM89VNyoAxW2SQvOSkgPOzWYvxVZzUe0RvU7+wd68WwRFdwnKeNTdwG5ckqlc5XMT9qfYzb/gZNjFhvCkcBVJO5eJDswsK2SO4MoMql/ivRmAW70gkSE9SliOlcUSNIjlg4Pl3dd2HPOk8f8+zHh0SpApRP8A1VM0tq7r0MfrxqK0AYpnhoyOsgG6aMiayqMC03CdV9NP/u2yD+YEHQjBN3SLTmWh05Mu6t+exsDjL5qAc17WsJf7He+u5b79WtbNl+5EnipC2LfQsUBKy1ISQHOum3+CacNoq2SB7i8fRL7oszVzSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FeRQRIvD454cLTm/pnw1VKJLkux6zFGuNS+UauflZOo=;
 b=P5OFg6zSiCjOSSVxfvxydCeUe1BBwybfU2rBnBfyePUuwZcpY2Wr4WgXWx2WKS+X2EGnlOFCL7ZiXMC4DMDm204MhxBoYTOe2dv6fHv3PsL9iN8Bc89fGpS5XAl0JWKeBfZggqQPGn0AD+8zpM0EF/RsZr3ymcfhA4NbleIJGBM/pY9xKISkll5Sobj0rXwwv2Utx//Vjjcxm7LsLhmbvtHU80Nxm4ntwTjCBOeU/1wFUpPAdG+k7N4KZc8hGSZlaLxyyW/RcU3rAq319+62xxCT8vJv4MIS1LaJ+buPkbORVHcjmRuBda1qAJg+sVWs5yNDD+PRJYclis4nFONBFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FeRQRIvD454cLTm/pnw1VKJLkux6zFGuNS+UauflZOo=;
 b=jN/fFwGx7ZNAw4tXu7t1sNxKUPT2UbwL5GgLEe3FT0Jh+0000Uk1l97h0EO4jSJYcec8TdQtTnBWoHLaQWuQRFi27z+xEHM2TXUHy18yjGnw0Tbi7wg2Y7MDhFN/PR/GKpZLdJOQFHCpiUqAD8RXADfGgwkMIBpd8Ttc1XVc3Pk=
Received: from SN6PR01CA0006.prod.exchangelabs.com (2603:10b6:805:b6::19) by
 CH0PR19MB7912.namprd19.prod.outlook.com (2603:10b6:610:184::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Tue, 16 Dec
 2025 16:48:48 +0000
Received: from SA2PEPF00003F66.namprd04.prod.outlook.com
 (2603:10b6:805:b6:cafe::ba) by SN6PR01CA0006.outlook.office365.com
 (2603:10b6:805:b6::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.13 via Frontend Transport; Tue,
 16 Dec 2025 16:48:46 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SA2PEPF00003F66.mail.protection.outlook.com (10.167.248.41) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.6
 via Frontend Transport; Tue, 16 Dec 2025 16:48:47 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id DDE36406545;
	Tue, 16 Dec 2025 16:48:45 +0000 (UTC)
Received: from lonswws02.ad.cirrus.com (lonswws02.ad.cirrus.com [198.90.188.42])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 69FCC822545;
	Tue, 16 Dec 2025 16:48:45 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com,
        Stefan Binding <sbinding@opensource.cirrus.com>
Subject: [PATCH v1 2/2] ALSA: hda/realtek: Add support for HP Clipper Laptop
Date: Tue, 16 Dec 2025 16:48:13 +0000
Message-ID: <20251216164830.832148-3-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251216164830.832148-1-sbinding@opensource.cirrus.com>
References: <20251216164830.832148-1-sbinding@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F66:EE_|CH0PR19MB7912:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 9e8d949a-f78a-4cc5-8f6c-08de3cc2fbd1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|61400799027;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?s2XNDaBx6TdGUfG+GqSBzA1mVBhTlU0tKPlXl5ZLLlKmsP3cApGCm46RoEuo?=
 =?us-ascii?Q?d6p5DJ3AitPyP4DT5d5ZVa33Tn/HApUZLJQF5MqtFeO5iTmcmhteBcHcclQ5?=
 =?us-ascii?Q?H6BZH8AjZjUyunB6vzrTupYfWCsCcZzVTyNtY+P0AOJV8xnQAMhjvMB0/kRM?=
 =?us-ascii?Q?tF4opAOUAVHSkrP3kB4p3BxHS+yLJWwg+aW6TNMeBsRMEZFPmYHJOZGESEms?=
 =?us-ascii?Q?0Hz02TZ48nic/pQFg28zQLZItqgU+ZQ22X0qbbQScJ8qrvrSPF5/lXA/Sjpg?=
 =?us-ascii?Q?pIMeT6uEq3/a1zwG/fnOFQ+neK0zE9t2lPRE90gq9fzWoLB+P3CtcYFAWeMr?=
 =?us-ascii?Q?OskHPFK+0cPTauk8+RmO/T3jqMZP+cr1zp83My9IIl0RLeGMkOgiejVYMxm1?=
 =?us-ascii?Q?b0FnKTEdK6QwduhWmCZZjGy8/H9wBXKL0pIcufs8snFFyyT3aiOuEImM78Xp?=
 =?us-ascii?Q?ZKD5N3cRvxkzlYD20NeWJv69k64qOEC8tZI6wpSXn3DaqyT//yoVaqfoLEXY?=
 =?us-ascii?Q?UnKpov8V/vng+/ewt4A6FAOaLcTcWXF5jU1G5f9EPkytM+Y7g4seIqAlPMkr?=
 =?us-ascii?Q?8x86877wJ/EpGMqpXbq2QvBHKtpPocJdbk9rkPWfrfq8//FPOQq57H6mjR5d?=
 =?us-ascii?Q?xHXr1zHeHUbnb0hBxd7pscKHkm5jz1hcrPWyyMPNl85Mi7onWdqxMisiIvq3?=
 =?us-ascii?Q?uag3ujiEHLVRnRBNViR2H0kH8WFMV/5r8UosCKnkmocLGfZcvTpgIfYa2VHC?=
 =?us-ascii?Q?t1cXueEsVmxRYfWpPqJxtSLV/FaHmRRtpR5Ga9RqFMGZo1Vc2qO+UA+OVax8?=
 =?us-ascii?Q?bj7S9yIqyRylx3M9r3NNoMaKGZpTqs3DNCP1crh4LcxWgEVA+iH6MGZAhD3M?=
 =?us-ascii?Q?mw05QgLVeYXeDMpF/VeWi8YaIlbLoKjk0pYe9GS3T7S2qk/zP0D605AbTguj?=
 =?us-ascii?Q?ahkmlByXDH/IC55kWltF+vTn24IG+W2nzKOgiEO4ChuN2MV8JDvj6pJ2Txt/?=
 =?us-ascii?Q?4WqcErh3b0XJDDqDzla3KEma0OTr3ftSPn+p0moY66VvR+7wLKM6DjseRXmm?=
 =?us-ascii?Q?XeoAUOdJoH+ny3nISoexss0K/TGixsmRU6/oYlmx1y4QiZPVJAec5XKplMAL?=
 =?us-ascii?Q?iUyMRBUO81io4sxTXckEyF5ItXkGMgN9grEknPPV+Udgr2vth5rPhVQJbgog?=
 =?us-ascii?Q?D0SCKhvTs/x2R2TjXeNYXtdJ0ZFqo17sohzlusWHfHJ9JxwRrxl5LrF3sKYG?=
 =?us-ascii?Q?/eBnpjU0kqTuiOuv2Qs1QVSKrL8QVi39PfpJ2tEpa3mp7Xn1MJGKHd48xVxC?=
 =?us-ascii?Q?vZliF3J7OusoRuViCvLFLHtTr5xBS5hI3wKmIuQv3UQfXAJSvgJ9bO4xaGDz?=
 =?us-ascii?Q?N0fiBCCmHPDjaqM/8dG7rPxdywFXV5ZXzp2pTLVd9JCExzDqLCfzNoOMNBJU?=
 =?us-ascii?Q?0MJnc8wgHmqK48d2qcpPU+aikiTzGksOm6VhVxQt037Ze42C2ljTsUvw8mq+?=
 =?us-ascii?Q?CiV8fwXgBEJ4UPgeCCwCiXSA81TOlz72nB2OpycwHYF+ZIgIJcutU59T1J6c?=
 =?us-ascii?Q?ehZwPCOhZ1aBVzio9RQ=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(61400799027);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 16:48:47.6526
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e8d949a-f78a-4cc5-8f6c-08de3cc2fbd1
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SA2PEPF00003F66.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR19MB7912
X-Authority-Analysis: v=2.4 cv=ZZUQ98VA c=1 sm=1 tr=0 ts=69418d77 cx=c_pps
 a=e+gafPXuV192R5FN4zVsvQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=w1d2syhTAAAA:8 a=2lyKzjhrc2nKIjESmZUA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE2MDE0NCBTYWx0ZWRfX6/N2m6LDBVJn
 7R9NO0wKBluuFOeGpR5wPzA4tRoiLddPskAPJFd1dGFl8gNcDFWf3kFq6/Y5YYvQsW6NxW+E1gV
 2c99hD0FC/XREq/JdkU5t887ptTmXPZYgC944cdPw4GuxvXgsFmRgEDRLjxKCleY9jrOLAcU6uV
 ceTfeamHGOx3sl4fVYnUiayYT1cBrO28fnBnHl2RTLrRfucHu4TNfeRL6gdQdGV07yelx+lCwu7
 u7WJFf2/CcZPSZdvojjOciYjFVt00VJ18mjUs5VL4oUGeHvw4jAmBKXEOEOi65eUuT2VBgUrdXb
 Jq+I5grUWshFyseeoiYuda4I9DhjGFBroQBiWK8ahfJgfm1AEkxnxUfUVaUlydfc08exxRfzyTW
 RAdhh9PAOBBo9g/QqVbNEi8bIQNEhA==
X-Proofpoint-ORIG-GUID: Q3q_7HyBFX6W9svANdIZ0lts82_ZqQLt
X-Proofpoint-GUID: Q3q_7HyBFX6W9svANdIZ0lts82_ZqQLt
X-Proofpoint-Spam-Reason: safe

Laptops use 2 CS35L41 Amps with HDA, using Internal boost, with I2C

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index ec57c075757c..e8f3cdcff0f3 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -6771,6 +6771,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8e61, "HP Trekker ", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8e62, "HP Trekker ", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8e8a, "HP NexusX", ALC245_FIXUP_HP_TAS2781_I2C_MUTE_LED),
+	SND_PCI_QUIRK(0x103c, 0x8e9c, "HP 16 Clipper OmniBook X X360", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8e9d, "HP 17 Turbine OmniBook X UMA", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8e9e, "HP 17 Turbine OmniBook X UMA", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8eb6, "HP Abe A6U", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_GPIO),
-- 
2.43.0

