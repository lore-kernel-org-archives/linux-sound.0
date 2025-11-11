Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011037.outbound.protection.outlook.com [40.107.74.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB860217704
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762821208; cv=fail; b=LR07cxJgomINOOe5JZESTj0R6HA+lLgWzSSNt/5mOxJ8oLl29UFdZf+WzCNi+Uf2zCH6kdYsVS2yFzTsjGV5hu4XV/gAUO083eIcFwOPU5NnQXJ5P/WtNpniB/ScXJZ/qV9tg+SVUKZN/VX2JExj2IOAROfc3PBR2ijV/njhvUM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762821208; c=relaxed/simple;
	bh=guQGuVe3xUZHolVJN1Ay1NTFRlKixeNykdHkxnjm/rg=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=A8Wj7FDZk2nVG6J2SsIhVj8BxwiUy452VXM8CJhBooqzavzgRsHYVYoJGGwqjFL1yIFx1SsDsXEENPPLCRLDrsArs3pbeGKwtMi0IVtdItDQlTefLWTNaXPwRrnAfs08wrd1TtqBbli9vT/IXJ+6C1mBtwYKTxGaSGDc1zCMEiU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=jHtNTjLP; arc=fail smtp.client-ip=40.107.74.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="jHtNTjLP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EDKfN3MK6HKATpzphwe885SNoXSAujVRJ6RA9OJkv7UfOnyeiBbgq0sdq8MY9RjqIrti82XkrB+FU47l1ItOs/y4yLurLPHbPhspHiarA+L7GYwvVCisQP5x1B0BJrkQaGiEQwj+Chxs/D5H5Uj+rkD4YU6ZGE9mv5+rRzNaCIxQV05UK8BYuI5m3QR6rQ239Hhza50sj2etoNy2BZXHQIiHgXSfZpq+VI8D9EXYyi9pGuO8Ltd3KaF0PsZrCHqXEr/5AcGwbothaKjacD1DeKv4TwCFxvJlTSufmBGPx2n3CFrsUOHoZfZ+OuRJco8mOizY3SJd9VTHtjMrdCIyEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QEYj3ThmOqamvhKaKnBRqS4eyCWugmFtYIf/ND7BkOU=;
 b=Tz0HYJGbzb0MD6pfImDnLb5CcnT6CUXlt5PviaHCH7e9iTQ85t6HgokpcFHOGQuDHxLvZaai4t8BfOyT+UMghEOy1NVbTmOHsaXS1vC5Z+3vyZ87Zlt0sUlxYsylm6XBNHhf+JWTpIgFlwzKKVrztsfqiS3X0VJFQggvUv0I7WFx9MWCj+BCveSQpQ/urrSYrgwc2lljXy1w2dbseotmcSVy6tGSsEYhvleo1IZEayiOyv2J0re1PuedFUPH5OeHLdyfzLU0W8kiZwdptCs83qrm+eikPh140nz+xN7KQJMcpx7dWMv/pb3hleaxh6QFYq2kcT3CAP2GTsUam9xWWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QEYj3ThmOqamvhKaKnBRqS4eyCWugmFtYIf/ND7BkOU=;
 b=jHtNTjLPF1hAOrb70jQ2OwRxBpYulf56xU1IshXa6gUejytt+smcQmHkf9N6ontviduoyImLdSchYhm2E8rDCHPQ/bvDenhch/oD4XT2n0hnkqno9Bmxbm5ft65VNTfkkbeJ9VZQOlPBrYONITDDKrwJcOjBA7YBaJ91m47Gt00=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB7149.jpnprd01.prod.outlook.com
 (2603:1096:604:137::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:33:25 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:33:24 +0000
Message-ID: <87a50twgq3.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 226/292] ASoC: mediatek: mtk-afe-platform-driver: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:33:24 +0000
X-ClientProxiedBy: TYCP286CA0164.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:383::16) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB7149:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f39b3fd-5e7b-4dbd-0d42-08de20b9ecd3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VD12XEtA++dbpl25FYzY7x9F05yrxsTFPzeP9AwUQfpE6/MQep/8v+3BND1c?=
 =?us-ascii?Q?JPQaSrNco1B2pp9QbFsp30iFL3ReK5w+PMOjz603rLbR9uKv1XA/3XPRy7BQ?=
 =?us-ascii?Q?zFKr72rd7S8qLz8G+SBSCZy4DLT7xbn76J2KyDnssw5qYQcS9MwtoRnyu+nY?=
 =?us-ascii?Q?erLP6DPBSDfiSORbZNxuxx4nd2rCVQcSXc6kAbIwm0QtZ+d5bW5iBwnM9uRt?=
 =?us-ascii?Q?r3dRjdQmpKuBtRhBnulZiWOI6nfJaVhpfvNdhyYTUw968RrfahExZdiMcyWs?=
 =?us-ascii?Q?KFkSA/lzP8aXrQshGuvYX9FKJGLPff0VfBX3emlufTOYSBx73NBK0N8GbfbQ?=
 =?us-ascii?Q?RyM7mG8UEhz33OjTsuKwcXN+XpxVALEAGuHs8iITmkwCfXW9c7TfdpUSjQhu?=
 =?us-ascii?Q?vBT6R9wKxniCaJij5fL6WG9F8Dbm6tNvLi+I80j2tZFGZnetENGbqtp7JMI6?=
 =?us-ascii?Q?dKM9HsFoSrfN23zazueGRUaZ0GI8qaQ3XKV3Fb/MHpnhvhcVRZ4iUGoNZTO1?=
 =?us-ascii?Q?hljORBvf4CGvkq1VGQer807B78nFvuNa2Nyg/6iQtXmIV3L9o0zOD/DeNgb+?=
 =?us-ascii?Q?iiWDpggIrBzuw/H/XYC4ikGey9HQWZwoNi3LaDp8x79Xrco3CKmqHpXSmRpy?=
 =?us-ascii?Q?h2tUfnCWpqNpaOXFRH8BsMCQIXa6+i6HIzKlDRhVm/T2SfQV713S8BBlhHR5?=
 =?us-ascii?Q?sg76ayYfLGgDeVbEvdiMV6+hwKRcmrnr9PGhaD9zQJhgCs25s4CB3sY6Bo2v?=
 =?us-ascii?Q?UpEDvxGqjomavG2wLT7mGE0xVhMoQP8swpCUctvzd37aVs7ZFYB17RJrzC7/?=
 =?us-ascii?Q?bcp6PSBYgInvckuk//+kF0ulE4w9Eruv3nNfw6zw0V9uz0W4qV+nS4IrERq4?=
 =?us-ascii?Q?JaNFNc4sSjwM//H8cPdhRbrL7kxvrSL45VQreX2512YJXa0gnK0rwnossNBo?=
 =?us-ascii?Q?DCGgRVocgn7fgQ1SSs27hGXJg6eLIOtatyBkr8oTvT3QdPOWf9HYjwghQT3A?=
 =?us-ascii?Q?6LI+cZBJ9CyZ7TXUc4K2IRdrL3apLTM8wf6eHfxKTKrvSYzIPJzmJ65FAp/j?=
 =?us-ascii?Q?7ZWftoko0QPlhW9oVkPO8fXktanGPVR/OO9EGeVXOwnXQ2Cy/d8Az9YAWFu+?=
 =?us-ascii?Q?MRxR5iCw7kHbqy2QnSvw/ximMIDup5VmfqXgtpanuaYXySbc4ryXKdASlBej?=
 =?us-ascii?Q?cKldJoI4pUg4p0kbk90NVUnCSOgeL6rqmLgj9LopnQtbGpc3NrIgo/3PEaP1?=
 =?us-ascii?Q?NiTAsgwiZLElR6yukLTiQTIlEZWNumiRYHcd83jY+uVoNcvasXhmUfr/k3Fy?=
 =?us-ascii?Q?7+q3VowOqWoxYWcvOpqgDcisLmzAW0IyhLga6vFeyMcPMXkojB960R8XigvF?=
 =?us-ascii?Q?bAGDP0e5Bw06CxofSKjf6MQC1xOF9Xuz+Oux3jr4L6xRFmvBGfLWWHtPPZOE?=
 =?us-ascii?Q?S5qpA4uuneIruIKKy+nAbk42iuO/xblzAZGk/s+LS80kVDi5mbUOxMNiHjsN?=
 =?us-ascii?Q?BXz1WKcuZ7Ud3nKXkPdlkXFtVrZo8D6D8hDO?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7hLub0+tYt28Vyc2lEPSDy3iiOntfgCwCUbaZ5m8BKBTmbPTRvt1ppBAS70Y?=
 =?us-ascii?Q?DcNhAT1JYkMLLh7tiMVwDyH84JRcSV4zqzgFb/S99m4brhN8O5UZ18pZ1UMx?=
 =?us-ascii?Q?GV+03fVOM8yk+GdTT02SShZuNFN4crqbj9uXriRnV2yKhwT9tgpLHzvGTH/i?=
 =?us-ascii?Q?Vqpq8s6l1RnZvUuS+olonmcnRz1dQgY8axREen0TaIgedmY380XYtbtQ3Ec0?=
 =?us-ascii?Q?iAA+Y3AmPW4HzWb1BjNswom3SX4C1YQdH9HmurMXkWhCalQP1YsmZkfk6nH6?=
 =?us-ascii?Q?NKQ3DhkxcG/mAvsggqPXXv6ou+x1yrc7A+yr5eXMkMvBvywhD+sbbwCb+cKx?=
 =?us-ascii?Q?Kd+yw/tKJ9ccQboDMnvzPR4Nzkf2aybV26flfrUo6gltGloyZnunqFjTY09y?=
 =?us-ascii?Q?wnMt7k8vNI7aYrqPh/Zt12ucRrxm+JuWl5jeuct1FsnyWzswRFxh1oJTNuoW?=
 =?us-ascii?Q?GWXoX8rKNx191NF7L8/B3roRBaK2C2Z5bXHTkVA6DO5c+PRqTnm0cYKqbZsv?=
 =?us-ascii?Q?QDKW0bdO5kcqbLLLbfGc1I9qzIQJ3Hu3hBART6S8RJ8TW2VxgjtMwXWQlZ8E?=
 =?us-ascii?Q?h3j9Jco1be9lHX70G1quU7fFqU8VH5ao4jr9vRfa6Yr9MIlg3TnKSLTzlrhU?=
 =?us-ascii?Q?QEd/KvO+hMAEKa7GgOm3lmiuzB12hOiha19H6yTmDXJcnEd+1/tOU30VLGAb?=
 =?us-ascii?Q?yzPmeQEEvDEAk+jxWHjNXfDBeSu1pSz7dioHWRh9SRw03CO/iz0sBRdZBni8?=
 =?us-ascii?Q?g8F//dAa0ZvoWGpjN5K7+67kr3Y3uMU4Sbgo1MjxjHIj/FP+qTw4SEzbOgv2?=
 =?us-ascii?Q?jFCHMMOnm4rJoiXQAJ8Wotjd9H12yT+Y7Ohj9K/OxUb4gfZ1yLEuFVZQOOmU?=
 =?us-ascii?Q?ajPfxmw98O7AdPuEUHR1RfLCGDzEbDVIr+GV0aihTZ9UrTdslYmBEX1yuN2F?=
 =?us-ascii?Q?SNGUn2uz6DA50cn9mcfWgGN01LFjG68VSB0gPkGBpdZ9l2HZ7HjN8VOdVor4?=
 =?us-ascii?Q?XhxDC3iBGFW5KWv4pf/Cw5+TPKSOc9bZO2QS3fVqI7/zQt6cXslD6kd5S3rD?=
 =?us-ascii?Q?WLscnfaI0gb2TF/1Mpw995xtkT1OGx6uRcPRm5VNIUB+vKKwrqnqyPHVScNi?=
 =?us-ascii?Q?BuUwWKGH2Ew0jCRvx33qi6K10QC676Aw4HZ9TJPfuiH2S6lZG7v3A+kcBvVQ?=
 =?us-ascii?Q?cxbChm0GigOTWvLOVhDeBiS5melwor1wo/cofIh0pDNi9o1xZzlPvNImXuhk?=
 =?us-ascii?Q?wp1uGnmGqrtlkxiL9SztVEqWE0lbPe5Rr33ett0wty2ioCpTUx/RvgR/9oCK?=
 =?us-ascii?Q?HWrEacSpbK8COc1CoAYkmd6yiIx13BzmV5iWPtGnxSCiqgjun5EpMc2Vq5kG?=
 =?us-ascii?Q?jmgo4cm8dZ6VcA7KcnLHmtGBL36DzRQZUT7cHhTQZpqLZfyqZTjOw8mbsekT?=
 =?us-ascii?Q?Cz20jrJV4pGXYxSyjWi3x7Q+N0XbqDYXt64IDCuPxgellqnMKVeckAngh88I?=
 =?us-ascii?Q?zNjgwsX0V7zXK474cd9b0XwM3FNv59H3r3/KNasW5oT4pUfXMdZ3EWjHzRBW?=
 =?us-ascii?Q?rEDZXpJC6+Sx+sI3jBgmW8nx7ctTYO/iQXmSImyT2qSpfwfypTmXC7COgokc?=
 =?us-ascii?Q?ZkzixDN3B4BHve8QHa1aNn4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f39b3fd-5e7b-4dbd-0d42-08de20b9ecd3
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:33:24.8861
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w9DTor+nH/BrRGkIQKc3nNSQ0q8cXXqx7Ud/ekEnVremFgI4HK8vFokGgnDqLQW+A9YXFs7H1vRS1SwmLgRqrN3nHd6y8mCMTRmNRBqjsgUhhyZzvaax+kDbfipvtOHK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB7149

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
 sound/soc/mediatek/common/mtk-afe-platform-driver.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/sound/soc/mediatek/common/mtk-afe-platform-driver.c b/sound/soc/mediatek/common/mtk-afe-platform-driver.c
index 70fd05d5ff486..938dd3d46b003 100644
--- a/sound/soc/mediatek/common/mtk-afe-platform-driver.c
+++ b/sound/soc/mediatek/common/mtk-afe-platform-driver.c
@@ -48,6 +48,7 @@ EXPORT_SYMBOL_GPL(mtk_afe_combine_sub_dai);
 
 int mtk_afe_add_sub_dai_control(struct snd_soc_component *component)
 {
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
 	struct mtk_base_afe_dai *dai;
 
@@ -58,19 +59,19 @@ int mtk_afe_add_sub_dai_control(struct snd_soc_component *component)
 						       dai->num_controls);
 
 		if (dai->dapm_widgets)
-			snd_soc_dapm_new_controls(&component->dapm,
+			snd_soc_dapm_new_controls(dapm,
 						  dai->dapm_widgets,
 						  dai->num_dapm_widgets);
 	}
 	/* add routes after all widgets are added */
 	list_for_each_entry(dai, &afe->sub_dais, list) {
 		if (dai->dapm_routes)
-			snd_soc_dapm_add_routes(&component->dapm,
+			snd_soc_dapm_add_routes(dapm,
 						dai->dapm_routes,
 						dai->num_dapm_routes);
 	}
 
-	snd_soc_dapm_new_widgets(component->dapm.card);
+	snd_soc_dapm_new_widgets(component->card);
 
 	return 0;
 
-- 
2.43.0

