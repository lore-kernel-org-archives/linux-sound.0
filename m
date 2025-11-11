Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011040.outbound.protection.outlook.com [52.101.125.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7672978F26
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820280; cv=fail; b=dbIk9wTiJCxTaaribG5XDB9zzvoz47AzPKbjC0Jn28ALN7ryKVXlL+sYjoGHo4Ohw8ssBrojFPry0iRfWldLkDIv2RDj+2kc8az4R06cjLH5o4NxaaIpyzpHU2gRj88A35rAhlO3gxAH9UHD6jFujVsjtd91PfzcnDqTvHHoCT4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820280; c=relaxed/simple;
	bh=Dk+xg3jxR5mwiekvfYZg1JfssmfBDYfmmneVnfql28c=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=uCPva89AbhsAf3Fefh1/jRXiri9ssCSAVl6425rbOUVmB53A3zBop/xp+DO+9fAuIBdvTr/ewUeKy0s+31KfjmSXKDqX312NbAJnUJ5ozckEhreFezyeyNKec88B1pRkV0pfCPA6aE1Y6Lyn3N4+AyT4JjLUgoYY94kTxbva3/Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=LoE7UEB4; arc=fail smtp.client-ip=52.101.125.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="LoE7UEB4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a9MXgH+4dU7HWlp1g/bbT5aujkMRY4E2Tgl0mKh0gQnPAX4whUNFuAOfhVcBrvZCEcJPmMrOvjn8vULpF7D0z3bdjYXUDcBlbg/fUrrjR0GBX+nS2NXnPRPQjD5qa1W+gEh0xl0LzLgH33geB7+wTmcmc5fTLDAvBYI3XKQoyLFeOr8N0gtWrcnyhmoJROfS7klh+QHh+EaVU61gbb13J/qQ2OzksI4nmRsLt8h29Ovg4BcintHW9LlS3LlHorK/1EhBelg1C00ZqfJerY89qkW04H8Web3Ln4Nx7bMLgWDNFNWe6hsLesAwet/+SCzmjbg81AX8LddKTWYBQKANAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p072kRbbkIjGLPcl6svLvHj5tRtG39NOGme9Dwbt1YY=;
 b=uXSTBWji7MOzGa1QXiTav0e/LZFc3/Yk3dfdoZ2BZlrUcfJ05J4T4eOYbUaIRweCB19P2nbw2YVeXaL9Dy1pjiFjbyLFGXDx9dCcEHsKTnVI/EAQ4IyrzZXfyGGKXexFjJCS/xLH/kBhV3ZKwZmY3zOGkI2RiZLjwPUt1QTvHJsqfPWXsBUptJP3gJAmBjYQOGtFod7c05pySKBP/9e+0jebekOOzfpVZJZoVLYT/KdPxEq5jxT3yzueygDt2VzroQ9tFn66ujWpvwyMFLY8ewbPpLH3z28lZcwKay24wDXfBwybRfb1sgC04o5et0OhAXah4OuVily8kalrSwx0Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p072kRbbkIjGLPcl6svLvHj5tRtG39NOGme9Dwbt1YY=;
 b=LoE7UEB4lPSGpXyYCtvBjhHR4eAHikOqP3zNfdjgpARad0QEfU4LUZmW6I0CFFiLxYq+hS2733tBIufHACVcLyGVkXBF7aJS6nwTwdcCFrERdZV8hh6L/CuGn7AMWgmLDYGhqzUnE25v3UIw0e6iD/YaOPdFgnwKsM7g40h+528=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB7893.jpnprd01.prod.outlook.com
 (2603:1096:400:182::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:17:56 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:17:56 +0000
Message-ID: <871pm5a0cr.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 008/292] ASoC: amd: acp-mach-common: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:17:56 +0000
X-ClientProxiedBy: TYWPR01CA0026.jpnprd01.prod.outlook.com
 (2603:1096:400:aa::13) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB7893:EE_
X-MS-Office365-Filtering-Correlation-Id: 2522e578-d048-4bba-3837-08de20b7c386
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QAbQzBz43rEoU8MrcCsXYr+4dRYxAHGAM7yRQeudzFpkcwqQVmONkB2yqZmT?=
 =?us-ascii?Q?GCmVf1/GSNkCB+EAUbghRX/Clp8HpcZGIDy5QkFAKYfb5mUlmmYPodhof9o4?=
 =?us-ascii?Q?sO4HrVbtCbkO8+5arY+8xFedNYUK3o1Ar1bpbVkiot0CxbzK8VndyLq60vnJ?=
 =?us-ascii?Q?+rKzjNGVOwgSz9IYelgEhh38ZgPomXTP9S6aJ7s4/xUSt8rlm7gDWIGgMh/s?=
 =?us-ascii?Q?+BJYymAxBcE8tlrllnvgFmo71dm8yjE8ctKXi+g01ubxJ3i5N3g+tjowNI4H?=
 =?us-ascii?Q?jQTzmtXYxQ3Aa8M6tMWQ3hJndSR6wYtBBLacojZ2KE8+sNuTjBjZIPWTidvw?=
 =?us-ascii?Q?o0cPYm7b24xhF8sOeJmqI+2tMSvEjDN2R3Hn1n8EJbBBU9vj9z+SiopfofsZ?=
 =?us-ascii?Q?tIS0t4jQj8xq0/M4C1KY/hrgE6nTPuHxeRG3X10G0ukaPM8ZhqzEorGvipO1?=
 =?us-ascii?Q?L0ew7gFccEVaCiwUpW7byrgmSC/yzMpwVIPKjbh7kKkxr5PVHp17Ar6g5ey2?=
 =?us-ascii?Q?bgEZlfwSvNVnJ+3U9G4JnufQMRQgfHFJKQBkGeFtEM8XkuaMqi++h6iGME9W?=
 =?us-ascii?Q?VzCfh6D4dAzCYrzabz1dCJ/NFNHrH+2tKPwmuNz/6+RiNfm08a+1aQdL1Hk4?=
 =?us-ascii?Q?zpAZwLjTilOv6Ir71LvxUoe4IKRkmWPLCh1bFqk2D9uUIwSgxKB0gHYQ+NfD?=
 =?us-ascii?Q?W/cbaosDaTV1dcEY6XUrAKZOdXN0+42iQ4+P+1ZMGqLW80PzdN3GglDe73c8?=
 =?us-ascii?Q?PsFacq3O2VZvHBNixhkjsBg9BtQfbNktJQngf76EkzUZJQLk3mhcXJpj7ekr?=
 =?us-ascii?Q?GafLpz7TRmmEc8c0sTepw7TFbBW8TCobNfHdVqIH3PTxlVCrIDriOyO2+D7f?=
 =?us-ascii?Q?4IXzHwzyOmyTIUer+AW4PAL8/Acg7aC+L37NLIRRFeAGZqGHoOI/cb/SoTJT?=
 =?us-ascii?Q?4Yrb3Bc6Es/SHYio32Kkl+sD8+hFJ1WkAXSwWfvnragIz4QRQ08cRtkYSGXu?=
 =?us-ascii?Q?6niwjyL66YECxwDmclYlIHPLa6J21VBAohUYypRyQFtBu4DhA9zS5jXUjltT?=
 =?us-ascii?Q?vpHcmQB7RpeB++GlgpP2aL8rua7uR/ET7DRDIPpXA4T33+ybm4h9z7P+YAUT?=
 =?us-ascii?Q?DM9JYhBp0DM8fpaO4I3jd+lCEBYT8KZa2nsHCDyTXjf/XseCQeDHEuIWhaQY?=
 =?us-ascii?Q?a8dlC5+S3VTAtwnPMe81qFmGtniw7BMwUqZghP+jlUAOEvD72CXiGWSo6jI8?=
 =?us-ascii?Q?+1F7BEU+u82VpcWESLPMkxT3oNo8wX2g47PpNhLd8kAYBCMDAqRdyzJfI02B?=
 =?us-ascii?Q?Xz3DfwhlJxYwcd05N7L7Of7wdJXS5op72Kfvh//Yg1YlgkSHq4SO3ntKDGBN?=
 =?us-ascii?Q?xPO2flPtqkjFEihUMqwHEbCSpIG7QILWCpMuMVFhLcXk1kOenfeKpoOHjtwy?=
 =?us-ascii?Q?r/1KlXpKVEZHRb6JFEEoyaV7LRSVtrIVOSbZk2qPVSGmQ/XLAwh1UTbPFZbV?=
 =?us-ascii?Q?oCOSkJkpeVwBhEU5dM8/o6sIH5nMAfuS9gS2?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qLau/g3yJ4T7uCkPfLbcDwx0aC/G195XMbyJguCMVCALBOQhUX/TKT4KsGQD?=
 =?us-ascii?Q?dkOCTm1obwFR1xVTPj1PdlXOibGjDlGQQ3GRz9PqbbdaPV5+4LVUvN+aAfTE?=
 =?us-ascii?Q?+nDHD3ZS/RpuyrRyuRnBgy03WKHfTH15ooAXh6LuqwPXyK2RfurowxG9xkMX?=
 =?us-ascii?Q?r6KuKA96fdoFI0MKK9FJWwFYivEKklDc4r+/zzAaybEhfnem32mQeIy7E21z?=
 =?us-ascii?Q?F4BFE1L41+Y5Gti6JaBAWoVAG1UyuKrewamnaK82teyjdQPCacjRF9vRU+T/?=
 =?us-ascii?Q?iO2dYe0C1WuWinSbtioN3fDcxE+7qRIOczymDRv/kN/5J/FqzpAS7w5kRHvI?=
 =?us-ascii?Q?b2qJ/5P2m0IkCY9cL2N4rqmEG0pdMdsE6CcKBKHLMSzm0C9qga25/2MKud/e?=
 =?us-ascii?Q?S0u8SBZMXNe1r+G7tM8iKCK7QVl+pmj22xGxZrYtOPwuNAYMcTt3rpFIQgFR?=
 =?us-ascii?Q?Jzyja8xM8SgSomdeJYvj3Irstf5TaVhTo3nWzXHX9XyablizoD8ZSURYrFTA?=
 =?us-ascii?Q?uiitIFanU2IbS7LXz4M555bONe41k4IjRE0f6YVEQMJnWWUfwpf8Il6gaNfT?=
 =?us-ascii?Q?o9coLPGBz84OjiHqJMa1mFGr9SDLpTX4zdY+BBegZ5xen3xfVGpsvr/gz8/e?=
 =?us-ascii?Q?orvvII+gEnJhotv4NR5A0yc7HN3/4NskFghZss1aF18Wnd/TYq+ZKJGvwN4m?=
 =?us-ascii?Q?kKi/f4sydGKXN+ywWj0UsbCECZ9Jz1TPgzdfRWVD/OBBjcT2vUVgofJlx/IZ?=
 =?us-ascii?Q?MnhUlUsjKEhNBGblS3ks6agblqfvNoO8k2kdUkKzc9kkUKUxcgA87Fi+p6/U?=
 =?us-ascii?Q?UX7PO/fqtG/89u2G4j6TwBH/frU8vW2rNHZt8+5NHYebrVqIv1FH6Lp1UJeQ?=
 =?us-ascii?Q?8fIWyCfr5YT2fwgrB7xmCLDe0WVXovhX1SnYs5uZGEqTHgjDkaGtTyAbsx1M?=
 =?us-ascii?Q?AoqulJqtOibP0ER+M3qqzuUO++6K/Ds6O3bRSWfgtiWAFzrDeVDlqDK0g0LG?=
 =?us-ascii?Q?tdog18747EwAo7r8mK9UJfvsqMLOhkrg7bERDCDD3s6CVbxjfa/zhIj3syXy?=
 =?us-ascii?Q?zJypOg5w1RxBQbMpIfuqy2M3I+gRkqpYNTk0h6y1vHC1u+WiKxGrZd20LgkK?=
 =?us-ascii?Q?OdMbXP8YsVuq5gCkPDaRkqjAckA4KIHX5HOzldgq+gISxRAEJwETr4gRMw1S?=
 =?us-ascii?Q?BNKafJXLJP2GdF4rRZfWe39QxU/UjuvsD9/LvSJ36tAFFExOIvWMD1tWbkup?=
 =?us-ascii?Q?fuJROnz8XkHla48BvXRIrwJEU7wHTg8xFp+UR/Y+F4ARcQQO834f7hlqvESQ?=
 =?us-ascii?Q?QlOzlz+qooacAYepoYWORVBzhVbd0QmklCZITUhAvBH+Gj6qBcivhc6VXgYa?=
 =?us-ascii?Q?9ZfdebYtL0rIVTDie3H87Cg6noUJvqv4kfERTFEn1vz132ftRBNLH99EV4Nl?=
 =?us-ascii?Q?xybzvfSTItC7JYIm/znwM5Z0V4MpKXMWXDxjOECOEQPwSSR8sVjw8Xh0lxLJ?=
 =?us-ascii?Q?tEebLpTwBERJKd7JSDNWtyOQ9DOggVAWlsFZm6miHvARX9Rxppwm1F5uOCqi?=
 =?us-ascii?Q?gxCAVIbLKb5sIN/3Rl2l7T56d92vrdZepy1LnuH1EULgeDWHnuuLCHDQYPdb?=
 =?us-ascii?Q?L/yM7Rbk1ghmG14UO5mq/l4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2522e578-d048-4bba-3837-08de20b7c386
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:17:56.5911
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m2pSqb/ZC4a1D/78NqqKv2RGkqIoha2fhnYejXvuelz0/CQF1COwe3HNrk6VFjzx6eu48RXu1weoUcy7aSmAm6MtXN+hQXYvqKdXc9wX9iiH1nb1o8pADlAu4Xm+8esB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB7893

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
 sound/soc/amd/acp/acp-mach-common.c | 40 +++++++++++++++++------------
 1 file changed, 23 insertions(+), 17 deletions(-)

diff --git a/sound/soc/amd/acp/acp-mach-common.c b/sound/soc/amd/acp/acp-mach-common.c
index c4bc8e849284c..4d99472c75baf 100644
--- a/sound/soc/amd/acp/acp-mach-common.c
+++ b/sound/soc/amd/acp/acp-mach-common.c
@@ -116,6 +116,7 @@ static const struct snd_soc_dapm_route rt5682_map[] = {
 static int acp_card_rt5682_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
+	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(card);
 	struct acp_card_drvdata *drvdata = card->drvdata;
 	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	struct snd_soc_component *component = codec_dai->component;
@@ -129,7 +130,7 @@ static int acp_card_rt5682_init(struct snd_soc_pcm_runtime *rtd)
 	drvdata->wclk = clk_get(component->dev, "rt5682-dai-wclk");
 	drvdata->bclk = clk_get(component->dev, "rt5682-dai-bclk");
 
-	ret = snd_soc_dapm_new_controls(&card->dapm, rt5682_widgets,
+	ret = snd_soc_dapm_new_controls(dapm, rt5682_widgets,
 					ARRAY_SIZE(rt5682_widgets));
 	if (ret) {
 		dev_err(rtd->dev, "unable to add widget dapm controls, ret %d\n", ret);
@@ -166,7 +167,7 @@ static int acp_card_rt5682_init(struct snd_soc_pcm_runtime *rtd)
 		return ret;
 	}
 
-	return snd_soc_dapm_add_routes(&rtd->card->dapm, rt5682_map, ARRAY_SIZE(rt5682_map));
+	return snd_soc_dapm_add_routes(dapm, rt5682_map, ARRAY_SIZE(rt5682_map));
 }
 
 static int acp_card_hs_startup(struct snd_pcm_substream *substream)
@@ -357,6 +358,7 @@ static const struct snd_soc_dapm_route rt5682s_map[] = {
 static int acp_card_rt5682s_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
+	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(card);
 	struct acp_card_drvdata *drvdata = card->drvdata;
 	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	struct snd_soc_component *component = codec_dai->component;
@@ -372,7 +374,7 @@ static int acp_card_rt5682s_init(struct snd_soc_pcm_runtime *rtd)
 		drvdata->bclk = clk_get(component->dev, "rt5682-dai-bclk");
 	}
 
-	ret = snd_soc_dapm_new_controls(&card->dapm, rt5682s_widgets,
+	ret = snd_soc_dapm_new_controls(dapm, rt5682s_widgets,
 					ARRAY_SIZE(rt5682s_widgets));
 	if (ret) {
 		dev_err(rtd->dev, "unable to add widget dapm controls, ret %d\n", ret);
@@ -409,7 +411,7 @@ static int acp_card_rt5682s_init(struct snd_soc_pcm_runtime *rtd)
 		return ret;
 	}
 
-	return snd_soc_dapm_add_routes(&rtd->card->dapm, rt5682s_map, ARRAY_SIZE(rt5682s_map));
+	return snd_soc_dapm_add_routes(dapm, rt5682s_map, ARRAY_SIZE(rt5682s_map));
 }
 
 static int acp_card_rt5682s_hw_params(struct snd_pcm_substream *substream,
@@ -581,13 +583,14 @@ static struct snd_soc_codec_conf rt1019_conf[] = {
 static int acp_card_rt1019_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
+	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(card);
 	struct acp_card_drvdata *drvdata = card->drvdata;
 	int ret;
 
 	if (drvdata->amp_codec_id != RT1019)
 		return -EINVAL;
 
-	ret = snd_soc_dapm_new_controls(&card->dapm, rt1019_widgets,
+	ret = snd_soc_dapm_new_controls(dapm, rt1019_widgets,
 					ARRAY_SIZE(rt1019_widgets));
 	if (ret) {
 		dev_err(rtd->dev, "unable to add widget dapm controls, ret %d\n", ret);
@@ -601,7 +604,7 @@ static int acp_card_rt1019_init(struct snd_soc_pcm_runtime *rtd)
 		return ret;
 	}
 
-	return snd_soc_dapm_add_routes(&rtd->card->dapm, rt1019_map_lr,
+	return snd_soc_dapm_add_routes(dapm, rt1019_map_lr,
 				       ARRAY_SIZE(rt1019_map_lr));
 }
 
@@ -746,13 +749,14 @@ static const struct snd_soc_dapm_route max98360a_map[] = {
 static int acp_card_maxim_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
+	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(card);
 	struct acp_card_drvdata *drvdata = card->drvdata;
 	int ret;
 
 	if (drvdata->amp_codec_id != MAX98360A)
 		return -EINVAL;
 
-	ret = snd_soc_dapm_new_controls(&card->dapm, max98360a_widgets,
+	ret = snd_soc_dapm_new_controls(dapm, max98360a_widgets,
 					ARRAY_SIZE(max98360a_widgets));
 	if (ret) {
 		dev_err(rtd->dev, "unable to add widget dapm controls, ret %d\n", ret);
@@ -766,7 +770,7 @@ static int acp_card_maxim_init(struct snd_soc_pcm_runtime *rtd)
 		return ret;
 	}
 
-	return snd_soc_dapm_add_routes(&rtd->card->dapm, max98360a_map,
+	return snd_soc_dapm_add_routes(dapm, max98360a_map,
 				       ARRAY_SIZE(max98360a_map));
 }
 
@@ -882,13 +886,14 @@ static int acp_card_max98388_startup(struct snd_pcm_substream *substream)
 static int acp_card_max98388_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
+	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(card);
 	struct acp_card_drvdata *drvdata = card->drvdata;
 	int ret;
 
 	if (drvdata->amp_codec_id != MAX98388)
 		return -EINVAL;
 
-	ret = snd_soc_dapm_new_controls(&card->dapm, max98388_widgets,
+	ret = snd_soc_dapm_new_controls(dapm, max98388_widgets,
 					ARRAY_SIZE(max98388_widgets));
 
 	if (ret) {
@@ -904,7 +909,7 @@ static int acp_card_max98388_init(struct snd_soc_pcm_runtime *rtd)
 		return ret;
 	}
 
-	return snd_soc_dapm_add_routes(&rtd->card->dapm, max98388_map,
+	return snd_soc_dapm_add_routes(dapm, max98388_map,
 				       ARRAY_SIZE(max98388_map));
 }
 
@@ -966,6 +971,7 @@ static const struct snd_soc_dapm_route nau8825_map[] = {
 static int acp_card_nau8825_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
+	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(card);
 	struct acp_card_drvdata *drvdata = card->drvdata;
 	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	struct snd_soc_component *component = codec_dai->component;
@@ -976,7 +982,7 @@ static int acp_card_nau8825_init(struct snd_soc_pcm_runtime *rtd)
 	if (drvdata->hs_codec_id != NAU8825)
 		return -EINVAL;
 
-	ret = snd_soc_dapm_new_controls(&card->dapm, nau8825_widgets,
+	ret = snd_soc_dapm_new_controls(dapm, nau8825_widgets,
 					ARRAY_SIZE(nau8825_widgets));
 	if (ret) {
 		dev_err(rtd->dev, "unable to add widget dapm controls, ret %d\n", ret);
@@ -1013,7 +1019,7 @@ static int acp_card_nau8825_init(struct snd_soc_pcm_runtime *rtd)
 		return ret;
 	}
 
-	return snd_soc_dapm_add_routes(&rtd->card->dapm, nau8825_map, ARRAY_SIZE(nau8825_map));
+	return snd_soc_dapm_add_routes(dapm, nau8825_map, ARRAY_SIZE(nau8825_map));
 }
 
 static int acp_nau8825_hw_params(struct snd_pcm_substream *substream,
@@ -1102,8 +1108,7 @@ static const struct snd_soc_ops acp_card_nau8825_ops = {
 static int platform_clock_control(struct snd_soc_dapm_widget *w,
 				  struct snd_kcontrol *k, int  event)
 {
-	struct snd_soc_dapm_context *dapm = w->dapm;
-	struct snd_soc_card *card = dapm->card;
+	struct snd_soc_card *card = snd_soc_dapm_to_card(w->dapm);
 	struct snd_soc_dai *codec_dai;
 	int ret = 0;
 
@@ -1181,13 +1186,14 @@ static struct snd_pcm_hw_constraint_list constraints_sample_bits = {
 static int acp_8821_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
+	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(card);
 	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	struct snd_soc_component *component = codec_dai->component;
 	int ret;
 
 	dev_info(rtd->dev, "codec dai name = %s\n", codec_dai->name);
 
-	ret = snd_soc_dapm_new_controls(&card->dapm, nau8821_widgets,
+	ret = snd_soc_dapm_new_controls(dapm, nau8821_widgets,
 					ARRAY_SIZE(nau8821_widgets));
 	if (ret) {
 		dev_err(rtd->dev, "unable to add widget dapm controls, ret %d\n", ret);
@@ -1221,7 +1227,7 @@ static int acp_8821_init(struct snd_soc_pcm_runtime *rtd)
 
 	nau8821_enable_jack_detect(component, &nau8821_jack);
 
-	return snd_soc_dapm_add_routes(&rtd->card->dapm, nau8821_audio_route,
+	return snd_soc_dapm_add_routes(dapm, nau8821_audio_route,
 				       ARRAY_SIZE(nau8821_audio_route));
 }
 
@@ -1340,7 +1346,7 @@ static int acp_rtk_set_bias_level(struct snd_soc_card *card,
 				  struct snd_soc_dapm_context *dapm,
 				  enum snd_soc_bias_level level)
 {
-	struct snd_soc_component *component = dapm->component;
+	struct snd_soc_component *component = snd_soc_dapm_to_component(dapm);
 	struct acp_card_drvdata *drvdata = card->drvdata;
 	int ret = 0;
 
-- 
2.43.0

