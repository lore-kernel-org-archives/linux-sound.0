Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.125.36
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795737515;
	b=DtBHbO88wI3dw17qzuAhHORWIxRHvGPkdK3Zls8egaCAVBSaj6RezIcJylh1TE8jj7aP
	 TayCENxi4AKtMlQplF8gzBqf3F1t+Y87tB/2G5UJaFoqItDdnqkbbgsWxUFeVD5I45KKM
	 wo9gZsMXqqG9etweP72ilO7OU1MxQLr9rSvznbo0aq9oE3vEW6y7ewEug2GZCn+guINOH
	 GFlMThOIle+VYuSiipR018tMF3oBKyyR3Cahhxgh6ESVEBMyZY/ffangd7MNey0O/+8pG
	 L1nAUOLMszyMn1dbAVtCjYZDNkQZBNQCSuqNerv/4jliYpQ3lFUPyzlF0McvTSHpuyA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795737515;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:From:
	 Subject:User-Agent:To:Cc:In-Reply-To:References:Content-Type:Date:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=ECMbrFbSgsfn/Mb27whrjmPqrhlNeEwBzMWMqcnLdRA=;
	b=Naav3Dy2g1AwVjZOCEhhiTfmWMWipmpXrKhhdCoSZGW/DSdx9yaqBMEY7kXvE7CzaDzl
	 Z+Sul94BJIZS2tiHyVzbp1pGMvf9cxgj5bW+gfjjC6HbOLWH+zYHM7QjTEv1mQnxAERxE
	 2Sxee138Sqm7dVD7SV/T+lV/ZVRIUqbiGAIDZ9zvRYRmnn2X3OQpdhX7bbI+xFc6JHlNY
	 riVZDxKVtYRLSlaOMVhs//VslfNnyJ/sSfWuQIasZm6ye8l6pgZe4pbRradoOxMkk7ESy
	 8GBVZO0N3CpV0EiTjNwDnHYGhFLuws2JB0Y3GN1JJaKM7bGOwo6XcFkRTSGsp8cfQDQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=renesas.com;
	spf=pass smtp.mailfrom=renesas.com;
	dkim=pass header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=edhZn3Tu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.125.36
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011036.outbound.protection.outlook.com [52.101.125.36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BE7D606A31C
	for <linux-sound@vger.kernel.org>; Thu, 26 Nov 2026 23:58:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1BE7D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=edhZn3Tu
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aCYZgrfYCVmIhVMSUJGQNj38opwx7qqVNKODWtS6U2dEdAnCfX1Jg1fF7uNVkBCjm4ZL/f2n9HGHPtT6tnOg4n+Gmt2tG9WsSVrCFLrD9R4P++HzaohiV1wHCoxRWwEj/M7JcU2ymHs3AgN4W3eqQdBKkLAHP0XZVRa75uEMX6421QHtlcWsOn74Rijknwo7TOzXYcFyl6/vZLxAeU0R3egL2qkKjtvr83es9nFDzo474FI7kUCFp+pRT+t/hCuhC+j09TQGmbnBfYJsdUXaZdqp5d1HATGoSkIyqdez8YdAMh4f4sh6UmnXzrfukaw7AjlajkxaTBhp9j0MYMwA/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ECMbrFbSgsfn/Mb27whrjmPqrhlNeEwBzMWMqcnLdRA=;
 b=SO+bKn1DA/LNItIvg5KiU1JbVfV+fEIoKKsLp8zIGpAKnn3KAyRPl/CDm5RvPhSNm4fLEIdtvtcPFKVQ5EO33T3m/P53npnVHHkyLr10M2SDWfKaO/iuQW86OuuULhv0APlWKfjZFeq2GnnhqxFYmgvS5NP5nrgIh6MVsFNx3S2Y+6m7ej9YQ4rjOz2DSozAi2GxPcJOVmV2czxBhoeXjPZfpd4kI1vbkpbfZGfPUqOp81/nVEaNLv6JisJUbwnXKDfimSbqgdmh3k6eNYgoa6AUg4wnSzYkvai7KHFJ6/mu1M0ZlwPGeHtw/FFPs6iyuMf9rZgDPSJfh1evZr21hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ECMbrFbSgsfn/Mb27whrjmPqrhlNeEwBzMWMqcnLdRA=;
 b=edhZn3Tu2PMoGvO3jbNis/FWx9jajdBWUXgIGnHSWYzW8fY9F8o+oA0+fkuqqTDkGnvz+3QmGfG7xrGQLZsfPmX4Q96LMlMItGHFThwBCUTCaLvnS/dl6JxBqDxhexJoEUgWbD3pO/rN7yREsjG+2Nl2TpnM5tT3WJNed9S93qI=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OSOPR01MB749128.jpnprd01.prod.outlook.com
 (2603:1096:604:4ba::14) by TYCPR01MB9643.jpnprd01.prod.outlook.com
 (2603:1096:400:197::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.9; Thu, 26 Nov
 2026 23:58:33 +0000
Received: from OSOPR01MB749128.jpnprd01.prod.outlook.com
 ([fe80::6a3b:d29c:c743:5180]) by OSOPR01MB749128.jpnprd01.prod.outlook.com
 ([fe80::6a3b:d29c:c743:5180%3]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 23:58:32 +0000
Message-ID: <87jylzqh5j.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 08/11] ASoC: soc-dapm: rename list to widget_list
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, Alvin =?ISO-8859-2?Q?=A9ipraga?=
 <alvin.sipraga@analog.com>
In-Reply-To: <87v75jqh7j.wl-kuninori.morimoto.gx@renesas.com>
References: <87v75jqh7j.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 26 Nov 2026 23:58:32 +0000
X-ClientProxiedBy: TY4P301CA0085.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:37a::15) To OSOPR01MB749128.jpnprd01.prod.outlook.com
 (2603:1096:604:4ba::14)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSOPR01MB749128:EE_|TYCPR01MB9643:EE_
X-MS-Office365-Filtering-Correlation-Id: 053c1e7a-ec77-4b1a-1d56-08df4c192d4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|23010399003|261009223027099003|18002099003|22082099003|56012099006|11063799006|261028144727099003|261102123227099003|261026140227099003|261026121527099003|261021121427099003|261022105027099003|10067099003|261022075727099003|261021123027099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	TnrtlE4mqPLi3SXGN2o8zMO2capWiNhJSm+vKjt/shg8AGqmN70Ky6VRcknljdpWER2RNhY76+hd2HdC5haAS/SzYkTjI3fZI1U2P5ZBHk1TTYWK8zJUcvOEvQQjMLo1ZGYJ33JLjLQ3rL1PPzOc0czzbe4EdzS9H5QKCSey+nEi9y94Emy992nLb5ggfLEiV/cdYFMdu1qK89JM1eOEcN5hmVmh3jltj8Bz/cEOCce+lOKso4oPZ8H9qJI+4+bo9CyZJgP7KS6+F0FWvPCmna1qFRq4IWssFIs+jqIgx3LShlMFfIT8lOKhJnUYyczYWrbrrUGyF5hGezlbq48j3SzMNR4pKkxbnHy6p3k1v6CQjcxWjtE+PsdM9fgWVkxR7XngTf/9n5iQ26CgxmSS6TTkuzaIF46Uoot/Uz+OTwAGQh9auZCU99nzeYTSfbXKcdHyB9icpab064k+RbSKL/JSCkwAlMuMdJJQVPOjRe0iAUcvcXQGQ16wtpilLirzCv3zZbJa4Uj4KmCXOPEUHNIK/QiVDy7a1xcfytbwW6T/lf6O8WNvnFn8lYEitQivA677wKMKCW9vJeZ1YeDcW/WEUM8/ONiyKsDRqD+8V0GRnb/j3YxJHjOAlkUhEOKlXzCKzz/G0qZ6YUiApALRp6U+v9mPeOScPE7gHFD+GZS1uxooo0/Dhfcm2izU3uEFxqsEiKmz/+0yzyr+3+iPoA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSOPR01MB749128.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(23010399003)(261009223027099003)(18002099003)(22082099003)(56012099006)(11063799006)(261028144727099003)(261102123227099003)(261026140227099003)(261026121527099003)(261021121427099003)(261022105027099003)(10067099003)(261022075727099003)(261021123027099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Gtr+TO7oT5lyuMC2tj14gYsqEWNf8nIas5DPhr2kd2jTfpnh7VQECjF+1S1J?=
 =?us-ascii?Q?HOSIBXgMG5IsLidsvN7gpav/hzQQ5dgfe6UVEMoWvQNDEBVWixGCpQrjPgAL?=
 =?us-ascii?Q?vYISz/PYUNpkTogwUiImzPoc2gvhag2BxSEp2O39kSRb4ghWO91fEAYLgyGu?=
 =?us-ascii?Q?lItZU8YwikT9Pi8jnP7v10ZFX4driN6jGshfc0tyTYVeeDF6M35lDd1gEjzn?=
 =?us-ascii?Q?C/W5t0M0t3Ut1OWQC0EcQ//NrHOoEGSBqKIBss1VqgMl7a8ItOdXA7sD7WAw?=
 =?us-ascii?Q?OEZCN+CxTV+CNQi2p/1pwRuj4ZK1SUXJfM/0ccM3lw0z+BfOW4MiHIm5poDG?=
 =?us-ascii?Q?cKnMKIYHRkYkYZfQLjMtmq5BycGwJ1WASKFpwlL58tkfA+yC/DIc4FjiT5nm?=
 =?us-ascii?Q?/3LgTw0WbsaSD1+OXU52TePvE4+tmFEZVEWKlmeBYtl11/EG0GAa0m5VGoli?=
 =?us-ascii?Q?tk87/p7MOzzTDAVLZvKa8zrmzYALjrz3oLnf2Y7QrRy+zr/o9ci6o0VOKGrG?=
 =?us-ascii?Q?4BQsNUULkJf8ZXKIRRh1AD95Kl/ZdvKy09dQ73kk5egnm4xCEnjQGO5QnkPl?=
 =?us-ascii?Q?gPrKrBtUH/gnE23U8P3enXnCWqjUja2M6KzsbZVefP/rReAxkbX7QKts0ACo?=
 =?us-ascii?Q?9IXBmkmspbv+lkk0fQ5fhoqwXXnuVaCC7tSL1QPiLQ2f0M+yQIdDKw2pIwbn?=
 =?us-ascii?Q?zFKC1FvyLLQqyeob744vnMrYcFHX+VMlDLDryg+TzM87AQxWj4Rz0bLZ5OLt?=
 =?us-ascii?Q?Qt2LX/Afno1u+rAOHeeRNHM+hEb6LOMc18+jIpem5NppmZanNdF4U5/Xh1q9?=
 =?us-ascii?Q?sh8SnazrWGGOF7+84rFr5DDke6Z3HnLvsw5rQDdWtDEzxmWHRpNrSM/toDKE?=
 =?us-ascii?Q?BtkB/2wzFZc1uQdSbYqUgK8Dfrx3kV8HRUFIXLrYLT9LiE5hjSmYvJIT3RJI?=
 =?us-ascii?Q?9expqpNVxiy3VnIaOPHigPSaFQo7Uk4obpKpJckTRCAJt3WXz+Jbx7Cg8ZSL?=
 =?us-ascii?Q?Lsw9mXSOy3rJ+5pCEytpNDAh6wQLJ2SuEE+9JzzuRJIP4Tpyy8lGoWwz9Jzg?=
 =?us-ascii?Q?Ga/8VBlJkwlCgvTH5t2364KQK4sIo6r7cuMsPaB7oHXFw44odd6zfNYoJ3Wp?=
 =?us-ascii?Q?vDQcTTeG2dFhaHVCtdtvaeeOqmxGj9pFN16ndDro+G/3kSH1W4KIY2l4NRFt?=
 =?us-ascii?Q?XfaWWermFZb/gWTFbOpVT6Uzn2NjDHNMITGEYUzvLqqSJ+g/FiMW2gqySvmO?=
 =?us-ascii?Q?NLW8ASkHcLcqGP0lFIVh0Pw2lExpoGOdE7k4vpj46SVrvyWm5wEGLm9UdSyI?=
 =?us-ascii?Q?UM0VEKV7R7lcsNlAPepbTwNECX99jLurBHYIH9dtWoUv8XViHUpJj2Vbbr/X?=
 =?us-ascii?Q?oJ7cLdDrQA2BZ/62uNAkcFx79mV/RlGKgjG1nqo0iJg5t6n4hhpCfTPgP151?=
 =?us-ascii?Q?5vX3f9ncu4HFn3XgJzL3724ji6fNTz7AtGYDeJc8TUHSyT05gAYdhJjlYTRg?=
 =?us-ascii?Q?tFqZDFZ8ZQsLMlzMCY6wzQyOCplUaSKuO4pLA1ARYPPU+ECy5OT5X9pGNadb?=
 =?us-ascii?Q?84h8q9dNgb3VvpL4MaepnDp3oQmgz9HAO1v9R19sn1tvWWRN71t+w7d1VUFZ?=
 =?us-ascii?Q?rhQnKxrPdUmpL6rcPt/RVSV5HgzA48Hw5eXTzD+Jo+znRfYd9JGpdcsHf7an?=
 =?us-ascii?Q?Qpu1mIkAhLK/aGBSQHqgb9mm3Oel2calQ/x2lpeCY7oHMi+QspAU+E8ERjP6?=
 =?us-ascii?Q?pIopPQ58s0WEdGV0YEzjiLeF1PQYcfg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 053c1e7a-ec77-4b1a-1d56-08df4c192d4a
X-MS-Exchange-CrossTenant-AuthSource: OSOPR01MB749128.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 23:58:32.8843
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AZKaqC+52GJLdrUat4mpaVLMj4X3XalAaleBB+oe60FKYcNU6RiEWzz/gFFAtWZ+Wi9onYja8njqHR2TRaZyAJn2mOIasA2NdDnVmvQqcDhAb2aoi/xx2AeLQEfePifd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9643

Current DAPM widget is using "list" to connecting to "widgets".

It is unclear and confusable naming. Let's rename it as
"widget_list" and "widget_list_head".

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 drivers/staging/greybus/audio_helper.c   |  8 ++++----
 include/sound/soc-dapm.h                 |  2 +-
 include/sound/soc.h                      |  7 ++++---
 sound/soc/codecs/wm8960.c                |  2 +-
 sound/soc/intel/atom/sst-atom-controls.c |  4 ++--
 sound/soc/soc-core.c                     |  2 +-
 sound/soc/soc-dapm.c                     | 10 +++++-----
 7 files changed, 18 insertions(+), 17 deletions(-)

diff --git a/drivers/staging/greybus/audio_helper.c b/drivers/staging/greybus/audio_helper.c
index b4873c6d6bed0..0de46577090c0 100644
--- a/drivers/staging/greybus/audio_helper.c
+++ b/drivers/staging/greybus/audio_helper.c
@@ -20,7 +20,7 @@ static void gbaudio_dapm_link_dai_widget(struct snd_soc_dapm_widget *dai_w,
 	struct snd_soc_dai *dai = dai_w->priv;
 
 	/* ...find all widgets with the same stream and link them */
-	list_for_each_entry(w, &card->widgets, list) {
+	list_for_each_entry(w, &card->widget_list_head, widget_list) {
 		if (w->dapm != dai_w->dapm)
 			continue;
 
@@ -62,7 +62,7 @@ int gbaudio_dapm_link_component_dai_widgets(struct snd_soc_card *card,
 	struct snd_soc_dapm_widget *dai_w;
 
 	/* For each DAI widget... */
-	list_for_each_entry(dai_w, &card->widgets, list) {
+	list_for_each_entry(dai_w, &card->widget_list_head, widget_list) {
 		if (dai_w->dapm != dapm)
 			continue;
 		switch (dai_w->id) {
@@ -92,7 +92,7 @@ static void gbaudio_dapm_free_widget(struct snd_soc_dapm_widget *w)
 	struct snd_soc_dapm_path *p, *next_p;
 	enum snd_soc_dapm_direction dir;
 
-	list_del(&w->list);
+	list_del(&w->widget_list);
 	/*
 	 * remove source and sink paths associated to this widget.
 	 * While removing the path, remove reference to it from both
@@ -121,7 +121,7 @@ int gbaudio_dapm_free_controls(struct snd_soc_dapm_context *dapm,
 	for (i = 0; i < num; i++) {
 		/* below logic can be optimized to identify widget pointer */
 		w = NULL;
-		list_for_each_entry(tmp_w, &card->widgets, list) {
+		list_for_each_entry(tmp_w, &card->widget_list_head, widget_list) {
 			if (tmp_w->dapm == dapm &&
 			    !strcmp(tmp_w->name, widget->name)) {
 				w = tmp_w;
diff --git a/include/sound/soc-dapm.h b/include/sound/soc-dapm.h
index 33c4a3e9c1d4a..ca456e3ac9e56 100644
--- a/include/sound/soc-dapm.h
+++ b/include/sound/soc-dapm.h
@@ -518,7 +518,7 @@ struct snd_soc_dapm_widget {
 	enum snd_soc_dapm_type id;
 	const char *name;			/* widget name */
 	const char *sname;			/* stream name */
-	struct list_head list;
+	struct list_head widget_list;
 	struct snd_soc_dapm_context *dapm;
 
 	void *priv;				/* widget specific data */
diff --git a/include/sound/soc.h b/include/sound/soc.h
index e8e256b7a0fa6..13ad3d4f81e53 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -1039,8 +1039,9 @@ struct snd_soc_card {
 
 	/* lists of probed devices belonging to this card */
 	struct list_head component_list_head;
+	struct list_head widget_list_head;
+
 	struct list_head unbind_list;
-	struct list_head widgets;
 	struct list_head paths;
 	struct list_head dapm_list;
 	struct list_head dapm_dirty;
@@ -1091,9 +1092,9 @@ struct snd_soc_card {
 	list_for_each_entry(dapm, &card->dapm_list, list)
 
 #define for_each_card_widgets(card, w)\
-	list_for_each_entry(w, &card->widgets, list)
+	list_for_each_entry(w, &card->widget_list_head, widget_list)
 #define for_each_card_widgets_safe(card, w, _w)	\
-	list_for_each_entry_safe(w, _w, &card->widgets, list)
+	list_for_each_entry_safe(w, _w, &card->widget_list_head, widget_list)
 
 
 static inline int snd_soc_card_is_instantiated(struct snd_soc_card *card)
diff --git a/sound/soc/codecs/wm8960.c b/sound/soc/codecs/wm8960.c
index 7c24c992ffbea..d77397d8efcba 100644
--- a/sound/soc/codecs/wm8960.c
+++ b/sound/soc/codecs/wm8960.c
@@ -518,7 +518,7 @@ static int wm8960_add_widgets(struct snd_soc_component *component)
 	 * list each time to find the desired power state do so now
 	 * and save the result.
 	 */
-	list_for_each_entry(w, &component->card->widgets, list) {
+	list_for_each_entry(w, &component->card->widget_list_head, widget_list) {
 		if (w->dapm != dapm)
 			continue;
 		if (strcmp(w->name, "LOUT1 PGA") == 0)
diff --git a/sound/soc/intel/atom/sst-atom-controls.c b/sound/soc/intel/atom/sst-atom-controls.c
index bac54c6211266..69b98f3a768d1 100644
--- a/sound/soc/intel/atom/sst-atom-controls.c
+++ b/sound/soc/intel/atom/sst-atom-controls.c
@@ -1480,7 +1480,7 @@ static void sst_fill_linked_widgets(struct snd_soc_component *component,
 	struct snd_soc_dapm_widget *w;
 	unsigned int len = strlen(ids->parent_wname);
 
-	list_for_each_entry(w, &component->card->widgets, list) {
+	list_for_each_entry(w, &component->card->widget_list_head, widget_list) {
 		if (!strncmp(ids->parent_wname, w->name, len)) {
 			ids->parent_w = w;
 			break;
@@ -1497,7 +1497,7 @@ static int sst_map_modules_to_pipe(struct snd_soc_component *component)
 	struct snd_soc_dapm_widget *w;
 	int ret = 0;
 
-	list_for_each_entry(w, &component->card->widgets, list) {
+	list_for_each_entry(w, &component->card->widget_list_head, widget_list) {
 		if (is_sst_dapm_widget(w) && (w->priv)) {
 			struct sst_ids *ids = w->priv;
 
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 7f21fd1e0182f..16f1e097dd538 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1276,7 +1276,7 @@ int snd_soc_register_card(struct snd_soc_card *card)
 
 	dev_set_drvdata(card->dev, card);
 
-	INIT_LIST_HEAD(&card->widgets);
+	INIT_LIST_HEAD(&card->widget_list_head);
 	INIT_LIST_HEAD(&card->paths);
 	INIT_LIST_HEAD(&card->dapm_list);
 	INIT_LIST_HEAD(&card->aux_list_head);
diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 3ef13d2b1f5e9..f2e739ad8f31b 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -1023,11 +1023,11 @@ static struct snd_soc_dapm_widget *
 dapm_wcache_lookup(struct snd_soc_dapm_widget *w, const char *name)
 {
 	if (w) {
-		struct list_head *wlist = &w->dapm->card->widgets;
+		struct list_head *wlist = &w->dapm->card->widget_list_head;
 		const int depth = 2;
 		int i = 0;
 
-		list_for_each_entry_from(w, wlist, list) {
+		list_for_each_entry_from(w, wlist, widget_list) {
 			if (!strcmp(name, w->name))
 				return w;
 
@@ -2876,7 +2876,7 @@ void snd_soc_dapm_free_widget(struct snd_soc_dapm_widget *w)
 	if (!w)
 		return;
 
-	list_del(&w->list);
+	list_del(&w->widget_list);
 	list_del(&w->dirty);
 	/*
 	 * remove source and sink paths associated to this widget.
@@ -3906,10 +3906,10 @@ snd_soc_dapm_new_control_unlocked(struct snd_soc_dapm_context *dapm,
 	}
 
 	w->dapm = dapm;
-	INIT_LIST_HEAD(&w->list);
+	INIT_LIST_HEAD(&w->widget_list);
 	INIT_LIST_HEAD(&w->dirty);
 	/* see for_each_card_widgets */
-	list_add_tail(&w->list, &dapm->card->widgets);
+	list_add_tail(&w->widget_list, &dapm->card->widget_list_head);
 
 	dapm_for_each_direction(dir) {
 		INIT_LIST_HEAD(&w->edges[dir]);
-- 
2.53.0

