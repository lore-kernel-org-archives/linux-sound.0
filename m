Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010044.outbound.protection.outlook.com [52.101.228.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EEB017C
	for <linux-sound@vger.kernel.org>; Mon,  6 Jan 2025 05:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736142572; cv=fail; b=L6F1je5CmKHsD3DC+pqG6Gn3k3boqzfWVIWp+BAEPYGOD1PL+hy5hBbt3GJJoxS4RyZVT9xndOApwUM0K5bpgmH4RzQnFIiyEMbKt13+rDbWNwaWjadyp6ckgcMWSEd3RBTg/T/aXsv58sx8BlUkAFVdXsEmUJHjtaZ4Y3kKYiw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736142572; c=relaxed/simple;
	bh=dFfg5Ae/MoPJH2Ejeb8Iihqmn9ztw02wCYKV3a6BO08=;
	h=Message-ID:To:In-Reply-To:References:From:Subject:Content-Type:
	 Date:MIME-Version; b=Cqt6tMHd7QD0ODP5aiRMDhuQKDG11Zohl+8mLcoODCieezg0f22A+hQizkWL0zHll5IEqUAK0NX/ADSR1BBUY9hxArSig5fKTQBiXhtHfY+AHcwFlJFjEMI2VSKWL8Vz/nPeh6VxGz2bfIBPzITkEU/21o3SXhjdMInbBAVS9p4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=owJWgjfx; arc=fail smtp.client-ip=52.101.228.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="owJWgjfx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x5kjXoNcy+ay+RoHxHZ/tq94Nt4tkPslpywGcgt2+RVdcv5t7khor96+zQyW0t+jx+OfoY3ir0RFvgcXxDDvsXpNN7D9KZq01SFvXCB1cL4gT891iFh5GASY2HBmVmt8hyOPhsk8X7ixRk7W1BtJ0i+JBA1HDfJSkHji+/UZbdAqjS2JQNQgzc36CLR5ndIGQYZkNUK7osRr2DLMNewGBkr3LF3tLlcq14Dgjp6L8o2ooR9KNc9lb+VCmR0hpjFuAooqzuLTyZov1d6gtKGcDug7/iS9C4AFPxdlG8bwkLeq5A9msr9XEvpoAQqv5E0/NYdC+8nwFfS0Qgii3Vo+Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S3x994mu//c+VzG9sCnHiRUdAe/K89WyGbiEHnI/TXE=;
 b=ZsquGWMtM51XhYLtqp4PTe9kavr6YigRLujJrL9Mdsjhw8daQNDVrBEjw2TsUQGZ73T6uo0NSAoYAW9IEAJ/fnmD4oO/HZjeyZD5PO5dI8Omuffw84EmL4EgBsgqoCHZCIz4GmrewMZuQ7ydxoDM+yZNB2neb/QQFH7cx4fF712uMrHaAaUwOKDEV6RJVVuI8jYOGdHmMVqldk2vaNf4r4oYadvDM6FK84RG+9D0byh3S7nNoT1SC2rjuNP+tJoSfV3yKZVoJBrtYHQmYwgsbHWGvaM3jTtkWQvNN8NQeVWORJ8AeajCxmYwY7Qg2nbvSvHuIml31TuX9L8Tiv1m+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S3x994mu//c+VzG9sCnHiRUdAe/K89WyGbiEHnI/TXE=;
 b=owJWgjfxKru0prgTS+Rkgy2bnz0ETOvKkJg3LXuVeN7k1pIXsJxEXeCHkIfTtPIctU92lY8amCQ0Bp7ycj+W1S8mnsEMpyIdyiWThEYp20zpBwhUaRPrU6+H3azQ4+ZzTQMl8YMwPCv6OTY/cLhHu6qGYs54tk2ZbwUhGQL2bf8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB6247.jpnprd01.prod.outlook.com
 (2603:1096:604:ed::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Mon, 6 Jan
 2025 05:49:28 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8314.015; Mon, 6 Jan 2025
 05:49:28 +0000
Message-ID: <87v7uso5js.wl-kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Stephen Gordon <gordoste@iinet.net.au>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org
In-Reply-To: <87zfk4o5l2.wl-kuninori.morimoto.gx@renesas.com>
References: <87zfk4o5l2.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 3/7] ASoC: simple-card: use __free(device_node) for device node
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 6 Jan 2025 05:49:28 +0000
X-ClientProxiedBy: TYCP286CA0135.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b6::19) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB6247:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cd6581b-2107-401c-30e4-08dd2e15e23a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YcpxeJBkcrVwoAhJvmRcMId6goOCi1wMyea9AOU3omLI/r9GBMBbdHHNu4rA?=
 =?us-ascii?Q?EqToT5N0hD1wbkeq5tfbiZkV7+34tKEGwofpVYfMD8uBfE+A0RPFjLQ2UQSw?=
 =?us-ascii?Q?JcrL+pc6roaYTvSy5Xrk+vcz0iRuscObpangsKqAqb6jgN2cbBIOyFkiRGjj?=
 =?us-ascii?Q?rxndAQQaz5OqlPE2BQ/r8nUPM8rNApnko21jqF2QhRbKWaU8SrE+xpGEfkHn?=
 =?us-ascii?Q?EC1Vkjx952BuhdoKRisbM6jcRwNAV3Q+r8fKdMIDIBYUNfb1iR3JvFAmd3D4?=
 =?us-ascii?Q?WUxhW7Mht1TUr1QflMq/d7VaEgT4WC+ULvjE7L8XOrD3kT8hvGSiOqNlp7yt?=
 =?us-ascii?Q?IHsXJTtX45V6reyIRFHUBsg0jB+WiubiR+E2AygKg0FhQWaIYGCLpnBcnc3t?=
 =?us-ascii?Q?hGhQTgOH83pl9IPTIfzZlkGU7FYyEHUBdyyyrv3iA77t1l4goQ4oVYCaelFb?=
 =?us-ascii?Q?ItVai0fAJo7P8Loi6izE/Fm6KtTnvnGC7BfLm5s+iaKSwtTlgwvYKkjnuQF0?=
 =?us-ascii?Q?HGilvhkqJQ51y4WIp/8Lp5rEWyWGkhp00648T76ik3InN7U0bySKXp/1lF/j?=
 =?us-ascii?Q?xlG0nBKN8OI+SeEEHaGp/dQErrr9D++3SjBZQ76pHXJnoUdNQFIVZnUGx/OE?=
 =?us-ascii?Q?cX8LUhKZovwGGT3NRa82m6HBFz7WALxNNvXq1uBQ153Brm7A7G8dViGbR+Xo?=
 =?us-ascii?Q?m3+memeB9bLdJWIT2+9rTw1Hg84yGD4KQ6Ssu1v1Y/LHTIL9f//U8YuFRxkZ?=
 =?us-ascii?Q?SVpPe9tUrHqx2oMs9kRyk9IoYX3GANCPnFSk9cdVkQgfAyVH4D6RpMzAgF+f?=
 =?us-ascii?Q?0Z5xWtyrmoZflkPZ30bScYSsXw26PIYFqaqb09EuCzjZP1AYR/0g71fMW/25?=
 =?us-ascii?Q?oaEM7NHab+n9DggoW7vSLZ58+76+KZoAbXnRm7Bm26mFHniagD9dWGfVQKwQ?=
 =?us-ascii?Q?Tjlj6WFS8a8V1F9S7xMt1/GKFZnkpxn7wpBIhvKzIzof/kjmjvhtpKMCr82D?=
 =?us-ascii?Q?4gqLgcKnM+fadxicxKb4Vv+zrCn9ZmwbWVthMwe9FqK8g1Kd5u44lZtHzAbV?=
 =?us-ascii?Q?NLjXwrSlnyOwjMtybMcmUSgtUlzRMf4ddI5slop3qk1mEHkYUn5NBrwTKUg6?=
 =?us-ascii?Q?hMgTPX3I5TqIWj9nBfqelSCHMOcXoa+jts8/b1SlaqS6FI+a9/URgz1zJFhk?=
 =?us-ascii?Q?vV5UzI7QUGhrf0rFkFCCC7JRqtpNwgWntnahpwP6JTh6Psmfegy4C8wAus7F?=
 =?us-ascii?Q?72pPKuAbYvSVdvrTyRws8wzxf6gRAI9f4ID1Eiw7ecm6q9aaXSDXJWYEBXeV?=
 =?us-ascii?Q?EqkYAV7ogL7WAr2A/u42UIkT37mGbK1R+j1RJhMoTH//qw/xlk7JBpydO3kC?=
 =?us-ascii?Q?OWjZ5Weg2ZcTqsQs9GXuyn3a8xUoajC7IjGDPMpy3B7h89rxajQr8oLKJXQ/?=
 =?us-ascii?Q?+IXgBNXHUWU/GAnrO/jMLL5FrmTdWg/X?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dl8iiBasJKeTKLsP6VsMkdkP4t0aUnZY2sUb/Ys/IkRyHNzsEiY2JyLXEXfC?=
 =?us-ascii?Q?vPKfyzBaNoiX5yT6FiQ72vkmDk/BH0j51aylcB/TbbFikPceC4+UkzjvmvgM?=
 =?us-ascii?Q?4jkb1LsjaXq4wCoyU0SDZsZxWD+15v5DUUMqM2QifKQyISFRcMikI1Jv2HRb?=
 =?us-ascii?Q?9gkoJgVeAAg62pIXMzFBKHcwc/iptI/Bz7+afSi82HVRuqOMMnOyDfNmKfTS?=
 =?us-ascii?Q?gxqNwrH1jm+zMmqki8eVorCRpTgme8jyCDFQarSjjuUb27bJFgq1egFMuo0i?=
 =?us-ascii?Q?y1jKZCgaqqrWNbf6ILbgOovkoIF7YPTo1zOExkgqJLH/tcha1NFNCkEodh52?=
 =?us-ascii?Q?3T6E5qjN1wfnFxRLImgH2gG8wZgZPyPXfssp0BSF+bD62bu1UqTjP+/8jOpD?=
 =?us-ascii?Q?8a/0jpJhaHIAeX8VM6mG9CSTqvQw5UPZP3s1hBpjuk144+MPbgx64tcLyujg?=
 =?us-ascii?Q?UgKsQzdUjObvHUFlOQDfNDousATf5GgKZgVmUl+F20iKoRR37aLwgS/n6JqU?=
 =?us-ascii?Q?gzUuNlq1O9qt/FO2zvJ5kamh39SNlLi3wziEgXTKE/d+StprNuYv2BjNMVZC?=
 =?us-ascii?Q?GagJcnAW6ghjQ8yUgmppLItqlScpf96ERfOtPkkw00yWLboj+vmD7+e1Ewxk?=
 =?us-ascii?Q?YcPQa73WVpVA7LW6s5X8hJ40yxkcb0rKSTi7BFWXbbqfG6gV1d5jw/v/bi1w?=
 =?us-ascii?Q?7KfLsCesXeX/38DuNNSCO4lSiPr8Czc6WW5GBJ1tpteOg7LrMkcJVyOWRZzc?=
 =?us-ascii?Q?S9PoyVRM9YsaeZkYI8NBZLZDeBis6nfXvyeED156OuzrexPP61QxvEE7/0gC?=
 =?us-ascii?Q?WexSpKUyz1Mh0OJJrdgJiQiYDchF5K74/mT0WLx9GWHpALE/Q5UCd6dvneMO?=
 =?us-ascii?Q?DsOnNkBcovjshkQLYYmRUCgu9Yh5ubrsyq/o/TR5k0r8GmZ/Hz2DQ3igv9C4?=
 =?us-ascii?Q?apAWYdFSRD+Fmu3Ds1LGSx8US8iagqaTDjwbpSol9ba3g5fk4AmE6vOLBeYw?=
 =?us-ascii?Q?hRbIt7MFLEiAInC4D5rOa2oHqaW2oDZiIAyCGed/0m1PW0XtyLyOrcdzIvDt?=
 =?us-ascii?Q?pNuheiGU40aYn2Q6iqQzCB02GztUz0V+uAjOtvlgqZ6xCUcFcZSj1TaP3l4V?=
 =?us-ascii?Q?3qzQHhUvkkUuG7JEgSKpTNcYyu8Un/n77Jo2dYxgA+uRNILRjZ47QC5PHFTR?=
 =?us-ascii?Q?463Ezf15gcskJgWqaL0fE6+rn3gcGMjrd5VWdxDLYmwCvneAs6j9Od5NXsYD?=
 =?us-ascii?Q?UsWKm+aVZs1vW+Zyass52YlTeURgBU6Ie/crA0R6JxH3v4dQSfR5pjgALKpw?=
 =?us-ascii?Q?HpqfZdCxS+G3fnwo47gLYrS24zLuaCigy+jO6N7NfsMd9vw+VGzvKnSr2sAC?=
 =?us-ascii?Q?G5vvji/joTqFP/nmDA0eKrtmlAv6/WppsiHRs6qrOzDlmAX88gMikh7KkN2H?=
 =?us-ascii?Q?HlhfIRTFuLjjk+d03MuscqO0GQkrzqyO+LCvSV0uC33rUywKRMSxvpEvAEj4?=
 =?us-ascii?Q?XqpVcG09QUe0EuGTN97y7ewkZhmEv9WCCDTGQ1O5lTkaKiTuxsZ/3+lYCHe0?=
 =?us-ascii?Q?+1syNfDON6W6C2gtb8dsuDFcrFgi5zCVKRRFMGQG3cGkdnAJob/+FRFgh4JV?=
 =?us-ascii?Q?8lwsjwheo5110SLwFxF8ba8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cd6581b-2107-401c-30e4-08dd2e15e23a
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2025 05:49:28.2342
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KcXFdDc0cxulkUgk0dv6+we0XCY4KHS3ad/LY42zjY6bWSUqzV9UvCZTQu8gXASfn0rba0kqDZTiKSwn/BXxo5ibD1X6ADD3wNa2TbrL85RpxbgbXmptVUDNL1sMkojn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB6247

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

