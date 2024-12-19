Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010023.outbound.protection.outlook.com [52.101.228.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B9F7494
	for <linux-sound@vger.kernel.org>; Thu, 19 Dec 2024 00:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734568532; cv=fail; b=nCKt7OALKyiCP7kORh06npcnauXBc42U+mwWAbJmzD72HMSEzlgNBg2UKHcED6sEnQXL4vSgRgVp8gKNEPO5oajxu3dmtIRi0EMoQqi4jD9uhPMbbAES19m5JkD28uaqashlKdaFQbzRqOEbGqExoez9V9sdTyNiMGG39MJe/ow=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734568532; c=relaxed/simple;
	bh=dFfg5Ae/MoPJH2Ejeb8Iihqmn9ztw02wCYKV3a6BO08=;
	h=Message-ID:In-Reply-To:References:To:From:Subject:Content-Type:
	 Date:MIME-Version; b=I55rUW35a2O2o21szXrYOyDeYSXmX4gfRg9FVMvmr9ZWIIxV30S18Umw9Vv6sGC67NOSguqK/z1CfJNRFYZopHvks+ReFEL37eNdCJOr9zrlEIl+oX6YaJOmXLj4nWLoGw/PZIWh/GeBRQt1KCMk81NJN5+nFbT9/nsTApRWyfU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=UNkApAdD; arc=fail smtp.client-ip=52.101.228.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="UNkApAdD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H9wWn3Q0TrZIJ0VKbpDHlS9MFWmE4xdR+6Rvcv6BOttieEswGd5s4cbgW+hLUifC9mDrj9hbKoas+7At+7zSSF8s95iRAs1MiKbUd9r/iOA98FcqshjNUD1R9WWzlAm0n0eEPAj4k0inHRN6vZ3Rx6P/MwWnI6rsBZAii8pWF8Xbm5QMjXfMUoWd9Eibx/yVmaVFL0zRoEE622x0oKyuaAraTfD5tNlXa9Zka8RQhg1NMRtG92g8Ej5qRfyijuf7IC6+ABUAVCoJJEi0GxpU8Fs3zwLvaem12UG44u1lAVKCtFqLCyHUeU5/7l5HE/nm3zrKeGu7SYAkrx19guGk+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S3x994mu//c+VzG9sCnHiRUdAe/K89WyGbiEHnI/TXE=;
 b=lMyYbOy2vifPwo8uiJlS4kAsBewafwUg8VM9qg8i8glyLJsg36gcbUZgQdcFaZkXhZSpDnQcqPQPaSI72M4vcasj3e4Dk+dWP4s+6yTsUjQadeCI8bVF4xx31z2ktR2oiuS+s9VSKiVIdoFOOtcQOWuTWdSx0546QZ8KosH0YximVUqKoDN2cy78TRdjqhvREyUgupCCXOAJI/KIRwLSAE0nKIet5oK+pb94rXlk0F5s0tIAVurzHScXpoZ5gLLGhH2qj4EfihMnZzo0lX9GlWQpOvD9R8YvTo7/sS9ZRtEwxQl5RsUSaghojLoT3PPO0kNA3bLlh3CLaTlg6ZDhhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S3x994mu//c+VzG9sCnHiRUdAe/K89WyGbiEHnI/TXE=;
 b=UNkApAdDCwQl0saMygztRPgdF7L9XJGL6aNtmu9xUEWkSVVrE3hApm2vFUpkib5gzjU85OyjUnWN7G1SFLurqjq37GLFkb7P6nPH49VBM+1KmFqZUaMA9HVUHbepa4B0wbQuCqKY7w5R1glVTu/9cq57dMyJFKsaNsNbEmpM2Ac=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYRPR01MB14144.jpnprd01.prod.outlook.com
 (2603:1096:405:221::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Thu, 19 Dec
 2024 00:35:28 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8272.005; Thu, 19 Dec 2024
 00:35:28 +0000
Message-ID: <87msgscxwv.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87r064cxym.wl-kuninori.morimoto.gx@renesas.com>
References: <87r064cxym.wl-kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 3/6] ASoC: simple-card: use __free(device_node) for device node
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 19 Dec 2024 00:35:28 +0000
X-ClientProxiedBy: TYAPR01CA0238.jpnprd01.prod.outlook.com
 (2603:1096:404:11e::34) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYRPR01MB14144:EE_
X-MS-Office365-Filtering-Correlation-Id: 21d4b129-2811-4148-6508-08dd1fc50981
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+LG0SuGNHxLKEQpvq0ixf78JWaYZL5Sm1niHupwZ4u5sxMUm85dguXE9LdXY?=
 =?us-ascii?Q?Rru8bnMJTysYHe/ogQg+0I9rCt7G9wgs58cvKui7mgy5X/eOjAozrhIIh1fQ?=
 =?us-ascii?Q?J6PtveidDQha7+FYjGij7BXQVJHSwP9JwDgVhHmhLray/jl4ZFF/nRaritZw?=
 =?us-ascii?Q?vEXtU/gGyzJMFRcLrU910qEV3O+4MGMoeKB5zfy2jlj3fXO8utP4fUBQNNxC?=
 =?us-ascii?Q?8uZEXn2vavRitBXqOcn5VcKq2QjlzCHYOmLes0RI8hX8fShzUTfQZoaFkCj4?=
 =?us-ascii?Q?dFuhlpgzrk9fMl0ii2pINcvZYWUqFF8V5fn5I77PX7Fl5ynXh9BDEIDcBs6M?=
 =?us-ascii?Q?9oeh5qoPDyq8ux0/GO/vw+PsErkQgxSXJQk6VkRhyZdH5bg2Jlkh92vViVu8?=
 =?us-ascii?Q?75ien/uS2eJb4b4BTJ/ODb+6N6SnYLEgKTLigol5Plw3tIVcU1K2lg+FoIUR?=
 =?us-ascii?Q?NdKYrJScwqUTYpWANp1ag20HkaHq2J1egKK9EZQmrg232aI3EhmjgqIzLVV7?=
 =?us-ascii?Q?WkETF4zWSv92Kx0oT3N2BxqhGkByjGCrup6LQALSN0fpoBacF7lh2LuEbYrY?=
 =?us-ascii?Q?lY63dWBxvll85+TXuRGHZGjCGkS3hVN3VseFIGBe1mMrx5NcrAVUB3/q5QnY?=
 =?us-ascii?Q?2Jw+WAQ0AnP+6S5aQJyHxrH93C1vBWNrRw26v7wwirU5vBhC0bOEwEGQEAJF?=
 =?us-ascii?Q?II+Z2VOgmAn8nb0fPYW1AK54AAkWZWYTaFQWu2zL/tKqJemrolLBTsMH7i1D?=
 =?us-ascii?Q?9AyYYS/UcCLryrKtrJ7ucM6oCamWL830bX/u9rTU2QrRvhlKLY4qRvGNeGuH?=
 =?us-ascii?Q?+xawEIgYVW0BJQYq8fqtiaPP0k138b9SHd+px/0xQXK9EotHHvZeXxOJ1cXd?=
 =?us-ascii?Q?zX5byEHIdaxFgYFhB0snWVQ0szQaRYocNdMz2TvlypVYiRiAmLYfCxM7qavk?=
 =?us-ascii?Q?YwZbulnIlt7rtjlyotx6rxSOsaKDOgE0umNNwFg7flLAB90aXtpLWqJWkL4h?=
 =?us-ascii?Q?U0abgXzV/+v3jzcXg0fxK3t3XC65hwMEyUXP5671E51KTwgfxSW3IHVgW7u+?=
 =?us-ascii?Q?HaXZCmPgN+nqsahaAwWhOqP1TUNxSPjxDMsXi2182txTqJ5hoJJZhnrUxLD1?=
 =?us-ascii?Q?u0DFsvZrkuzNBh/mGuvePwq8CVmtdGy69Fk2KsaD3d3OufonT1spjnC25RSf?=
 =?us-ascii?Q?NtOUkEZ7B2fwpxi1jKo7QoQdSXEFqk3JDYEYKgQ/4qckGMkDoprPCc/Pvxov?=
 =?us-ascii?Q?00FOG2ml+iIRNVm2d9wZVQMkgFsrlbZraeXXZiobp5z0b11tj83yD6b07M4e?=
 =?us-ascii?Q?GwdK2VC2jyt9VpK7RM6ogmIVQetj0l2yDgnYuPRuv6MdTqsmPt+srrPpMRzQ?=
 =?us-ascii?Q?koZposwfRIDzeeYIOIvlx0AzjQ+3IChLEGLLh7fzPIQa4r9dYVFnuaTLQFb8?=
 =?us-ascii?Q?8kK4EyI1N2Mpe/SJTGD0rgnzX8q79Dbv?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?a4qA4PHHEIAiVul5abyqzVYpfqxwBGUeSlSepiazc7u/UG8lyS3NDnqigpsv?=
 =?us-ascii?Q?7nYpTephaaTBABo6RBe5vn+Nk0/IlSnB7MiSFcCfWvHS5Au6arPJR5OMbjiw?=
 =?us-ascii?Q?lMQH+UAyL1coj2iXhp6vEXTdeB78bb0xPz9BD/bhemAk0Uw9+n0hVW/s/a1n?=
 =?us-ascii?Q?yGBVobMeMyJQQsPG4tB8ubv7UOM7BEkOTXiMnuEuF0+0iEzupQduvaeRX3Mh?=
 =?us-ascii?Q?Acph6tR69xPMHZLc1fi+AzkxLeogc4Cr04A9OuFhoP9Fpv+LvY/ofMtMYsLE?=
 =?us-ascii?Q?iBtebfPN/wKoQH0OyWOwSRJB0yHc17EWnx6cXblIHgxL0GBNQDBj3QYUvUE7?=
 =?us-ascii?Q?YDSa+Hd+YLUEthW3EtsaYs3+jmwoYXXsxeQYr9yINLb3ZA3TTrXo7+FjtWpK?=
 =?us-ascii?Q?R7SvLAuJv+jv77Kg3xw0sGmLMYc1lwG81/jWn2RUXDbJEiIPkN37gekCwQ71?=
 =?us-ascii?Q?PkrAI87mVmhViLi8JHdyrBRDBg2xhIvFNRu1+yq5kQkS9YPHlIx1RiAGR/0o?=
 =?us-ascii?Q?9ZbWRbzTYgYguD18guPhVsWd0G6XW2Pta8ngosgnOZOZgLuCzWR0FrT1QFyW?=
 =?us-ascii?Q?1I219Z5pGOvjLWRGuX1IjkkzH0+J+ohjatu3x8j1/iJCc13TpSf6SUCqpizY?=
 =?us-ascii?Q?+70IIClIRtl95R+GoH0xMNPa00k2OEsdXKKRCN4D5O/xh4SD5BxbheV6+hqP?=
 =?us-ascii?Q?e6/NPfMXqPnG6Uc92gIKxZ0yuz+L5sIAqM3nQHl06ALLnRqJ6UD0w5JQiP/K?=
 =?us-ascii?Q?9uThSJEm3Da6JtQH2oosYNv/wfn1T/G+aTdgHUtaZy8auBkdE5mo2W7vqbVd?=
 =?us-ascii?Q?ZjQteTKCfiAfX8F9NpYJItbALemb7ZZCrmF2q6kNuFD3nEqc76hpBm+GlgPl?=
 =?us-ascii?Q?MhzLUN4/CUVJUkjjscU91to8TBaEFH84ndD24apLToLhoE8Z/+quS0N3QF3J?=
 =?us-ascii?Q?02hxsE+GqcgjWEf3JQkN8vwAbqnLXtoXHMzw/ml2WO/baIBVyhw94nuezt2X?=
 =?us-ascii?Q?QaxlWxWHIohs7DNYlluMEgZpeY6S7e9pjcYFOEf57R7rvHo1F3YS0IQJgw8m?=
 =?us-ascii?Q?jVlye+hlp5H5/Rsxd4YvGQW23avZwfqw5Ar7GKRwvu12ubk7HNTZHdQzk+us?=
 =?us-ascii?Q?Xf2yHGxOQp3okeX6tYY0oO8Duzbn3iBS5tYCrLxSH8fAFWlXjC24SVvcmOIQ?=
 =?us-ascii?Q?lezVXWWden+VITciSDCMO2/EfgxKr6InH+CIsLbIm9t4hM8X5kTR6Bu8nQho?=
 =?us-ascii?Q?z+qzCfOarnEzzoUXvLos1OLk8fW87XyL+9Zx4PNvlwgaO+3waiFDUmo6udI9?=
 =?us-ascii?Q?3celCJOVssoFPX8trZWwcRZxLmpvZy+4JujPttw2JVHI5Dcxizqa0jJccM3G?=
 =?us-ascii?Q?yc/CQtmisbxK1zvqoVZx/CXZtve5H5F1UMwdLGwTMp5SUxZ81gST4gmWuDr/?=
 =?us-ascii?Q?ZuofqDgOhGuFxNOVezcJX4Z7jwTO3/JgnZhMlWS5+YLZOMtF3ErdPILKnMsU?=
 =?us-ascii?Q?zz4Q+YDq6gGvb+IjCeSSEyF6h5dHplQuzYLV+mLsAQae8ZWGzP8Xuv96phss?=
 =?us-ascii?Q?B8YRkCR8o/ejEpiiHr/LdYxGZfTHLwGg65ctSBI6l1RjH5AGdTN7nRxY1vKZ?=
 =?us-ascii?Q?xIeGsrMKObmfhPuW63UClqQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21d4b129-2811-4148-6508-08dd1fc50981
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 00:35:28.5864
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EEqegav/1Zdh2M8FxsyFEBmZwdIaM51id4hh/SmphbWcUihzNvTUYLurUO3/hahLnRJmvP9nEwics4TUKW7hONMVpZrl6gofZ6kUbbsFVYFep4rB3seOwx0UlF0n7V5B
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB14144

simple-card handles many type of device_node, thus need to
use of_node_put() in many place. Let's use __free(device_node)
and avoid it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/generic/simple-card.c | 58 ++++++++++-----------------------
 1 file changed, 17 insertions(+), 41 deletions(-)

diff --git a/sound/soc/generic/simple-card.c b/sound/soc/generic/simple-card.c
index 76a1d05e2ebec..afe7e79ffdbdb 100644
--- a/sound/soc/generic/simple-card.c
+++ b/sound/soc/generic/simple-card.c
@@ -120,14 +120,12 @@ static void simple_parse_convert(struct device *dev,
 				 struct simple_util_data *adata)
 {
 	struct device_node *top = dev->of_node;
-	struct device_node *node = of_get_parent(np);
+	struct device_node *node __free(device_node) = of_get_parent(np);
 
 	simple_util_parse_convert(top,  PREFIX, adata);
 	simple_util_parse_convert(node, PREFIX, adata);
 	simple_util_parse_convert(node, NULL,   adata);
 	simple_util_parse_convert(np,   NULL,   adata);
-
-	of_node_put(node);
 }
 
 static int simple_parse_node(struct simple_util_priv *priv,
@@ -176,7 +174,7 @@ static int simple_link_init(struct simple_util_priv *priv,
 	struct device_node *top = dev->of_node;
 	struct snd_soc_dai_link *dai_link = simple_priv_to_link(priv, li->link);
 	struct simple_dai_props *dai_props = simple_priv_to_props(priv, li->link);
-	struct device_node *node = of_get_parent(cpu);
+	struct device_node *node __free(device_node) = of_get_parent(cpu);
 	enum snd_soc_trigger_order trigger_start = SND_SOC_TRIGGER_ORDER_DEFAULT;
 	enum snd_soc_trigger_order trigger_stop  = SND_SOC_TRIGGER_ORDER_DEFAULT;
 	bool playback_only = 0, capture_only = 0;
@@ -185,7 +183,7 @@ static int simple_link_init(struct simple_util_priv *priv,
 	ret = simple_util_parse_daifmt(dev, node, codec,
 				       prefix, &dai_link->dai_fmt);
 	if (ret < 0)
-		goto init_end;
+		return ret;
 
 	graph_util_parse_link_direction(top,	&playback_only, &capture_only);
 	graph_util_parse_link_direction(node,	&playback_only, &capture_only);
@@ -215,11 +213,7 @@ static int simple_link_init(struct simple_util_priv *priv,
 	dai_link->init			= simple_util_dai_init;
 	dai_link->ops			= &simple_ops;
 
-	ret = simple_util_set_dailink_name(dev, dai_link, name);
-init_end:
-	of_node_put(node);
-
-	return ret;
+	return simple_util_set_dailink_name(dev, dai_link, name);
 }
 
 static int simple_dai_link_of_dpcm(struct simple_util_priv *priv,
@@ -232,7 +226,7 @@ static int simple_dai_link_of_dpcm(struct simple_util_priv *priv,
 	struct snd_soc_dai_link *dai_link = simple_priv_to_link(priv, li->link);
 	struct simple_dai_props *dai_props = simple_priv_to_props(priv, li->link);
 	struct device_node *top = dev->of_node;
-	struct device_node *node = of_get_parent(np);
+	struct device_node *node __free(device_node) = of_get_parent(np);
 	char *prefix = "";
 	char dai_name[64];
 	int ret;
@@ -296,7 +290,6 @@ static int simple_dai_link_of_dpcm(struct simple_util_priv *priv,
 out_put_node:
 	li->link++;
 
-	of_node_put(node);
 	return ret;
 }
 
@@ -312,15 +305,13 @@ static int simple_dai_link_of(struct simple_util_priv *priv,
 	struct snd_soc_dai_link_component *codecs = snd_soc_link_to_codec(dai_link, 0);
 	struct snd_soc_dai_link_component *platforms = snd_soc_link_to_platform(dai_link, 0);
 	struct device_node *cpu = NULL;
-	struct device_node *node = NULL;
-	struct device_node *plat = NULL;
 	char dai_name[64];
 	char prop[128];
 	char *prefix = "";
 	int ret, single_cpu = 0;
 
 	cpu  = np;
-	node = of_get_parent(np);
+	struct device_node *node __free(device_node) = of_get_parent(np);
 
 	dev_dbg(dev, "link_of (%pOF)\n", node);
 
@@ -329,7 +320,7 @@ static int simple_dai_link_of(struct simple_util_priv *priv,
 		prefix = PREFIX;
 
 	snprintf(prop, sizeof(prop), "%splat", prefix);
-	plat = of_get_child_by_name(node, prop);
+	struct device_node *plat __free(device_node)  = of_get_child_by_name(node, prop);
 
 	ret = simple_parse_node(priv, cpu, li, prefix, &single_cpu);
 	if (ret < 0)
@@ -352,9 +343,6 @@ static int simple_dai_link_of(struct simple_util_priv *priv,
 	ret = simple_link_init(priv, cpu, codec, li, prefix, dai_name);
 
 dai_link_of_err:
-	of_node_put(plat);
-	of_node_put(node);
-
 	li->link++;
 
 	return ret;
@@ -374,7 +362,6 @@ static int __simple_for_each_link(struct simple_util_priv *priv,
 	struct device *dev = simple_priv_to_dev(priv);
 	struct device_node *top = dev->of_node;
 	struct device_node *node;
-	struct device_node *add_devs;
 	uintptr_t dpcm_selectable = (uintptr_t)of_device_get_match_data(dev);
 	bool is_top = 0;
 	int ret = 0;
@@ -386,14 +373,11 @@ static int __simple_for_each_link(struct simple_util_priv *priv,
 		is_top = 1;
 	}
 
-	add_devs = of_get_child_by_name(top, PREFIX "additional-devs");
+	struct device_node *add_devs __free(device_node) = of_get_child_by_name(top, PREFIX "additional-devs");
 
 	/* loop for all dai-link */
 	do {
 		struct simple_util_data adata;
-		struct device_node *codec;
-		struct device_node *plat;
-		struct device_node *np;
 		int num = of_get_child_count(node);
 
 		/* Skip additional-devs node */
@@ -403,26 +387,26 @@ static int __simple_for_each_link(struct simple_util_priv *priv,
 		}
 
 		/* get codec */
-		codec = of_get_child_by_name(node, is_top ?
-					     PREFIX "codec" : "codec");
+		struct device_node *codec __free(device_node) =
+			of_get_child_by_name(node, is_top ? PREFIX "codec" : "codec");
 		if (!codec) {
 			ret = -ENODEV;
 			goto error;
 		}
 		/* get platform */
-		plat = of_get_child_by_name(node, is_top ?
-					    PREFIX "plat" : "plat");
+		struct device_node *plat __free(device_node) =
+			of_get_child_by_name(node, is_top ? PREFIX "plat" : "plat");
 
 		/* get convert-xxx property */
 		memset(&adata, 0, sizeof(adata));
-		for_each_child_of_node(node, np) {
+		for_each_child_of_node_scoped(node, np) {
 			if (np == add_devs)
 				continue;
 			simple_parse_convert(dev, np, &adata);
 		}
 
 		/* loop for all CPU/Codec node */
-		for_each_child_of_node(node, np) {
+		for_each_child_of_node_scoped(node, np) {
 			if (plat == np || add_devs == np)
 				continue;
 			/*
@@ -452,22 +436,16 @@ static int __simple_for_each_link(struct simple_util_priv *priv,
 					ret = func_noml(priv, np, codec, li, is_top);
 			}
 
-			if (ret < 0) {
-				of_node_put(codec);
-				of_node_put(plat);
-				of_node_put(np);
+			if (ret < 0)
 				goto error;
-			}
 		}
 
-		of_node_put(codec);
-		of_node_put(plat);
 		node = of_get_next_child(top, node);
 	} while (!is_top && node);
 
  error:
-	of_node_put(add_devs);
 	of_node_put(node);
+
 	return ret;
 }
 
@@ -514,15 +492,13 @@ static void simple_depopulate_aux(void *data)
 static int simple_populate_aux(struct simple_util_priv *priv)
 {
 	struct device *dev = simple_priv_to_dev(priv);
-	struct device_node *node;
+	struct device_node *node __free(device_node) = of_get_child_by_name(dev->of_node, PREFIX "additional-devs");
 	int ret;
 
-	node = of_get_child_by_name(dev->of_node, PREFIX "additional-devs");
 	if (!node)
 		return 0;
 
 	ret = of_platform_populate(node, NULL, NULL, dev);
-	of_node_put(node);
 	if (ret)
 		return ret;
 
-- 
2.43.0

