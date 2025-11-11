Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011037.outbound.protection.outlook.com [40.107.74.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 935CC1B4F2C
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820761; cv=fail; b=QCDT63VDsUyhN3H2MiCPCkDKlz9CJJ7w+/ODm1ICQcHRMqTJlwNd7lBHwHM9FhtjuNFVc0c+ROC0rDy0xaDwTm2jZNoz52XZ/Ucy8elXT9eJTIgxDLCQhcOzKV60cIuSoPhiShYTlnC6WFhumHltPMPrdDIvHUmkGIVpKVsUz4Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820761; c=relaxed/simple;
	bh=HcLRKkM6LxHYT3BzKJM/8z+JLQn/29ppBfFgYBrsxSw=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Khk9IKYRfuDzDfxZAbia91Ifvw4SaLTBI/32x2OjOjSYBuZzHDTSciKeb6ob5GJN+YCDxyazFSc/t1LMWZFdJzmIJid/w8DrieBQdhY3wuwhcTfPdjZ+DAhkbUaLB11NtR+tWFOLhspqjQhZ/4v9nNTgMVKzPoSfLpZu3zoX8wo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Uj5lJGY6; arc=fail smtp.client-ip=40.107.74.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Uj5lJGY6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WTh+a1wii/y0wVLn4xs7hV6+vler/FHBaW62pBcm/+AeWE1slw5AL0BUiervL+qMF8Hpr3yTk/oh2eVNrj8a9l5AdKjkN6y82+6PQvNuHVVNTrTjKcaTbxNTPtOqetjY3dmblRn59VbEi0P5R913lAk8f7J0X1SYYCPch1tRHCAJzaFJDIJ/wgO2GiTjz1tM9kNm6RC9FU8tYnPTtkF3IfV9NdeLVIU4k6zDAEM+MO12tOI3tPaZR6eUCS+Zbhh24ml38BT9AJke8NdmvSABYCfRzkH8DcTs+GK/gSWATtz1/jmEFi11WU69TKRMweA1rwgs5mPDgzW9SaGNp123KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4SKN9NOKqlYCaaQY+PLVbovV26hCJm9BA33YAfyPpdw=;
 b=oBT+TTtt4Xuyro7K3PE2G1tbCmyAVYnQja5LqCyE0sF1T4/CoCUBzTsqHVpYndQhA2ZC9QWndXYeswZ5+3JBjsVyl8cdNe0PXi12o2LbV/Q4DxpFiZNKapIE2ynYN+2snWJzllnfOdRuPnC9izNZD4voJXzWxjK5AB589crJ3zYe02CQb467WS/t+w0XS27C/fx37HS4Gg3HEAKRXfOLVz/IqV33vOZdoYcEHdcuyjR1dV4qrvObuPoGCe3pRC/eTA3R5Jlmt0rnUijpL3eTRAhE7+VGyFDu+NrhSBOn3TCSs/Emy5VCr/9TNGHrdSstwGsKUlkP6BNmTCJVpZ1AZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4SKN9NOKqlYCaaQY+PLVbovV26hCJm9BA33YAfyPpdw=;
 b=Uj5lJGY6yNj9SjEAfpwhYHNE2Sglg5S+3T9Og786XWxOdNc5y9SrJbaWJM10mGq5EaHBfHbGgosWSmUNJl0Eu24vt/iCg7VS7nICiMrvMHIaa2kxHO0x9378R0E2Gp6tKyWIBv6G5BKhNbhN1MI8PQ7IaWI/5Gf6UU8EjZ5xygI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSCPR01MB14439.jpnprd01.prod.outlook.com
 (2603:1096:604:3a6::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:25:57 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:25:57 +0000
Message-ID: <87ecq52z57.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 123/292] ASoC: codecs: rt712-sdca: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:25:57 +0000
X-ClientProxiedBy: TY4P286CA0030.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:2b2::8) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSCPR01MB14439:EE_
X-MS-Office365-Filtering-Correlation-Id: 9220abfe-166a-4f2b-1b74-08de20b8e222
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PKHU6XENZt89QCa1ZXUrb4Q2a4Ntfw9D5V1w2MHRN9S8Mo6QgTHLc00WXkXE?=
 =?us-ascii?Q?5+lfNAjTevKdbQdnIEmTQgtEZVF/dkyVf11i0G4n2frCwXokUw1EzsIvBnuL?=
 =?us-ascii?Q?JeMV3ni2pqAvtCQFVftOUUbq2CYwVmiFkhoo5vcToXUnVnESCHUmQkRt5shF?=
 =?us-ascii?Q?ZasLBUHr/kZMsz8eim/AxjhHSpORRuXUlo6F4r1yrMY/Cdp1wq+07fFjt/WI?=
 =?us-ascii?Q?yyiChkxtdjn2/f3DSy0as4qAEnSiCzvwdxSdUZrZ4jhmNNLYMjH0gcAh8c4Q?=
 =?us-ascii?Q?b8I/SgVsPb2Kg/nmZuZ18kScQO1ix1c86BHBej7/84dKlnTL/9w0/nikhzqS?=
 =?us-ascii?Q?e805qFjJzEGSvPQ+PL00ZV9yqkUPFeBbjsDLu52EbzpcBcZd2Ff14fn/x5+q?=
 =?us-ascii?Q?3UmrIwDMCkWF/JQhZPTyERsbmTxNRAaDccNb0NpBDC78W+bx8SOoq1032NHX?=
 =?us-ascii?Q?0C+J9J3VPmGQqbZjpbnGT1PAgw/OSXDswBSkCd1Yk/mZ7YFayXRCQPUwbMUi?=
 =?us-ascii?Q?dseryasrmTlfaBbblQpz8ylHBMh+j1bzbJcXH05PdHpGrGOLn+btyNpjwtUa?=
 =?us-ascii?Q?ptbU3LNrIRwBjfml2d8fdxGkO9zwTaF8nxSZwUnAU4S4D5ayT9r1eMRiLpJe?=
 =?us-ascii?Q?S3AuN2ZCIuHA5K67Xl3wBCB3b45N0CzbYwokFH+YaAckbURTgt5bg94yEg0S?=
 =?us-ascii?Q?c5OLFzwCosOWChpC2wNb5USUNrPt4Cy3E/5GF4EVoUjDw3DVP67AuSb9wuLR?=
 =?us-ascii?Q?1f6x2F+Hco5imS5tlzXO2xUmbtx0aR9EacKgPozO1/QwRDxD1Pk+2f+/r2Nc?=
 =?us-ascii?Q?HGFA+X81FUteM4zkUMGmM34O66bAFrH1uTGIQioS5kv53kwkLaXcFcd/I61J?=
 =?us-ascii?Q?Rtt8njaSy3evsD3s37N7QKiixiKejgikBqjgKmqyYYAl2N363xlRInsyxNx0?=
 =?us-ascii?Q?vgolGLmQnGO5jDclbhDaUVS1w3nYY5R0r1d3St7D8Fv4Z+yhLyNkJ4lVq8R4?=
 =?us-ascii?Q?Oy0A+0P8PYoQ7ZCJSdzPHj5YkLH8/ck/U9HjegkC/QTlfaAah+xIvCoVW1o8?=
 =?us-ascii?Q?i3R+vPuqNuF4rRb/wNibb76xpCm1XLfkk8c46rjCGPKrq+N3dPEYNwhpHsVU?=
 =?us-ascii?Q?sZsKJl7E6pzMIBOQ325ErUzV8RXwnc7rETTDgnBfx4K0L1xOgxY9wV7F+P/T?=
 =?us-ascii?Q?P9mX/QS74HZweeQ/fNY9WrWl8UfndcrW+odMR8UmVIU+DpRvPZOIWdmH7WWZ?=
 =?us-ascii?Q?wAxLg0/YThNT6aj26+1ArhtA+3dQjh0voI5xUKyLzo5brT3GAVJrOz/aHYp8?=
 =?us-ascii?Q?9OEx+j6G55Za8MfmggsspQGMuqBSHOPySpzwXcgF/EGJgyoLeqAobUEcz9E3?=
 =?us-ascii?Q?DBMrN0hWUioz5EUpOcAlTEpeGVwUPWmX0ClJEJm4R2Fy0p07qQXQSl1YEsrY?=
 =?us-ascii?Q?ZRKxTAiSQEaxwH7efrhHZShDWgQ/FNj0sQejnBLezQtOXhzHqlNKnU1fjEF1?=
 =?us-ascii?Q?KqA57I2aw2WG4V9nspPXf8Ou12p6zi86AjZL?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?iGSwRt7Xr3J143HomiZDJL4KGtdgPAbCwRy7YSRxrykAxOlIixRRuwVf6keE?=
 =?us-ascii?Q?A1Ox3d5GC38Pif1RWhtHlZzkcin+wtv9cfcHwkxlIdPWB3/SKZaAhcKXes3y?=
 =?us-ascii?Q?GX16EMdlJjDM7HGjUz3kahdbAn9sYjJIww+ATlWyUtH8R9EflCfat53L2w/K?=
 =?us-ascii?Q?LeXyN741w4cIe8YBNl1ykWfBABUZO+IOIcmLiZs9Xz1n0ujsw1wEiHCeFDHv?=
 =?us-ascii?Q?XtzkZgtJO1/76pshZXAK2lF5bXvP1kEnQnDtLXGQHG3ZzotGAXZI7wZRzd8L?=
 =?us-ascii?Q?E6LYcloNLCDpJFm5AE91Jq05iA9FZxsBlYJKVrrHWKodcHYa2J92n0ucfBSz?=
 =?us-ascii?Q?RWxL67Xqh0nlsS7KdV+ZTHfo6RrRFCQtby4GQm0EEmcK70lwPR+sgdoHBQCi?=
 =?us-ascii?Q?IWIovOolwpoGV0EHTvCuErPTbavTyajjR0shmpITrABDKGNv01ImzxQh0Bsf?=
 =?us-ascii?Q?JzE8isQaYJYibyV2iaFLs6yoJWNe9DpTtxTQHNWPnOLroY9zTVHZPQgtykIy?=
 =?us-ascii?Q?Ji1E6EhdSqJMmjJYPzfJi5MXnxODgvRpEhF/kw+8iPZb7ejkihWmnetLXig7?=
 =?us-ascii?Q?AFj2e3KXQDFwLwBTTNpZQe41dEaGx5jUXSz3j7nCahX8oMW9C0KoV3Yo9KHd?=
 =?us-ascii?Q?dfS9YAzsTs/hAJ7VnauEI/9uqeegd/K7e74+ToT6/PItSiP/Aa65OxZDOg8G?=
 =?us-ascii?Q?SMbBd0Xh2QDbRoQVQOBgytZcjFUt3jQw+UZupNqfyFUU0afoWfwD+2G6CQVt?=
 =?us-ascii?Q?+tvakx+1IySZnuAeQl9L6AXJu38G8+GhQ7mO1yLWo5fhDdYpWwPdsL7W0tJ6?=
 =?us-ascii?Q?bKs2AT6qgLz2RutorAP0XjZlgGGEFOKvbC7CEiBdAkeOh+mgEnT5+GoJZOOO?=
 =?us-ascii?Q?U9jhkggltdeA6r9PbPf8wk1etgTJuJOuXTUtPuH501J6g50MeHn2md4bzJdv?=
 =?us-ascii?Q?0WMZ8lNxkvKxVEgZUwhkXVhK9Oal483Pj5vt1TRs9OR6wW7owlGbtcgYYPvU?=
 =?us-ascii?Q?x/HOnJSTnsCNGW0WJmUv8D+EwMVLCpo0zlU0poDgH6qGVoD1VAgKlSJsLxyX?=
 =?us-ascii?Q?zI32HOatesDrFD49ouobXlcnFzSQA85j2tHMkkgj0k1sB7/UrkRHE6tklI8h?=
 =?us-ascii?Q?+c5NVEX8wjt3A7BK+JaKRJmitp0rO2pBszLC+BXXEcOrfGyX51dRDCUIPuIB?=
 =?us-ascii?Q?F2Rm0e36KI6lBXjxVNLN6rP9x4aLZPCKST6oMP+HFefUCYPLaSR33pHKfnwn?=
 =?us-ascii?Q?2JQbY6RFy0r18nk1BV7s94NN7GJM//RpsyAG7DDwYkk//epSTtxRuSvfy1BV?=
 =?us-ascii?Q?O+qNz4ahn/U0Y8hlrniyWoOlCgQIPk2VXZU3kpA23Q2YIWYSHViD03CYk+ME?=
 =?us-ascii?Q?ZB251iEBNj2zW3CAvRTdV3oJ3igYLe3vWv/QeWaW8D78N7+eyXfuCmLYwhv1?=
 =?us-ascii?Q?JRUMkBIc1gfBdPnUkPARiYUFgpcP2r5PCa+kByby4gAMljwI3DrK01bpbk1E?=
 =?us-ascii?Q?hfEqqSoWnUePeT0UtiKtzfzBANSj/9Jh/z/EcW+GyHGvsquVPY2Eq8+HIGY7?=
 =?us-ascii?Q?VTnQRs8Iy0U36+hN+P9zh0Qlf8Z+7znaplLijHeULIRiXSjV5HNyS2kij3Ck?=
 =?us-ascii?Q?XW0QbwEW2sRyNScCD+AG0h8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9220abfe-166a-4f2b-1b74-08de20b8e222
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:25:57.4845
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UiTAi9ZAmXlBT3MJ+bBHByf6RuSke9Mp6LBlbf0pukfuk2F0qBdqyzhXfiHDhP6+nef1Ui27PGADytIWF2DFoyLWsv7rtlyAgq6pNHxTHGRNixdr5QdqlAmBb5jOZyMX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB14439

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
 sound/soc/codecs/rt712-sdca.c | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/sound/soc/codecs/rt712-sdca.c b/sound/soc/codecs/rt712-sdca.c
index 0ebaae426e73b..4796fce084ff4 100644
--- a/sound/soc/codecs/rt712-sdca.c
+++ b/sound/soc/codecs/rt712-sdca.c
@@ -743,8 +743,7 @@ static const struct snd_kcontrol_new rt712_sdca_spk_controls[] = {
 static int rt712_sdca_mux_get(struct snd_kcontrol *kcontrol,
 			struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component =
-		snd_soc_dapm_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_soc_dapm_kcontrol_to_component(kcontrol);
 	struct rt712_sdca_priv *rt712 = snd_soc_component_get_drvdata(component);
 	unsigned int val = 0, mask = 0x3300;
 
@@ -768,10 +767,8 @@ static int rt712_sdca_mux_get(struct snd_kcontrol *kcontrol,
 static int rt712_sdca_mux_put(struct snd_kcontrol *kcontrol,
 			struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component =
-		snd_soc_dapm_kcontrol_component(kcontrol);
-	struct snd_soc_dapm_context *dapm =
-		snd_soc_dapm_kcontrol_dapm(kcontrol);
+	struct snd_soc_component *component = snd_soc_dapm_kcontrol_to_component(kcontrol);
+	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_to_dapm(kcontrol);
 	struct rt712_sdca_priv *rt712 = snd_soc_component_get_drvdata(component);
 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
 	unsigned int *item = ucontrol->value.enumerated.item;
@@ -1017,7 +1014,7 @@ static int rt712_sdca_parse_dt(struct rt712_sdca_priv *rt712, struct device *dev
 
 static int rt712_sdca_probe(struct snd_soc_component *component)
 {
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct rt712_sdca_priv *rt712 = snd_soc_component_get_drvdata(component);
 	int ret;
 
@@ -1230,8 +1227,7 @@ static const struct snd_kcontrol_new rt712_sdca_dmic_snd_controls[] = {
 static int rt712_sdca_dmic_mux_get(struct snd_kcontrol *kcontrol,
 			struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component =
-		snd_soc_dapm_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_soc_dapm_kcontrol_to_component(kcontrol);
 	struct rt712_sdca_priv *rt712 = snd_soc_component_get_drvdata(component);
 	unsigned int val = 0, mask_sft;
 
@@ -1253,10 +1249,8 @@ static int rt712_sdca_dmic_mux_get(struct snd_kcontrol *kcontrol,
 static int rt712_sdca_dmic_mux_put(struct snd_kcontrol *kcontrol,
 			struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component =
-		snd_soc_dapm_kcontrol_component(kcontrol);
-	struct snd_soc_dapm_context *dapm =
-		snd_soc_dapm_kcontrol_dapm(kcontrol);
+	struct snd_soc_component *component = snd_soc_dapm_kcontrol_to_component(kcontrol);
+	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_to_dapm(kcontrol);
 	struct rt712_sdca_priv *rt712 = snd_soc_component_get_drvdata(component);
 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
 	unsigned int *item = ucontrol->value.enumerated.item;
-- 
2.43.0

