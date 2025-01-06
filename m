Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010016.outbound.protection.outlook.com [52.101.229.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F00A17C
	for <linux-sound@vger.kernel.org>; Mon,  6 Jan 2025 05:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736142588; cv=fail; b=CkQ4iQ3oQBVeD1nA8TR122ws4erIiRGaxGNjjX+DpanqyK3JJw+uVICL0t96HdEJ61pI5Cxvt6JExKHF4S+EtZWMMrhOHpZ2eck6h7wfP/CGPYBUgvWIw3RDdyNuupJxLXfPnpJLfhE67BvSSZyfP/o5fD64z4Qq7FCY0NAXvDg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736142588; c=relaxed/simple;
	bh=P3lBIYceFZvtGODMe5E2CFfedsXcVN8l9R42YlMN/GY=;
	h=Message-ID:To:In-Reply-To:References:From:Subject:Content-Type:
	 Date:MIME-Version; b=TR51hvKVabUopZtkMKzKOe6SymJutSVhuXa6q9Bokb2cUqRu4uUrbSyXeswpd9ExhxFNS+hl28aslcvkaOz/tc7+YGH/qoFgiWQpbOcbwLvXgZPKCaB5pGqxaFK+idD1zub8VqcCB6QcCZpmuGyziPvgBep497yAvYPJW3qAxjM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=BqCwGn9h; arc=fail smtp.client-ip=52.101.229.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="BqCwGn9h"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bKEpwB1ZXX/dFpo2mNPK/eJVxqikk11TUnj2VCzHB5jlt3B8DgppN08Htzo8Ce5tPjtpPV+oFPpwn4r2dr2wWosJM2BjTELG3Sok3Oyclb5e3F4bMRfHK/8OWxr9kR0T+Dh0e6+V73wgTNiki4mbS0WfY1OzM6/ensJbPg43o00mMWBQdue7O0HMTAJWceouzIW3zGzHHXOIJ9S+tDzwkls+7kAOH9cfRoVhbGrtn1ukm4Pp8JowvFlw1VCimH2oOdSTPiYOXc/zvsVZSqRfrdBMPXvrwWfp2zeVjnV6CVThngLYHfZ0l14+wRnGjLY/AjDQMMtgXnMl9pPhIEsE9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ptxx4KlXPLr54EzR49exvE5r06t9J/AL/yfOPW20bxc=;
 b=d4oTSdLAsrIKh9gqCjSuDBTklpp39UTXWvXWfBAaGMA4SYU16hSTH7y3d5KvPjBMSyD8gpBiDfBo+KiE/BpuHaE9P9CawjVv2ufpKgLKGleMJ6ZVYfpB8L4gnthHT8fz7LTuf1Mqet+nLc+K0AIv7vPpSfNT6CxWGjAA4UKLyL78O/BQ8hic1KZyoIQPUcxN3r7c0dwBsPlOHjS5QjpniXbqPyniIxQeTsfHI81SYTlRRlMUqj0gLvbWL4ttGh62FwYcn3JaLDF4YvyOweJeDxQGRbyQ60LwjpE5XNATJiokdfp7FqTmCGuagi1VSOgnVRkAj75JV9cshbDLDDHtgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ptxx4KlXPLr54EzR49exvE5r06t9J/AL/yfOPW20bxc=;
 b=BqCwGn9hGuCzCWxzwy/bsvBdLxJJAnzbvj3+dadEGdK0yX6lZ/7rlFjAjoPU6zERlVI02e15+SH+ubFd6kiKFzNLflLkw10AtS1VY4sDrTwNOAO3IFpg4e481g8c2EQvK60aSIL207Y49S4JFQWXNgmWzmmrFq54jcmY79TC5pk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB6247.jpnprd01.prod.outlook.com
 (2603:1096:604:ed::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Mon, 6 Jan
 2025 05:49:45 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8314.015; Mon, 6 Jan 2025
 05:49:45 +0000
Message-ID: <87r05go5ja.wl-kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Stephen Gordon <gordoste@iinet.net.au>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org
In-Reply-To: <87zfk4o5l2.wl-kuninori.morimoto.gx@renesas.com>
References: <87zfk4o5l2.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 6/7] ASoC: soc-core: Enable to use extra format on each DAI
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 6 Jan 2025 05:49:45 +0000
X-ClientProxiedBy: TYCPR01CA0139.jpnprd01.prod.outlook.com
 (2603:1096:400:2b7::16) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB6247:EE_
X-MS-Office365-Filtering-Correlation-Id: 7da932a3-8675-484e-553d-08dd2e15ec79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?G0NgG2BiDKN2CoRewWDR4/gf+jwe6w88iI6nFlvll6iuXGZoZ7LsCLX8tZxe?=
 =?us-ascii?Q?EvC5Mz19fr7Ub79c55BeRO+ndXDa+9QdZu49ar7LRUL4nbzXP/nvH9/hczaa?=
 =?us-ascii?Q?O9jpP/7l0Ihzq5HZbgBH/Cxa5rghX+pd1f2YnCEai5Nk7VRdMOk04+XwxqUr?=
 =?us-ascii?Q?pt3C+pmoIajhqEqSPgCSx7ReXBFylTF1bRVT/yZtLVm4F2sl+QMXHTtj9VPZ?=
 =?us-ascii?Q?rMxddk++jouSwsydlK8aIcsH5vHVs8rhVSCB0LfvS68a2b0pkJdDudx+lvqp?=
 =?us-ascii?Q?2pQs/u74IFG1MTQZ38S0eQMWncfKkKejR+SzHY50i2CJalco407T3+voJdb3?=
 =?us-ascii?Q?rxrL2QMt+XgVw0RroYo0q0oEm7Huo4B0aztvrHUK/LgjbpCb3p+ZAe3UICpK?=
 =?us-ascii?Q?Ma16Pfcz6Pel9pTvY0jiqQmNXyzc1aeVXUOigcjRoJHneIqR6BR0ykmMpTHV?=
 =?us-ascii?Q?YQrb8sXEJegLzwBSWuIhXl5oFSlmyiv8d+xB3mikA2eD5RoxLDwaXNu7YBxg?=
 =?us-ascii?Q?Dz5lmNG922fffKwkhpMepWDyorwRcfevKH9qZdPci0KW60A7vw67l/89JDJE?=
 =?us-ascii?Q?kxNHw3FHv+dfd4/9oGuPZ0c7cIg/q+SdZHJxiYZoUUeZsuY725DZLHEm59Od?=
 =?us-ascii?Q?3atL8kZ+5GYqlAsz+Md+nX5eHihIY9Znpg71enzH7/vs7ptWmbh97ggzwhrF?=
 =?us-ascii?Q?jbvENlfjRw6P8S62gvXOCHhUVceMNW2C0b1ExWQGvTkFf8RJ39Ljsw0uMS29?=
 =?us-ascii?Q?EjJf83CmoBMQI7Y633TkWKqIrar901xvgpnXvPT4ZpFSPL8YMmbh0vseQLkY?=
 =?us-ascii?Q?UTV3eRfXaIk3uIAEmr8Pl8PNFjsbteHOFSKI6APa41TyLB5ZLEe0W5MRMnVz?=
 =?us-ascii?Q?U+wiSuE4UQ8CCFTediWw8UST2W1jpjivq/5wzWR/JQq3OHMBuLGXwOJgogDn?=
 =?us-ascii?Q?IPvetUYIFyNPaEBcUyLAv1eOWqqS45BykrEe+7XfOVcQH0tWORSweAUvNyXm?=
 =?us-ascii?Q?hER7nm9PLsaVypKFDQV42b87yfJh1LxCC6+j/jZtD4SlaR070E9YaqXnazrK?=
 =?us-ascii?Q?afXQPBFcBCqh4alCC4E7sFFwgJ/eyq98ssQnGWgJEVOS6h2WqA4QE6i4TmGP?=
 =?us-ascii?Q?NE9w8hgTQrYGQY7WqLbko5cWdy/SXUI+/91kMqLkZikXPhJ9gCqDADFb+0Cu?=
 =?us-ascii?Q?1KhMWs+paeles3ghXO3gZN1eVp5Xrz3JDZm9q5LF8/HNGGaDhpx18VA4Sr7J?=
 =?us-ascii?Q?2UIa3HostwyJo4kXUK65BSK5arm4NaGS/Rg1MyBK5aw2nEzvrVTq77cxy0iO?=
 =?us-ascii?Q?WCsBdnnH+T/j9Byuxv/oVfwBSKQQM2OcGtw982HF5iPzKiejVhZR1ki5io56?=
 =?us-ascii?Q?x+9dkDULplC88C0i1aeJe6B79IwaI+sIRY0J8oFIzDOXaSdALiaaLiMkr1xZ?=
 =?us-ascii?Q?Wck+CxJrEmtTynTlJAdF46fkxT6M/mKD?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+Y4GjCJ7kbO5IK8COs7VAb0ZwwmLV7vxExxY0Vk31XyZSguXpjUXuDcLGTOi?=
 =?us-ascii?Q?buKirkY7PIR+/BzztkyEbnQuXKHnMNETwXcgWWjJjYWnEx6Fo3pCx79rzh2Z?=
 =?us-ascii?Q?q0sEZcig86rV/Cr4dmmqiI9r4qwCmjYHZLm1E29q4AG2xK0JJMZ7KgOuRY7M?=
 =?us-ascii?Q?WlExalSIn8+QyZkJsUrv/7m2lGj4BN5rTC6Ksnqh/vaUHziL0m8QhbhproeS?=
 =?us-ascii?Q?sxs9qfdTq1Jhg2Uy2Fun+H0w/EhE5LWONx7/S6lcpw0qGAIrqeVaZ9G3ift2?=
 =?us-ascii?Q?A4rzEjJgLB6TNyFBJONHg8Nqv0LVNCdTVcaLxuckr5LQ8uQ+ygwJOkSvbFJQ?=
 =?us-ascii?Q?W0fOL2qHK9IQ5SHw5fzzg/oHQj1eaMgq6a7QLYadq/M4RkLI8fV/E+BOXyZc?=
 =?us-ascii?Q?TzoxcuO0DFTzPMt5iqcigqUVAyi32jfZAIG6PY9pZspFmYuBh2U8AtllhBFl?=
 =?us-ascii?Q?xqixVTN6LE06TSUfv6441IDfdgXdZRJRfY+XB7etjRoZpPAYi407Zp9bSOQp?=
 =?us-ascii?Q?o7FmAUv0a1jkBSZXQ/84p8RT3p+0812XyM/0oCCNfbZKTbyAMfle9y9RZk32?=
 =?us-ascii?Q?9fl7z7Nuf7B5kL8HBuo7Xa2ua6zrgvRVL3ZCC9rWT59jTyARvPmxR78MQe+T?=
 =?us-ascii?Q?atghOz99ZnIlhQdsH8ylRbNNnA2gBpwFuEZaiLbmwBErNbHdCIz8k+JsO3mK?=
 =?us-ascii?Q?tzgMg6//CW5iOP7c5On81VIQ3f6ZWgnzVXLSU1B/B98EZMg11GxJIEyDQKFz?=
 =?us-ascii?Q?/qh3dXewxs6IaJfqttH5XH6mj+4KeKNxIabm4aVEeu0FGIzxEBCQDowQLS7N?=
 =?us-ascii?Q?fi/qNLZcbErz9uTFP46Z4SQdJX0CUaI2L6eDAPLjvt2WgLsqen1mtqyRAWXH?=
 =?us-ascii?Q?VwKSuxcT3OzX082+J4m/l56kamPCWPiQnANJ9AMLcpCGC7R0bi0KehOnPbTg?=
 =?us-ascii?Q?T14dMvwTiIrlh5SqO2MK5m3pQw7JK3YCKSM8wyEw0tmfaE1+TVQFQrnr9LSN?=
 =?us-ascii?Q?O0LozmgJHf2GrPaExpLUJnOBJ2dKroXaRYJitng5SR20o+QmcZ+uSKNI0MFn?=
 =?us-ascii?Q?lbVt+eL1w+xgJipTQVKrSsQWm4/Hbsu1Bpe57XLdKCuUSAKBbuRiUDS0IIRR?=
 =?us-ascii?Q?/UCOkAD5cgaCsk23ja8eePqWbxZcKugrCHfC6A9aEO9FvJQ1ApyxcXwHEI4L?=
 =?us-ascii?Q?RC7d+ImbJzAq6p56OGH6kyCYew2D+hYBRWrCfRSYaP0UTtid70JNnjvpsAte?=
 =?us-ascii?Q?6wV6EaeRgnMavW3/ab7l8PsAD14t0w+0W8aBHznanjdM9jcjWR3hNvBfTKv+?=
 =?us-ascii?Q?w9xJ+c+8hNJ/0c8dS4H1ZhkgU7ojy1MaOzZazPrusTAmJAY4K4WrfPlvuvmt?=
 =?us-ascii?Q?hug2/Krcpxi2lmHfW770XbUHcevAnJUClQtp6pViuwijo/26DAM15EuyGqqV?=
 =?us-ascii?Q?lgpacHXipXt0cf80rwlMNOyeZDnNxqErYqyLG+xPJKU54peegmS3OhGjQrx4?=
 =?us-ascii?Q?YpfEE0WGoNvd3eNVUN2I5KLVY87uZtQic9bUSjKW1hd4CxenMIYLb3sEtZ15?=
 =?us-ascii?Q?L1PcW/m4Owoh9jiJIfUBIE/YDm+sGEErQ8xfFi4kZcpFzZx4B0ldYbPJQymd?=
 =?us-ascii?Q?Ju4nIALmLReoNlZk4uXqBdw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7da932a3-8675-484e-553d-08dd2e15ec79
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2025 05:49:45.3912
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cYzMPIuUGxBoqh7GHr94FtUNh2CvSi/vikLyGGaaSOoL1F/PNqxvw5dGN4an0ze6sfRoVuwipmCPKM/4cE3f5MvspDn4lRYxN9his6m+qxX6tOnjZ71FdWlIehxOVn58
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB6247

Current ASoC is using dai_link->dai_fmt to set DAI format for both
CPU/Codec. But because it is using same settings, and
SND_SOC_DAIFMT_CLOCK_PROVIDER is flipped for CPU, we can't set both
CPU/Codec as clock consumer, for example.

To solve this issue, this patch enable to use extra format for each
DAI which can keep compatibility with legacy system,

	1. SND_SOC_DAIFMT_FORMAT_MASK
	2. SND_SOC_DAIFMT_CLOCK
	3. SND_SOC_DAIFMT_INV
	4. SND_SOC_DAIFMT_CLOCK_PROVIDER

	Legacy
		dai_fmt  includes 1, 2, 3, 4

	New idea
		dai_fmt  includes 1, 2, 3
		ext_fmt  includes 4

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc.h  | 11 +++++++++++
 sound/soc/soc-core.c | 27 +++++++++++++++++++++++++--
 2 files changed, 36 insertions(+), 2 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 4f5d411e3823f..61eee40da12ad 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -681,6 +681,17 @@ struct snd_soc_dai_link_component {
 	struct device_node *of_node;
 	const char *dai_name;
 	const struct of_phandle_args *dai_args;
+
+	/*
+	 * Extra format = SND_SOC_DAIFMT_Bx_Fx
+	 *
+	 * [Note] it is Bx_Fx base, not CBx_CFx
+	 *
+	 * It will be used with dai_link->dai_fmt
+	 * see
+	 *	snd_soc_runtime_set_dai_fmt()
+	 */
+	unsigned int ext_fmt;
 };
 
 /*
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 31cf499e3e79d..bd16b3fe59c8f 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1449,23 +1449,46 @@ int snd_soc_runtime_set_dai_fmt(struct snd_soc_pcm_runtime *rtd,
 {
 	struct snd_soc_dai *cpu_dai;
 	struct snd_soc_dai *codec_dai;
+	unsigned int ext_fmt;
 	unsigned int i;
 	int ret;
 
 	if (!dai_fmt)
 		return 0;
 
+	/*
+	 * dai_fmt has 4 types
+	 *	1. SND_SOC_DAIFMT_FORMAT_MASK
+	 *	2. SND_SOC_DAIFMT_CLOCK
+	 *	3. SND_SOC_DAIFMT_INV
+	 *	4. SND_SOC_DAIFMT_CLOCK_PROVIDER
+	 *
+	 * 4. CLOCK_PROVIDER is set from Codec perspective in dai_fmt. So it will be flipped
+	 * when this function calls set_fmt() for CPU (CBx_CFx -> Bx_Cx). see below.
+	 * This mean, we can't set CPU/Codec both are clock consumer for example.
+	 * New idea handles 4. in each dai->ext_fmt. It can keep compatibility.
+	 *
+	 * Legacy
+	 *	dai_fmt  includes 1, 2, 3, 4
+	 *
+	 * New idea
+	 *	dai_fmt  includes 1, 2, 3
+	 *	ext_fmt  includes 4
+	 */
 	for_each_rtd_codec_dais(rtd, i, codec_dai) {
-		ret = snd_soc_dai_set_fmt(codec_dai, dai_fmt);
+		ext_fmt = rtd->dai_link->codecs[i].ext_fmt;
+		ret = snd_soc_dai_set_fmt(codec_dai, dai_fmt | ext_fmt);
 		if (ret != 0 && ret != -ENOTSUPP)
 			return ret;
 	}
 
 	/* Flip the polarity for the "CPU" end of link */
+	/* Will effect only for 4. SND_SOC_DAIFMT_CLOCK_PROVIDER */
 	dai_fmt = snd_soc_daifmt_clock_provider_flipped(dai_fmt);
 
 	for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
-		ret = snd_soc_dai_set_fmt(cpu_dai, dai_fmt);
+		ext_fmt = rtd->dai_link->cpus[i].ext_fmt;
+		ret = snd_soc_dai_set_fmt(cpu_dai, dai_fmt | ext_fmt);
 		if (ret != 0 && ret != -ENOTSUPP)
 			return ret;
 	}
-- 
2.43.0

