Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011059.outbound.protection.outlook.com [52.101.125.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E6022A4EE
	for <linux-sound@vger.kernel.org>; Fri,  7 Aug 2026 00:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786064111; cv=fail; b=Cq8W5S1ep95Wv5SA7hKJkvOY8gj+i/tOiueBwNp0hWGjEBWot6paHzD/PqZS7vY2JO/LfkKpe/pkkirBKrUWyRtUiE6W/vrkUaBgroLyg146BiJuc9gknh8LFmHZ14pL99CNXvFlwxZH6JfyCF0lyA9XC6blchKYCsdkPqO911c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786064111; c=relaxed/simple;
	bh=PAwpytvvoTu0KwzQjsHuzb6IzRYvl/p13N209K0NyvA=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=FWXfTmp8yf2cFegdEP0j6u+5kz0oFyIBwMSkvtEUVo2xIuswoMYPob/UEMtH5wFJK1s+A1LhY4qe8e15r9okQX6GLsBQf3Vr6hS3PQdpnaquzSQAWxtWJrM1SYekkP8Fkio+dTQxNXzuYcKOosYzThjZ/VtUWwMQrOy1xg14Ow4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=CzPBoaEG; arc=fail smtp.client-ip=52.101.125.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="CzPBoaEG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C5J/cHkxoDSi9Qze/UPeXQ64Y1nX5tlXpCc4R+DiZBq/5Epu2oOKRr2UPOSq5xZjjAYVa+ptWjvNUG8kQzPlTttG6kwEHjKQwSL/R5UTUeSP2hm0KvWtj1J8JaX3YFlmWdZzfYlrTOM21PYB7KtGhGfiq2Wa17e80yjvpQnlhHDeP+6nSKMdK9GtjSCTWITHaxKGFu++dv0JnNOE+JZebak2Wz59DZNWi+q5f/chHwSPmyU1n3oCVhSZnicjsinuvOdIfdI1D77RZIJh70EXUiKfKhLaQBbQ3zKMykRpr9ZpFSTc4tHu02v+5DSk4iOR3Lm5UaIrDzpPJALU1dr+Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jm9sMF2uLcmEkudktIEwbYM5/VLkezJk/I52MWDKdgA=;
 b=wjj1nxjka/hiTDivvJ5SykWrxmM85Ix6J5S34L0DVHZGG0/68dzA0eHOS4etgVKg5HLV/O+/HwgyH+3fGM+Kpni+gg1YqLjeKeoU23EtuCHDBVUyuGWGz3aMC13QGuGbIyItlb/6J4clC069Kp6fOkYyOIfa3y3EJo5x9KKzrWqGFhexlSXGNjtV89WoRu6ud8p2NeQZ5G7rp+UpLxJFQbPaf6UT7Q8pnumO3PnyuDdLVkUVqZpKmcHQxFm6lVC2grIHcZS1YsXmlWTwfAQxYvvp/3rUlfCsTtVKDO5TBLkLoM1tkuQ/mAXZ5qx/qWg2fUNRAqJxLScc5vjcMsH/Sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jm9sMF2uLcmEkudktIEwbYM5/VLkezJk/I52MWDKdgA=;
 b=CzPBoaEGSwdVB8PfpGlRw1iMSyb6Oxo4sk7PzLa5Ypo3j7iy+hKGuBFg8PQhV+BY/IwtetonK6kZPwWr3t8oMv+/fU7Ok45nPRtSF8YRqDFD8uxrMRHbSm2MnmucB6QqmYKgurdUuKASffL6bp9PNtTt5JWJ12qTeov2485rDrA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OS7PR01MB14460.jpnprd01.prod.outlook.com (2603:1096:604:38d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.23; Fri, 7 Aug
 2026 00:54:55 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0292.022; Fri, 7 Aug 2026
 00:54:55 +0000
Message-ID: <87fr0qu4v5.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, M R Swami Reddy <mr.swami.reddy@ti.com>, Takashi Iwai <tiwai@suse.com>, Vishwas A Deshpande <vishwas.a.deshpande@ti.com>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH v2 19/44] ASoC: codecs: isabelle: use .auto_selectable_formats
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
In-Reply-To: <877bm2vjjn.wl-kuninori.morimoto.gx@renesas.com>
References: <877bm2vjjn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 7 Aug 2026 00:54:54 +0000
X-ClientProxiedBy: TY4PR01CA0055.jpnprd01.prod.outlook.com
 (2603:1096:405:372::11) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OS7PR01MB14460:EE_
X-MS-Office365-Filtering-Correlation-Id: 7447c76c-d446-4627-9e41-08def41e7efb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|52116014|366016|1800799024|376014|11063799006|56012099006|10067099003|18002099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	mFMCd7NfBmvvuCDtEF1ov3+n/VuQOfQGwWAGEIyz81xIx/xAmseABOpo/InxdNP5TfJ/ihLSiGukk3TwMJ0Nkhi7yFC4JoS0sUbilx/KD8fbP/VJMXFwM3NP62bmykAz5MW4cGCa026fd8TxkZJgZ2I35C8s1zMkXl0Y4K+VKfefa0UtgRaezNa2MHGwABXDE3fdiHOnqheLmjfRBUeX7fvWoTgEIYw01ZV/sLH/TGSYSqFn6B+/N1Q/uDm3VTwbDRlD5gmsXcF7BFMvCwdJXWlCMvGZdpy5GH7rCyHYezSKMcSjjo2mIdMJbxNMQ/WfM/EWv0HRpuevztl6oEFU0omXfnw1UfTGKSZHYDQDZpYwgeqmG2XP4uWKxrFomhJcXDkJBgp+FGfx/xURGIgRQIBkuJvSBUQFnqM7qcASf0QJ6rfrGmN4OBJLEhIwfTOXsv3jbkZsJKRA8kj8XY0qaqY81zf7drVMeKGndJTkvfyzVet3/g95yv9oZqaYN8s1b0xmRTp9O0ki5bq122t4NbT52fUwOWJfdkpmrcfT7pd1bL9bNgyqwu3deiQtXImHkdpvQDrjnpLq0lWhIFE7ZmIpQETUAK5y03ClsPNRvSAcUaA6EROOnMq73YhpxFfKMCu79L3e9CpXy3rxh8FJrnZ+eBdofCXBdwyJ/gX7+ajZn0uAsp1mpkRd8n7ad3Q16xypbWTVkvdGO/jifYF8oZbn5bQUcoN7iT/BKqaoEAc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(52116014)(366016)(1800799024)(376014)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?i1XKC8A0bxAe7R1B1BhGcnZ+cUXg8FZ9FRTXc0CE2KhhhtJgfaR5AOfzFQOb?=
 =?us-ascii?Q?96px4Cxw0H5bz/E7Ni7KeRMj9rtzpNOQY0VLSOvntNsEyUSqrQX0kOuiuiP2?=
 =?us-ascii?Q?fL0eKYjIMbtFFPoQRBHoxwbNvG2VXkLniF47MMcJyl+RHytgi4lhjalPJNHL?=
 =?us-ascii?Q?oEuCkIW9FtRZAIfUCJiJX8tCGcEcT49Oa0Z29IoFfTILU2yWMecitdJSWXck?=
 =?us-ascii?Q?Vky319SRHSn2uT/zVcUSmitLRDzNGdAtz3jnjvLJzdYEsy/SUYmh3xS6AzuC?=
 =?us-ascii?Q?GMvKNFBMePKxSY4uEVs/llutIfRXMZ9I2UWmmxP963cc80j0xIzcE226GcX7?=
 =?us-ascii?Q?0ALx9ijvULs4erI7nNYybKwxp8+WWjwpd1S9C706pVwIS6Ot0PADYVAagZKA?=
 =?us-ascii?Q?6Y7t1QWB8X7a5oQQH7ITNRHehJqCG4rSrMhXc3QPNHYeABOYiP3vZQHWJYaE?=
 =?us-ascii?Q?GCmvqs51VuDjR1MTp11Tz8PCuPYbB3NrDnrt27fk4pqGNmmS5lBleZ827XqH?=
 =?us-ascii?Q?8/VuKt2Xx0BBVB31bYBOcM3MRchwc9x34J+258w3rUILHop3ii17x3elB1i2?=
 =?us-ascii?Q?wi4JA8VkSRx0V9Dfk/h+4UDMzDRyqfwAQNkSn7iWXkHbHAOhFOjGM5XsnyZC?=
 =?us-ascii?Q?yvIhaA/qH6qWO8vJvoN+vRowLwCM1dATYOKC9cXbNypMEvdvCVtexxuZMZAI?=
 =?us-ascii?Q?VvbhiXli0hN9IwurFW05i8VVlZWXkwfhiKSR8IaKO/euaBc5nb/Szf5aq53q?=
 =?us-ascii?Q?OOw7SOZIbC0vgoTTl9WyiSXSvfd1vzc6iaUCI2BVw3d1T9ufTlb+t1IJxWu/?=
 =?us-ascii?Q?TCZ238brTqG5bEyly6afF8DhQxI990DIfp1BtJ1XNSdIlsRS0SKVCcYoReMf?=
 =?us-ascii?Q?WG8OUN3h5A2f+OdGBr0KDHB2GBFDMP/gQ3G8Ln/Gl0urbUkkEZ9a5UYfDn/A?=
 =?us-ascii?Q?mnCAy08fhW+z93+0lRQ0LBsmcV3K69WkEl1P1ZsZUFUI4lbFgKJjqH7wMAqP?=
 =?us-ascii?Q?uFBkb64oLeOqIfbqYYLnykAQfGMpAP+K/IPF329SSFZgamzz9TEHhA6I6cev?=
 =?us-ascii?Q?sGE4Vvq/T0rQ2tWAp3vQatO8ILt6ULgKZ6JZ2ZgNgnWnpJk3ggRywXMnrnfT?=
 =?us-ascii?Q?ynn0OchVO2NR/JK3bmIGBVgLDS7llzuIFHR6DNqXmQLOuxnat2u8ZaP9QaYN?=
 =?us-ascii?Q?apXp4Gy+vtufO3eTkvzpYr/vXJOD+HWDlYnBYfF1Bocxl7rnrqbEDgpXt7iT?=
 =?us-ascii?Q?b6umAjOFXsxQbUDPnc/lFuo9NfMHxoFPgqyxZEVPE2ZAnNSF2GMttj6ciMAa?=
 =?us-ascii?Q?lRrWqjIohJSHbr24lFshacziwWSrs9/DM378jJmvEoWZ9gmZPl/HbpfYUcJq?=
 =?us-ascii?Q?9q8dA0wu7RZFurU02Ye9iHPUsAyGDr5kFuFFGj4bv3YoOVhjxlJpWki+EruP?=
 =?us-ascii?Q?WP7bRV0WkPHDZI4LH3VorHjX4rrq6/JesWikd9i9P9MUo3HbIRpI/r9OQP9S?=
 =?us-ascii?Q?fnKkd0G36PX6QfmwoNaoyIjuMRLiRslKrcePvpVMsq8hwqOKNngEEazatjeZ?=
 =?us-ascii?Q?G7YQWy0lQBH5K79pbuPqR7NyWaGr9KH7itce6NYsYZfLMhoFOO/zRzn8pKUD?=
 =?us-ascii?Q?vgtLjDZETPYpWzf0OT1/A7r6u6xxlWVXhka+NYBO/cqtYoLDMCEv+qX96gp6?=
 =?us-ascii?Q?LOiYye88kpyjU9gI64vbi7Vht3MfYDIu3Y05zs5nZeRgVmDATlKyj/HQxO12?=
 =?us-ascii?Q?F4WhQwIpr5twH7PYFHkTOJ0zxjFh1SubbJ+LPKPjz53f7Vnz4yds?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7447c76c-d446-4627-9e41-08def41e7efb
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 00:54:55.1230
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DAybsBt7rs/cNnKFbRcGTxDfxgpxDlwhD8UrgoLWmg27Jhd26XSWH62qzUyjg5YbmrU9vsYyWi+DvCVfZyjuuk/IyHE9PfYPHi4SJOr+0B2xJ53ICLpYzNdDfIFv/0f4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB14460

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/isabelle.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/sound/soc/codecs/isabelle.c b/sound/soc/codecs/isabelle.c
index fa1c23dda4eb6..7e8dde79b11a8 100644
--- a/sound/soc/codecs/isabelle.c
+++ b/sound/soc/codecs/isabelle.c
@@ -1011,10 +1011,17 @@ static int isabelle_set_dai_fmt(struct snd_soc_dai *codec_dai, unsigned int fmt)
 #define ISABELLE_FORMATS (SNDRV_PCM_FMTBIT_S20_3LE |\
 			SNDRV_PCM_FMTBIT_S32_LE)
 
+static const u64 isabelle_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_PDM;
+
 static const struct snd_soc_dai_ops isabelle_hs_dai_ops = {
 	.hw_params	= isabelle_hw_params,
 	.set_fmt	= isabelle_set_dai_fmt,
 	.mute_stream	= isabelle_hs_mute,
+	.auto_selectable_formats	= &isabelle_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
@@ -1022,6 +1029,8 @@ static const struct snd_soc_dai_ops isabelle_hf_dai_ops = {
 	.hw_params	= isabelle_hw_params,
 	.set_fmt	= isabelle_set_dai_fmt,
 	.mute_stream	= isabelle_hf_mute,
+	.auto_selectable_formats	= &isabelle_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
@@ -1029,12 +1038,16 @@ static const struct snd_soc_dai_ops isabelle_line_dai_ops = {
 	.hw_params	= isabelle_hw_params,
 	.set_fmt	= isabelle_set_dai_fmt,
 	.mute_stream	= isabelle_line_mute,
+	.auto_selectable_formats	= &isabelle_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
 static const struct snd_soc_dai_ops isabelle_ul_dai_ops = {
 	.hw_params	= isabelle_hw_params,
 	.set_fmt	= isabelle_set_dai_fmt,
+	.auto_selectable_formats	= &isabelle_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 /* ISABELLE dai structure */
-- 
2.53.0

