Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010049.outbound.protection.outlook.com [52.101.228.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D6EF233140
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762821349; cv=fail; b=O5wOnCWqHKLByvV5GXhPcd+2L3VZqtIWDPu/Djk0mopeWmI3kQgqXbKO9Vq6vYUp8MtZmSlbB1KdtcHXvj6T022wAnTCh5u+h39HgCjAMzNlo+PJPeBOdJ52YpfHS0J/vgdzkzsqWSxtq+uZJ/cBeF7vVQOWK4fu+29zXpgIzi0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762821349; c=relaxed/simple;
	bh=nrBJOLaMhwmZdBNmefrCxB3/HnjpoL/gf9Hcq9Xgn8Y=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=JJ2OjEykkYq9Z3I8DYKBDvM/3JUxWrWYeqMfhvOEt3jsxNYIafmQYrHKQwGX/xCUIcuirqp4xG8uoOrj4b2eZLjERf06hcIfABSEZs/9XbI9AeXof/fM87FslRTMzmuNUmstUj8MYDRVSYHuYlqjcjxzmDGnb9UXqdXUG8+4/x4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=LL5F2iXS; arc=fail smtp.client-ip=52.101.228.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="LL5F2iXS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WwgEOO3FRu0WbLrXVI/ThxPJCPDwMaxZetxdbgv/EmKfFVH4ltZL/VTx93fe6eOYqMyeWyQc7LKQDBldCWoHmtvo/1IVZDns0usiFcsqueEfD4pZaeywIrEe7aM0Fz4OeFGQn9jNQ8G1UhyAsTa5kfPXh34e65JmILxG9RnLlkFlYycfPgtGmgnxESInK3xdlJFi6rJ0yCqMwVKONXT+MaNWXqSi9xdHOJ9A5SKSKgRJl4ELYV+DfjNqqWZeYf6rwyYDO+IyGDdOHK4tfNwM5XJitskeHdjbhGBdDW+vRGbOVoGMhof9aXdkglGZ2m8k8kg9MdIEfa7teVbipWyD8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qin1WTcW/E0QNcTKTfV8SQTZ0/Fu9bFN+59piQCrYVI=;
 b=bnxnbu6xl64s0VIMxNGdoxbhHXNXtDZGyuGHmD4sPMcrQvuyNN5AnKSSLCqyB+pudOOD9XoP/O/yLhizCWq+00dj/OWzXPLwnvp3BoVj8KyARKo3DKYnMh/Ebv9YjjSDvQ2hzdoGw2DR5nS9JfHJvV/uHOkxtJXEvCAo8puxSwNNoOeyjNZ4V8yIM8V0FwXDEWEsijlSZ46sV7QzariwPM4f+JFn/P1VV0BFExDwPSMrBMMhf6wy0DUz53QLxe1GlXWlSco6li+tL/7ldTEvFD/aAu+r7vVdtc6nqXQbJqQBBkpWHTID/8oHaWPC/zt2pVbqF+KooILTNgrcJLfn1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qin1WTcW/E0QNcTKTfV8SQTZ0/Fu9bFN+59piQCrYVI=;
 b=LL5F2iXSMIqnNf60obe1UX1HFK0OdO7tM7UwjyY/TKwnNCoY4aYklckepUW6Gjvrg/HwBBqvXy97ACsgPXLqw+RQcvR4PXow5lYNYcx1dakfOhYRr0kkXURHLXfXEV18XcfTLoUtr8TPBXFXhbLTqNmqgV5nPnyHHzLxnY3yL5M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSCPR01MB16378.jpnprd01.prod.outlook.com
 (2603:1096:604:342::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.10; Tue, 11 Nov
 2025 00:35:45 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:35:45 +0000
Message-ID: <87pl9ptnhb.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 265/292] ASoC: sdw_utils: soc_sdw_rt711: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:35:44 +0000
X-ClientProxiedBy: TYCP286CA0374.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:79::9) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSCPR01MB16378:EE_
X-MS-Office365-Filtering-Correlation-Id: a5d9c2a0-4377-4c9e-c47f-08de20ba404e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7BhaEIAx2hBE/V+dM4BpEd3jlybTgydjqla9IN7HwtRyI9uxLyhaPG5+6b6s?=
 =?us-ascii?Q?dK55lhu+v48JJah0hpOXsAxsi/Rlr4QFM0uO2ZT7Hxut/6eBfhVLScjGLcTf?=
 =?us-ascii?Q?pdW5V/gT3gQFZYzPnSVAdywcmm8q+lfaPveDqXtLD2ca5eAr7omZUEISxdSA?=
 =?us-ascii?Q?zRl/da9D7+6A1BhRywibELBtWYF2tMp7s9KgleIPIWBaAZJYTsH6Ie8Pk6iJ?=
 =?us-ascii?Q?2GaSTkL2O+6bC0OmpTd/WzUxz2VodvpsvfI1uVsRBtUom8crRFqlScxKI0ph?=
 =?us-ascii?Q?yi8NQYNjTE+E48twMKqd6q4P+L5uhRDgffAzV2fJZ1Vn1Co4IQHuci/GibxI?=
 =?us-ascii?Q?qSBzLWyKKq2YKuq8DWhdlNupGfDW8RL+RA5p/8dhBTZwRSX+gRdtvus8zy76?=
 =?us-ascii?Q?F611w81TktaoxQhPVCHBqvLMiqN8olUzUj37L5VD0v05xsUfGK5URbZvRMEP?=
 =?us-ascii?Q?Omcn4TVuXj8jmCx0REFpTXGpW9KiBMYUxDMIcrWo/Cuv5D/k8T0uRl6IElDA?=
 =?us-ascii?Q?06j/3GEgAe0pf8je3nag7dmL6Mq6XLM7qersq4g+e4a7+kOaOn6E24PorrsX?=
 =?us-ascii?Q?VqeYDI3OQqLd7nqOxnr8xMSg9giKWJKuB9eeFZPgyJ6divh0lu4rC5kq3xJH?=
 =?us-ascii?Q?DaXVKQUtEdh3+Ckixngwjk9z1/v3HYD2Sj5TksfR9dc7HQJR/k2Aviw0yRlj?=
 =?us-ascii?Q?8ito9uMH7YEhO9MWg5kFCKY3SnjcFpEfyfCeYJQbNUhHkjnCxaas9HpGtuaw?=
 =?us-ascii?Q?3FPfjLuSa2l8Tjg2I4h6Rx8+K+PeQr8Iqq7LaXqNHnVFqlvEPqeAWmtW/fHV?=
 =?us-ascii?Q?dbpBH0Sp2YvPj0oOAc7FfS379fmFPOZxlOalJQmyZOnhydvcb+Z7fHb3RtUX?=
 =?us-ascii?Q?wHwX0NmyuHjQWbUTMdZZcREuptADLJO7qU5mSXnWFrHiiLlzHrV86RzRyyQb?=
 =?us-ascii?Q?ZlLtNwJ+xisZ8ysq2aZ79pTwC8mXgo9ZjEr/JtfYwCfwu8bWraYs6YlZZ4Rq?=
 =?us-ascii?Q?Cllypvzl5yP8s7oRPq6mGP2o21FXerZxlSXkZlnlg391lVYfGRRLfN+qSc7E?=
 =?us-ascii?Q?SdqMifDKYIZTNygptBZpMLfRYYECyRgoIc70SJ79RSkcvQCEVpPsBUFi1uP7?=
 =?us-ascii?Q?8wU106LRsk8sb3hRQ9Z5MS1Mb2rUsS9Ui/XFUQZ1VQIGspF8kFhzcyBBbUCh?=
 =?us-ascii?Q?s47iB9tjZRoNvnTWghSnUY+96+wzctS+GZztlacwg78oWNLb7ICtJPrrmXJF?=
 =?us-ascii?Q?7E4BXtp3XfU8OGb7pRh3VQ/dPXp6MfJvwyR3Z8iICEYK+5Qlmt2kuImxPph6?=
 =?us-ascii?Q?JUyCh9Vsg5WuJH5rWEoLwQw/23EEQdI8aB16k+2xZbn6Fmd/EzWQWtrzsCqB?=
 =?us-ascii?Q?ySIhzRU2+rM59yIGqvUpKqa+Q5yaLQONaIo82NJNeFvjqvM79viKoPkxSiz3?=
 =?us-ascii?Q?+uOYHgj+rCSn7CK0nsDi0UyjayOar+dVPU3iQNyPcaJHhHaS2bXIFYLcppGM?=
 =?us-ascii?Q?qUXaMXwqk/5HHrKFRSQ/H24VUAVMJUGqFvvK?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RXO8l23Usu58LuDL6h1JCGsmIdd0HzoC4AhEf9uIC/67TUCxzX3IYFRYlNyY?=
 =?us-ascii?Q?IdhehqrnXfdwqxF7Eqf/wpsq3+p8+zbXyzluBVxMChDO6UdP/u4955BBGNCR?=
 =?us-ascii?Q?v9E7R/av0j65Gz8vsD7fDgizCdqR+sl7mPjsI/O4UvwLI6kUMfdpYlgsUtnJ?=
 =?us-ascii?Q?SOUqMfrMQQWEJK3vbt48bOLvZq3t1KH2d+OV9kpo7tpph6v9ZoLjHm3pJJ6a?=
 =?us-ascii?Q?gIpPtyUgsUGeU7UN1MzLJk6bEPVneSSi3aT16xwfKe4wrufNOh9MyMHUpUo7?=
 =?us-ascii?Q?gHtZS/kH9xtXK0EOtXejB4/t/XI+1pRkQEIyBZGIFOnPj5hDWMcTGemUE4zL?=
 =?us-ascii?Q?I+9QSqACHiVInPLgARSVO/LvWRB811zoQ3rHTdMg1DD+BF8ZE5kFBSWo08yt?=
 =?us-ascii?Q?N4bVZViN++FpwLSxCrBaEh/oVCWqIHvl4dh+nym/mUc/g4Qx1xMfO7Csr2dN?=
 =?us-ascii?Q?fqd4iOxPXI2hD2EV0av4MG/damU+ogzpQkhV+pr9540rOq7u+42oaZF04QNw?=
 =?us-ascii?Q?EpztVF+tDdNF18cccnZehDW6msKMedgFoZH2gFR4MdFDoXvM4STb1T5VN/A+?=
 =?us-ascii?Q?SmJkcPapykrLiS1/eNlRFAskkksNKj715zAc1f2sh3Ju/73T/hPwW0MAJCeN?=
 =?us-ascii?Q?lV4yFPricQE9bsHaAa1OLuwwCobfAQaHMzpCRuRj96GAlf0PmUNkR2y4/Y3z?=
 =?us-ascii?Q?lcfdiVkjCB+XkCslcStjX6DKceHKNk8GvzZfv+fmIaWoGmAg2DWiUoWAv94K?=
 =?us-ascii?Q?mS8eogjnY4Is0xPbF+FfW/3xnL47ir8d1GsoFTnDxu2kFgBExwnI0yj00fqj?=
 =?us-ascii?Q?jy28+negRCUeMDb8UcRFDSDR/59h057Bs/3ajJiM+a1IjB9cmKOHtjyFFsep?=
 =?us-ascii?Q?UlQfODR0y6D4LiO4xKjJsnDNs0fzkco5+gCW01bzCrzZR5/exhWNGnjQpZ58?=
 =?us-ascii?Q?vVKoJ1roMdgZ0wKrAMD/IxzOr3S4viYnnnkn50D6mM95nn3N/+qRKV2kxv+E?=
 =?us-ascii?Q?IINuUOTsKKrUmzEUW9Kwy58+nifiig9L+WQuKtp/HzSudn+SXvsHSMpf9z7J?=
 =?us-ascii?Q?dScU91dwzchsB58G2Z29F7zLZJppZMIkafh/eJMHztKE+nzsdfbxVAl+5etI?=
 =?us-ascii?Q?N3AHog7UL6wTE3+HY9gnZwO86H0ut7obLgaIavyVbU6gVlqj9nF01/F5JlSO?=
 =?us-ascii?Q?yoHD716z68QlJzZ22pxjnxzRLshoDSzGeL+IGtk+sTEmoInJOGUgaHZeTIvU?=
 =?us-ascii?Q?9yoe8NkZkgoonJPLbN4SoCp9rmmi/5v1L7UicRAplz5kvEIKj2KVoR52oVDf?=
 =?us-ascii?Q?FYn2S0qI/pP5wgJe5hh+ok30l1xP2vmLKmu2BQoCauzRppYh3akYEPTFu+5P?=
 =?us-ascii?Q?VjYf2zwXAI9AVb2lW1uNMIR3BI0MWL+pw956QtiTEsEDlXuyMuCFJImKMIl0?=
 =?us-ascii?Q?lZrqGOcYAkO4PyzcKJuw9OEawlFk5GDPyP781yFTBhQrx1Nd49JbELFuFcfG?=
 =?us-ascii?Q?CgUGJwUliMqRaScmMxeDCGqbAeM9aopgoIhtIqv58DjNHbtHQceMnM+pvwSS?=
 =?us-ascii?Q?2usiLalaxvYDg9FHIMOomGtO4O7TIdWytZgvd0cVrcxzr3Z6+b4J4Y9rAKlv?=
 =?us-ascii?Q?LDcQFH37LZlrNI1p2blyUCk=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5d9c2a0-4377-4c9e-c47f-08de20ba404e
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:35:44.9251
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rqL0PIAQX2Gt8L1GxRz94WysUm/z29GnKLqYzQag11x37fQWXI/IU4eDQgbPUvy2E1Kg+7CPTC9Bw7jgY022GJ1i6ZSieWcsLD/nRP8CbxcL9wMi7ReRrwYLh/2lFEs/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB16378

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
 sound/soc/sdw_utils/soc_sdw_rt711.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sdw_utils/soc_sdw_rt711.c b/sound/soc/sdw_utils/soc_sdw_rt711.c
index 4aa93fdefef63..3a3a66b4b7372 100644
--- a/sound/soc/sdw_utils/soc_sdw_rt711.c
+++ b/sound/soc/sdw_utils/soc_sdw_rt711.c
@@ -64,6 +64,7 @@ static struct snd_soc_jack_pin rt711_jack_pins[] = {
 int asoc_sdw_rt711_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
 {
 	struct snd_soc_card *card = rtd->card;
+	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(card);
 	struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
 	struct snd_soc_component *component;
 	struct snd_soc_jack *jack;
@@ -76,7 +77,7 @@ int asoc_sdw_rt711_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai
 	if (!card->components)
 		return -ENOMEM;
 
-	ret = snd_soc_dapm_add_routes(&card->dapm, rt711_map,
+	ret = snd_soc_dapm_add_routes(dapm, rt711_map,
 				      ARRAY_SIZE(rt711_map));
 
 	if (ret) {
-- 
2.43.0

