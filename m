Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011038.outbound.protection.outlook.com [40.107.74.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF8CF223DEA
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762821265; cv=fail; b=AbwjuYpNJwMe3rjvU3L3xoLaGEwUCAwaqiqNNAT/rKflyBr9Pf/58FXaxAU14ZFudHBKuv87zPoQ5eL57ze7bhi6lyYzN3xzYJkKgjYDiSdfF/ZoefEwz+z53CsqIoE0MBVA6CXiZ/bmYORf0MzpwmkQY+FU+QUakwNk7cCDBiQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762821265; c=relaxed/simple;
	bh=idTskOpavNc7NWqbdkLgAkRWf/PNR0MbLRApc/Bd5Qo=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=vDcbUUne71+3M0pCFZBnnbhadS8SGKYWv203viN0NlN9yQDZx3g1MobaBYo5aEXr/ePZ1wZg14iUv7H1WVbT71J07/6ycDJoLpuGrV14ZzxRFUNaz3gV5Jz2372QDE8JAD4Syg1Ho3e2jSKPEPJlAI3+mive2FKs9dsOgrXv3uE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=ZBRpH1+z; arc=fail smtp.client-ip=40.107.74.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="ZBRpH1+z"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ev3fMQGCmwgbs/ebfMvoj/0yCjwPPsAGbFxFKk8z5u7Vh6Gtibukizqj5MSoqwMdqcQBbBlYFKZpwlhtRVIS83uz/mXG/9/02cUl9Upa5eRqEMAsL6LlP8TXw7nLjMgFZ3zZL3YaeB80upWhZ3C3jXxD2Z0Ox+MtwO90HzK3ySKe4te3brzBVLjHmndjlKNb/z+1cwjdTzz/oQzUmItlO3EViVX3weNh40PUWb5kai3Orrfu6fPNT5cpslD0s1P/LYm0b7/C1XmBPsbklDWiBlpuTAPnB1345e17R9vaZ87rgf4rtSeR2lVVYgTcfaFfO27VhwB5Qx36Ddbf86tKgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MyqR0Ciu3F4ydKT/AkPy10M3mGGrXjKAuZ2s6eR/8ps=;
 b=wi26Iz0mqvW048oeCfjX4WWIfUX4MrVvi4tFgN67ie12Z2Ettb/3AR1yHe7XGitY6QhAuKldYozl2EMUu2Xr0BnkS+HLSe3Hm96JQnSPwHmjVC5DLsOyojkf+DM6cYz2RE3jGa9u+GA16AJ/jjNdX7cDPRXy9ZHaldg7NzFfQT/eXs/6XoxTDZfczbANgv6bf48fRhpmnLs3s5qQBL//RL9H4CLlJIbkMciwtWB1MuRsp8vtJF8LhX17RpqlcWsG/uQX+NNu9gWXgBU2hDqmZQEKMIRfWlt9l//QBqJ7nzX/BUIr9eTTb+hwXVq1laAfPQlkM83G3SjbVIx9bTIkjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MyqR0Ciu3F4ydKT/AkPy10M3mGGrXjKAuZ2s6eR/8ps=;
 b=ZBRpH1+zIyH6/2BvzSI9utlxVzE39TAKLm8UNRh9LM+5bQb+Ansy5FqQeQP2qd1SIOu2q9MyeL4MnYwOuLQ2khiQi1Eg0A4o0wLmOcYkgGQZlj+QriDE1L1hOkB+ih4lqpdgkWegJ0MeEIFN8pXuj33Cwh2uy0pj3Xr4+kzoFX4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYYPR01MB12531.jpnprd01.prod.outlook.com
 (2603:1096:405:19c::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Tue, 11 Nov
 2025 00:34:21 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:34:21 +0000
Message-ID: <87ms4tv242.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 242/292] ASoC: qcom: q6usb: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:34:21 +0000
X-ClientProxiedBy: TY4P301CA0031.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:2be::17) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYYPR01MB12531:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fa319bc-b1eb-4607-2058-08de20ba0e9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yHDU/A/7z3HR7IGFEyqXt3N5cxafoEEGnq2qMVvvySeDSQVbEZn3BLIZVrHi?=
 =?us-ascii?Q?G3lhcnc0pRurTLb2e1wh9fsTLZ8MDq3W1ELHgYdOdMasUeODo5Wq+B8QtJEc?=
 =?us-ascii?Q?UO/jhJkK3AVnT137rBR15utLSF1vIW8U8R3fNOrFOh9Q4KiX33c6Os2JV2UP?=
 =?us-ascii?Q?zFQrCHdvaObOfJFky3RzGTcgzKg2ttEQZNCcyCf2Nwpr71X5bZU3R/AzLHji?=
 =?us-ascii?Q?l5U3EBegJq2hGdBaiRD9vOXW5doJjMtt9XFKXEQM0N2cHpjZbsVXlIwr5Fp/?=
 =?us-ascii?Q?aKExfaXmYhcwTY182i4kq8NtXxwQGc0m7JW8X8z/OGM54cyDiIIAKveKzSY6?=
 =?us-ascii?Q?y3JArpZrQnXm14EopkK2MPFHQP2FnLndcCwq5AFjxLwN83XfUKd3bgJ8HbYr?=
 =?us-ascii?Q?uKCnf4pyGxDwXVEokuaaOlOcoqSy8/iJ6NfLM65z+g/CJEYNZqekWFHsFppx?=
 =?us-ascii?Q?W3MknHT2GbNC3P10dOn3wxdR+oYspsvUJPPF9Lyjrxq2EflMRQ9GaU9uYsiH?=
 =?us-ascii?Q?5rfIoOE2h691zRN9SlJ6yCD2djqBTjkUoPGsqLbWLGekfRC/UbIPtT+Z+P5O?=
 =?us-ascii?Q?dYzD6HoeaCDPjpuoYnDE2MkeLsZBPB8DVgODgwLL5oBDR3fyKHbuv0nt6CHm?=
 =?us-ascii?Q?XkJ79wgoqkRs+gX9Pr2rTXp4KlQ+FRErtY3BTUC7WqRL1ymKK7fpH+a2UvnG?=
 =?us-ascii?Q?XV8/WvpW+flIitA8tVagWKznglam165FKhanUOtUrhQqOIF4R0h24DGsxs6z?=
 =?us-ascii?Q?BdeTz+JrropElNN8Oj6nj2VtgLekyB28PYN5+wc01ckpc0YhKR4riQ0FRf6D?=
 =?us-ascii?Q?P19fkn93Qm9HWFP8QcKvQYSjjkX+GaxSpvbyVKfnK8WgJeceOpiro/yJPFQM?=
 =?us-ascii?Q?E2ntTbAHnN5ShhXqVwynd1Vl8oYD8U/tGtKWL1ay0pVWfLxCjK4kQQU3GDD6?=
 =?us-ascii?Q?OO8RKrrg6Cup9xRo+m2q6+cKUfNU5Sbb4gcgxBamwdsMAbC/rGCD80JjmNha?=
 =?us-ascii?Q?EMeQ/FCVMQU2wFJwjtQwBOQ2wl7BCVuURhPRQn6c7m5fghmlPLCARWivBKyX?=
 =?us-ascii?Q?ceAt81JjGDZYgg0UkJ2Rg3sV7iUjYfKmjKvxEgTRODX8lV7uXccVwmw6o9gJ?=
 =?us-ascii?Q?FIv46xYmseJITQcnfLyNxl1ZWvA4IjxojW5M1/uGZglCgtrtYzoqevKxRlKr?=
 =?us-ascii?Q?wJFjgOlii47WdFUOKWQlWG0bdxTs6cUnnZoI7LhJkz35rDGgUoGPAu6GloAL?=
 =?us-ascii?Q?n7GxE+yx1EZhv4j54Gv/eSbfmnKX/1VKODhP9n4b9zZS2bTVwHkSScD2ICN5?=
 =?us-ascii?Q?B2AVqY/2xbLdYn/8qESljgCQYjDsusZyn1htNXpYovQcIUMHjOjQrBZ/e53W?=
 =?us-ascii?Q?5R9Q3oMpTjSCLMgkx+UucLTZfddGBzJ5ExFdUM/++FyPqIWGIo1XwORzHUaR?=
 =?us-ascii?Q?S4dxoteAp3tOS1xvleRcmgrprzpLHGVileOQI22P2//l8/d66OF4TNN3DPSn?=
 =?us-ascii?Q?93NI8/I26JiCwt8bazAMoyXRP2Jkz6BtRSt2?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xG/QayUVZ/9d63JyotM/qbBCNwhaqvCinA+v16cFIcYulu3/5Zj1tjlQ93vQ?=
 =?us-ascii?Q?yRrPjsmM/XtHW2TnPDDpB1z9FZUeMyw1THE/n3UYWu7sfZe9cVpdsVoHAV+I?=
 =?us-ascii?Q?ys+v/nI93QSNoe+5swD/wy9VIa5t/MwxexBp6AK+vUQL+mDsYjQ565Sc5Ot4?=
 =?us-ascii?Q?By2CkMyZx2KtZsm1euv4AKtSJ7i5/W3Y2EpLF3ZDTICVKo1lEoBvNW5ckyoy?=
 =?us-ascii?Q?5g9o0uLmPkbsF1i3Pwzpk8z1keZ86vFgTqw3j+lmFIp935g8KHoydXrgek98?=
 =?us-ascii?Q?z6nPhHspSD8+XvkeE0acGGzcHSkasoinOajyQK2T5PC1X2y++QMi3lyQ/ROm?=
 =?us-ascii?Q?PuqvpI13A0wTN1VKwCdi+eKUC0c8wHlsCzr4vJsrRFa2oRku/6vjJcNQBN1f?=
 =?us-ascii?Q?4D0cmRYo2wz2u43kE/XpVgZqMKR4rGD6DGERk5HJIhRJHOOYYuPqCDsv260+?=
 =?us-ascii?Q?M3QBitU0WYEgoLeQsRt4vttM5Oa6mxnZYAMovZ5DNGNWHGvqHgeA1sGqqA5f?=
 =?us-ascii?Q?kFwjARlp7l48FV6x9DAWtpsyPsDX0wXFJ5s8tXqGNSOTgQ5dUFpIi8LoBcBT?=
 =?us-ascii?Q?9g8Q+iVyHr4KrEsw6ZGBMjzppkN78BTo4HwilZ56WKR+Q0vkjKtH+7SvR+PZ?=
 =?us-ascii?Q?0/txoHAiETnYN9ABBzTXrs6d3SdOwkfo1X5OIIHixCqMCbZr645alYgPhqI5?=
 =?us-ascii?Q?xy4zl8FGLsNUZ/FWjD58mQ0VULDiIfiHZxtmOSrQBuPojtvzongE+CoMW/Bk?=
 =?us-ascii?Q?IUjycpg1IJgdNwcSg1lw8XTwEN1eCqGPpSJWNqc1uRpNTf8TPwgmQ1vr8JCa?=
 =?us-ascii?Q?sM4v3onuy/7MyIhmhCWdUAdEw4w2aqSNTXfySqhYTZhrD1c5mPwO5gBOpHlu?=
 =?us-ascii?Q?g00wHpDX24il7zUdpZ0tc03cMpl96KBqmkWGNCEv/iR/1UP67WLLf5m1yhM0?=
 =?us-ascii?Q?PNkNwGB24BcHClMlHcrmkMP2ol7pbzEccNqsAkdqMqqpHJRXr0B1+hciMqoe?=
 =?us-ascii?Q?iD1YylXB/ca0+VacwqugBgDzqdvVKqaSPobTx3iRfweq87CmjHeFg5xSpkWh?=
 =?us-ascii?Q?eGeg2Q/FDecaPCCG6xqqyfWRtLPa5lGadgOXJCPgyulwJEn+hm4S8cAy7Dsi?=
 =?us-ascii?Q?o3ZqfUonspGTpdvXr0NRGq8qS1euv+x5J1fX65ua29fsB7Z+W9I0SVIUBS9Z?=
 =?us-ascii?Q?aOkwwA8MCjoMyFHoBYF/HJX9rY2Ok14lbEl1Ig8ZF8rK2gdkfxLW8Mo5v7E+?=
 =?us-ascii?Q?eq0PKJqoOlJpWkHXJVfdT2+VdPktpv6KRY99K2rLLsS1JFEr9yRF/HfHoI/6?=
 =?us-ascii?Q?B+VPwDNJdRGJTZneGu/iiuyshjC98MwXvXFDLZ48H0NieDsLVUCiglQkN4kL?=
 =?us-ascii?Q?viJmEihxiRncFo92g4T6Z2wMOEitZ2M9fpFzjvf1JCHSRc0wzPYRLyE1ec9A?=
 =?us-ascii?Q?afunPbgnFK0AL/BGwcFT3Q/TptfMBOOQygJrn43SFzohzwpRLrlwv9vn92VN?=
 =?us-ascii?Q?NS75t52JWIhy/VrPiICasxyPiLPgL25lV0DYoCfissezFf2cS0IjeBEoRB3C?=
 =?us-ascii?Q?C7QmOQz4JblspxeFGa9rCrIP1uL48cgVd9EPUl5As16QiRAHpIL97nhNz/Z7?=
 =?us-ascii?Q?nB35V5Zc00Sh5MnCEAeCuVg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fa319bc-b1eb-4607-2058-08de20ba0e9e
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:34:21.5902
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SOuEyk26zYHwXp7A3cY25ttLUK/CT6d1CLlF0HlmBGQZy4P1Ls9YvTY8r1pHYLKoqox3XMSrrwXb1+mDbH+Za0L6z+DeMQabod9ChaiSN59XBplGzFuJbnoaUrBD9XrQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB12531

This patch converts below functions.

dapm->dev					-> snd_soc_dapm_to_dev()
dapm->card					-> snd_soc_dapm_to_card()
dapm->component					-> snd_soc_dapm_to_component()

dapm_kcontrol_get_value()			-> snd_soc_dapm_kcontrol_get_value()

snd_soc_component_enable_pin()			-> snd_soc_dapm_enable_pin()
snd_soc_component_enable_pin_unlocked()		-> snd_soc_dapm_enable_pin_unlocked()
snd_soc_component_disable_pin()			-> snd_soc_dapm_disable_pin()
snd_soc_component_disable_pin_unlocked()	-> snd_soc_dapm_disable_pin_unlocked()
snd_soc_component_nc_pin()			-> snd_soc_dapm_nc_pin()
snd_soc_component_nc_pin_unlocked()		-> snd_soc_dapm_nc_pin_unlocked()
snd_soc_component_get_pin_status()		-> snd_soc_dapm_get_pin_status()
snd_soc_component_force_enable_pin()		-> snd_soc_dapm_force_enable_pin()
snd_soc_component_force_enable_pin_unlocked()	-> snd_soc_dapm_force_enable_pin_unlocked()
snd_soc_component_force_bias_level()		-> snd_soc_dapm_force_bias_level()
snd_soc_component_get_bias_level()		-> snd_soc_dapm_get_bias_level()
snd_soc_component_init_bias_level()		-> snd_soc_dapm_init_bias_level()
snd_soc_component_get_dapm()			-> snd_soc_component_to_dapm()

snd_soc_dapm_kcontrol_component()		-> snd_soc_dapm_kcontrol_to_component()
snd_soc_dapm_kcontrol_widget()			-> snd_soc_dapm_kcontrol_to_widget()
snd_soc_dapm_kcontrol_dapm()			-> snd_soc_dapm_kcontrol_to_dapm()
snd_soc_dapm_np_pin()				-> snd_soc_dapm_disable_pin()

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/qcom/qdsp6/q6usb.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/qcom/qdsp6/q6usb.c b/sound/soc/qcom/qdsp6/q6usb.c
index ebe0c24259277..6381b289c55cf 100644
--- a/sound/soc/qcom/qdsp6/q6usb.c
+++ b/sound/soc/qcom/qdsp6/q6usb.c
@@ -138,10 +138,11 @@ static int q6usb_audio_ports_of_xlate_dai_name(struct snd_soc_component *compone
 
 static int q6usb_get_pcm_id_from_widget(struct snd_soc_dapm_widget *w)
 {
+	struct snd_soc_card *card = snd_soc_dapm_to_card(w->dapm);
 	struct snd_soc_pcm_runtime *rtd;
 	struct snd_soc_dai *dai;
 
-	for_each_card_rtds(w->dapm->card, rtd) {
+	for_each_card_rtds(card, rtd) {
 		dai = snd_soc_rtd_to_cpu(rtd, 0);
 		/*
 		 * Only look for playback widget. RTD number carries the assigned
-- 
2.43.0

