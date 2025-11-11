Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010055.outbound.protection.outlook.com [52.101.228.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F30C11E3DDB
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820968; cv=fail; b=iNMKukPSnUo7oIXSdOnd7usHeoY5/vLSf+P2EQkXpuKbUoJh1ScS0NLUutOtzNXOGGliKC7BBDGMCeIly+i51puk3r/or888kqtSMp6jvuP7eekqN46ijdaHZhA0XgnG6ytpBvXXC0Rg/LPi0JzsMlBY8FqKV3onN7YNMThdphs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820968; c=relaxed/simple;
	bh=FqqD5yRxU0a0Rs9bxXYl8G5HmbU2s+efyR0V5VjLE2c=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=YMEkhYMXP9DZX0Uofdz691JjspyCvZXg0WfP8XpClL0lh7gtxMRX2D9S/ZqF77hdoiY9BYf9q1vAjPx4yo+N/gdCyA3wPoxJF0BD0GsYbqR2Lvcak/9ADmo5dCYt4Agn42l3x9GQeSjnD7n95bRQ1f7joDZwIYWL/x1WNIkrpbM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=P7G3op2D; arc=fail smtp.client-ip=52.101.228.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="P7G3op2D"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yV6kKFvyTQCKK80iskJjOkPjplc2OPBngUkJzCr0LxECWntq1Hxi+ztDRS+swvXguMY1eYOSO649Ic0hwByKBNo7wWqUnA4yb1xiBXSKcSyXgtdUNmDvatAocGwAEwLHbqiiyIG5D08aDWsr4kdIs5okfgA7EvwS0sTPGRgqr1pxiWubkyKccHi+y8hDGTVaqFZKNZxkWk96Bfpt92dBjJLORSrDdYhNXTouPZJJYUUIAA1PiniZKt+Vnac8CvlBZSvJg2PQZXQzP63TKER/QF8eLHSOG09Cx+XJFMgoNmES+8csBolIjwbBjtKmrv/g5h07M/zg4I4okx24XkKUWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EjifuZxhnWyZuKanh69Vx8YB+KOsljSwL+vMlpHp7qk=;
 b=EtzLELkWj+kVL7+9YTqybRSyicKvbgEhB4O/+jj8SBv317FLE6RCZ11SbENnSbNBksxUskQMyGwzY1V4FVohUxmPEyM3s3ZZWaIo00UVF7Ud96KEilmt7psu6Cf6XGr124iS+4H715RgLCpJYhhPMpP2pQhKYBkc8wCb4OK9bVVBCZpMamFNZ+i7R85BKouAnMwDPnz334IwybhrO5CFWJQM6jpdBxTSNh4PHZj0yE9BfCiyprhLj6ULw4NrirYsIJH4hS3z7DpxDRPf9V1vPDA/xSCuDWpaZGxhgHFoJ0iuq1G89fSGO2ug5wFOXpsN5GxKLg/+RtfweUbka0GRVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EjifuZxhnWyZuKanh69Vx8YB+KOsljSwL+vMlpHp7qk=;
 b=P7G3op2DcFvmgjKgEZ4a2dPNjDMSGn7D5A2AaKwhJFPg2LjgFAbFcqpk/q0ve5pRXXA+lfwavR98jV2Cqs4d8GpQtLr/D86Pw0h13tAwMlN19oKW7t+qFwS6yQbuhc7nos7UGmlKEYC1CXFIetqwUUgdWmJ7kz8RZkx/ZLVbz1w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB11220.jpnprd01.prod.outlook.com
 (2603:1096:400:3d2::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:29:25 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:29:24 +0000
Message-ID: <87cy5pza1n.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 174/292] ASoC: codecs: wm8962: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:29:24 +0000
X-ClientProxiedBy: TY4PR01CA0107.jpnprd01.prod.outlook.com
 (2603:1096:405:378::15) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB11220:EE_
X-MS-Office365-Filtering-Correlation-Id: eb999f9a-2ce9-4b62-68bd-08de20b95dbc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gh5ssTLB4yS8Gh5U23ca1yE/4m8LsWjt4xTUM2Vll0OXh8gO0Sg6rrebD5St?=
 =?us-ascii?Q?1stbyk91jvMFHtGNsOHSZqzYOppZpAffWgfjcJwYpSZptjTo5/hVOpkLaxmc?=
 =?us-ascii?Q?C49gCao/4uj/5c9eC5h+lLIFUcQSUu+tKaXVcm4IKbodffakjaAqqwq5JpU5?=
 =?us-ascii?Q?NTXmEPlu/0nAP4ELkliN3tAfkZlyU0wcLtl7ozyx6MaO53Pj4h9Hc4K7FyqG?=
 =?us-ascii?Q?gKAoKd1RnuiEVvzzixwjYi0m8jBI+p+folN3OgxdPOWur9MwNFtBGl60Nzhn?=
 =?us-ascii?Q?8oapyVx0HIX/i9cq01nhuuaEzoZsLlABjatXzirFkOyHAQNlaXovoxIuRWYC?=
 =?us-ascii?Q?v9eOcfRyfXDzY12nc2uc/Ljuxw/vkxVSykp6lWWVZOYAJpc2C+s0sF7po67+?=
 =?us-ascii?Q?Ke81iM/vf/IH4isAWMAAjG6bpIVBf1+TxBB22eYxKsNUuoaRk++B92HwGvvM?=
 =?us-ascii?Q?x5EEBx1Yl33d1GUPaFUYjBHDuR/PFm+HIpeSJjw0v5JtluijBu5I4Fgw1IrB?=
 =?us-ascii?Q?skSjE4+DSlWW9B5RbNnb8AYgbKmClUHn30XaG1yYFouS6+JSCF87IKHvfdQF?=
 =?us-ascii?Q?pDolynigMcjF2+zamv5bmubaQAjfBmMEBDuh0O3f/JmE9egkAW0tJOlk7rpI?=
 =?us-ascii?Q?CQ20Cr1dhW4ag9kjBL2Hcru1TQ/vZuFZQeN/ebePsv/jKLg8HFLcj4NRf6PE?=
 =?us-ascii?Q?B6dQ3tJltJ/Sb2uuIqABpL2PGPyqVEQYcYGqimSAPPnXnzbAg6gPa4x7rbxz?=
 =?us-ascii?Q?UwylkBGibZ7fGf8B0mFdJFVXEat7DUSHsrdyLEODC1g9tFO7TTHXiRZGfnHP?=
 =?us-ascii?Q?WPbYoQjCDYXwD5xRE78IxXZ+yK8q5BdAHc/K4U2M+NH0XhVFUAnEsB7pDIz7?=
 =?us-ascii?Q?Eh84N23VABF9h0a2tLLf3GcHcQqbYESdoUGB22DS8gUUh5s0S36xt3lUTaOe?=
 =?us-ascii?Q?mHFa39PMS32q+fyzKNI5O4SDXO+CREbzPm6xw1C7MniuKisf6fiaJNDw4PMU?=
 =?us-ascii?Q?p9Pb/X2oe22tJRImyRtaMHyH4TCg5cWPvpk4oJ/s/oZIo80FP7Qj3FF/6QxI?=
 =?us-ascii?Q?YTfYZn+vIyt7sJMlnZ1TJqW81UCT1jiZHMYw6qijStGBUgJKIAIuH9WHRZFQ?=
 =?us-ascii?Q?X/kcUlFfcoQC648HZmou/D8CBB8WOxS/zfGWhmieDRq2XI8NCg2gTattixlk?=
 =?us-ascii?Q?x5Es4+2rWVGGYWmQNzlMFinpI8H2LuCj8LLLGcMk0NyI22GRngNPH9o3L+32?=
 =?us-ascii?Q?N/xwrpJXMuPnG6lh5LzIvQ1BbaS/KrctTRGiMRT5sCf850pwolxEKPGX5AdH?=
 =?us-ascii?Q?pdetGkl8NnVBaM4PSDpWoWfW9rN6R6ghZXN8PGHxroUIqnObYLV6xrwtHbEa?=
 =?us-ascii?Q?tMmimKY/CJvKpHyeklwLzr87bHdJ4Z1hgJ7LgMk9upnubhUa2AgsLRoXPyMW?=
 =?us-ascii?Q?P71D2DoXJmBk85m8Sxk0Fy5rMduguZ9d/8Jc8Z1dyojseXb4ZxUHzxYH0J2B?=
 =?us-ascii?Q?qduYEwU1rHrQjBhB5bbk8LGx+/Qhp0agPsW6?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6wOSrQWTcT177K25MXLGRyEs6Gh9OG08uWEdQE2KpNi264hLLcvFQks+HM8n?=
 =?us-ascii?Q?Gdc5Qfh+1xvYy1o13so8RFZeD/LaUhjc2xo2sSX4vSvDQy0fKrym371qW6PO?=
 =?us-ascii?Q?6GbxSJ9M4em8um/QqKYElZefsrzRV5f5JH4nQYRReh+oFF+61gQYQx5GOlgl?=
 =?us-ascii?Q?MVnT4w5fcVaJg+iQzbrVyPzihaE0Ziw2vNtW0F6Dqn73JJM7AAnp2QC2nze1?=
 =?us-ascii?Q?jHsFb2qBC2C2q5kkXBc1OUKTV5zzUq9bjyN0XheJJU9YqkfBTGbnxfR7htSq?=
 =?us-ascii?Q?Ngkal6fetJ3Xs34kUTiQt8sYJG38URXqrGqvO24Pssu1NxXivKM2W5zlDZgU?=
 =?us-ascii?Q?ydXfwbQzlL7UJCiGjuqH16JSitUBOqoFAmSTP+X5G71Q28U2dXxIiwcjUvFZ?=
 =?us-ascii?Q?hkPQpnV0hPx2Y+4LbawqvZgO/csKc8f0PE25wmHf52CWfrP8uMl940jzyub2?=
 =?us-ascii?Q?M135btkTESPoG8bExMD0fpbDjXf1i4Z12xpb1eV6Zog3RQ4t1W9xss8FPeaE?=
 =?us-ascii?Q?4EWzMx2qkU9tPY2avDtYO7gxuJs2YX90V5SuvXw6G/H+vpmG49GMU5mxgLsL?=
 =?us-ascii?Q?MWbYLfO+RzrOXPX+l7NHdd2F4lSNVqGW/XJomRVBPysjfBNbHZ0dNezI6y/E?=
 =?us-ascii?Q?Ve3VAIChRTnps2/eM5pIWKusMcNBxqD10oxl1RsJDVGEOsuDgPG2XZ7zLQeN?=
 =?us-ascii?Q?855dde8K0Y+ChPS667MfrsE0YZ+A2Wko6snjuT7Np5oul1pmGLHD5/hTk48X?=
 =?us-ascii?Q?e/7pFOOzAbSLyVuFryU0zZZj9ZuRoJV8yTFj33WjyENv7VyCMLwmxi9hAJJ9?=
 =?us-ascii?Q?WfwQJjad9vMZ1ncuyo29vvFjZJ5UUD01hD5Rm1y+YVM50R6+AOfbk6Gld2Hx?=
 =?us-ascii?Q?b3DGUTCTARbWasAyTkF0ZxLSxpELXlKkar2iblB/6IOgo9r+FJxEWk3zK0HC?=
 =?us-ascii?Q?zAxJ7Q0d5eDDAgkWsywHe+8eobiDh2Bck75OblQCHQOnfBB5mzTn57MqkVVS?=
 =?us-ascii?Q?vPYSUa36N3D61iCy0SMTUFgwVwTno+7hqUPHwIm1ZkbVSWqRxH0hkM6Qc4vi?=
 =?us-ascii?Q?SNeJVwq0p/3y8UPlXhFHGoXAFoHmV5L1QimB25dBDwtBggQXcLY8tvpg6fHY?=
 =?us-ascii?Q?8YKMgIaWsmK6Urns9VeRzcdSdjjkS6utVJaX2H961BRcO4/hXAoElHtfchu/?=
 =?us-ascii?Q?e9jkdbab6Rfi1dYUk4FTOh2K6dLASHNEmyq5VPyJdFl8KvDoAiJEkVJBrkOj?=
 =?us-ascii?Q?ats0deOiumyRWH4FsSj6ZVX5ykpgNpu8SlJP2FUbvyAbaQI2hoVFIVGqAlb5?=
 =?us-ascii?Q?UMI4N0FBTLOSUkApoxNEhYpZ0xf/owHGwiLLd6/GmY3RHWPa3ZZX0clu0FsK?=
 =?us-ascii?Q?HD2/3vBrzJM1hFIBkOuEQjL12PTHZzN9/jBis7sA5ndyxEcNsz7lmG6r71qc?=
 =?us-ascii?Q?tzK13xWsCuWz43zRfYxTggTg4KBxAv33tb/IhBL1BaagOucLpzWS3HzHAhNP?=
 =?us-ascii?Q?h+jTHsF2s2svmad508Wf5AsQkY9DfMdOttukIr1jILksu1caxtQR/TQo3eYa?=
 =?us-ascii?Q?5XoSZsRMvSLWTYECfW58/o0Zvys1U/3ytySwgEtFf2JiAN4yjeLJtVYxkxUL?=
 =?us-ascii?Q?iFGAex8C1TDyqowTHkdL/Hk=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb999f9a-2ce9-4b62-68bd-08de20b95dbc
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:29:24.8999
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r7JfR4gPPyvAKvj886WFdNbVy96tG590pjr/aDd+EfybZEdcgdxH+qMO+qOoK8zcrMWQrAOGPTcryTsGZ/MNsEAy/eXbnsMN+ToO0lo82b/EI+ORLqUXXTnwa5Ov8G+y
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11220

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
 sound/soc/codecs/wm8962.c | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/sound/soc/codecs/wm8962.c b/sound/soc/codecs/wm8962.c
index a5ad916966b27..e9e317ce68982 100644
--- a/sound/soc/codecs/wm8962.c
+++ b/sound/soc/codecs/wm8962.c
@@ -2419,7 +2419,7 @@ static int wm8962_add_widgets(struct snd_soc_component *component)
 {
 	struct wm8962_priv *wm8962 = snd_soc_component_get_drvdata(component);
 	struct wm8962_pdata *pdata = &wm8962->pdata;
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 
 	snd_soc_add_component_controls(component, wm8962_snd_controls,
 			     ARRAY_SIZE(wm8962_snd_controls));
@@ -2466,6 +2466,7 @@ static const int sysclk_rates[] = {
 
 static void wm8962_configure_bclk(struct snd_soc_component *component)
 {
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct wm8962_priv *wm8962 = snd_soc_component_get_drvdata(component);
 	int best, min_diff, diff;
 	int dspclk, i;
@@ -2505,7 +2506,7 @@ static void wm8962_configure_bclk(struct snd_soc_component *component)
 	 * So we here provisionally enable it and then disable it afterward
 	 * if current bias_level hasn't reached SND_SOC_BIAS_ON.
 	 */
-	if (snd_soc_component_get_bias_level(component) != SND_SOC_BIAS_ON)
+	if (snd_soc_dapm_get_bias_level(dapm) != SND_SOC_BIAS_ON)
 		snd_soc_component_update_bits(component, WM8962_CLOCKING2,
 				WM8962_SYSCLK_ENA_MASK, WM8962_SYSCLK_ENA);
 
@@ -2519,7 +2520,7 @@ static void wm8962_configure_bclk(struct snd_soc_component *component)
 	usleep_range(500, 1000);
 	dspclk = snd_soc_component_read(component, WM8962_CLOCKING1);
 
-	if (snd_soc_component_get_bias_level(component) != SND_SOC_BIAS_ON)
+	if (snd_soc_dapm_get_bias_level(dapm) != SND_SOC_BIAS_ON)
 		snd_soc_component_update_bits(component, WM8962_CLOCKING2,
 				WM8962_SYSCLK_ENA_MASK, 0);
 
@@ -2579,6 +2580,8 @@ static void wm8962_configure_bclk(struct snd_soc_component *component)
 static int wm8962_set_bias_level(struct snd_soc_component *component,
 				 enum snd_soc_bias_level level)
 {
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
+
 	switch (level) {
 	case SND_SOC_BIAS_ON:
 		break;
@@ -2596,7 +2599,7 @@ static int wm8962_set_bias_level(struct snd_soc_component *component,
 		snd_soc_component_update_bits(component, WM8962_PWR_MGMT_1,
 				    WM8962_VMID_SEL_MASK, 0x100);
 
-		if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_OFF)
+		if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_OFF)
 			msleep(100);
 		break;
 
@@ -2629,6 +2632,7 @@ static int wm8962_hw_params(struct snd_pcm_substream *substream,
 			    struct snd_soc_dai *dai)
 {
 	struct snd_soc_component *component = dai->component;
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct wm8962_priv *wm8962 = snd_soc_component_get_drvdata(component);
 	int i;
 	int aif0 = 0;
@@ -2679,7 +2683,7 @@ static int wm8962_hw_params(struct snd_pcm_substream *substream,
 	dev_dbg(component->dev, "hw_params set BCLK %dHz LRCLK %dHz\n",
 		wm8962->bclk, wm8962->lrclk);
 
-	if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_ON)
+	if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_ON)
 		wm8962_configure_bclk(component);
 
 	return 0;
@@ -3193,7 +3197,7 @@ static irqreturn_t wm8962_irq(int irq, void *data)
 int wm8962_mic_detect(struct snd_soc_component *component, struct snd_soc_jack *jack)
 {
 	struct wm8962_priv *wm8962 = snd_soc_component_get_drvdata(component);
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	int irq_mask, enable;
 
 	wm8962->jack = jack;
@@ -3239,7 +3243,7 @@ static void wm8962_beep_work(struct work_struct *work)
 	struct wm8962_priv *wm8962 =
 		container_of(work, struct wm8962_priv, beep_work);
 	struct snd_soc_component *component = wm8962->component;
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	int i;
 	int reg = 0;
 	int best = 0;
@@ -3488,7 +3492,7 @@ static void wm8962_free_gpio(struct snd_soc_component *component)
 
 static int wm8962_probe(struct snd_soc_component *component)
 {
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	int ret;
 	struct wm8962_priv *wm8962 = snd_soc_component_get_drvdata(component);
 	int i;
@@ -3543,7 +3547,7 @@ static int wm8962_probe(struct snd_soc_component *component)
 	}
 	if (!dmicclk || !dmicdat) {
 		dev_dbg(component->dev, "DMIC not in use, disabling\n");
-		snd_soc_dapm_nc_pin(dapm, "DMICDAT");
+		snd_soc_dapm_disable_pin(dapm, "DMICDAT");
 	}
 	if (dmicclk != dmicdat)
 		dev_warn(component->dev, "DMIC GPIOs partially configured\n");
-- 
2.43.0

