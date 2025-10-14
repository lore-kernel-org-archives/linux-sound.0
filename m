Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011024.outbound.protection.outlook.com [52.101.125.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C261530AD1D
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 04:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760416062; cv=fail; b=mUb7ptqVvP73JWcgKo3OdLHzuw1moDnaCQIkjYod9qOjSvM5bLNgc/GGUDN4KtnugF90d2koRqNPJ0bSFzJp4Fd/V6UJ1/vMZOrbHO9ZeBAi4YoevR4vw3q1VBNTbos4UYhu+LylBQ2u3lic22YLSz2bhczROPVSdVgy7WIR+Zw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760416062; c=relaxed/simple;
	bh=VBP388qo8M61pP4PzuzKjhfbar2QuQMlOBp0a54y6vY=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=fO+I9KXAuvfklH1P+bBD4Czu+GGWBwWQcfrMwfNXORCLHyz3CB1hf1svEQL5l2MydnY6jrFqDzRjModPlw8KhpMEZQttz8pY3tjuOeXMKRtYJy0tHOg6QLF7hT01K+Zgni1SxpUXFYnqtZJ3XFhibfC2QP6oEy2sr1rtcZdsWhE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=n3ep8JX5; arc=fail smtp.client-ip=52.101.125.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="n3ep8JX5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XUAViiRama0fa1+TeKtK5uBE2LLE5GinfzEXOH+mNlhwqRn2tBAWvxYfwy7LkvE63yqrNwxMMJRTQWUL005JyuyHjd8uiKSayjD5NSz2IB6pJk9RiUCGwkQujwz7oV7d5EZa0aT3TwEiMrDN6JC2cMCUJknrIGqlxl1Qv/2M6R8wxZAQwraHi5XLH2RS7on02TQYHB0Awywhrsv/73GZQXCCh5UaRi0A0vhPiH7OmTar5zqn3yLQfamRxLL16kC5SsZfIj8goOfmElNQq0LLukIFnRDD3kooGi43oih+BScODtnw9A99tk4lLjNRJqSKYqxQmDTaU09Gckt65Y0JJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KL7+VMU780cvJd5vdbWppOqye5QvsF+GH/4rcAGBPO0=;
 b=tzn+IzcSuybvReZXZVuyIu9r3mDdKQvHRAUsRn75Ot8lvinXByIaisK3P8hfOreQhHP3uxcj2ByCqgmLvBVUugu+fna7wO9hFOC9P5jVSbl0Zi/qURP9GKHTvfct4lOAGc72p4oV5CPzg1sVDwl+kyipS6+nJz7U6AhECxaCz+fwIWmBKgN1ukkzWb/WcO9uOIQVfQ4ZHqW2CMvTQJbdau9j7eZFPnAxqSmoevenxOZWpBhlT/S2bqoUh/DoPP//GR2kDBeDlKTJlzhx/m+A0I9CISel/uw21Js1W4MpC2fLWOv+EDv2SqTU6F6TX9WCtlfcyr1VFTCZ+qVq7vdFQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KL7+VMU780cvJd5vdbWppOqye5QvsF+GH/4rcAGBPO0=;
 b=n3ep8JX5ifcUZ1naYZvqzkHDT5937CyMJVFFAB3SxuJm+x98Cwox/vaoUOB2NAHoqPr7Oe88PlVDTnxx5j+4AZA+DDWBAMOOy3pg8UE22xcudNJ00KxGIFi1MsOxZMCmmChmkADebKmB+fvhL2hsvlmITKAPf6XE4vEqOaRv2o8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB7268.jpnprd01.prod.outlook.com
 (2603:1096:400:f3::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 04:27:40 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 04:27:39 +0000
Message-ID: <87ldlem7k4.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 132/139] ASoC: mediatek: mt8188: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Oct 2025 04:27:39 +0000
X-ClientProxiedBy: TYCP286CA0028.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:263::15) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB7268:EE_
X-MS-Office365-Filtering-Correlation-Id: c669ab36-05e8-43eb-2b25-08de0ada02af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?54SqtimONiltnDVlRBWCfz8Fg2QFI+ymByE9mo6GZ3kUKn7UtVYEnPq5AKor?=
 =?us-ascii?Q?AYD/ytkiThQzPZp2PHxpW4kA9W/Y0p1OwBIdlvZ0EjhBWRnu5UsGU1lBtX54?=
 =?us-ascii?Q?s3BVRNbXXqBxJ8+7BEWO7GNOj/EDfHmfdEhGhMdCAL4FHG1bTUrFdRij80R2?=
 =?us-ascii?Q?b3Gyr1tiO0lsZilwwW79mIYaS+T59qbcIH+sPeXZCkJe6jqC9UKmMZT/QQOY?=
 =?us-ascii?Q?Zg/JpcQ2mfbF4/gFp5+JBaQ/PkoS4KRXmLPZDb/OaFboB34JdgZAVd3RwZnb?=
 =?us-ascii?Q?4O/vq1rvCLqXZ4Fm1bHcwNbpG6IjoU/UY/9ZxMrsqf3p2OF/wk3jpdMVzRSG?=
 =?us-ascii?Q?4KfLiAysVw+wILaRd5lg+/nk7+iCu1/ZeYPo8oTuH/NnmZ4SVaLuny39l0H6?=
 =?us-ascii?Q?xNLQsFoE7lsTQuxYKTK2ou0BqqPi52dIbyO05F7JOIzlvuE7zY7pTJQOUKib?=
 =?us-ascii?Q?gdYxfWFAyzicqLff/NtRFD//5tw5tdTKI0ZKk6+c0wOaHYZvRrg6PEYzKSKI?=
 =?us-ascii?Q?IMUAEf5MfsiWPRaL9Vt9jNUPOQF5YZxrteAoTLiYbLLlezp0Wyn4cp/oh51q?=
 =?us-ascii?Q?/RwwmXEyv1W3P6ybTJ1p136q2viNjwM/rhNJIeJE8onnhs9aeDouxJ0Kv0XE?=
 =?us-ascii?Q?L9NZx2+pT6IGA7q820T8+R0ZwcmP/kTZ+xZ9L4hp4NiPaaXbI+V3szyeHea2?=
 =?us-ascii?Q?9YSMqQIwISPVqa/R5Vn+V8YrI6FORC9zVJ366zFotnVRU4vcoCCElCkK53qf?=
 =?us-ascii?Q?eYFWjPbwAfW8GcmIzZh4IrCrEPyVdNH/hJO657zTfOP+3lPNgb/QZ36Wwizh?=
 =?us-ascii?Q?McW8nFr6/ZoiVRJlnEF576yfHGOGdIeuAMw9CSSnV4KVgCSHVqINFKZ6t12O?=
 =?us-ascii?Q?z6vgH1teLOWQAAlsrpLHhqfge9eg0BJ+wTlwtVBOlYJk+hYIk6bLpHLyCRVA?=
 =?us-ascii?Q?6NhAXXmZ8CgpfiwqoV1GfrnMjrOOvwmZEBiBq8VETri2qlpl9kH8a2ktLYXX?=
 =?us-ascii?Q?yRphf8TiVJ0PLbaP6J8QgBPUoaBSktQmPy+2L+G+1p7iJ7UZc9l0vI6XO6rj?=
 =?us-ascii?Q?9EteJAPO+ztIUwCuSA3QVs2tTz+e5FenkpvUoj+jXPzfm+7MwqMgUcALQjrn?=
 =?us-ascii?Q?kvlp+ak1jhQGodfdUeoM1AWc56XRlwASzqCHRSxm/astyBCu3/WYqcCh2W3S?=
 =?us-ascii?Q?bP0Gn1o619AuTugcas2L1soB4y7KG/GJ8iA1eZ36g5O+NcpGRiVdiq0ayjjT?=
 =?us-ascii?Q?2unHAFil3RCfC/9uTmxdlrHcm7iNHVFWrlcrE2mGSg0GDMEXJL2p+aJMSnVu?=
 =?us-ascii?Q?QDuEhebpixgJnttoLjOCD6VnwLZlUxBNlQErGv8JJDKk0vgCd5tFjJNTa0er?=
 =?us-ascii?Q?ncyDj3innybgeF8J0ejjuZIipPXV/WMmBJGqLvAO+GTSXyJ1KJVX/a6X/D5W?=
 =?us-ascii?Q?0Mho7B4FK8OsXkXIyFcQL2/UokQfhTJJxkQhG4aBH49vXcdMGRhq7vouttrR?=
 =?us-ascii?Q?5U1XxUeflgwxu9q4jB9xSGjb+R4WPnguXpRa?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ypwb3wHFnO7y1mIIcF2cYzLGrem4jNLdG63T530mzZOffdSa2HjoyoMgs2q4?=
 =?us-ascii?Q?9MqIiVp780s2p8r+BJidDjfiwt0cqR4C95hfXkiWpb7Sbt9Mq0EqG784W4NQ?=
 =?us-ascii?Q?+2A+SKMzuzkzv+2g8aRB0H1RiyQJGpaYz6kQ//JiS01xY4D1kh1LToi7r44X?=
 =?us-ascii?Q?Jg9ePWRj6axRf7Ct2+8vURwqi2QPZRBzo3lXiJKjjErAWPetpKCyFqyvpTh8?=
 =?us-ascii?Q?5J5r+5sgQQQkrSwZBma92JkqPQvnkrqi3p0Z1CtJAo4lrSKaCIKIXRdyyAG9?=
 =?us-ascii?Q?/pSuRYmLpK3D6f8mc3Ie9rYMR0/My/OwljTlraEZ6j277N/8v38YLcdkGuMP?=
 =?us-ascii?Q?iYqRPPvCV4zt9jfusZAx0DQGzfZqZUGqmE8n2ftjF3Pyd0SFXEW4zQQFk6th?=
 =?us-ascii?Q?NQ9PSvb7NSojuoQOYpp9LD1hYs1+cv1LyYElyTVkVI2Vl8mTdVFZ1W7krs0x?=
 =?us-ascii?Q?iDBpm8hu8CKexR0u2kSW5sLYbxiaX/DDrAYgmv8YaVMHITLsRyWJVWda38BU?=
 =?us-ascii?Q?YKWYZxgae74hjbIsIMbpoDdbAcbnwBH6pAREegF4/3C2z6JpzcYVAN4Mrp9g?=
 =?us-ascii?Q?m/LmkG+1B8d4t6WCdqSqEvgbH1RMx0IaHBwnRMNcYBfoDxoDyDrATAJGUnB9?=
 =?us-ascii?Q?f8BY/hygwom6hXaUEEdioALloycrhyNLHRkjRda7O79Dum3Dxsn7CThcTQyF?=
 =?us-ascii?Q?izYhCcGIetsyhngA6WSKKkk2qiBmDovjthvRtVhVleLCdTNYpoc2gWsjv2RY?=
 =?us-ascii?Q?c8nbhNYgJi1JqiBot/LBAA1RC8y+LQ8s662jo6F3uhqPVZNUxlh2aoMhFoDw?=
 =?us-ascii?Q?7fjs3PPJKT0UD9x15o5CFcgQFD8dFg4jLOufoBRWrV4m3K53NDBDypa+GobS?=
 =?us-ascii?Q?eF/nsjIgXbjpU+rIHifK5HVkty9eoaqgFE4SVWccaGpbAAh6l02wTul+3Q7D?=
 =?us-ascii?Q?GDSY+tfXcAwCwiI4N8HRb8NC8OkLiYYFFBY8yHbptf5O/We/2zyLKlzp+Op1?=
 =?us-ascii?Q?LhIWjUnhC2bTAKqsmxTvLLf5s/aDpAHVMmuc0Lq306kr4bg0VghZK1N77P0j?=
 =?us-ascii?Q?QMWMY9cY0Sc2JXtsRQcSP9Ao+PHO0e5iGYVBSojDPCo+ooJKm+yruz9A4KKq?=
 =?us-ascii?Q?Vm1Z0++fx5rfkWJVOWEBddNMznzjOU/Msi6aPiGdZDRE7IuNNKo+pxUxVRJl?=
 =?us-ascii?Q?O2tbHZCr5AZCJHTwCg7RnrNmSSjdOqeZRuuZyp3+sW+8tA2fj8iHT1xqYLR9?=
 =?us-ascii?Q?HAQ4wdHktj3D9QRcxAWsQYvee3MeDCMxyVFvKFP0glTQKO72TYMp7a44kDw9?=
 =?us-ascii?Q?6ixMVWbSj1iTeOYKnCKjIL8lOimP/PuJTjn5pqeWiVvRop1JYmLleeyErPAf?=
 =?us-ascii?Q?420FrYqQISYTXEYR9KuOq2CSnIoOwhCWP0edHRkgLqS7kbkHW8ptSz5yzg2T?=
 =?us-ascii?Q?0ystiKFBaJPt0CpqAniAQlCclvj4qZ4fwUYhCBiUeaiL212rq/kkGV478h+Z?=
 =?us-ascii?Q?tquHX0GLS0s91jNFt4r9cy4pqguuS1iOe+lvGXcI/1Dm8638bI+E/5sHEHMu?=
 =?us-ascii?Q?Ofpqv9qfepfS+raF5vrl2yZou0skP3QuDUf7oVBOOxwp6yEYOSEp7pYc0keP?=
 =?us-ascii?Q?RSZyzXnGpQW91TfbJ5Fk6pA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c669ab36-05e8-43eb-2b25-08de0ada02af
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 04:27:39.8791
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MNChGDlEbry9oj7RQMKHNHMZ0Qt4fb/MmFadeZ8qJRl5Y6rP7pHVLbopd9vAP1cYGKgypyO4GvS6Z0k36JY7uz66wHxyLEtFQp4Gjj4RnInCtVKwRUuEcslX5Yp33lvx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB7268

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
 sound/soc/mediatek/mt8188/mt8188-afe-pcm.c  | 10 ++++------
 sound/soc/mediatek/mt8188/mt8188-dai-adda.c |  4 ++--
 sound/soc/mediatek/mt8188/mt8188-dai-dmic.c |  2 +-
 sound/soc/mediatek/mt8188/mt8188-dai-etdm.c |  3 +--
 4 files changed, 8 insertions(+), 11 deletions(-)

diff --git a/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c b/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
index ac4fdf8ba78fd..7b1f5d05f4d61 100644
--- a/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
+++ b/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
@@ -1623,8 +1623,7 @@ static SOC_VALUE_ENUM_SINGLE_DECL(ul10_fs_timing_sel_enum,
 static int mt8188_memif_1x_en_sel_put(struct snd_kcontrol *kcontrol,
 				      struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
 	struct mt8188_afe_private *afe_priv = afe->platform_priv;
 	struct mtk_dai_memif_priv *memif_priv;
@@ -1647,8 +1646,7 @@ static int mt8188_memif_1x_en_sel_put(struct snd_kcontrol *kcontrol,
 static int mt8188_asys_irq_1x_en_sel_put(struct snd_kcontrol *kcontrol,
 					 struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
 	struct mt8188_afe_private *afe_priv = afe->platform_priv;
 	unsigned int id = kcontrol->id.device;
@@ -1668,7 +1666,7 @@ static int mt8188_asys_irq_1x_en_sel_put(struct snd_kcontrol *kcontrol,
 static int mt8188_memif_fs_timing_sel_get(struct snd_kcontrol *kcontrol,
 					  struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
 	struct mt8188_afe_private *afe_priv = afe->platform_priv;
 	struct mtk_dai_memif_priv *memif_priv;
@@ -1686,7 +1684,7 @@ static int mt8188_memif_fs_timing_sel_get(struct snd_kcontrol *kcontrol,
 static int mt8188_memif_fs_timing_sel_put(struct snd_kcontrol *kcontrol,
 					  struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
 	struct mt8188_afe_private *afe_priv = afe->platform_priv;
 	struct mtk_dai_memif_priv *memif_priv;
diff --git a/sound/soc/mediatek/mt8188/mt8188-dai-adda.c b/sound/soc/mediatek/mt8188/mt8188-dai-adda.c
index 43670316611e9..ac547fc864a6f 100644
--- a/sound/soc/mediatek/mt8188/mt8188-dai-adda.c
+++ b/sound/soc/mediatek/mt8188/mt8188-dai-adda.c
@@ -310,7 +310,7 @@ static const struct snd_soc_dapm_route mtk_dai_adda_routes[] = {
 static int mt8188_adda_dmic_get(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
 	struct mt8188_afe_private *afe_priv = afe->platform_priv;
 	struct mtkaif_param *param = &afe_priv->mtkaif_params;
@@ -322,7 +322,7 @@ static int mt8188_adda_dmic_get(struct snd_kcontrol *kcontrol,
 static int mt8188_adda_dmic_set(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
 	struct mt8188_afe_private *afe_priv = afe->platform_priv;
 	struct mtkaif_param *param = &afe_priv->mtkaif_params;
diff --git a/sound/soc/mediatek/mt8188/mt8188-dai-dmic.c b/sound/soc/mediatek/mt8188/mt8188-dai-dmic.c
index adcea7818be20..a9515d7fb70ac 100644
--- a/sound/soc/mediatek/mt8188/mt8188-dai-dmic.c
+++ b/sound/soc/mediatek/mt8188/mt8188-dai-dmic.c
@@ -570,7 +570,7 @@ static int mtk_dai_dmic_hw_gain_ctrl_put(struct snd_kcontrol *kcontrol,
 static int mtk_dai_dmic_hw_gain_ctrl_get(struct snd_kcontrol *kcontrol,
 					 struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
 	struct mt8188_afe_private *afe_priv = afe->platform_priv;
 	struct mtk_dai_dmic_priv *dmic_priv = afe_priv->dai_priv[MT8188_AFE_IO_DMIC_IN];
diff --git a/sound/soc/mediatek/mt8188/mt8188-dai-etdm.c b/sound/soc/mediatek/mt8188/mt8188-dai-etdm.c
index 69a091dad88dd..4dfaa761f9f73 100644
--- a/sound/soc/mediatek/mt8188/mt8188-dai-etdm.c
+++ b/sound/soc/mediatek/mt8188/mt8188-dai-etdm.c
@@ -1061,8 +1061,7 @@ static int mt8188_etdm_clk_src_sel_put(struct snd_kcontrol *kcontrol,
 static int mt8188_etdm_clk_src_sel_get(struct snd_kcontrol *kcontrol,
 				       struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
 	unsigned int value;
 	unsigned int reg;
-- 
2.43.0

