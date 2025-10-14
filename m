Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011035.outbound.protection.outlook.com [52.101.125.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D369F30AAD2
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 04:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760415943; cv=fail; b=NV4edNQw/toVH+yEPZt312MTRnLE00qTMpWo7Qnrgi2+zartcUFHB1SQRPbSpRxupYT/uG4xEEf2HvXr/dmXRgVCnbZ75OJmoKtiJcG18wpt5f46j/HJkDknaXe6uwmScc7ISgV7duqOfmsXWaQEuukZc3tFJ3dSwdxGPy6v/W0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760415943; c=relaxed/simple;
	bh=xkW7GimZZhAqtxsh1gzcez66C0SOGIXYWgy2FB9R5+A=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=MBlx1qrQ/1wz79t0fFGMR17QHtKV/IR6T1XqUu9rb5VXEhdwY8iynEuOgWU7YFljkpCVpzbcJUstDgIfRqMRPU74cGAQoQj5MAzOU0HnLmvRGv4b45aFSl6aasIgP2nsiYRVJGhbYCq6ggA9ryzL4pCUIcPXsagqss3OFsuZJ7g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=hQO/cJ5B; arc=fail smtp.client-ip=52.101.125.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="hQO/cJ5B"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ASi5t0Dp9bU1IgabMNjTiRTM6G27KSBHPHB0JuQaKmA6gZNPjQopo0G7Ikg4tby0PZ+QE/QM+A+JOx72wyC4PdgJpb9VlFtlvm+EWkSFnPOHVUsYzoDfahPYh0fpTXFOaBGZntc0b4a1lubraSi0iA+sEvlD1hqcyrcus/pYYP0Yg0liL1fE318+ArS5klDLjZL65rWdSJsuq51FsIPJw8UWqzsaqnzdJc7alL/glJ2TC7ocfdRyp+uTzL4/e3uK6r+VvxfP3krqnMadCfFKUCKkz5WDIQahYgVKFHO+LP4vNGcPK/1DXR0sKLiNUQG0UrdmvwvhoDN8S5vEM84UZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T6GTnHUg6iBE2D16oUQ5DJ1GegqAczmQUr6ZAXXnmCI=;
 b=frzD1U4XqEB7Wm8tea45HOcTirnVnPBG4bKUBzJQJ4BoizuuVP1MwTez0YFrDOIAUtBW6CgIMuicePw3EDByxyw7ULCqwpafhQCkStuJI7XKArUhS/4mxleCALlYkqMBudw7hG4LnVJee8eYbvRz+T5Zi2ia/YYQtG4yRgxkhUjrkLgoCWW/oqp/uC3my+lfeSDesNZn5zVOt9HIwf2yPkexieYr0Hu9MuF1ikSMOgDVCzn+uckwU1XPIBeVdwjn2pp2UnqNgep9j/3DVz9/6qGsmjv2+gUoL8JhN5pg+08UlpaugkgKoqT+OkEKVdDZ6tuy/7zZhiw14wWu16bEjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T6GTnHUg6iBE2D16oUQ5DJ1GegqAczmQUr6ZAXXnmCI=;
 b=hQO/cJ5B0Uf7ifYdVaGjVVInpafXbUIk9QmeEQDjimabuCB1TT7UtU9M5imWuhGZB6vZvXcRz8tS/yVBDjHD9lyNboQlw9B9fF4AiEcSNgNNitcJV6l18rdLw01FPwUzybfrEn98NuIlWhdxD1lzYXyPVQEWV5R2/mymchjkFlg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB10584.jpnprd01.prod.outlook.com
 (2603:1096:400:29e::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 04:25:39 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 04:25:37 +0000
Message-ID: <87y0penm7z.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 098/139] ASoC: codecs: wcd938x: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Oct 2025 04:25:37 +0000
X-ClientProxiedBy: TYWPR01CA0037.jpnprd01.prod.outlook.com
 (2603:1096:400:17f::6) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB10584:EE_
X-MS-Office365-Filtering-Correlation-Id: 22af37bc-9616-481d-3edd-08de0ad9b9bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0MOOPDIBVR0d2ym1mZIUn0Oz8CQgiyzA+0giDK4gXy7KP81EM1UnEDB3XzhQ?=
 =?us-ascii?Q?54HPMNmL3ybwNEsjJrasHnD+byGXu7AICZ4Xmju47FVF7Q/d2hrv++3BEkyF?=
 =?us-ascii?Q?GfOtbnqvczDsiLPGxullZ+VCjKiyjmcopOkItJ3KsM4RKw3ex9qA2mFhOsq4?=
 =?us-ascii?Q?DoA1XEQz0dsyxDXh3o7Q9KnTgqY3NNHqStKz8FowBcHw8mwpCtOFsojoFUPg?=
 =?us-ascii?Q?8McSCQNR+XSZArTq6eL4pq8I9BDL+J9wPFDvuY8o/i/Wi/mBY4NfdvuI+8cg?=
 =?us-ascii?Q?l1tnDx5qm9YD3aqK2UNAdfUQl0axBEVBryouHPLhK1UiIY/+doLQWz9JErZm?=
 =?us-ascii?Q?bX4KWaoY8uvwyPanME0K0QLNPUZ4r8DSvQ2k/Aoy3f+XPIxjKG335AqQ4hfr?=
 =?us-ascii?Q?qQKxxZWHPR1Od6n+LcAlrDG+jTf5b5kA2MReAbHQgchFyPpQNIHNeHBw+diJ?=
 =?us-ascii?Q?9uXRPjk/wB2yHkpGqA5yFM3Jmu/6cmKJj6VH3jezBiviO0O9Qia4BPwVm/t5?=
 =?us-ascii?Q?JC8L5HqSXCKNzNmJwM1SKPa2t/fhNTamx6r2aR9Rls9xeI+/6WYwxd99vKT2?=
 =?us-ascii?Q?V77GkooiMCcBJ8fiwwx2apsNEA/Qk7IvJHd7crjwFyxhfWDjn7V/gjOa32JP?=
 =?us-ascii?Q?WJtCVYsdqqCN5Zn1IdSVwhQiM+9i3RZhbr6FTcp+FaJTkNVECLbPZVC40yds?=
 =?us-ascii?Q?8yWyBLaYIktpqNF54ubEmH5pVHaHH4LmJ6ToKhkdgIrsH3EFdEA/fk7DQLPx?=
 =?us-ascii?Q?wVqb1ebpRTI3tiiwtx+06S63DXYdEzK6+QyszWMCc5l0apgGRCuU6oiMOET4?=
 =?us-ascii?Q?H+ilQVYPZQ3E6tQTQpsJ5b9tzhOw6trLrWOQSQZKfxoXCqDO4Mb8FoAbcZfc?=
 =?us-ascii?Q?TDTG38e9YELqIzdmuvyymTIjN88gLYkGILToeLTw2SzGknt+AAwyTE5KN85F?=
 =?us-ascii?Q?2a4fZzqlB93sFv0Jni6eykVNbDNPaE08t0PcRySFh37wCItfaSNwMoHz9BRu?=
 =?us-ascii?Q?1DhOIinBc7MibMJjzlwb4KAzHltpTcbXSOmuNZZWPyw9QT1dhf37NYanm9J9?=
 =?us-ascii?Q?4uIIxD1qFRqtIGn9K9U4h18LXZoZZqLkWW4kNqhXWvL1eo76f1TUYRqjI1Et?=
 =?us-ascii?Q?sNNaJrs34pTJKML4fYmjHtopKm4P2Xc4rJn9pbl75jchb1fTXfScfr6Socon?=
 =?us-ascii?Q?88K3oeH6OJgweRRudTtXi+37PDUevKOmAMTzh5qswvmnBNCYv52gIx+707nl?=
 =?us-ascii?Q?qOX8Usd5Nf14Zo0OZqpCZWtIByQR/T1s7Xp1s7alzoO7AlLgZPqHg2RKdBsM?=
 =?us-ascii?Q?eMOZw+431wYVNsLXywyvi2SvgDbUPlbIo6/ILB5F2RGhRTtW0KfNEwMTQP91?=
 =?us-ascii?Q?E5pzLnzj9nyhFqW3f+LPWSuPJZPeKYaBrcJZ0EY7xTMm55saVz8kylWxWm5V?=
 =?us-ascii?Q?J4tgQj6/XAkl001dCeIIKKbvUBKz8J3tGFwiBFlESPkZmRF0cIpGBxhUsLDP?=
 =?us-ascii?Q?aRsFrz6mg/dw1erCL7aJlnXn+wMha48WwyQL?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nyvGuJW9aEQ2eJWrKqgcG/WuwBI4+WoLKwiFkWRH5egITmePLq4GHdZ+uVI7?=
 =?us-ascii?Q?fRJtVLxt5LO3h1eDDh2Lu6P/wPJs4kKs+ufe6C1cjONWUek6XYaQIzB1qE8t?=
 =?us-ascii?Q?zvls8BBZAIHPcDarnA7aIF9HXNPgIc5ztXRLbovONVtILDEKqZ29Sn9ONAiB?=
 =?us-ascii?Q?jvlOaL+If1NzNIfgzx7npUvQPXMkV1vvGFI+47bqyS4R84OjrrmMz3MFB41T?=
 =?us-ascii?Q?rFohFDYQ2cTYlsfZaKP2Wf0bvpjgnFBfvTthwlc7wGs3szsVJxZaZdeKwRip?=
 =?us-ascii?Q?vsGf6ISsZEl17OjewqUhjSO35X7VxtramZ+08GgTmv4TX0ekOMxHZdP5lrxk?=
 =?us-ascii?Q?j9RRhFZYQTtL6umQiHfLqloiM0YK+MunvdsQBrH6M6xuqErIokBIXN+khcAc?=
 =?us-ascii?Q?lRSzPW2Pq9fC07LbUhbREcLJOIaljXi4oNGNZX0FJU7WeEZWQXi1ni6/QL6v?=
 =?us-ascii?Q?ExCZlD+U7i9PTJckI9HIkRmnUwCNNk/vG/OZICHu2Fknkv99scvexOAfcMMo?=
 =?us-ascii?Q?fO+hachJbJZj8yjGB8FUBVY++poL9adztJLN5cB7P7UBjOsTx0vDndRPIoI6?=
 =?us-ascii?Q?HOhooWBnz0JUsnIm//YtpPjcBIcd0vDIN2PZAWA1Cl4VaH5UA0FuPmvZ5Unb?=
 =?us-ascii?Q?DWottHYDAliMwaUIfmCFjOgCkI6WXEWeeEffpSTS82zMTMZB1UgB22qXzWDe?=
 =?us-ascii?Q?0XYNu2rLeSljFqk7QlT1yNs8PTGvNP0/s0EzkSLkxxoeBSf2SBMHY9x9o1We?=
 =?us-ascii?Q?xzt67Im724yRB7ONB3YquzqwnE4HxXDwIZrW7qfu7WVSgi0onlOOdb1X9cM3?=
 =?us-ascii?Q?EMXIGnyLmQ3PtoyBH/sP7XG0NEmtY7Qy9ym6tZEsbWkWrHY+EwdrdMWigA7f?=
 =?us-ascii?Q?YpbtLTf863VfOMYN5hagwi10rqa5zGKzj26i63Vk9kxhKeKomllVR/uNKgTs?=
 =?us-ascii?Q?gg7Meu5cfiQ9U3outpmxoYZFxAswCRpVGsfy5kMQXInElI0DncTgpLWw4QwL?=
 =?us-ascii?Q?46I5HvT1bY7MZF6ns1hzhhlN+kNSbMlGc+u8cDlmfmFddJ7Z5xegorGu24tz?=
 =?us-ascii?Q?xGTP3pdReFUqUt4AJH8/acPlTOdMz/E8xLTLgkic6051Je9OpsIlRjngK/Xo?=
 =?us-ascii?Q?397XS66DjxchosfhfPnqtA6BksHzOznA0CUVI6+CBlC2KPU+qxZc2j0qtJvb?=
 =?us-ascii?Q?4+RmaL7B4MSrpAcrJA6woDi2RXFQUxhqGQEnxW8HAd2/EWNW4kug/vZRh1dm?=
 =?us-ascii?Q?EmiVaaNAt+vIRK5K6N+IczkH3Dgoi6GLyveR+gyScpMngBTXUF9LdEgR0y99?=
 =?us-ascii?Q?4QF6DntVf67fFSbYRCzcH0fD4MOGi18hYIqo5IfbzhX03kufgi0kOpNdmYNk?=
 =?us-ascii?Q?tOwXussZQPHbUMrVJ6HFJB6tqe73m+ikivgI4pToFLZn5R1OM2Z8AyaK45JU?=
 =?us-ascii?Q?NESMVxpa1ELwErTeQy1VGPYbQvDkm8WYwwr6mBEOJz/ze2K9Faz9Mp3Jn0OF?=
 =?us-ascii?Q?9BOnDyWe+5slKnu/+w5gbYWWyM5YfU/bBgBunk+jyFJfyBIlBSAzMbZko6o0?=
 =?us-ascii?Q?NVKIZfjZ1y8RtFZMbTpMTeUekxyNhw3LUjVEfWNnooCOzi8ZWpLKZaUXa+ge?=
 =?us-ascii?Q?0F1AOp8KzUqO7ks7luPC9IM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22af37bc-9616-481d-3edd-08de0ad9b9bf
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 04:25:37.4770
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 63Ca2bvYvuiJHq3+Br8NtB4mjkDeFEOPcBhXbDQFFxIpxqPcLHYKCANc62tUeLyLXquxS4N0y+jllti0p00oRC3/3qPgvr5nUGaq26bImnSHFbLT9eA18zDc57XCXkgA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10584

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
 sound/soc/codecs/wcd938x.c | 27 +++++++++++++--------------
 1 file changed, 13 insertions(+), 14 deletions(-)

diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
index e1a4783b984c1..f5b7de2bc896d 100644
--- a/sound/soc/codecs/wcd938x.c
+++ b/sound/soc/codecs/wcd938x.c
@@ -1479,7 +1479,7 @@ static int wcd938x_codec_enable_micbias_pullup(struct snd_soc_dapm_widget *w,
 static int wcd938x_tx_mode_get(struct snd_kcontrol *kcontrol,
 			       struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct wcd938x_priv *wcd938x = snd_soc_component_get_drvdata(component);
 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
 	int path = e->shift_l;
@@ -1492,7 +1492,7 @@ static int wcd938x_tx_mode_get(struct snd_kcontrol *kcontrol,
 static int wcd938x_tx_mode_put(struct snd_kcontrol *kcontrol,
 			       struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct wcd938x_priv *wcd938x = snd_soc_component_get_drvdata(component);
 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
 	int path = e->shift_l;
@@ -1508,7 +1508,7 @@ static int wcd938x_tx_mode_put(struct snd_kcontrol *kcontrol,
 static int wcd938x_rx_hph_mode_get(struct snd_kcontrol *kcontrol,
 				 struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct wcd938x_priv *wcd938x = snd_soc_component_get_drvdata(component);
 
 	ucontrol->value.enumerated.item[0] = wcd938x->hph_mode;
@@ -1519,7 +1519,7 @@ static int wcd938x_rx_hph_mode_get(struct snd_kcontrol *kcontrol,
 static int wcd938x_rx_hph_mode_put(struct snd_kcontrol *kcontrol,
 				   struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct wcd938x_priv *wcd938x = snd_soc_component_get_drvdata(component);
 
 	if (wcd938x->hph_mode == ucontrol->value.enumerated.item[0])
@@ -1533,7 +1533,7 @@ static int wcd938x_rx_hph_mode_put(struct snd_kcontrol *kcontrol,
 static int wcd938x_ear_pa_put_gain(struct snd_kcontrol *kcontrol,
 				   struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct wcd938x_priv *wcd938x = snd_soc_component_get_drvdata(component);
 
 	if (wcd938x->comp1_enable) {
@@ -1552,7 +1552,7 @@ static int wcd938x_get_compander(struct snd_kcontrol *kcontrol,
 				 struct snd_ctl_elem_value *ucontrol)
 {
 
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct wcd938x_priv *wcd938x = snd_soc_component_get_drvdata(component);
 	struct soc_mixer_control *mc;
 	bool hphr;
@@ -1571,7 +1571,7 @@ static int wcd938x_get_compander(struct snd_kcontrol *kcontrol,
 static int wcd938x_set_compander(struct snd_kcontrol *kcontrol,
 				 struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct wcd938x_priv *wcd938x = snd_soc_component_get_drvdata(component);
 	struct wcd938x_sdw_priv *wcd;
 	int value = ucontrol->value.integer.value[0];
@@ -1602,7 +1602,7 @@ static int wcd938x_set_compander(struct snd_kcontrol *kcontrol,
 static int wcd938x_ldoh_get(struct snd_kcontrol *kcontrol,
 			    struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct wcd938x_priv *wcd938x = snd_soc_component_get_drvdata(component);
 
 	ucontrol->value.integer.value[0] = wcd938x->ldoh;
@@ -1613,7 +1613,7 @@ static int wcd938x_ldoh_get(struct snd_kcontrol *kcontrol,
 static int wcd938x_ldoh_put(struct snd_kcontrol *kcontrol,
 			    struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct wcd938x_priv *wcd938x = snd_soc_component_get_drvdata(component);
 
 	if (wcd938x->ldoh == ucontrol->value.integer.value[0])
@@ -1843,7 +1843,7 @@ static const struct snd_kcontrol_new wcd9385_snd_controls[] = {
 static int wcd938x_get_swr_port(struct snd_kcontrol *kcontrol,
 			    struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *comp = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *comp = snd_kcontrol_chip(kcontrol);
 	struct wcd938x_priv *wcd938x = snd_soc_component_get_drvdata(comp);
 	struct wcd938x_sdw_priv *wcd;
 	struct soc_mixer_control *mixer = (struct soc_mixer_control *)kcontrol->private_value;
@@ -1862,7 +1862,7 @@ static int wcd938x_get_swr_port(struct snd_kcontrol *kcontrol,
 static int wcd938x_set_swr_port(struct snd_kcontrol *kcontrol,
 			    struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *comp = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *comp = snd_kcontrol_chip(kcontrol);
 	struct wcd938x_priv *wcd938x = snd_soc_component_get_drvdata(comp);
 	struct wcd938x_sdw_priv *wcd;
 	struct soc_mixer_control *mixer =
@@ -2506,7 +2506,7 @@ static const struct wcd_mbhc_cb mbhc_cb = {
 static int wcd938x_get_hph_type(struct snd_kcontrol *kcontrol,
 			      struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct wcd938x_priv *wcd938x = snd_soc_component_get_drvdata(component);
 
 	ucontrol->value.integer.value[0] = wcd_mbhc_get_hph_type(wcd938x->wcd_mbhc);
@@ -2520,8 +2520,7 @@ static int wcd938x_hph_impedance_get(struct snd_kcontrol *kcontrol,
 	uint32_t zl, zr;
 	bool hphr;
 	struct soc_mixer_control *mc;
-	struct snd_soc_component *component =
-					snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct wcd938x_priv *wcd938x = snd_soc_component_get_drvdata(component);
 
 	mc = (struct soc_mixer_control *)(kcontrol->private_value);
-- 
2.43.0

