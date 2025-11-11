Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011060.outbound.protection.outlook.com [52.101.125.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82AB0229B38
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762821272; cv=fail; b=amuzS3WKs74X9R4b76Oi14p4PlYgzPdNmxkuW65qMf9TZdHmf49K2dxjjoC1pVtjE5Qe23ioBL7+fGSoZkMEtv72kxz1Bsta/71WVuMreq0vwsLCNSAjtorLA0fT43Y6Aexo5x4OyfhKOW5/VKbEgeK5dE9RUy8McSm05VmmHyA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762821272; c=relaxed/simple;
	bh=EJ69dP496mKm4IRifamNkae+fk8cYwnUEYj2zV8M70g=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=iJF+/3ZsrmznuHKYRTX31P40KYYlqxW4sLWiqn3/8MGKknZcmA9Mr/jM26ngLN1AoVnlu2LXhXPtievax9/cdtl/NQzr9thQ4jNVyjywdNbM3ua+Ugnq5Cm9ShEoBd7+rn1i3ce3tyo9PfVFKUby0gDHSnecItkgHgSf9nCrRyo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=LeiEq8bh; arc=fail smtp.client-ip=52.101.125.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="LeiEq8bh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kLsFx0o9Z2aTZ/zGeKfIZ0slQiaqHZYIUnfUOMSZMvdZUKXjUCtx27If1/QYMHMDFh+Qv6CBrABQ7hQQ8U8KgyMz3LRMSY01A08AYN41l/RIFb3/COTQ9yWWj2Z6g1xg1pRtCj7UGW3TuO6SrVD7Lf0xKwHG0azVAnOIjAdehzb+K+JLMabJNXOf4O/7NPmqZ6yKiqrnlNksq4RXgxy/n+CD9HWvMP6bDkdScEf6cCqzO2pN9XZ3yiJ+tUHQ5DQNzfAaihjhWf6iXlpzjlw+vrmygbYUJhiBYpK11ui36DdcwVO7KFBaFBnpE8ZR6kyy2jwrCljXgpLPyHqq/toUOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JKyRQsPefBOL8l71W5CFvhbxQHVWcy4JTwTTQDLBWYQ=;
 b=KJ5gd9ru1jASxzHLmwU0F0ZKvUv+NfMea7FSTpont+fria02K4mOnarizBOxbKCbekzgQJBu03vlwkZEjjYuuEftTYbpOi8rno76HpEhMJipR7xxWC5d2IdgoxU+Huc4lTKA9C4Eq+hbFHj8QjbfANuXMP4/nV7sNnBoysxp+k4JIlseqi70N+ELTKcb75xfR82vQRy8JUsNjL0GhV5MfojhtGMT7SVWqNGLhD7UXhjwRNaOEf2uq2s0Cp/nXOZrB6oKAs3kif6zkx6kt3mg839Ik7ECY5oKE09jevzBhuh+cshlvEhQKvxidSDUCPWrK2wv8H3ia9YI6g6nLB4MJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JKyRQsPefBOL8l71W5CFvhbxQHVWcy4JTwTTQDLBWYQ=;
 b=LeiEq8bhwR5jcaDEJwJ/K6+Kv7VOj/Envv+RV+tNAVzZ/nFofPOuMu0odghdOHj+gxCQQwy8k9VJqZMduUmoKk7/nmH0uICFAA12jT5K/prpYrzDMp52/CoD4qzkMAP/SzA4hJcrXQ26vq+tsnMYmBBRsem/gMYuL4IBv088s1w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYYPR01MB12531.jpnprd01.prod.outlook.com
 (2603:1096:405:19c::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Tue, 11 Nov
 2025 00:34:28 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:34:28 +0000
Message-ID: <87jyzxv23v.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 244/292] ASoC: qcom: sc7180: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:34:28 +0000
X-ClientProxiedBy: TYCPR01CA0042.jpnprd01.prod.outlook.com
 (2603:1096:405:1::30) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYYPR01MB12531:EE_
X-MS-Office365-Filtering-Correlation-Id: 2174d709-f51a-43e5-4d6c-08de20ba12c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1kzdOZvpBTi+9rzZ35qz8hMTIOOqHUmuhykd8J0c5oN0K6bPmdxBZWbpV9VN?=
 =?us-ascii?Q?n+zj2c9vDAeuHakes1SXrGktLhsvrtKIJSH/0OnIo5k0H6HoVDnK+AzKLxpC?=
 =?us-ascii?Q?BICdVGgc9Y8hXy0ZdKSaHKvs1zLUqsidLKtUzh/MeCYbQuFrHGY6iSuzcTvR?=
 =?us-ascii?Q?0SMGn/KBPmF2J+8lk7mx/8QbvOH5cWq2cgMVut0oWnwYOlxJlAhlICZXJAW/?=
 =?us-ascii?Q?nbQlrsngfGGIudbZm5wmgFrm9LuncxZRI8nXwvNhFLYwosV5WLATif085y8T?=
 =?us-ascii?Q?t9fH8oKmboCYS8dRTEllZLH1KsuiKaWYbyvUBc67bxD46WohVGvLJeXFrYma?=
 =?us-ascii?Q?LoLIs8B0Nzn3EDxpLzcaq/lM9TMcIH/ru16NLrkpq0Mn7luAdNFh1LWXQigo?=
 =?us-ascii?Q?+ww0JE93+3r4ZIypguaKu/Lji/03cWUKTX8ngwkGpvCnupRLsR0vu/2IHwMV?=
 =?us-ascii?Q?ERucinWX3JvZGZ58BuAPQ+5ZnU+4Svb6TOGXX+4bSIq0k30bMy9sbbCGxdoq?=
 =?us-ascii?Q?DNkAyQdvkI0vHxGIU8r5awKsVMnVBVsMTV6XaGyjLjNObV9hXUCGmINOSlhs?=
 =?us-ascii?Q?bndj10h0nclolZ+QdXn8iNzSh3vXIoUj8XryOFBfWYZQkta1+En8Besc0O2W?=
 =?us-ascii?Q?q4LIRssKHK/aWpTDi8zBu5UE0UIEx+f2wyJUSOTNvWp7xL5/qcRpJLVhPRbV?=
 =?us-ascii?Q?J1tDiIHGEQZkv+TnuPF56SXVgaVgDUYbV2AJcGfTQyZMG8YH3468Q/Zboy+E?=
 =?us-ascii?Q?4o11+4KXk11mLyeX1b6iZd9AfNhCu7U4CepG8Bg6e/pNof4CgddnYrks/moE?=
 =?us-ascii?Q?A+z3IAZP9P5U7w4gB5xVt2+vzuu7zzMnDDHU1it7NDf2DiDYo9w7VwHuldm/?=
 =?us-ascii?Q?7X8pGN+OcF6O2vEGb68SVCRz6j/2BMJyg7MLcTFv5TGRls8Suq3vcuYTB264?=
 =?us-ascii?Q?WYUWE3wTWj1Jo7T+InDcAkVD8AFyVYZsbnyJjL4CLXanzeA3XujNxj5Q1Kes?=
 =?us-ascii?Q?TX74hepWtq+KrAQoNxs42IyNVQ7aMuTwmAkbTeoyngHX4g/a/evGP55qFVG2?=
 =?us-ascii?Q?8UyfJWyy37IYRBE2FaAThNvwW1oB4vVD29sOsnvIA95MTQntE/xliZ+BPcRG?=
 =?us-ascii?Q?evCxIA/qxxxBewSxHjXcyY91WaRuGu0IYaZyA90LW6jm2IXe7bDJL7cy7s6l?=
 =?us-ascii?Q?xFlucIha1ZhAQ5AT8yWm9MpSfg12eBAeqyAg1FKY3mVkEyQnLIi0Lv5u6DY3?=
 =?us-ascii?Q?eJfcIHhoaL6x/X0oP1Yqq8AMxuOphha9fJ1I+pqGFnL245V7H3IQV6CpCFG1?=
 =?us-ascii?Q?/NfTeCdj2LQ7cnuR8v2X9PY3GMZ72A7VG8LNo7I04NrxiFuz5H7pSSdnpt9v?=
 =?us-ascii?Q?RldtGAYDJjO0enRnLWYrL1dX0ZS58tUW2RZ1m3IZMzNLFx2rPWhXbW1Igqq4?=
 =?us-ascii?Q?c6bPAYCopG7sfztKDEQnPSfXmRZilx4EXDZN0a7/dyihLCIu8xcIjZsthLim?=
 =?us-ascii?Q?yMF6j8RT6RN8JWwjY6FBv0gXkSIRO3l4nadb?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VGpj32ogev1337Y1EpSW9Wh1duLezKWh8jyazWvy2X797niSSxMJ+TxUrqLR?=
 =?us-ascii?Q?3dgxx7mTJNxnoP12lzqviRi4qwWNdoh0e+IVmo+DzaHO3Bff3bzuVuLPVixO?=
 =?us-ascii?Q?+1lGfCf/7JBRyeSIdoVsmIcWGXNqwS+aOqQmy4cVixwNKACKPVhEItsPWRoz?=
 =?us-ascii?Q?+Qx+/O1Uaq/pGreWIddFJ9Oy23pn8wJzFhOJDeyXuQMzrFxo7u+8AT/J14iB?=
 =?us-ascii?Q?og6POU9zL3wMG9E9rlbUNtemZ/TmZ6aincmLvN2DyzxIvqfhk2jSJ48rh7/F?=
 =?us-ascii?Q?rfqhVMJxF8lge4SMYwnaj5+S2yw0kirGFreCAqG5KZl59SFliHw08L3j3REv?=
 =?us-ascii?Q?SOauxoIn9o97yMGhqUrU8qEerlQvjT56OIKmqqKoY/tY3KYsISnYQVJDAZkJ?=
 =?us-ascii?Q?YLqGy9vFPWMMnoO2C2qqMO8Ku7ggCLerGiRh/VadYTx4p1zNp8EfYAxU2Ri9?=
 =?us-ascii?Q?Ujo7HjIkUhsEbCCS9qImqv0yDgOyp3u7ESzak0uHow/12siZR/HegbKKwzGB?=
 =?us-ascii?Q?R/2zBJh0amvrdc1WYVpm5roPUgmXFFBIxZitroapFiKgf78qs9lGJqQZL3i/?=
 =?us-ascii?Q?a7XnnpJYMiQAVf++3ceLkW3Xfftf5uapeEfO5W6OieP9koVNeKKp6aUp97hX?=
 =?us-ascii?Q?SAM5JQoGDMDfyLNy1XiPlI4WkCu3LEfsqJkL7gSNUt/rdfLMwgeSmUXFN4J8?=
 =?us-ascii?Q?A0t7hbmi32B5oRWj2CF4inVfn+o84Cv6vDHZGVbizO9FnbduGI97y9mKh6Ro?=
 =?us-ascii?Q?pdtU+5CPmm5NoUHqyEccLqQ4O/qQGBUnvTHKfVsMaBDhvZvBlP+YhIAauiai?=
 =?us-ascii?Q?FsWhShA91j+e7GzvgyAnEWBBHXCzmM8DY9o5SNoiHXd+qIJgBRxrSA6cYqZZ?=
 =?us-ascii?Q?sqO4PgIUZCoT05PNV+EosAvB7j3spmxGOMdklrlDl1WRe9hehPacHbqBDt43?=
 =?us-ascii?Q?tJRacRqyPBcPaOEyachx0/NMeal0wLGJbkh48KdL387Q2ABcDvqvn03M7sbM?=
 =?us-ascii?Q?xus1moWKGfNYOrbeJjC0tr5Dm51mB1IcoALY34bJZ+HUqajsruXyOd0VE/8J?=
 =?us-ascii?Q?YjcbmeVuHBEVFbHaGCiUL2uWfC+8HX/JIMuG8LclBPcHYG1L2rJRB87AymU5?=
 =?us-ascii?Q?9YJHKedl5m5P2w5oWOBS0CEcrLedTKTDyTO4dzFv/Udl1OvWODF1tUNhojNe?=
 =?us-ascii?Q?Fh/EEsasKoXPUOTbQIxZwUu8T920Dlfupls0b6BrR1twNqeabqrTVsdNAMhj?=
 =?us-ascii?Q?rPy8YL8LmqGmVkYH5HxqSwJUq+VgRX5AMrz88vc1jm6UXpX1GuEy5v25PQtK?=
 =?us-ascii?Q?KTjFYQcW6k3jbicf+gv6zgJxTuY7u9szXu8NuRqnC3JtTDpV9IMwoYuLCS1k?=
 =?us-ascii?Q?QZvs7Erqrfz4pTmyQDN4gQqyNu6U9adfElj9OyCoCQjN6GQjTGB93QHsQxi3?=
 =?us-ascii?Q?a0lCqlpN+Z9NE31kxO2hnXKc0a2YZKghyKaH4+xjbWh+0T2oS9VJd38u7hxw?=
 =?us-ascii?Q?tdNqWEma8JsJ/vUH59TPjCjuTlGHR4gKzo7NAnXaBLtiX1Ldfu2+X8Inpf36?=
 =?us-ascii?Q?M80IoAJlx9nuWXs1t9GEYmAdeKbGSje2aqSPD4Gas8NMVeiQjfUE6YikQ0pr?=
 =?us-ascii?Q?rlC8rCWnIX19nO9vntJKEoQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2174d709-f51a-43e5-4d6c-08de20ba12c0
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:34:28.4958
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4w+SxGdtA3flWpvnUqwFovo3AF4+BgC4Ztc+CXRVToz7tHEtehje4k+BLemIZP0ZbLwF2V7XE+Iz921YZJRYaXeaY8C9NOjgrNLcsulpunf2YxYqmKCUsddOGbarp6ZF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB12531

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
 sound/soc/qcom/sc7180.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/sound/soc/qcom/sc7180.c b/sound/soc/qcom/sc7180.c
index 84b6ac5d2a205..bc5a188834793 100644
--- a/sound/soc/qcom/sc7180.c
+++ b/sound/soc/qcom/sc7180.c
@@ -287,8 +287,9 @@ static int sc7180_qdsp_snd_startup(struct snd_pcm_substream *substream)
 static int dmic_get(struct snd_kcontrol *kcontrol,
 		    struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_dapm(kcontrol);
-	struct sc7180_snd_data *data = snd_soc_card_get_drvdata(dapm->card);
+	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_to_dapm(kcontrol);
+	struct snd_soc_card *card = snd_soc_dapm_to_card(dapm);
+	struct sc7180_snd_data *data = snd_soc_card_get_drvdata(card);
 
 	ucontrol->value.integer.value[0] = data->dmic_switch;
 	return 0;
@@ -297,8 +298,9 @@ static int dmic_get(struct snd_kcontrol *kcontrol,
 static int dmic_set(struct snd_kcontrol *kcontrol,
 		    struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_dapm(kcontrol);
-	struct sc7180_snd_data *data = snd_soc_card_get_drvdata(dapm->card);
+	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_to_dapm(kcontrol);
+	struct snd_soc_card *card = snd_soc_dapm_to_card(dapm);
+	struct sc7180_snd_data *data = snd_soc_card_get_drvdata(card);
 
 	data->dmic_switch = ucontrol->value.integer.value[0];
 	gpiod_set_value(data->dmic_sel, data->dmic_switch);
-- 
2.43.0

