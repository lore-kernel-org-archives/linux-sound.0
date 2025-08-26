Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010057.outbound.protection.outlook.com [52.101.228.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87B752D3A85
	for <linux-sound@vger.kernel.org>; Tue, 26 Aug 2025 06:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756189336; cv=fail; b=bjXRu1mxO4Ksgm5fDxnmjjNa9Hety2AnQVb8PXf+K458xeOhwvITN3uutA7y8JuECH8nIVidyuka1+HE/l5H2ewFCqfIGlOICYKhnytMSwDG8Fr/FwcdMkt5HT0LFym+8Q7/XQiuw8tdM52nt9egJgvAnlxxHZpMkK6K+L4+ctk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756189336; c=relaxed/simple;
	bh=PxzLgalW4ToCFz7IuJhdDNypZh0cdxhGOBY0JtKnlAg=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=j8575l14nEtYA4Za3DSWt/cLDPwZCpMe+o5RSBOiMm6PhGqTcz/br+5aK8E2EZnLaVw4tbci5V7+4RX4ZJ9pRxo4zy6IzZgzK0S3arVGeNEKRmsF7BYabg0SxiL9s0PiQDsKhZaHwNwRoDIsvzjtRVJlLiWGMVbrOqogIQNNQpc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=eqs+7sMx; arc=fail smtp.client-ip=52.101.228.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="eqs+7sMx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wDEB8dpfzECitngeBPzC1MNjK74kOORrKDsITU/INVknLcYSj2tJ3wBDsSLI70PqNCiW/qw/DMqNCVM+kFy6/IElA1y4jesK5ABFQLDSst/fZ1GrKddoqedBAFIqHEWf7d55VwA1Wn95jvmS4Y6M6bChuDiE6v7gimGNi/cS+J1T8vKcilqPhePzC3NNbxLys0smTrt9DwQBu2PkhZ2VA90BNz9YtHNnADBtiBitvEXIEfVAmPgrukjPAvIYCtfioX0rY+x5CetrB35XPieqMbtMZ9NKrnd0SzEAfAc16jl8/tzbB6uQkSDt4QuDhRViW4rdKN+NNjPih+mnvgqarQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LGGzo1w8PyrCDzEGNhhGfD2/9tQa96jcxHIC4fxpROU=;
 b=ujr34qEay8nMVoLwqY8wwplYqc9nR6AVw768UZPLB815FeKcj80SXnrvep4V/4ASySYH9qRNDwMnrH3fXUgyjpwYz2UPgZpd9AQW/DZSnpFWaJxU1kT0+s0cRiJKSM4zy3/Yx3HWrwOojYZzevoto2Jizu3lRVVCqcVSS6jq+jRznuiLz7/U2Y6rMO0pdVmKbJZ4hxdPhybxLvZ4vX4Msr06Em5boEfkdcxoF+ls9zx+Pc09oUodEnfqZkYAPcgcjwBlAMeVlbD9M1m2UzR8PkqvYNtrQEhQXh5JkXGpiSxX/JgZG1cN7fUPsGToegE3whbMbLXZcLQXrEyVQq/xEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LGGzo1w8PyrCDzEGNhhGfD2/9tQa96jcxHIC4fxpROU=;
 b=eqs+7sMxzwh+4ssuWB6YNxyIz9TukeiLAt9BBdEnmQdkaA8OSFmX0a7agccl81l0ZgM1Z/obwYUejnM5xfkbBKkM77AFwSGCZebZxC399ooRFUZ/NoeexTuYuTMsLlOGIs8J6y9PTocpEtTYCbEE59O9FUZSJJD4sIftdaQ90pQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB17440.jpnprd01.prod.outlook.com
 (2603:1096:405:354::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Tue, 26 Aug
 2025 06:22:12 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.9052.019; Tue, 26 Aug 2025
 06:22:12 +0000
Message-ID: <874ituy54c.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 2/4] ASoC: soc-dapm: rename snd_soc_dapm_kcontrol_dapm() to snd_soc_dapm_kcontrol_to_dapm()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <877byqy54y.wl-kuninori.morimoto.gx@renesas.com>
References: <877byqy54y.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 26 Aug 2025 06:22:12 +0000
X-ClientProxiedBy: TY2PR0101CA0032.apcprd01.prod.exchangelabs.com
 (2603:1096:404:8000::18) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB17440:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b4491d3-4a52-43a9-3674-08dde468e4db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HHtQNn8my78hjcdpGhUtSoGcbLittRJxYFdkRtApNqRgEP4z+eqdcEf2ERk+?=
 =?us-ascii?Q?k/kiLY6Ojjl2fOlsn0S+H8N7WDOTHwbq0uJfFvpWgfQK+ZTikjJ8Xb/8cAHx?=
 =?us-ascii?Q?vvXsAzxTRvOcMaS9gmIzvsJEK2ltvR78VSAc4VeulMlu4GNOJWRVMkySFoB0?=
 =?us-ascii?Q?e3VyukEaHB6RUWEJod4aLGH2/OhYGU9aMo+xZcWKKhQPF0r1xadDn6rb7eDb?=
 =?us-ascii?Q?PuFjULSCMs6iXqQxCT3UuvUTFRjQ0m12e6mXGnz7YeaxfLFZqR14MWtbwWaO?=
 =?us-ascii?Q?1cdzXf+xu9mCht7KHwBw0YTTBNktUuyAG9EqOzFh8XSG3DvzDybzJt3yj3uL?=
 =?us-ascii?Q?pHhzyflA4HsMdMdD98ZvZduqsrVHhmLFWKN6F/1SaV1s1i1BAlreNkwRYr5g?=
 =?us-ascii?Q?czdP+iqhM7lAQ5aNwE+S+ZV2OWDGbkoYn83PCtMiun6JULMRmz8ikyHIz9xt?=
 =?us-ascii?Q?RSoaeRvNVXVpymQhACpv1H/sJFdg1VsDedK/z6J2NmMRc1f5v3bo2SJyf9Jz?=
 =?us-ascii?Q?nvDWG2roSEPaRYdK/05ne+igjc4XLKQHmJrujtEF/nJcQZi3G++JLV3qhGJ0?=
 =?us-ascii?Q?jv4BDApt9vt39yLTZRefLNhwLywP64TyawrI+bCJhDlNyJ5MunV9AEguMM8P?=
 =?us-ascii?Q?ob8L/zz/4JwqP2REmp9sDNxyF6TrDAq4xUNMDWRc/f7OWpDPvsqIIWx6Rhx1?=
 =?us-ascii?Q?0yIj64kBZdvNuu7U1X36HrYdGzA13yQJegLle9b/2XqwUBU+SQrXe519CVOo?=
 =?us-ascii?Q?9H4QlUqNiYR9bKFfcF+rQFpc5q03/ebp2BC2A+bzVWktIqrRt/I52IGDRRrJ?=
 =?us-ascii?Q?6zHLJt+d84nHZOGUdhUtJJJqAirJIznKUkPJibKklvf5ZXJKBeCaQI8AIw5W?=
 =?us-ascii?Q?iEAvEWd4csEBVOzqZWkFJcoR98AaVEbYregogve87Ivs2h0/JWZWpKpq/zuT?=
 =?us-ascii?Q?DSSaH0SrmjA1GTIODPb/8922lBBcdFLZhG5RUteR/lZCGvYqbZy3trOxIZ1/?=
 =?us-ascii?Q?cs3Z/OMKyt9ebTrPoJNUyjTEzt5dNFFy91KMlIag6w0VKXaTXJ23RIZhtQhG?=
 =?us-ascii?Q?PhE7YrB1U+JzrIdColO2wlocw/idgSpHH/awZ0bhHD2Y/hybTjV1cfusDiAi?=
 =?us-ascii?Q?tLrq/xFSnZwXTYCGibFD7IjMYFj47ebJosa6IWmj1wrcXgnYoo/1EJqGcPfv?=
 =?us-ascii?Q?rLphNS5c2MI2pyR+rdx0/P3QfS29q+peocBrwnGIvkjgp9eX5oV4ZCYgrZiv?=
 =?us-ascii?Q?Mb4ccdNCxtIBu6p7p1CcEKwHB1DyR9p2AKGSxdj0eYqnk6VUnqOhtMvzDMCJ?=
 =?us-ascii?Q?FhpYkTDzi6UZgVbhXZ+8AIbHMrWiFYdUyIuY+X7qhOxwfp9XfuPayhzHVORh?=
 =?us-ascii?Q?89ZDgfz5tzZ8NqpuN7m87Wo5tBVjblhwZ2kNAj+BJ8cLuJ3jQrHbEqo2up9Q?=
 =?us-ascii?Q?SWoITOjLkJeizwKrqsj/fJ6AZcKANvyDHR5FNqO2cBj1eHMtK1q/Dw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UpuSVPS2wGQJ4s6g325VaffV6JG8C1TsDREtq1GZo/hGKUVyM+eivGfJZJMT?=
 =?us-ascii?Q?+++L2gKZ4C2sC4SfV+3ZZeLnF+diYJ5TnoYzw0lCN31b72NT6F3elDw56TlU?=
 =?us-ascii?Q?c72MGJVJ3n9j6auqcgKyWzrkCSpjpzwi7yeWyd9dJnddRKoGFSqs4G9rG5iu?=
 =?us-ascii?Q?hEddETWjkxMI9f90u8hIJRJiavFgJJ384YSURJkyWU+hLmDXQahP3KfNj7Gy?=
 =?us-ascii?Q?tcuRPbbkvxcxnpn58eXDRjbMKf+PEfs/4Qywx1kHrHXYksiNl2Dv+CGXDH7+?=
 =?us-ascii?Q?NwOqcFR7aGEZNfpQQqrrTK22HT1U/tBVavZhawH0LfzgZgGsltfRQ2w1Sb4Q?=
 =?us-ascii?Q?fSZ92SbaiE1UCN6/3u7l6wSwg1qNfpmwIISfHxLcCIJEBHX4miuTRPkbU1vq?=
 =?us-ascii?Q?aIRjH0yOLE5sCAZRFUfUyb1M9XvrTep0GdpMjJnIfNhj3GOLrJtUoV7ziPf8?=
 =?us-ascii?Q?tWvxNJoluGVRi7cGhxUw71JNJBcNvdMYpqMySdi2SzXKlcYiAA/2pDkNQXVx?=
 =?us-ascii?Q?h0eMBBbGr+QFWX/46RTiKRDc6w7J0jzFmwRAovFw3DJAW4GnZuzwALzB1VDJ?=
 =?us-ascii?Q?e5FLuITa1eIlXgLpPTjgn6AFMgZ0WiBiDaVOj2WDf/CeLGeBnmNwxI9IH0Jy?=
 =?us-ascii?Q?Unp/mgr5r/6dt9+ZAWqcUj35MiHFS28bHAb6aQJffLKnZ1frE3PnoqEL2asU?=
 =?us-ascii?Q?g0wbkjfgdPrTrhal5LdXVmNc7ZUbprlb0yMWNep68ZnU0b7NcT3T1vPSEYE8?=
 =?us-ascii?Q?5cgMvXLayXzjcEzcuxUvqYC3CnX/THFutj3H70sPZF9LPE0qGjybyrWVXeyo?=
 =?us-ascii?Q?3diWUnugpiYp1cVggPtKuYIUibVLoIoLiWIcINgNNhkxZnuAdJT3a2PKRXB1?=
 =?us-ascii?Q?Z9NA3F6etWAPvVXw85izxFjR49JhdLB5729m8MsoiLd00ZSp2FyF9JY6ibgR?=
 =?us-ascii?Q?+KnsesIqECq7mNoJxdnq8yy4bCU+rdKIe6hcPm6CjCMiuft8IAdic3TsvpP+?=
 =?us-ascii?Q?RJiEieME/Llyr18FCrACIIk/Tzj51wyHbCWcl+dxnCyuWh3hFuSWIoOg7Fc8?=
 =?us-ascii?Q?kxCvpDkrbUuZa6PSunfWJKcILHgWJD84EvSqW9RNHjztV1YJrhJIKHpAct6C?=
 =?us-ascii?Q?gLAi81N+bchlXyjVJ5n4yv2oMSOeSYxL9HYm9sfGRb1z34iuFVgCcxZ3pnFB?=
 =?us-ascii?Q?MXnw6ZiFdcEGjAvwtwdZOAxFJT8QWr9QXy0qYOV9uS43mbUb76OL/qwLy8W6?=
 =?us-ascii?Q?htYw1A38Kh0j1SCX0ta1LVcP9mtiK9eq4eaWAEpWnytAiPX9qb3//x+Cw0ie?=
 =?us-ascii?Q?3cagwBxsizWn8TiLkuBxlpRUVBMWkZvNf/eG7UJOC8wsBYRJB93mhJ3kZ/FA?=
 =?us-ascii?Q?KzTz3lvfUerrX1xSkpsymDncBD2K4d3Sf0th089RAG8uVfLsD/Dzn+X1VmUv?=
 =?us-ascii?Q?qHFocxgnre96qpcF1mKHwRp4lPpy6XXiY8zRMJ8X/Uy8HZoKsu4w6Fd+Tnmw?=
 =?us-ascii?Q?sujx++mtBHWePZAnXv1WzVCglGQhFSMPNcs77kZL7B4+qazjtY6QvJVF0LEf?=
 =?us-ascii?Q?2U2hxCz3pWFrhbhoej0lnNv+taFmKphuBs/mCsQHjk+SejOQJWCtcFem2cyz?=
 =?us-ascii?Q?/NmdpldmHwcYw7UTk4ZhKX8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b4491d3-4a52-43a9-3674-08dde468e4db
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2025 06:22:12.5355
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8jkBVR3nsNNIaFpuv1fnluk9o2xaXkaM9ikcgh777XIPqPAXjOH9X6kFqWKx0UgTJ7z5W4S9QAwjgs/cRGBiJBGP5Zfr6wQT7bpdRu7Wd33cCy9oB/ZhK7Aw3OKMRIq9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB17440

snd_soc_dapm_kcontrol_dapm() is unclear naming, rename it to
snd_soc_dapm_kcontrol_to_dapm(). This is prepare for dapm cleanup.

This patch keeps compatible by using define, but old name will be replaced
on each drivers and removed from ASoC in the future.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-dapm.h | 3 ++-
 sound/soc/soc-dapm.c     | 8 +++-----
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/include/sound/soc-dapm.h b/include/sound/soc-dapm.h
index 220eb6d08534a..8add8de7a8c94 100644
--- a/include/sound/soc-dapm.h
+++ b/include/sound/soc-dapm.h
@@ -718,7 +718,7 @@ int snd_soc_dapm_dai_get_connected_widgets(struct snd_soc_dai *dai, int stream,
 	bool (*custom_stop_condition)(struct snd_soc_dapm_widget *, enum snd_soc_dapm_direction));
 void snd_soc_dapm_dai_free_widgets(struct snd_soc_dapm_widget_list **list);
 
-struct snd_soc_dapm_context *snd_soc_dapm_kcontrol_dapm(struct snd_kcontrol *kcontrol);
+struct snd_soc_dapm_context *snd_soc_dapm_kcontrol_to_dapm(struct snd_kcontrol *kcontrol);
 struct snd_soc_dapm_widget *snd_soc_dapm_kcontrol_to_widget(struct snd_kcontrol *kcontrol);
 
 int snd_soc_dapm_force_bias_level(struct snd_soc_dapm_context *dapm, enum snd_soc_bias_level level);
@@ -730,6 +730,7 @@ void snd_soc_dapm_init_bias_level(struct snd_soc_dapm_context *dapm, enum snd_so
 #define snd_soc_component_get_bias_level(c)		snd_soc_dapm_get_bias_level(&(c)->dapm)
 #define snd_soc_component_init_bias_level(c, l)		snd_soc_dapm_init_bias_level(&(c)->dapm, l)
 #define snd_soc_dapm_kcontrol_widget			snd_soc_dapm_kcontrol_to_widget
+#define snd_soc_dapm_kcontrol_dapm			snd_soc_dapm_kcontrol_to_dapm
 
 #define for_each_dapm_widgets(list, i, widget)				\
 	for ((i) = 0;							\
diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index bfb2edc2f91de..25b2ea14d6599 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -888,19 +888,17 @@ struct snd_soc_dapm_widget *snd_soc_dapm_kcontrol_to_widget(struct snd_kcontrol
 EXPORT_SYMBOL_GPL(snd_soc_dapm_kcontrol_to_widget);
 
 /**
- * snd_soc_dapm_kcontrol_dapm() - Returns the dapm context associated to a
- *  kcontrol
+ * snd_soc_dapm_kcontrol_to_dapm() - Returns the dapm context associated to a kcontrol
  * @kcontrol: The kcontrol
  *
  * Note: This function must only be used on kcontrols that are known to have
  * been registered for a CODEC. Otherwise the behaviour is undefined.
  */
-struct snd_soc_dapm_context *snd_soc_dapm_kcontrol_dapm(
-	struct snd_kcontrol *kcontrol)
+struct snd_soc_dapm_context *snd_soc_dapm_kcontrol_to_dapm(struct snd_kcontrol *kcontrol)
 {
 	return dapm_kcontrol_get_wlist(kcontrol)->widgets[0]->dapm;
 }
-EXPORT_SYMBOL_GPL(snd_soc_dapm_kcontrol_dapm);
+EXPORT_SYMBOL_GPL(snd_soc_dapm_kcontrol_to_dapm);
 
 static void dapm_reset(struct snd_soc_card *card)
 {
-- 
2.43.0

