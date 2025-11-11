Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010021.outbound.protection.outlook.com [52.101.228.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E66591DD525
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820874; cv=fail; b=gPopPZssjSozJYlTtloGClTyFE9KOqRP9vjfWrfFoucRE3qq30tWBL/wsIN5QxBTJ7ayM5qGimiuRvBZMbliNd06+wTbswNq3Rj57UPg0oGwLjKKQiWojpNkD+eBz6Oa9Um1Jnv4T+kcXSkEhJ7bQ1hAgn4G5MBLxc7B3lH6TEY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820874; c=relaxed/simple;
	bh=1PqBDVifxpZh8IFNCIB3fOjHNeelcKV6byTgDk0TMbY=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=sujc0kL6urCPgnjGwfpCdweUvwOeVCHK7spXU7xNV4X91xOr0gdGczRW+NK2i1lomQA0V4MfvE1FXECVodGB3HIQaObqHdtqJea9bqoYLNMzTuHdeYVrLOvYMe6HlLTXP1fEfHJAj9/iDmlLPT1aelAxrSwLDTup58g0GLUGc0I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=hgE9rCT1; arc=fail smtp.client-ip=52.101.228.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="hgE9rCT1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kI9Ir1dN/Et8bBU8/jQSDabNBlBDSs3CnOQLQDKqG11zYBFlh9+coJHIr0qqy5y1ei+4GF6RQB2t6oi4WfO6QpOAwAzy34lAoZthlXdDGhePQsD4TNoyhyGYa+KT7CDsPPJD5BercNRySifRAaVlK2OV37yP7dr8U18LjJ8Szuc1uRfQ4XynX9fGGlDaL93kG6q8/PALETlUkH1bW1/64iRsyrc3IC3b/t/nEDYf/URQc1dp1pS3DhnGN9fISUEtp4HkZUuKtXECpemrkuMMaWCkIMUDdSyLf7LdbMxA/R7MvyJ3eQCQezsBeNLuEbjaJu46MgMECRHF3MP8TvLfTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pIbi6BUC/CbR88gR5JlnLB8IRSkHk5veT3ShFsqPZj4=;
 b=hSCcKHSAFOje6W7CpIs9agKPJXClMQVrhcic/o7ibuRfSNGalLey2Lke7byYUXjB1YNUzzJCEJfKhEvv5T/Uw6gwL2jkAYv9wcydWbr9qrMhq/5zx/AqVlYnKygOuco6rqM5KBp/ET0b4RW60SLim0KPho7ZOflSJAs/iqtLmdOJaiFrlV4WY5KbBmWM4qadnxbSsa0/0vJS5BDKS6RyKT0wjFkZiNL5C8xyL74jNNulp60g1sBdVdmdTa5HwTPWmH4XPRiAbtz3Kt34ZM6xj5MnbfVIcVmd2bD1g0Z0gZNs9Hz5/afbTp1Z8hatQNWejutz9UJ1sjjf7Ojo2doqwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pIbi6BUC/CbR88gR5JlnLB8IRSkHk5veT3ShFsqPZj4=;
 b=hgE9rCT1DjXQMYoJvpQ5TFIq2oqiOMXbkt7U/SYLYgtKWgm5LZ4nFfn+jihbrMVvDqxtb9fFXAM4mZvQN/pzNVzajNqXGlktVyVCPj8ZXU0mUBy2gMxzEqm3olpZWlwptXmrSN67l7Zp/rnjiBcfB26yaCezuaGSGPyfJj34GAU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB12798.jpnprd01.prod.outlook.com
 (2603:1096:405:1e9::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:27:51 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:27:51 +0000
Message-ID: <87ecq51khl.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 148/292] ASoC: codecs: wcd937x: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:27:51 +0000
X-ClientProxiedBy: TY4P286CA0104.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:380::17) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB12798:EE_
X-MS-Office365-Filtering-Correlation-Id: da348b58-877f-4e4d-25bb-08de20b925f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?G9PYpSmDFSoyJFoaJra0By+cQEzZ+A/KHRwWZ/rvTdxklR+ZOWb/UJVhoToP?=
 =?us-ascii?Q?Tx+iU0mQcUlsnHt4ZjW8mgA2o3yForpA1x80orGjajD9mpx0fvSeidAN+mRb?=
 =?us-ascii?Q?Yk4+IRNNpu9jlBzqsntS7gWbz3dL/uHY6OcLDXP2kQ/mHaIb0f2QGA+H3YMC?=
 =?us-ascii?Q?tKIh3AWlckiCAtnAqnuU+x1uTipmPYP8zkKM3jMvRuBRK8yMnREIeVVI5+8K?=
 =?us-ascii?Q?t1krdCO8HLhp/33TZ2HsqguLxkXov5PzfbphpEYhLxfh8fuhIsM150zRgXxZ?=
 =?us-ascii?Q?/dFdbXQawH1kDNkQrJ4EXfihun63qnYT4iE65tIdYVoOiwyXn86dbFMpqA3C?=
 =?us-ascii?Q?Emhzfu90AefzE/qxwyGlq9zCumGwSi9RvUgp9f6wUrJ/z7PMdmoZG7B2vhHT?=
 =?us-ascii?Q?rHSUxOdiVc0nGisXmBnYwVDpNso0NsqYSLsiE90fPqWQu/xGlJh1Tyr8z8A5?=
 =?us-ascii?Q?XIJLVYHCXhIvzFiKljdVFj5MY4fLda+fJWFcp5SlzZY2MtjRStGXut/gPsHz?=
 =?us-ascii?Q?/noA1W+WEODWgqXXA878OXhhYVQIfuzS94rziTZdqG95iEVboIOaY0bNn6p+?=
 =?us-ascii?Q?SAsrjuv7xq/1ZavjGyfQbHjSSY0+nSuvffqiDmunHgcAonAIN8CRJmj95JeU?=
 =?us-ascii?Q?1f+cHJBzSoTMxA1SfhtrNbHfZQb2Jg+sMIjID3NfuQyHTYTvXc5vnFzsM9OR?=
 =?us-ascii?Q?KaVxYFTwmpEYa+EYiVbhqIswGtG5rjgQnalnqcJRz3cu1GSagHCsfYijsW08?=
 =?us-ascii?Q?X9ffucySdYVkWa1tM1LzXWEeTpfjJHZcmAQh9pU2X4ALuyIzJT8faxIHvuJ3?=
 =?us-ascii?Q?/28WB9FLcPe19Jh9yKwBr0MG1HVsUaSv3LNh53rkU1Lum06CeBqeD34bi0ZM?=
 =?us-ascii?Q?+dsXdhNa9P/qBBvmtbwD852ktZUQFJzrLIaCXwQA45rpAw9NZsJABN3CqFRH?=
 =?us-ascii?Q?a/GPeqxPO8L20rVEDZX5vygNSEM3trZsshPWrUSUbmIfo+XydN6UdBVJ06Wc?=
 =?us-ascii?Q?xE6jC8O3nqXw0ykUGM5e+JLRedaCCa1NfgI1SnZasJA6anukEp9pa3YOYHyK?=
 =?us-ascii?Q?uLMfWCirBVFaI1RT3y1wlJgMiV8982wpB1rvqSCzm5gdb3mK4CI6aTd3u4m6?=
 =?us-ascii?Q?kHqp+4+Y5eYvwPYJMd/kvirrPwfEaReWD5DXEG3zEkbKp3zmqccoQA1f4fFM?=
 =?us-ascii?Q?W/4uVQSdL0hgsLa4WuohT1oFt2ItBwXi7uWjwg3OY2/eVaOFyY86DzxzWNKs?=
 =?us-ascii?Q?uj0I87NtJtBz8gomsOqFuAa/HujPnPJosxZToxG6l8xN6BrNjaEAUEXGoyxa?=
 =?us-ascii?Q?lE2SKYjqBQpjXq0pa0ToWRlwyxA31pMGWiuU59aRXjrgHZaQE8gvyfvmdWaO?=
 =?us-ascii?Q?+rkHAWrm16IcFv90TznCdmJA7vf7HC/Zg7xM6Hbkx1NeT75tAhfkflrmc7iM?=
 =?us-ascii?Q?qzTZUjvVlWm0jTfOQYfgf6wGvZLH+J8yKGQTwoRAawrpFufrqcgOXAhSG117?=
 =?us-ascii?Q?SBYaFF813BDBNPVzb9+ClAcHmAKb76gOFQYq?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rmfNnA62Vj/ExCiUpGcvuZt8fF1yT49ja3hqkWLwsTC6r4IZcFWShHmft153?=
 =?us-ascii?Q?CHG6o/Ue5PB2s/T52RBN7TCaDQ1FPu8g2NoZkhx1MvjK/0CdUNqgpl5q3uJc?=
 =?us-ascii?Q?i+aNBW7Cy/REkdKmkuleZ5eToR0iIzXtdqslE4MKn0aYtmMjHfW2V3lFFtkk?=
 =?us-ascii?Q?LKqNZ12U/9baqy9zxLC+xup0sW6wBkFM+jjmPGmBxkX8Vynsl0lkQXEwqcx2?=
 =?us-ascii?Q?AAuht8kcTygs75f9XkCVmb0Qo62wwyjX9eaznSO5DhSKB/c+uHksHVYRj/dU?=
 =?us-ascii?Q?2ElnhTbre030D/EaOSRgAgkFZPS2B0lQQAbAS8kUaZvzt60ZFXBBd37TOrjb?=
 =?us-ascii?Q?irqmGUfdJn1oXToFAxTHNJ07DWroSLoJiPnzXcr0DBpuigxptjUI0XtmOCdD?=
 =?us-ascii?Q?IJp+PZaVISfY0uBUgReOctt5GkKSdNvKz1+qvushxXgI4LKMYY+t5sMDAzRw?=
 =?us-ascii?Q?a1730ux8yhIwuvj9ShHMpFtMPhX/vnyI9Lflv2pzj09kjMo95pFa4NGkX5Te?=
 =?us-ascii?Q?pGZLo25il+W1RuU4sxPbRnFOVclgNWkjsw/kV+LWHAaBCSTV7Ztgj3AfUc4B?=
 =?us-ascii?Q?bxk0HCLxgtblCnQFCKKCdTsbPWRWMOlCxFwXxdWWqfj+XnMRcjxPqjxNxWKf?=
 =?us-ascii?Q?+4YjgBYDECJw6jvh6xyCVkG6VF0FX2s33F/iL0sRjySgFngwGp5wRFamZWRM?=
 =?us-ascii?Q?wc/m6zZGa0AhEv21ZpJSyn/6xXI2l0aKGfGjxSLzmvtQzbSqk1hQplvHXorc?=
 =?us-ascii?Q?lRxgoL772CczfEvSH6yy9/nurO4Q4fOKeuMY4JV8zujOOrrUO8kdSt1SLgKr?=
 =?us-ascii?Q?MN4jCUzFHrH0v5+5ivnAUoCMLHsWc6PQBFGQJcA2oVO+VIpf5BSOIuXm1mjQ?=
 =?us-ascii?Q?m44aPfp39sHgEPMVprkO+PrXFt5gIL9sBGoztccOVy+NjZ5ISgkTO1q3nage?=
 =?us-ascii?Q?uwufmVoE4YaGNqzhfkpqPN2MJ8+WexPAXCW4M+aa4AHLfntk/KUi3gjJYVdI?=
 =?us-ascii?Q?cLKXwCBpJ18GcSY+9K8rlbAWNulvTBWrlY33u9c4j6aCaoO/gh426FHMiDQW?=
 =?us-ascii?Q?ETgnaAhds5zyHo8w97iTH0fCVUU4UPYNLq2r5H+YyzS790l5d6lbZLgDi41C?=
 =?us-ascii?Q?gyBpj0jGkzeeD8tC11bXBQXVaoF6kHhas3wIkB0b5h7/5enYQe9wPbLIQTOv?=
 =?us-ascii?Q?SHRjG1TYINw049YP7/lqQtX44TwV5C2osM0g8OpxE/yvq1iYw7aww8hUKOwk?=
 =?us-ascii?Q?NXhdq3N5KdHUq+htWjlZipxaZ1X2ynX7a4iRZHCHTBqH/8MsG1uKyE50GJ0b?=
 =?us-ascii?Q?qAC7zjMn8LUkaQRs2YN8nCKjBEe3nfEXK7Jc5FhHqLVFq8Zcjuh2FZb5o2kD?=
 =?us-ascii?Q?E5dhjuUFHPcwyOzLWLEJYwSpUQzFfiabQHYWFWGeAzXD4QYtLN8TDr4NO6aa?=
 =?us-ascii?Q?b+ToUU3W0RuifPFsNJbnnM+e43Idq4tnXByDPefyvvW0pkQ/xySHFXkmjygE?=
 =?us-ascii?Q?5sgj6d65SZN5vxzsqOGcEkecg988cScf6KdufZza88KDvuswf4hfGNZf/lkl?=
 =?us-ascii?Q?f0X56QgxA1LHskgvvVsiYNN9ArqV/AJ1N7bmceKujK+O5Xjn7+urYAts/x2L?=
 =?us-ascii?Q?I4uUngc4ZnbuZK0Rl/G2d9U=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da348b58-877f-4e4d-25bb-08de20b925f5
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:27:51.2284
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ggdC6WM9E5Kt8T5lPzfTEpwAjxzRQ/siMA39OFK/Dan/p2zp6Q76DQ9pHAi1xiBNUS9PjsYF2spp5r6s9SEfUBmPb+IgqYvrMScMt34mvxFmK23KIU8lGQAcXQl3UmRx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB12798

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
 sound/soc/codecs/wcd937x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wcd937x.c b/sound/soc/codecs/wcd937x.c
index e7b9ba284cd34..f53cddf07d508 100644
--- a/sound/soc/codecs/wcd937x.c
+++ b/sound/soc/codecs/wcd937x.c
@@ -2473,7 +2473,7 @@ static int wcd937x_irq_init(struct wcd937x_priv *wcd, struct device *dev)
 
 static int wcd937x_soc_codec_probe(struct snd_soc_component *component)
 {
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct wcd937x_priv *wcd937x = snd_soc_component_get_drvdata(component);
 	struct sdw_slave *tx_sdw_dev = wcd937x->tx_sdw_dev;
 	struct device *dev = component->dev;
-- 
2.43.0

