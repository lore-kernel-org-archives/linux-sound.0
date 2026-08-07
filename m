Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011057.outbound.protection.outlook.com [40.107.74.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E064248F7C
	for <linux-sound@vger.kernel.org>; Fri,  7 Aug 2026 00:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786064175; cv=fail; b=pZfD4CcG8UIvd2/+M0dvPN572Dulq3iEH7ZLHMIE7VnURn0s8/sccHNrRAyQDr5VaHgpsYab/RDz9tf+1yOWDpPJCkryhQbg3NqeGi4W4FcYs8sJ/y3PEHC4pNJLItAm5iQKRdIGo7ktrfA3xqOdzCAdeFj/T2FrrMve4MdGkuU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786064175; c=relaxed/simple;
	bh=srN3C18aKNZhsu9p5KqUr/sauYJcn8Di4BztgbIT5H8=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=bHz6axGVPtlq2OVYajWyXgfJD1L1T7lx0tH/5mFpk65jsJH04Xd9c9/6hF5IAc30HdSKoNOcGSQtr2fH34oKLm8Tn3iR5tXi3bV1rKl1BmiPcHhr5MytF44FgnCRx50tlYBnhuahaCdixymwEirT7P7DYqoK9vFtRzjG8C5WroY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=XVt22+hd; arc=fail smtp.client-ip=40.107.74.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="XVt22+hd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cXIoktIgR8EaPPeD21inC2TgX+LY5Ji9lSkoBa8la21Sts4g43WlXIb1twQjLtB1hJ/GuyD5ikWDvlubi4ksww+sPvmZo8AGscqOY3Wu6O6QogINsWnGDsMzCTYR6+DYKR0c8+96UvFFLmwSJvvdvNESMHDDjNtpDFFV53tEwBw9Lk+btLHrtDT6MAf+Lj+UtGNNWTj//kx0lHxj+X4B8Di/51+HYzcgqzWJDFYxCz+82I1PIamhffzI+HxDFGVKGyvuH2FKKNLz7yn+QIgfi/XDLa5rspTGyr2Ps6Hlj5tbkZ2Dx85tr0n4MZpEygiyIYX1VDRxfce1AnbL/m1PPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hkcNLB6j2tm631PvMxOYRvD3b+c0MJUq1ICV+zMKC2c=;
 b=fAQwIVJv4X8yV35XvXtL1yBxuso9JePbVrzvIf4mk3fI1xN0mrIUSZDoAynAnXjAYqz4Gv4sDc3zn2hkNtb5RomVnyMICnWVJKUhAIOc65qAItQQ/OMTqZJq7we8umZg4kI++QMIXdMkUM5HWJl16QsuMjbfhcqOeRRs+7/Ubwlh9hYs0KYNR3uqT9gHLsqN2G+jIEWtcvrxbTsspyQ/b6oX4dcuYZQAcoP3Z9/kMTSwOPa+7jbfdSqh5nvKgmuVwrP6oSAjPyRhV7xzrZARq+fzfXxH/4fsfhTrMJ6iuk50bDLcJvUynRec483HtZmJ119hAn4olkEDKjxCsvLMQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hkcNLB6j2tm631PvMxOYRvD3b+c0MJUq1ICV+zMKC2c=;
 b=XVt22+hdILmhtphXWR0XvQhnfmr1OiMGIHNdqdQVxxQ71c4gB+VDHyntfk+/rXC1YeIOqllbx5MOkg1LcRB85JDeEkc/YAi4C6cGysP/cSNHvvWB1E0xOJP7LQ3aI4fZWK7nKMjd0gGulDrcvznGeC9DIKgJreUmL6wfYarXg/g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYCPR01MB6638.jpnprd01.prod.outlook.com (2603:1096:400:9b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.23; Fri, 7 Aug
 2026 00:56:11 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0292.022; Fri, 7 Aug 2026
 00:56:11 +0000
Message-ID: <87zeyysq8l.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Oder Chiou <oder_chiou@realtek.com>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH v2 30/44] ASoC: codecs: rt*: use .auto_selectable_formats
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
In-Reply-To: <877bm2vjjn.wl-kuninori.morimoto.gx@renesas.com>
References: <877bm2vjjn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 7 Aug 2026 00:56:10 +0000
X-ClientProxiedBy: TY6PR01CA0037.jpnprd01.prod.outlook.com
 (2603:1096:405:3bd::15) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYCPR01MB6638:EE_
X-MS-Office365-Filtering-Correlation-Id: 94095640-1302-4692-000e-08def41eac52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|23010399003|366016|1800799024|38350700014|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Raka12DAsayq72NL30QwIeJH5rW7LEApY0j2L3j6fNgbxJ2KuX86sXDpRuptp0LiK/UFF79tfC1R3QoA+UZssyXS9rnY9k82DQTWbQsllj+HKjyaFo2ulPCjgeTDa6ijNlQYyIsMsQhgg8Kx0I7PNsS5lscSYyIJMYkTInVHdz+iJZrMHboxJAgFw0LP0ycc0tDaWHYGPFcYtlMzK/bmNqbgbqlfotdrVkUScz7oqi89Ea1oezSIHmSXTfykKKHCa3fF5naHQJD5urMO7LDWsTl2gsNrya9tSLY4aUw9mwKDPKocZ04hDBh4q1s+ol/rx0rUzjRHpvHScVJhj7HMc/+BDzaB6WFDusDt7c4g6F/6QXz50vyg6E+mQ/sxPQ/Lh6tu3KFpgL7xdgPEmg+U+pPsB0+kjYpQJPDbFuekw9D8KKFc1MNYamKDhSKCB8QBAd0GL81unZ5dLSMXaG5jQd93w8Mus0BYShEWPLNWZp+G1MCNwUtAE0y8BQd4/M4HDI8A35bkG8VAy8VEnAq0IdNM9V6fTaRtD2XzpejjVMPvGcR8DHbKaQtuJ+/EidePDzZSZDY/eUOeFc07iAuhlUiQ+iy4jk4Wmk1JrtaSWmLNbNGtHY9JGRiTF8kE9FEnSRVRPIUw72Cyi78HS32QqEdJq8nqJzVEPwKU0XG0d9zu+udpz0qNwWi/RLmH5CmTQDm+Iy5/PXLDAyclVRnxbhS0DvVWxlCeuRNBUAWS9SQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(23010399003)(366016)(1800799024)(38350700014)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?v4WZOwlzKRVSd4R38d5L45Wd8Aj8MPJv1gkjbg+Z2VapwzE3jHLyM51L+WiI?=
 =?us-ascii?Q?uWMB08GFMLlKpRytHJ8PblwbpreZJPDrmtanxJPZOo8CPrLN6UG2A1hMKvPX?=
 =?us-ascii?Q?qUb//VPhLo8IFI+HsOQlzfHr35iBQYqgDoqaCxzXZR477tgdGt6M0JBPF75d?=
 =?us-ascii?Q?NxcG7aCSyUEZBDADOEurxDM4bJd4YMKtQ9CsJP2ph6KkLCf5MMqP2ah7VP79?=
 =?us-ascii?Q?2haoxjQltjSBDWh4CIRz30xcSK+ALk98U+ZSb+1BAAFHASgT8RHCOZidQdRt?=
 =?us-ascii?Q?sUayF1tlEvgGvtZQgOe27IvbGX7FmwsOhJZb1sG5sgAAhpLPSSVyqT1GYPMn?=
 =?us-ascii?Q?Gk+G0BJnqDTihXUf7jIBii1aDjcxUxmSOLIWomN0kYGbtgMMm0wwqe00H4b/?=
 =?us-ascii?Q?B6fEaspGJHhDQkajFI84I3/eg4sQwmwlVLxks60lIALISlXfinW3Nk8mvCtf?=
 =?us-ascii?Q?CU1RSqrVkc7camseotbrpePSWRwpT/Abgo0edKU3AORz1j2WjF73eQuybqwa?=
 =?us-ascii?Q?xyiWzHEE94rtqtPbDOnVUsXb2gufSG7GcV3eJMIuVdVxjkt8TEbL28PzBAK5?=
 =?us-ascii?Q?GGl4ONf/5tBLI5TZKTVIOusK46e/xhbw4i9zzuHA3foMHEi21TfuV6SQMEEN?=
 =?us-ascii?Q?MM6HDpPmujBcHh4jpq+wyhGdh08yC9JwnuzQbebHgZJ9soVvwToJ256MYwk/?=
 =?us-ascii?Q?scKfKy01it+6cT5sEs7cOOyUZo32/SH1xvOUYZtTrVrCl9lQwMH2Z4Pa06Tj?=
 =?us-ascii?Q?j0DFQ8FAdywLEcfP7ICn9guc6FZaR4e5W0xaMOBi4TDINEx/aiYaN5hjfyMZ?=
 =?us-ascii?Q?PteZQn/WRxPLeg3BlOuEPeLcm7EWXc5/ry6xXlczYEP9nNgqc3HTolXqtV4W?=
 =?us-ascii?Q?+t+11nGZCcfdln1Q6jXu9Tm+aJiu7FRxNHe6vD2XKGJhMalhXQxXXN75VpBQ?=
 =?us-ascii?Q?fRte5HwlYGbHAQlvlueKkvQ+Xu/KvasaWaCkKFaGo/0pSACpDSs9tOWhaWB7?=
 =?us-ascii?Q?zK/3XPCHgWfwgqGFO5ZJnSQjYWBnnTwaXxzTmogNX0jBTmey0NOlJ8JaZx1o?=
 =?us-ascii?Q?44ewJpK/jUXym/JCS6fBrFvREvRerAZeaG4a8Iv1kKix1xjqCY7jOl+1XCJ1?=
 =?us-ascii?Q?TkaQJxtylZkKcl4dFD/xbFprI8DfT2GX9Usl/wEE+TT0FUqz95wm2mpVJLvm?=
 =?us-ascii?Q?O+RzOh7DcenUizufGqH7mNSprdlAh2YTXSKOpe1n0SEYspfJZSVkgQbbiP9C?=
 =?us-ascii?Q?I3yIAQdlvi60mqr+wfIApb/7WwJxAAakmO1KyGqXpBMMY47NK8vnnGa7hjAx?=
 =?us-ascii?Q?5l0jIZh46IUiDOk/xz68Scs1I68t1s5fSqbvyPIPriY3pXIkmkX7P8TrNKg7?=
 =?us-ascii?Q?Nc69LY3Zx67OyPNQmCQfIGZnyLXDuXz7cIWQ9APKCwdzTL1ozKY3Sv/XnzVj?=
 =?us-ascii?Q?DCebkSRpCbOA4+uBzU0OkHkikngnDVMHVCCp8fXtm/AJFVgWYtYrM0M/HfPP?=
 =?us-ascii?Q?1WJoQlp6f/qV1Ucut2CCgdnm893BsxPd8d5/JvDB8pADGvzx9ou5hfz9VL4N?=
 =?us-ascii?Q?mUGmL6Oom8areFjBn/HNwotY3bv3OHf6ww9FRqCmU/pmdwG4CHzECjY8amfI?=
 =?us-ascii?Q?RgPGivjWNIlwxDVgmQQHtLTIlX7kwm6ZPKwiMUYjFKE0BaUMvPbJgYtLvHcy?=
 =?us-ascii?Q?68mdQ1BxUdVhEpDc97pitOuPTvs0rN9DxogPeXiqO4tFcPCLHSIB0siZI9tc?=
 =?us-ascii?Q?Ql+7t197amFqY4V8nYc8NzloY1kMWNU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94095640-1302-4692-000e-08def41eac52
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 00:56:11.2070
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2h+jIlFf09fDYE9398GG5YWsIfvPHWm5QCpT8Udz0kr2W6FKbKx26Rs77LqyQBdB5v4iWRISCPeYFhMGQh740F5xpH+7ZTW9HkCDFBX9BtSXLm7zjE/qjAycy3rBkomX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6638

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/rt1011.c  | 10 ++++++++++
 sound/soc/codecs/rt1015.c  | 10 ++++++++++
 sound/soc/codecs/rt1016.c  | 10 ++++++++++
 sound/soc/codecs/rt1019.c  | 10 ++++++++++
 sound/soc/codecs/rt1305.c  | 10 ++++++++++
 sound/soc/codecs/rt1308.c  | 10 ++++++++++
 sound/soc/codecs/rt1318.c  | 10 ++++++++++
 sound/soc/codecs/rt274.c   |  8 ++++++++
 sound/soc/codecs/rt286.c   |  8 ++++++++
 sound/soc/codecs/rt298.c   |  8 ++++++++
 sound/soc/codecs/rt5514.c  | 12 ++++++++++++
 sound/soc/codecs/rt5616.c  | 10 ++++++++++
 sound/soc/codecs/rt5631.c  | 10 ++++++++++
 sound/soc/codecs/rt5640.c  | 10 ++++++++++
 sound/soc/codecs/rt5645.c  | 10 ++++++++++
 sound/soc/codecs/rt5651.c  | 10 ++++++++++
 sound/soc/codecs/rt5659.c  | 10 ++++++++++
 sound/soc/codecs/rt5660.c  | 10 ++++++++++
 sound/soc/codecs/rt5663.c  | 10 ++++++++++
 sound/soc/codecs/rt5665.c  | 10 ++++++++++
 sound/soc/codecs/rt5668.c  | 22 ++++++++++++++++++++++
 sound/soc/codecs/rt5670.c  | 10 ++++++++++
 sound/soc/codecs/rt5677.c  | 10 ++++++++++
 sound/soc/codecs/rt5682.c  | 22 ++++++++++++++++++++++
 sound/soc/codecs/rt5682s.c | 22 ++++++++++++++++++++++
 sound/soc/codecs/rt9120.c  |  9 +++++++++
 sound/soc/codecs/rt9123.c  | 13 +++++++++++++
 27 files changed, 304 insertions(+)

diff --git a/sound/soc/codecs/rt1011.c b/sound/soc/codecs/rt1011.c
index 15488a0592837..d47b0370dd6b0 100644
--- a/sound/soc/codecs/rt1011.c
+++ b/sound/soc/codecs/rt1011.c
@@ -2133,10 +2133,20 @@ static int rt1011_set_bias_level(struct snd_soc_component *component,
 			SNDRV_PCM_FMTBIT_S20_3LE | SNDRV_PCM_FMTBIT_S16_LE | \
 			SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S32_LE)
 
+static const u64 rt1011_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF;
+
 static const struct snd_soc_dai_ops rt1011_aif_dai_ops = {
 	.hw_params = rt1011_hw_params,
 	.set_fmt = rt1011_set_dai_fmt,
 	.set_tdm_slot = rt1011_set_tdm_slot,
+	.auto_selectable_formats = &rt1011_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static struct snd_soc_dai_driver rt1011_dai[] = {
diff --git a/sound/soc/codecs/rt1015.c b/sound/soc/codecs/rt1015.c
index ff0c08ff610e1..c6d59c2860644 100644
--- a/sound/soc/codecs/rt1015.c
+++ b/sound/soc/codecs/rt1015.c
@@ -1016,10 +1016,20 @@ static void rt1015_remove(struct snd_soc_component *component)
 #define RT1015_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE | \
 			SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S8)
 
+static const u64 rt1015_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF;
+
 static const struct snd_soc_dai_ops rt1015_aif_dai_ops = {
 	.hw_params = rt1015_hw_params,
 	.set_fmt = rt1015_set_dai_fmt,
 	.set_tdm_slot = rt1015_set_tdm_slot,
+	.auto_selectable_formats = &rt1015_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static struct snd_soc_dai_driver rt1015_dai[] = {
diff --git a/sound/soc/codecs/rt1016.c b/sound/soc/codecs/rt1016.c
index 11c8c45574a13..56a2f3d3354df 100644
--- a/sound/soc/codecs/rt1016.c
+++ b/sound/soc/codecs/rt1016.c
@@ -534,9 +534,19 @@ static void rt1016_remove(struct snd_soc_component *component)
 #define RT1016_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE | \
 			SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S8)
 
+static const u64 rt1016_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF;
+
 static const struct snd_soc_dai_ops rt1016_aif_dai_ops = {
 	.hw_params = rt1016_hw_params,
 	.set_fmt = rt1016_set_dai_fmt,
+	.auto_selectable_formats	= &rt1016_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver rt1016_dai[] = {
diff --git a/sound/soc/codecs/rt1019.c b/sound/soc/codecs/rt1019.c
index 370521149ac8a..3998abccd93a8 100644
--- a/sound/soc/codecs/rt1019.c
+++ b/sound/soc/codecs/rt1019.c
@@ -492,12 +492,22 @@ static int rt1019_probe(struct snd_soc_component *component)
 #define RT1019_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE | \
 			SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S8)
 
+static const u64 rt1019_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF;
+
 static const struct snd_soc_dai_ops rt1019_aif_dai_ops = {
 	.hw_params = rt1019_hw_params,
 	.set_fmt = rt1019_set_dai_fmt,
 	.set_sysclk = rt1019_set_dai_sysclk,
 	.set_pll = rt1019_set_dai_pll,
 	.set_tdm_slot = rt1019_set_tdm_slot,
+	.auto_selectable_formats = &rt1019_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static struct snd_soc_dai_driver rt1019_dai[] = {
diff --git a/sound/soc/codecs/rt1305.c b/sound/soc/codecs/rt1305.c
index 2d5fad76cf528..92998ec0a392e 100644
--- a/sound/soc/codecs/rt1305.c
+++ b/sound/soc/codecs/rt1305.c
@@ -910,9 +910,19 @@ static int rt1305_resume(struct snd_soc_component *component)
 			SNDRV_PCM_FMTBIT_S20_3LE | SNDRV_PCM_FMTBIT_S16_LE | \
 			SNDRV_PCM_FMTBIT_S24_LE)
 
+static const u64 rt1305_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF;
+
 static const struct snd_soc_dai_ops rt1305_aif_dai_ops = {
 	.hw_params = rt1305_hw_params,
 	.set_fmt = rt1305_set_dai_fmt,
+	.auto_selectable_formats = &rt1305_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static struct snd_soc_dai_driver rt1305_dai[] = {
diff --git a/sound/soc/codecs/rt1308.c b/sound/soc/codecs/rt1308.c
index 630946cd7cdf8..28c25871ec0c0 100644
--- a/sound/soc/codecs/rt1308.c
+++ b/sound/soc/codecs/rt1308.c
@@ -729,9 +729,19 @@ static int rt1308_resume(struct snd_soc_component *component)
 			SNDRV_PCM_FMTBIT_S20_3LE | SNDRV_PCM_FMTBIT_S16_LE | \
 			SNDRV_PCM_FMTBIT_S24_LE)
 
+static const u64 rt1308_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF;
+
 static const struct snd_soc_dai_ops rt1308_aif_dai_ops = {
 	.hw_params = rt1308_hw_params,
 	.set_fmt = rt1308_set_dai_fmt,
+	.auto_selectable_formats	= &rt1308_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver rt1308_dai[] = {
diff --git a/sound/soc/codecs/rt1318.c b/sound/soc/codecs/rt1318.c
index d13fd0e141252..23d6ee974ef16 100644
--- a/sound/soc/codecs/rt1318.c
+++ b/sound/soc/codecs/rt1318.c
@@ -1087,12 +1087,22 @@ static int rt1318_resume(struct snd_soc_component *component)
 #define RT1318_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE | \
 			SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S8)
 
+static const u64 rt1318_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF;
+
 static const struct snd_soc_dai_ops rt1318_aif_dai_ops = {
 	.hw_params = rt1318_hw_params,
 	.set_fmt = rt1318_set_dai_fmt,
 	.set_sysclk = rt1318_set_dai_sysclk,
 	.set_pll = rt1318_set_dai_pll,
 	.set_tdm_slot = rt1318_set_tdm_slot,
+	.auto_selectable_formats = &rt1318_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static struct snd_soc_dai_driver rt1318_dai[] = {
diff --git a/sound/soc/codecs/rt274.c b/sound/soc/codecs/rt274.c
index 63b5fc439773d..d70feeb7aa1f2 100644
--- a/sound/soc/codecs/rt274.c
+++ b/sound/soc/codecs/rt274.c
@@ -1027,6 +1027,12 @@ static int rt274_resume(struct snd_soc_component *component)
 #define RT274_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE | \
 			SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S8)
 
+static const u64 rt274_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B;
+
 static const struct snd_soc_dai_ops rt274_aif_dai_ops = {
 	.hw_params = rt274_hw_params,
 	.set_fmt = rt274_set_dai_fmt,
@@ -1034,6 +1040,8 @@ static const struct snd_soc_dai_ops rt274_aif_dai_ops = {
 	.set_pll = rt274_set_dai_pll,
 	.set_bclk_ratio = rt274_set_bclk_ratio,
 	.set_tdm_slot = rt274_set_tdm_slot,
+	.auto_selectable_formats = &rt274_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static struct snd_soc_dai_driver rt274_dai[] = {
diff --git a/sound/soc/codecs/rt286.c b/sound/soc/codecs/rt286.c
index ded0ea3324804..0632fec5b0108 100644
--- a/sound/soc/codecs/rt286.c
+++ b/sound/soc/codecs/rt286.c
@@ -995,11 +995,19 @@ static int rt286_resume(struct snd_soc_component *component)
 #define RT286_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE | \
 			SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S8)
 
+static const u64 rt286_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B;
+
 static const struct snd_soc_dai_ops rt286_aif_dai_ops = {
 	.hw_params = rt286_hw_params,
 	.set_fmt = rt286_set_dai_fmt,
 	.set_sysclk = rt286_set_dai_sysclk,
 	.set_bclk_ratio = rt286_set_bclk_ratio,
+	.auto_selectable_formats	= &rt286_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver rt286_dai[] = {
diff --git a/sound/soc/codecs/rt298.c b/sound/soc/codecs/rt298.c
index 5414a1712b571..5901638198d8d 100644
--- a/sound/soc/codecs/rt298.c
+++ b/sound/soc/codecs/rt298.c
@@ -1056,11 +1056,19 @@ static int rt298_resume(struct snd_soc_component *component)
 #define RT298_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE | \
 			SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S8)
 
+static const u64 rt298_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B;
+
 static const struct snd_soc_dai_ops rt298_aif_dai_ops = {
 	.hw_params = rt298_hw_params,
 	.set_fmt = rt298_set_dai_fmt,
 	.set_sysclk = rt298_set_dai_sysclk,
 	.set_bclk_ratio = rt298_set_bclk_ratio,
+	.auto_selectable_formats = &rt298_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static struct snd_soc_dai_driver rt298_dai[] = {
diff --git a/sound/soc/codecs/rt5514.c b/sound/soc/codecs/rt5514.c
index 58aecd4c83a60..8dad8ba0fe0ff 100644
--- a/sound/soc/codecs/rt5514.c
+++ b/sound/soc/codecs/rt5514.c
@@ -1142,12 +1142,24 @@ static int rt5514_i2c_write(void *context, unsigned int reg, unsigned int val)
 #define RT5514_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE | \
 			SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S8)
 
+static const u64 rt5514_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops rt5514_aif_dai_ops = {
 	.hw_params = rt5514_hw_params,
 	.set_fmt = rt5514_set_dai_fmt,
 	.set_sysclk = rt5514_set_dai_sysclk,
 	.set_pll = rt5514_set_dai_pll,
 	.set_tdm_slot = rt5514_set_tdm_slot,
+	.auto_selectable_formats = &rt5514_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static struct snd_soc_dai_driver rt5514_dai[] = {
diff --git a/sound/soc/codecs/rt5616.c b/sound/soc/codecs/rt5616.c
index 46ee412dc81db..3f9d97d04d48a 100644
--- a/sound/soc/codecs/rt5616.c
+++ b/sound/soc/codecs/rt5616.c
@@ -1260,11 +1260,21 @@ static int rt5616_resume(struct snd_soc_component *component)
 #define RT5616_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE | \
 			SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S8)
 
+static const u64 rt5616_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF;
+
 static const struct snd_soc_dai_ops rt5616_aif_dai_ops = {
 	.hw_params = rt5616_hw_params,
 	.set_fmt = rt5616_set_dai_fmt,
 	.set_sysclk = rt5616_set_dai_sysclk,
 	.set_pll = rt5616_set_dai_pll,
+	.auto_selectable_formats = &rt5616_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static struct snd_soc_dai_driver rt5616_dai[] = {
diff --git a/sound/soc/codecs/rt5631.c b/sound/soc/codecs/rt5631.c
index ed1233973eb83..f97fd24e4229a 100644
--- a/sound/soc/codecs/rt5631.c
+++ b/sound/soc/codecs/rt5631.c
@@ -1626,11 +1626,21 @@ static int rt5631_probe(struct snd_soc_component *component)
 			SNDRV_PCM_FMTBIT_S24_LE | \
 			SNDRV_PCM_FMTBIT_S8)
 
+static const u64 rt5631_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF;
+
 static const struct snd_soc_dai_ops rt5631_ops = {
 	.hw_params = rt5631_hifi_pcm_params,
 	.set_fmt = rt5631_hifi_codec_set_dai_fmt,
 	.set_sysclk = rt5631_hifi_codec_set_dai_sysclk,
 	.set_pll = rt5631_codec_set_dai_pll,
+	.auto_selectable_formats = &rt5631_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static struct snd_soc_dai_driver rt5631_dai[] = {
diff --git a/sound/soc/codecs/rt5640.c b/sound/soc/codecs/rt5640.c
index 74fd05176eff7..4fa1eee8e87f3 100644
--- a/sound/soc/codecs/rt5640.c
+++ b/sound/soc/codecs/rt5640.c
@@ -2877,11 +2877,21 @@ static int rt5640_resume(struct snd_soc_component *component)
 #define RT5640_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE | \
 			SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S8)
 
+static const u64 rt5640_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF;
+
 static const struct snd_soc_dai_ops rt5640_aif_dai_ops = {
 	.hw_params = rt5640_hw_params,
 	.set_fmt = rt5640_set_dai_fmt,
 	.set_sysclk = rt5640_set_dai_sysclk,
 	.set_pll = rt5640_set_dai_pll,
+	.auto_selectable_formats	= &rt5640_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver rt5640_dai[] = {
diff --git a/sound/soc/codecs/rt5645.c b/sound/soc/codecs/rt5645.c
index 0d546fb34e527..11715e9b8b250 100644
--- a/sound/soc/codecs/rt5645.c
+++ b/sound/soc/codecs/rt5645.c
@@ -3537,12 +3537,22 @@ static int rt5645_resume(struct snd_soc_component *component)
 #define RT5645_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE | \
 			SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S8)
 
+static const u64 rt5645_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF;
+
 static const struct snd_soc_dai_ops rt5645_aif_dai_ops = {
 	.hw_params = rt5645_hw_params,
 	.set_fmt = rt5645_set_dai_fmt,
 	.set_sysclk = rt5645_set_dai_sysclk,
 	.set_tdm_slot = rt5645_set_tdm_slot,
 	.set_pll = rt5645_set_dai_pll,
+	.auto_selectable_formats	= &rt5645_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver rt5645_dai[] = {
diff --git a/sound/soc/codecs/rt5651.c b/sound/soc/codecs/rt5651.c
index 5c729135f71bd..9723b4c7540cb 100644
--- a/sound/soc/codecs/rt5651.c
+++ b/sound/soc/codecs/rt5651.c
@@ -2102,11 +2102,21 @@ static int rt5651_resume(struct snd_soc_component *component)
 #define RT5651_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE | \
 			SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S8)
 
+static const u64 rt5651_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF;
+
 static const struct snd_soc_dai_ops rt5651_aif_dai_ops = {
 	.hw_params = rt5651_hw_params,
 	.set_fmt = rt5651_set_dai_fmt,
 	.set_sysclk = rt5651_set_dai_sysclk,
 	.set_pll = rt5651_set_dai_pll,
+	.auto_selectable_formats	= &rt5651_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver rt5651_dai[] = {
diff --git a/sound/soc/codecs/rt5659.c b/sound/soc/codecs/rt5659.c
index 3097ee6d4e89f..3d782f41ccdd8 100644
--- a/sound/soc/codecs/rt5659.c
+++ b/sound/soc/codecs/rt5659.c
@@ -3716,11 +3716,21 @@ static int rt5659_resume(struct snd_soc_component *component)
 #define RT5659_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE | \
 		SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S8)
 
+static const u64 rt5659_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF;
+
 static const struct snd_soc_dai_ops rt5659_aif_dai_ops = {
 	.hw_params = rt5659_hw_params,
 	.set_fmt = rt5659_set_dai_fmt,
 	.set_tdm_slot = rt5659_set_tdm_slot,
 	.set_bclk_ratio = rt5659_set_bclk_ratio,
+	.auto_selectable_formats	= &rt5659_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver rt5659_dai[] = {
diff --git a/sound/soc/codecs/rt5660.c b/sound/soc/codecs/rt5660.c
index edf2e3e346e4f..807604120d282 100644
--- a/sound/soc/codecs/rt5660.c
+++ b/sound/soc/codecs/rt5660.c
@@ -1161,11 +1161,21 @@ static int rt5660_resume(struct snd_soc_component *component)
 #define RT5660_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE | \
 			SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S8)
 
+static const u64 rt5660_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF;
+
 static const struct snd_soc_dai_ops rt5660_aif_dai_ops = {
 	.hw_params = rt5660_hw_params,
 	.set_fmt = rt5660_set_dai_fmt,
 	.set_sysclk = rt5660_set_dai_sysclk,
 	.set_pll = rt5660_set_dai_pll,
+	.auto_selectable_formats	= &rt5660_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver rt5660_dai[] = {
diff --git a/sound/soc/codecs/rt5663.c b/sound/soc/codecs/rt5663.c
index 262d3bba1f3d4..ec46e6180cc0e 100644
--- a/sound/soc/codecs/rt5663.c
+++ b/sound/soc/codecs/rt5663.c
@@ -3222,6 +3222,14 @@ static int rt5663_resume(struct snd_soc_component *component)
 #define RT5663_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE | \
 			SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S8)
 
+static const u64 rt5663_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF;
+
 static const struct snd_soc_dai_ops rt5663_aif_dai_ops = {
 	.hw_params = rt5663_hw_params,
 	.set_fmt = rt5663_set_dai_fmt,
@@ -3229,6 +3237,8 @@ static const struct snd_soc_dai_ops rt5663_aif_dai_ops = {
 	.set_pll = rt5663_set_dai_pll,
 	.set_tdm_slot = rt5663_set_tdm_slot,
 	.set_bclk_ratio = rt5663_set_bclk_ratio,
+	.auto_selectable_formats	= &rt5663_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver rt5663_dai[] = {
diff --git a/sound/soc/codecs/rt5665.c b/sound/soc/codecs/rt5665.c
index 1d987472ba42f..9545758f58d66 100644
--- a/sound/soc/codecs/rt5665.c
+++ b/sound/soc/codecs/rt5665.c
@@ -4401,11 +4401,21 @@ static int rt5665_resume(struct snd_soc_component *component)
 #define RT5665_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE | \
 		SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S8)
 
+static const u64 rt5665_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF;
+
 static const struct snd_soc_dai_ops rt5665_aif_dai_ops = {
 	.hw_params = rt5665_hw_params,
 	.set_fmt = rt5665_set_dai_fmt,
 	.set_tdm_slot = rt5665_set_tdm_slot,
 	.set_bclk_ratio = rt5665_set_bclk_ratio,
+	.auto_selectable_formats	= &rt5665_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver rt5665_dai[] = {
diff --git a/sound/soc/codecs/rt5668.c b/sound/soc/codecs/rt5668.c
index 4154bad276101..cd6245d6b91af 100644
--- a/sound/soc/codecs/rt5668.c
+++ b/sound/soc/codecs/rt5668.c
@@ -2254,16 +2254,38 @@ static int rt5668_resume(struct snd_soc_component *component)
 #define RT5668_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE | \
 		SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S8)
 
+static const u64 rt5668_selectable_formats_aif1 =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
+static const u64 rt5668_selectable_formats_aif2 =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF;
+
 static const struct snd_soc_dai_ops rt5668_aif1_dai_ops = {
 	.hw_params = rt5668_hw_params,
 	.set_fmt = rt5668_set_dai_fmt,
 	.set_tdm_slot = rt5668_set_tdm_slot,
+	.auto_selectable_formats	= &rt5668_selectable_formats_aif1,
+	.num_auto_selectable_formats	= 1,
 };
 
 static const struct snd_soc_dai_ops rt5668_aif2_dai_ops = {
 	.hw_params = rt5668_hw_params,
 	.set_fmt = rt5668_set_dai_fmt,
 	.set_bclk_ratio = rt5668_set_bclk_ratio,
+	.auto_selectable_formats	= &rt5668_selectable_formats_aif2,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver rt5668_dai[] = {
diff --git a/sound/soc/codecs/rt5670.c b/sound/soc/codecs/rt5670.c
index 1d120b5dc2be7..f772f093479ad 100644
--- a/sound/soc/codecs/rt5670.c
+++ b/sound/soc/codecs/rt5670.c
@@ -2791,12 +2791,22 @@ static int rt5670_resume(struct snd_soc_component *component)
 #define RT5670_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE | \
 			SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S8)
 
+static const u64 rt5670_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF;
+
 static const struct snd_soc_dai_ops rt5670_aif_dai_ops = {
 	.hw_params = rt5670_hw_params,
 	.set_fmt = rt5670_set_dai_fmt,
 	.set_tdm_slot = rt5670_set_tdm_slot,
 	.set_pll = rt5670_set_dai_pll,
 	.set_bclk_ratio = rt5670_set_bclk_ratio,
+	.auto_selectable_formats	= &rt5670_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver rt5670_dai[] = {
diff --git a/sound/soc/codecs/rt5677.c b/sound/soc/codecs/rt5677.c
index 3e4d1dbce740e..8d2f2cffa6193 100644
--- a/sound/soc/codecs/rt5677.c
+++ b/sound/soc/codecs/rt5677.c
@@ -5033,12 +5033,22 @@ static int rt5677_write(void *context, unsigned int reg, unsigned int val)
 #define RT5677_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE | \
 			SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S8)
 
+static const u64 rt5677_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF;
+
 static const struct snd_soc_dai_ops rt5677_aif_dai_ops = {
 	.hw_params = rt5677_hw_params,
 	.set_fmt = rt5677_set_dai_fmt,
 	.set_sysclk = rt5677_set_dai_sysclk,
 	.set_pll = rt5677_set_dai_pll,
 	.set_tdm_slot = rt5677_set_tdm_slot,
+	.auto_selectable_formats	= &rt5677_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static const struct snd_soc_dai_ops rt5677_dsp_dai_ops = {
diff --git a/sound/soc/codecs/rt5682.c b/sound/soc/codecs/rt5682.c
index 6f7e68c20d135..1aceb08b280d6 100644
--- a/sound/soc/codecs/rt5682.c
+++ b/sound/soc/codecs/rt5682.c
@@ -3043,11 +3043,31 @@ static int rt5682_resume(struct snd_soc_component *component)
 #define rt5682_resume NULL
 #endif
 
+static const u64 rt5682_selectable_formats_aif1 =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
+static const u64 rt5682_selectable_formats_aif2 =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF;
+
 const struct snd_soc_dai_ops rt5682_aif1_dai_ops = {
 	.hw_params = rt5682_hw_params,
 	.set_fmt = rt5682_set_dai_fmt,
 	.set_tdm_slot = rt5682_set_tdm_slot,
 	.set_bclk_ratio = rt5682_set_bclk1_ratio,
+	.auto_selectable_formats	= &rt5682_selectable_formats_aif1,
+	.num_auto_selectable_formats	= 1,
 };
 EXPORT_SYMBOL_GPL(rt5682_aif1_dai_ops);
 
@@ -3055,6 +3075,8 @@ const struct snd_soc_dai_ops rt5682_aif2_dai_ops = {
 	.hw_params = rt5682_hw_params,
 	.set_fmt = rt5682_set_dai_fmt,
 	.set_bclk_ratio = rt5682_set_bclk2_ratio,
+	.auto_selectable_formats	= &rt5682_selectable_formats_aif2,
+	.num_auto_selectable_formats	= 1,
 };
 EXPORT_SYMBOL_GPL(rt5682_aif2_dai_ops);
 
diff --git a/sound/soc/codecs/rt5682s.c b/sound/soc/codecs/rt5682s.c
index 34997cfb465b6..6dd0d36a71863 100644
--- a/sound/soc/codecs/rt5682s.c
+++ b/sound/soc/codecs/rt5682s.c
@@ -2926,17 +2926,39 @@ static int rt5682s_resume(struct snd_soc_component *component)
 #define rt5682s_resume NULL
 #endif
 
+static const u64 rt5682s_selectable_formats_aif1 =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
+static const u64 rt5682s_selectable_formats_aif2 =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF;
+
 static const struct snd_soc_dai_ops rt5682s_aif1_dai_ops = {
 	.hw_params = rt5682s_hw_params,
 	.set_fmt = rt5682s_set_dai_fmt,
 	.set_tdm_slot = rt5682s_set_tdm_slot,
 	.set_bclk_ratio = rt5682s_set_bclk1_ratio,
+	.auto_selectable_formats	= &rt5682s_selectable_formats_aif1,
+	.num_auto_selectable_formats	= 1,
 };
 
 static const struct snd_soc_dai_ops rt5682s_aif2_dai_ops = {
 	.hw_params = rt5682s_hw_params,
 	.set_fmt = rt5682s_set_dai_fmt,
 	.set_bclk_ratio = rt5682s_set_bclk2_ratio,
+	.auto_selectable_formats	= &rt5682s_selectable_formats_aif2,
+	.num_auto_selectable_formats	= 1,
 };
 
 static const struct snd_soc_component_driver rt5682s_soc_component_dev = {
diff --git a/sound/soc/codecs/rt9120.c b/sound/soc/codecs/rt9120.c
index e51cd4a318948..1445e823c4ff0 100644
--- a/sound/soc/codecs/rt9120.c
+++ b/sound/soc/codecs/rt9120.c
@@ -289,9 +289,18 @@ static int rt9120_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
+static const u64 rt9120_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B;
+
 static const struct snd_soc_dai_ops rt9120_dai_ops = {
 	.set_fmt = rt9120_set_fmt,
 	.hw_params = rt9120_hw_params,
+	.auto_selectable_formats = &rt9120_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static struct snd_soc_dai_driver rt9120_dai = {
diff --git a/sound/soc/codecs/rt9123.c b/sound/soc/codecs/rt9123.c
index 07eaf275c9e98..251bad450ec8a 100644
--- a/sound/soc/codecs/rt9123.c
+++ b/sound/soc/codecs/rt9123.c
@@ -299,10 +299,23 @@ static int rt9123_dai_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
+/*
+ * NOTE
+ *
+ * auto_select doesn't include _DSP_A / _DSP_B, because it has limitaion for TDM
+ * (= rt9123_dai_hw_params()). It can be selected via Card directly if needed.
+ */
+static const u64 rt9123_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J;
+
 static const struct snd_soc_dai_ops rt9123_dai_ops = {
 	.set_fmt	= rt9123_dai_set_format,
 	.set_tdm_slot	= rt9123_dai_set_tdm_slot,
 	.hw_params	= rt9123_dai_hw_params,
+	.auto_selectable_formats	= &rt9123_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver rt9123_dai_driver = {
-- 
2.53.0

