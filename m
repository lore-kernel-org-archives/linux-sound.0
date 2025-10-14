Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010020.outbound.protection.outlook.com [52.101.229.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB61C3081BB
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 04:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760415640; cv=fail; b=EXBu/A6Xo43JYnnahYCZQquRGMUmImix+xpuLkUojm3LkwPsSoWxK3pxLotI7/O8xxzZRba6D1v1tVS9SteifFRs8S9/r/34yTMST2WClRYti41judtwnbFYkROVHHWL7GakJ2HlGP45onnxHuBYpJD5K/oFAs1vINnJiCudeQQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760415640; c=relaxed/simple;
	bh=QYtnoK2X+qQD481DlimRI4SJyqxQOecw9X1H0mm0pPI=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=NDqDBRCLEeZJt3X0hyLnvdWlfbK+hS2xNDvgg1J1o5TavYF6U7O7Mk+OaHoYSdjDB602QZx0wK8aYo4WmxMhhxOaAU9jXYgs4B82QapqTLgQrCDs32WBcTi0Snh/skMm7h25ZvWIpsIkXd45W9uyIBlKghjDaI+1oLLw4xF6vaE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=CcI3nfUs; arc=fail smtp.client-ip=52.101.229.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="CcI3nfUs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UvOR8YyJFy7PXARIFb14tcxGxZVEDp7fminzOXMvGtWYJJHc2eXzIbKKuK3LOZOP3/ZWu1KbpPjGec1QAMEBsv3qyuDvcgjp9P4pPaQ+GQJHqYkgpw0DZkPat8J2peNd6gyXoWmkLuTs4E4i6RomfRh60I8yPECsEO6RpRyRN/9opNGH6xJrfw7rjPGVIJ0/Z1MP8cf3KTKBtcRvMR3qhky0+Cd/lyv2M5t6jAx+/boplo1dWyUrFPDkMKgTTHcxumxD0gyUsnkTzthwIJhdXYH0uqEiYeXOIzrGLKl834hTPCYMBgR4FpDL2PGnSF7PiGQ5fIqHcSWQ1kc681KyQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Jy3H/2CdpGuXzTayKd5mIIn297Zam0qM7+TH+XCt8M=;
 b=TrD3ETe3GbVRA13ILdYRdVpRgbgIbDHE5PJLQnKeM9EK2RmMHLNei/sJv9PGuy+Xm3eM8IuKmM39tpXAygifPqYCdcQDJjRfYR0RtRs8R0+DL4+CFOw2o1nuXfMGlat2D1LMIMrtaEU/h8Xu0oZz7pULuRpT4zt15WU+oaiOVaP/j641clT7hwjaHZoxVTAbVjTFLm1Jd1EVFl8u9cEYL4qjwGjCr4U/hpgCLdVXuQD4RR21pxw8lFCd+70ZBjKmzJ7EnTMI27mejGuunh2Wko2K8gpUd9sOUZCnSEZxNX8jhtjgIm9NnHVCAVUnhNLQbzPDc1Wwtc0m97JE1hxQsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Jy3H/2CdpGuXzTayKd5mIIn297Zam0qM7+TH+XCt8M=;
 b=CcI3nfUs7uJU03x8TbiPx6x9oIfbD/zCw8hfoNoQh5UCGux/KK+U/qhWDGZq3mFKaRbhWfToauY7qorD37HbLGfEVuS6fyZzkmp61Yoyn5V7T460HojRfBMTZr7JPYTh6SrZzT9g3YwU39btgfps5zZTmYtu2rp5HMjm1mts1rA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB13995.jpnprd01.prod.outlook.com
 (2603:1096:405:205::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 04:20:36 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 04:20:35 +0000
Message-ID: <875xcit8q4.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 018/139] ASoC: codecs: cs35l36: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Oct 2025 04:20:35 +0000
X-ClientProxiedBy: TYCP286CA0158.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:383::9) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB13995:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a6678c7-6e82-4098-1975-08de0ad905ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?e6pJTtc5/ZdPwFXoCi3YKPPx2lfG6qbmMc+63gPqile03vy3zFr/4BaHuz/U?=
 =?us-ascii?Q?JTI3Z8poVywd9L+7S+Ah6phATs2vPovSBAxqmsN8QMOSKqyP13DJwrZza8a1?=
 =?us-ascii?Q?8JXPng2uMJEOK6aYape5vqf6EXvbqEfXmUasVmt/Uwmb6N5mQ8BjdT8FmZZF?=
 =?us-ascii?Q?vGDSE78KbyXzfgmwYIcjRakvtiVShSD4fzF8AozCf6qhdaGv2cQzH0mMslLh?=
 =?us-ascii?Q?pIIhPzmSiCGr8jVKqTBGX67CRDMo2b2NR6H64lcLqz/K6mT1IrsVD3VShFQG?=
 =?us-ascii?Q?z1u5y6XOEz344Y2CItXFd0EEckHouDiB0FqO3HbgKmdniYv4kZOFXn2A9/AJ?=
 =?us-ascii?Q?npJ0sK3bdaNMNev1sQUMGZuNXutTiaJ3PfVzqXHbO+yzDrkiaD6WbDtgXbXo?=
 =?us-ascii?Q?EXz625yLbvgVimRJ31zvvwOeztiag/5Lf291hxApJMSyyv3dDcTEyiIfUf79?=
 =?us-ascii?Q?yL/GPYswElyYv+oh6ps8fI9XvdppqP77NqA4JRD7ehiP7Z7q3MvApxHnDpAU?=
 =?us-ascii?Q?1jFV9R72+7897WvZCoxP7Bdw4W7sqn26s89HrbQnDowIoVpVr3mabaTNt9m6?=
 =?us-ascii?Q?Y2W/8ZnzlDX6//zG0LOy02+UiLYMHICRkeZMSq1/wCsZ/AaLkGcwQ1dXoe91?=
 =?us-ascii?Q?L7BKka84O96OXpeRfT5cs9+u3h8cmGPQ5fsWOXicjJcGCj+SokxnD0LnHK3s?=
 =?us-ascii?Q?GNP4V39qFbq+MUjfiQFs1ku0b2SiHoR7IMqabeZU0BO9Q1DDSLGgLB7ZaZlu?=
 =?us-ascii?Q?HYfINSzGTFbhSqh7XvzPouqXODiYfNkP0uXfGOeiDV93ZInRSrDlMRUir2h2?=
 =?us-ascii?Q?JeAZjGuQminPoqwXjdz3iM56INfuwcbodYZhSQAUEAYgAPRJ79mk+Tiu/2Fv?=
 =?us-ascii?Q?fj3sAwknU+3Pg3sAujIuFK/prbQTbXhCIa1pbExgRUb19GMUA0BzK7yM4Htb?=
 =?us-ascii?Q?sEfuv8J0LN4yJAJxJelg738lPMvMxq40q6cuILGNK+WUT0HrBCfKd1MXSpQM?=
 =?us-ascii?Q?5OCGpLhcsIzU+AXXUJli/c8m5PR8r5xOcc18iT2NFgsDpn753kFSBmv72C1f?=
 =?us-ascii?Q?8TbGQxQcmpMa2zh4Dv52DQ62gZlRY9K8it8SF34e9WooWX1BpFOfHwGgQrdc?=
 =?us-ascii?Q?db8uAIqsLrfgtDRhTR226dK8oOaHwH3VS/hCQT/kQLBWQ39kqMbcQF2oShKg?=
 =?us-ascii?Q?cd9h9k7A3p0Hl1arwQYSeFW4X5EWBWTsGpcdIBWNEVblRLbt9qPF9JHQgus9?=
 =?us-ascii?Q?Q+UoeWlFgiQKtX6wW62Vw+ju5TNTLPNI1rUpq5kEc3rEo445kohGIdcwRDeU?=
 =?us-ascii?Q?I52tFQjqH08tcupZ91U0RM+y6ECmENLRS5eJyMrjALTc9kd18G12z0XBDbeJ?=
 =?us-ascii?Q?PDLR4OZxA12he8xgTLq062z+dtDl2rO4adkCTDCrmKz9y32T8MPyGTyZu5ct?=
 =?us-ascii?Q?iAEclz6Y1+iWmh2Phjcp4ObtIjLjiZreosq8FP7k2e1jrG4paYSvidT6ppsF?=
 =?us-ascii?Q?CElp0jyO9lH7T46e54yK8gO3FlmkDqR9VPZy?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?oMcYJhLvtiOaTVDDjHw9ZbPO5Zqga/W++67Haj3hsMS7s9xpoFQKxlIeILwN?=
 =?us-ascii?Q?Tx7SlDaDrP23uJCA+xbLxRRiN8OYnnk4lZCdOVXswKsG3lQhqdJctgxoWErR?=
 =?us-ascii?Q?ldOddPGxA+LmV3qB0M6nLyA1kKkl8sxQ7LRpWImxGTM+XBDif7t5EavoxO7J?=
 =?us-ascii?Q?7Jv47UIPSinYtQdxoE5O/r6iHyxkQRINs8PGkb3FkqbwilEWdSyJmb0wmOJ7?=
 =?us-ascii?Q?uqK8KqLATk7us/kpTq1/m3R9wzEYD4J88nF+IfCiMScP19mjw0Ol/QTwvu4+?=
 =?us-ascii?Q?brK+Cplfl0wK5uuLxeYv5CfG1y+kDlajE4XZtyypi3QVqfrX0ZBT8ZC24DBk?=
 =?us-ascii?Q?8mH7h8gdcp8PMyDnKUo9qa0MsLF9UblO4KoSDlpHObwsM0Dr2ckWypjom7cw?=
 =?us-ascii?Q?gUmtAc2Lirh/L3zPAbDYQtq6rg7fy2Mcuv+I95QC4nAI6TwEMfcr/zhyv2pd?=
 =?us-ascii?Q?Yx74oacN1QZ0yWvsuOoOraDrAOR0L+L34q1P58pfQc+XnfbDSLgOtXZtv0Wu?=
 =?us-ascii?Q?O8sTN0jS74nX3gCRCzNEpCYL2ebBBfK2Nd5/TYeK/ZP0PVIT9WIKXwkxqN2x?=
 =?us-ascii?Q?SPio2b/vNjDuYNwkjncHqUU2W7m/i95y9BwL2p2bPL76sU6cj9TDsMupeiCV?=
 =?us-ascii?Q?T1hqNAqLOFh0HsAzMMnaYwBEhWcLcmyOx3wYAp18keK7UMMIRksSXIjUsLLY?=
 =?us-ascii?Q?jlND6M3IdN72goZgMZ7X4li+PHzwk4dbajYOSygRyULd3RM4lL1xvMNSuOQg?=
 =?us-ascii?Q?855Ztu0Lmf3UVQDWnIiuaomq4HWX5Zo8HPN5XPAMd7ZaExqLtO7QQZvKorAL?=
 =?us-ascii?Q?T6dsJ5CQfl2eVyU6fXNRpYhz9RpBv9KEAALw+pO8nIkiIxhtj9GAUFuY+AX1?=
 =?us-ascii?Q?tcl5ruBoJSh80BWRwVr4UHQSW8QwiVZpYOoyOwBzj403lRz5LvzeZPljrb9P?=
 =?us-ascii?Q?LA84kyAEwHfQtFNlopMSCsDPD+kSvjg7bwGMPa2KSBVITSWMCKDCQ7CCU7Xx?=
 =?us-ascii?Q?nL67eAtXbRs6jWD3ZHX+Bb/9kY5OmEekMFjZe1EV4OVF2WZEZA/M5PyL64QU?=
 =?us-ascii?Q?Fhq0pplyo/yxdSo1IeN8sdp3XnY3SufeiwDuR7qEM7lye+mLVl0AF1Z309pk?=
 =?us-ascii?Q?z8oqWRoWFqEyAsXEFNepKaVmSpqzDOffQMTn5yYl3jRA25iUcFD+HKaWB41H?=
 =?us-ascii?Q?WGYSvQKtRsF7gKxglHcLmM7DYmczWJPvM4u5qIxVCNqokzuoZaEjjsDwVEP6?=
 =?us-ascii?Q?WOPXsVYPFHUs1MMQigvjOuhig6dkBseaWNXrQ88M1r0KQjh/VrcM3BtFDcgX?=
 =?us-ascii?Q?WoOtXSCgQNHwwEYLTiA8mHHaDEhRcGe67jMh9ZVMySya0LX8/F4HMYUQhe7G?=
 =?us-ascii?Q?u6NyyLfR95Xk8UXOANDVWomS9Ris26XEmle274XmL8rwqsH/um3UIrNvA8tz?=
 =?us-ascii?Q?qGbFa3gedkYawJR5fPn3zimXCqIhlYLuMahS2LeEQspaGeMh93QymO61E56X?=
 =?us-ascii?Q?WTlwWhkYKVMgqllQF0Hn65uPm+nIMplRhbbyG69uHzifRFA3YFbQHmc50FS/?=
 =?us-ascii?Q?9naZwKQcr6Uf0XjM0Gn77t1eO4lCb1lwXUv5FVVlBpHfrgfHH2HUSo4IYtJ0?=
 =?us-ascii?Q?bzcR3zleYpTvP9BmS4xr4+4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a6678c7-6e82-4098-1975-08de0ad905ff
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 04:20:35.8975
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e7qsuDrvbFKDs/PhM494q6n6vFJVloOk9N3zCuu3CTiWo4w/r4Et0/emU7sjhhX/iYOrrDMkOG/4NEhwTxYVQnpwhx3y5am0bTUqPyTmszGeZnSD9hsMlbiPqhNEcQ9J
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB13995

We have very similar name functions (A)(B). Both gets component from
snd_kcontrol, but (A) is used in callback functions which is registered
through snd_soc_add_component_controls(), (B) is used through
snd_soc_dapm_new_widgets().

	(A) snd_soc_kcontrol_component()
	(B) snd_soc_dapm_kcontrol_component()

(B) is using very picky way to get component but using it is necessary in
ASoC. But (A) is just wrapper function to snd_kcontrol_chip(), and directly
using it without wrapper is very common way on ALSA.
To reduce confusions of similar function, let's use common way on (A).

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/cs35l36.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/cs35l36.c b/sound/soc/codecs/cs35l36.c
index b60697ff7a506..93818d7ec1a77 100644
--- a/sound/soc/codecs/cs35l36.c
+++ b/sound/soc/codecs/cs35l36.c
@@ -455,8 +455,7 @@ static SOC_ENUM_SINGLE_DECL(pcm_sft_ramp, CS35L36_AMP_DIG_VOL_CTRL, 0,
 static int cs35l36_ldm_sel_get(struct snd_kcontrol *kcontrol,
 			       struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component =
-			snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct cs35l36_private *cs35l36 =
 			snd_soc_component_get_drvdata(component);
 
@@ -468,8 +467,7 @@ static int cs35l36_ldm_sel_get(struct snd_kcontrol *kcontrol,
 static int cs35l36_ldm_sel_put(struct snd_kcontrol *kcontrol,
 			       struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component =
-			snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct cs35l36_private *cs35l36 =
 			snd_soc_component_get_drvdata(component);
 	int val = (ucontrol->value.integer.value[0]) ? CS35L36_NG_AMP_EN_MASK :
-- 
2.43.0

