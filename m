Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010067.outbound.protection.outlook.com [52.101.229.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9F8379EA
	for <linux-sound@vger.kernel.org>; Tue,  1 Jul 2025 00:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751328680; cv=fail; b=Kibgv1mKOlmWV2xoOn/YyS6jheLnQf4MAijI5sGpPngQArjxNPHiKT7T3OTQA+GtN4Bp35fCK4RYma8DXUFq+vh6V2VHYlN0HXpnFKJyhzqlEGGd27mv6AGlVU4QZKpGrzi649WfdUvKz0xuRQPbuMR3Av1N/EUcSE9mHc/BH8Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751328680; c=relaxed/simple;
	bh=qjI6Hg1A1mm/N2nUTmrngkg3mlBRQkrE1oUAuTHKMmY=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=bBLwURoWjNneOElVh9dACZoIyH77NixGFEVnbLW54etxwSLwzVsS2gw5rxj6mG8kCmMcEcR9e2Ntm5QcUg65Q9gUIA9gxfJdNM95IPypwchX7n9NrZ443roXfAbr1D7zRllf8ZwHj0VhXiuLUby/w0cTShePrXfyKBXr0q5YvwA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=UaXXmrP8; arc=fail smtp.client-ip=52.101.229.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="UaXXmrP8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IBG3s4PSMAddqSxknQzTps6JMmr1dU4niPVY9uaV8GUKAVHT3YMWhWBn/RIzTifBPxGxx5loomcikBEonJ0CjXlk8PE3/No6WKq72Gn1navldGUKu1QPmkF+/XM1dB7WEk408jRGiCUNgSioadjpZAVoYrIvkDNnI5vhbgaEBT59AArrnly4ZJ3KVrM/+lS5svp3i9cFFHvPw1gMK5uNd6oms4wb3AXmY+JHGlBSNLd/G4H20g2m2+4KjVZ57JoVvgVIVv6pXANCwjoul/1Qhwn5V7E2/23SMxEflyTWAsh+UhXXZIU6wEJqQyCclmWmQxcTuut5W40PTFp7VVb+pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vFhrxIaI9Wh7czH9kD1YIzhBdUSRYnFDT94if051Ax8=;
 b=v7ME+f7o9vs0Ts/jctRAAPDrGFmjVZLTxdIzkXUoACXQ3PUa0RwP9MrHDWk++13/4Oo7eKsluuwIImJTKAnJSpplZOjCP/pBC+XEekNxtFaw1Prx5oP8+K9neJxuKgRnflFgowZIKdZ//CM5CanUv2ruzzcS1XT+DFEeyalObkaxGH7SmzP0PUhb5E6yyYxsETaXFD0wsUeodxpQ9SGKRXCm05GM1WbEn1iI0/NwurhQyiHy5JcK1dklKEdkQT9mg0v/BIpbvIjoVfkdrO3drbkaPv30QHe1XyD+aVmd4+Xet39oUMZ8VExb88t5jiEM5SNDercPg24etvx+6/aXRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vFhrxIaI9Wh7czH9kD1YIzhBdUSRYnFDT94if051Ax8=;
 b=UaXXmrP8yjYskjWE9z/ThgcNc23oAqJUmsbHShAnuih+vPGVoU6XlD/WN3xwMuwnBsrTJaEkxI9+AA3OuRFkbvy6C9MR96eU8hCE6SlOj9JErMXpZhz3wsZtn8ybAU+ZXzvuih/L4es35kehFjqQ7xEmKbN3A/9FCeL03NcSmHE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS9PR01MB12421.jpnprd01.prod.outlook.com
 (2603:1096:604:2e2::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.32; Tue, 1 Jul
 2025 00:11:15 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8880.021; Tue, 1 Jul 2025
 00:11:15 +0000
Message-ID: <87jz4shisc.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 10/11] ASoC: soc-dapm: add prefix on dapm_xxx_event()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87y0t8hiue.wl-kuninori.morimoto.gx@renesas.com>
References: <87y0t8hiue.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 1 Jul 2025 00:11:15 +0000
X-ClientProxiedBy: TYCP286CA0195.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:382::13) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS9PR01MB12421:EE_
X-MS-Office365-Filtering-Correlation-Id: 50484d74-bf7b-47ea-1bba-08ddb833cbb6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?c7zvVEGeJnU/TBh/VYQSsKqPHT3FgQmXQgZmd4YChO4vxNwDaR9s8effz9RP?=
 =?us-ascii?Q?VNR/ooIfWwbebunCjLkNS+neCDhJxaw0CY8AT3R2lcAAtR4s9Bsg3mfHl9bS?=
 =?us-ascii?Q?rwagJN9RMv5KsDF12aAPJcGZJDIvmJ0NgOsg+xM1TPcYPY1/81mxLHULZCjH?=
 =?us-ascii?Q?vbsqkvcC4Xcqty8ItwVZykv0OMuzkllZ4UOJJzdhQ4xe25im5zRvcGT23wWQ?=
 =?us-ascii?Q?EI4VDpYj0ZsMnv21ByUG//zHIRdV//qJB/W3yiXMzI0EZLlMJQFyyUQmb4XI?=
 =?us-ascii?Q?5B6DycVZ9rnB4Keoo0ty1FZ5RVDWD3qbfNDogqe6l+sf4f4ryeAPKmsBGvyJ?=
 =?us-ascii?Q?3MqTX7CFe0QWKfBTZPEBtzONW4ezrvmseyM66blrB5OIfLIgPNgzJZ9KTR9k?=
 =?us-ascii?Q?rKNbaOP9ieHdIbtlnuAawf0gU24lvmvwDn1a5SgjXN58BZqGf/nbgyTyi5VF?=
 =?us-ascii?Q?o85dwb4eM94N1F8VAZUjbLHUFwb6t9yGSBIIiig0Kx/D3rt/8d41/l1Qed0B?=
 =?us-ascii?Q?nxiAAlHIDh2fBYAIGq1oS7PhV/AJ7U/sXt/16hrPFVv7PwwzaUf5RW0x3kmm?=
 =?us-ascii?Q?JYBQ83XT1uGaphpOh762AuJZPPp827RyBd6nyJfXL9d9A439PO0401Kuzozr?=
 =?us-ascii?Q?FuAzp0sCguvVNNHXKvLw8wHBzYRry+MXP75P1Ew78IpxCIcAkKXHvOzZp5Ej?=
 =?us-ascii?Q?bPXLf8D5JynUEHuS7Tw0HkkfL23ed+ZUJIkTeL7TPTjNycTjq6DRIA/OUFoy?=
 =?us-ascii?Q?gbh9PAqfqjVIZc1yi+uBtCdrZ5d0TEnpimZ04G8atbVh/K94riNXPlhvnEid?=
 =?us-ascii?Q?36qM5kPlVhJE/fmo8MhBvpGPFjYhe7TBxOD0WDfi6ekb91NY6KCl7PME6NnK?=
 =?us-ascii?Q?TA59fdaBiv6FVDqaMSxoQXTQziyFiGeAYOa67cG7swwDH0IcqZW7okJiqAR/?=
 =?us-ascii?Q?3hBwpcDHI1RBl0MIam73sj4ba66whF0e+dfNlcR6G/pz8KQPh/imMUNm/Mn1?=
 =?us-ascii?Q?VyTyyahVS6v1YwrPnHaToAjfas85H3/shlJttbqgueKXG2Z8BNl9Kq0Ur+jg?=
 =?us-ascii?Q?/f/Y7zYV7LHlNeQbdX2hkbQVAiZvryq9yDQlCeOPSh9g+SzyGUaexMVfORrD?=
 =?us-ascii?Q?ziJexZNHbSeB/1PwR3G/YR5ROs6mWs0uy/HLspN6ld1vazzODIAl1v/j0sCw?=
 =?us-ascii?Q?z0v60TTDNfBUL/5PQMJ/wNlGmjTuh1+NlrclnfZbmlqZZ2WgY4IxlT7Ai5Eu?=
 =?us-ascii?Q?6YuD1eMlvnzR7QXMWWiR/SjHiDnCt8rdmy1Vq4ATmYJIuq9Dz/RXGdEOvH20?=
 =?us-ascii?Q?c1LT69lcRzZzKRM1PZS2amslDFa/eg2uTuIHF98cay10249klOudszOGHY2m?=
 =?us-ascii?Q?P4cd5Jkfbgk9S3VuNacsVUITm3UEA2MpgbsMNbKFqQP88jJoodWPMKPVGYmN?=
 =?us-ascii?Q?uyK8JcathUfLPV42hrANKKMvuFk/IHiCMsrygJpo7sagimfsgbdzdQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2JICK8AtgiyiVa5kxJjXJE3gwNC5lODFhP9dL4xlvJ54lVByTSV9Mn/1DiAX?=
 =?us-ascii?Q?9pBcggBb5ROHX4oKGaIT+ObOtBI/CWpFshGB4kGnDiS/3nr17ftwRf6h7lRn?=
 =?us-ascii?Q?FHNt4LuI8QHexf9bOKPOqg84ugEwFbKA/8E+F67gp/XlwjPqy/gzTBHVCyA1?=
 =?us-ascii?Q?akGk1WOAxBQYpYPEmQUsV6KABF+X3l1BwLiFRAoOlzn6gjohNs1hpp4PeD4K?=
 =?us-ascii?Q?6jdQh5B4Q3bBcvcTDOW4KDv4wt/Yixc2i+XCrPSd8jAEdPKcMJkBt2J5o3KW?=
 =?us-ascii?Q?B3FmdoV3vZQ97rDU51MyGzKRoZrxsf4vfpw/MFZDJM0Kp1DwT121XvNYPePz?=
 =?us-ascii?Q?gZfyG0TSzhVFg4pYAk6Kv4bJaKkMUMpziXDvvtKlu9NlZ/kh4QWPQmauiKhy?=
 =?us-ascii?Q?+qo98lSSSXrHXYgGH4DUN4E2nzs1m0K4qjUMKGkW+i+r+h5FWRynezPT8oOb?=
 =?us-ascii?Q?sLhrA/pCwWmdjDyrDtRGhRX+qkAfsIx5TpogZvZjcKfu/45JiJkVA6X5iUYH?=
 =?us-ascii?Q?PnRGGfbuiRKl3d1eND411PrRc9cok+wj1330h2Cur8BmlFIwHVbs0PVOeAlj?=
 =?us-ascii?Q?htMlZLmvqqthSVzPA2+sCnvAPYczTrxqdaLlXqm+OZ6uubtCUlf9e4Qgqq4L?=
 =?us-ascii?Q?pq83DqRo9xv36tNdf7Qa3hsHq/N2mA3g0m4SsC4ZC5XGh+9XDhU+35RNl4n5?=
 =?us-ascii?Q?DVcSNZtn6USP07VZy3PqhaillvCJhbexZP8T7HqDVTGqgzqxJOSFPncBT0nL?=
 =?us-ascii?Q?U7CClJ7+LD4A6ahDHH2khsaA/i7kPJrlbtkF9YVsM8ipGhdGjBws4n4Zi9fm?=
 =?us-ascii?Q?iATbGgoFWIJiiOWhYOQjiyl7E6KQ7HVR7JMdMc+PHF3GJVRaPyFNJuTaBSfu?=
 =?us-ascii?Q?P/Szt8pBwj+KifbbSgMRX7OaDgJy4jrRcnLcEgVzH76GT8ze+HF5SZIpgUuR?=
 =?us-ascii?Q?ZuPb0AUUcpXk1nwLxuhN38KtbAjt18VZwMoB6sRbmvdq0BG8jzVizrxjUmzC?=
 =?us-ascii?Q?QrC6wdrczSDQXAoPVBwSQku5LuzbIBStDpaAeVXQk0aCkvm1AVOsF9Y69BMB?=
 =?us-ascii?Q?Rs3JHt5pY5IQfM6UCMMZFO52cqJNnPGQwN4aJ3nIdqE/LM0Eg17kTNt2prjq?=
 =?us-ascii?Q?msqrmeNqGRC34nrxpVs42JgmXXdXG0mDZCtdcmqrYNveSBLUNwO7St/KAk3I?=
 =?us-ascii?Q?T4XJW4RiAGWSCE+v5oZ7c5e4oAFYL7PzAXG7ZHVNPadgQAB9M0yNkQ8VFaJZ?=
 =?us-ascii?Q?6qXlUGP8/kEFDO5o8Cegy8OqWnKNjxPPCxH3wcSGbSfvGxEoxmN4peUlZwyP?=
 =?us-ascii?Q?T8gMQBDuqvJ1LrTSihkaj7pdIiK3oqRtVnTbuzhxdyb6sIZD4UovLSlcwBFJ?=
 =?us-ascii?Q?Fzknthy1onhOTjc1G7orqWVnUizBm6dWAFBHtn8Xh8lrkzGQu2UbCCiDC4EK?=
 =?us-ascii?Q?iBPytrB2VzLMHKMmGGLwcH4QhGyB6BfdCMGQvNM0wzwNimfsPNtN6m4OIAFz?=
 =?us-ascii?Q?WrhFsIdqAl7n+PaOR8ckDgdrNvV9rUs5WeB30hoyKyS9rpPb8o5p4Gysftgo?=
 =?us-ascii?Q?eiGAnO84LGWP1IawTpCwUDau3BUJLozLclOm8Ap8BZPY4wfCp3PhxjdzDDEb?=
 =?us-ascii?Q?P00SQBP0Bz6vfMuLP338ymQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50484d74-bf7b-47ea-1bba-08ddb833cbb6
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 00:11:15.8590
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o8BzeWjSVqZiNYtRY8rbdNVYrVlkh0BhvjnzVTOUj60pVQ68QMYZigxRB9uZBGV56SQPTp3cmDne8L5l15AhpYQII/YZkBJwjLZ04beRlzJWNH1g1uzuW2x9XVGofPak
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB12421

dapm_xxx_event() is global function. Let's add snd_soc_ prefix.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-dapm.h                  | 12 ++++++------
 sound/soc/mediatek/mt8188/mt8188-mt6359.c |  4 ++--
 sound/soc/soc-dapm.c                      | 20 ++++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/include/sound/soc-dapm.h b/include/sound/soc-dapm.h
index ee77a80765c6..be5ecc276562 100644
--- a/include/sound/soc-dapm.h
+++ b/include/sound/soc-dapm.h
@@ -295,7 +295,7 @@ struct snd_soc_pcm_runtime;
 #define SND_SOC_DAPM_CLOCK_SUPPLY(wname) \
 (struct snd_soc_dapm_widget) { \
 	.id = snd_soc_dapm_clock_supply, .name = wname, \
-	.reg = SND_SOC_NOPM, .event = dapm_clock_event, \
+	.reg = SND_SOC_NOPM, .event = snd_soc_dapm_clock_event, \
 	.event_flags = SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD }
 
 /* generic widgets */
@@ -312,7 +312,7 @@ struct snd_soc_pcm_runtime;
 #define SND_SOC_DAPM_REGULATOR_SUPPLY(wname, wdelay, wflags)	    \
 (struct snd_soc_dapm_widget) { \
 	.id = snd_soc_dapm_regulator_supply, .name = wname, \
-	.reg = SND_SOC_NOPM, .shift = wdelay, .event = dapm_regulator_event, \
+	.reg = SND_SOC_NOPM, .shift = wdelay, .event = snd_soc_dapm_regulator_event, \
 	.event_flags = SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD, \
 	.on_val = wflags}
 #define SND_SOC_DAPM_PINCTRL(wname, active, sleep) \
@@ -320,7 +320,7 @@ struct snd_soc_pcm_runtime;
 	.id = snd_soc_dapm_pinctrl, .name = wname, \
 	.priv = (&(struct snd_soc_dapm_pinctrl_priv) \
 		{ .active_state = active, .sleep_state = sleep,}), \
-	.reg = SND_SOC_NOPM, .event = dapm_pinctrl_event, \
+	.reg = SND_SOC_NOPM, .event = snd_soc_dapm_pinctrl_event, \
 	.event_flags = SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD }
 
 
@@ -630,9 +630,9 @@ enum snd_soc_dapm_direction {
 #define SND_SOC_DAPM_EP_SOURCE	SND_SOC_DAPM_DIR_TO_EP(SND_SOC_DAPM_DIR_IN)
 #define SND_SOC_DAPM_EP_SINK	SND_SOC_DAPM_DIR_TO_EP(SND_SOC_DAPM_DIR_OUT)
 
-int dapm_regulator_event(struct snd_soc_dapm_widget *w, struct snd_kcontrol *kcontrol, int event);
-int dapm_clock_event(struct snd_soc_dapm_widget *w, struct snd_kcontrol *kcontrol, int event);
-int dapm_pinctrl_event(struct snd_soc_dapm_widget *w, struct snd_kcontrol *kcontrol, int event);
+int snd_soc_dapm_regulator_event(struct snd_soc_dapm_widget *w, struct snd_kcontrol *kcontrol, int event);
+int snd_soc_dapm_clock_event(struct snd_soc_dapm_widget *w, struct snd_kcontrol *kcontrol, int event);
+int snd_soc_dapm_pinctrl_event(struct snd_soc_dapm_widget *w, struct snd_kcontrol *kcontrol, int event);
 
 /* dapm controls */
 int snd_soc_dapm_put_volsw(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *ucontrol);
diff --git a/sound/soc/mediatek/mt8188/mt8188-mt6359.c b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
index a2a76b6df631..ea814a0f726d 100644
--- a/sound/soc/mediatek/mt8188/mt8188-mt6359.c
+++ b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
@@ -408,7 +408,7 @@ static int mt8188_mt6359_mtkaif_calibration(struct snd_soc_pcm_runtime *rtd)
 	}
 
 	if (pin_w)
-		dapm_pinctrl_event(pin_w, NULL, SND_SOC_DAPM_PRE_PMU);
+		snd_soc_dapm_pinctrl_event(pin_w, NULL, SND_SOC_DAPM_PRE_PMU);
 	else
 		dev_dbg(afe->dev, "%s(), no pinmux widget, please check if default on\n", __func__);
 
@@ -510,7 +510,7 @@ static int mt8188_mt6359_mtkaif_calibration(struct snd_soc_pcm_runtime *rtd)
 		param->mtkaif_phase_cycle[i] = mtkaif_phase_cycle[i];
 
 	if (pin_w)
-		dapm_pinctrl_event(pin_w, NULL, SND_SOC_DAPM_POST_PMD);
+		snd_soc_dapm_pinctrl_event(pin_w, NULL, SND_SOC_DAPM_POST_PMD);
 
 	dev_dbg(afe->dev, "%s(), end, calibration ok %d\n",
 		__func__, param->mtkaif_calibration_ok);
diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index d612dfbd245e..e8bd83fb9ef4 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -1537,8 +1537,8 @@ EXPORT_SYMBOL_GPL(snd_soc_dapm_dai_free_widgets);
 /*
  * Handler for regulator supply widget.
  */
-int dapm_regulator_event(struct snd_soc_dapm_widget *w,
-		   struct snd_kcontrol *kcontrol, int event)
+int snd_soc_dapm_regulator_event(struct snd_soc_dapm_widget *w,
+				 struct snd_kcontrol *kcontrol, int event)
 {
 	int ret;
 
@@ -1566,13 +1566,13 @@ int dapm_regulator_event(struct snd_soc_dapm_widget *w,
 		return regulator_disable_deferred(w->regulator, w->shift);
 	}
 }
-EXPORT_SYMBOL_GPL(dapm_regulator_event);
+EXPORT_SYMBOL_GPL(snd_soc_dapm_regulator_event);
 
 /*
  * Handler for pinctrl widget.
  */
-int dapm_pinctrl_event(struct snd_soc_dapm_widget *w,
-		       struct snd_kcontrol *kcontrol, int event)
+int snd_soc_dapm_pinctrl_event(struct snd_soc_dapm_widget *w,
+			       struct snd_kcontrol *kcontrol, int event)
 {
 	struct snd_soc_dapm_pinctrl_priv *priv = w->priv;
 	struct pinctrl *p = w->pinctrl;
@@ -1591,13 +1591,13 @@ int dapm_pinctrl_event(struct snd_soc_dapm_widget *w,
 
 	return pinctrl_select_state(p, s);
 }
-EXPORT_SYMBOL_GPL(dapm_pinctrl_event);
+EXPORT_SYMBOL_GPL(snd_soc_dapm_pinctrl_event);
 
 /*
  * Handler for clock supply widget.
  */
-int dapm_clock_event(struct snd_soc_dapm_widget *w,
-		   struct snd_kcontrol *kcontrol, int event)
+int snd_soc_dapm_clock_event(struct snd_soc_dapm_widget *w,
+			     struct snd_kcontrol *kcontrol, int event)
 {
 	if (!w->clk)
 		return -EIO;
@@ -1613,7 +1613,7 @@ int dapm_clock_event(struct snd_soc_dapm_widget *w,
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(dapm_clock_event);
+EXPORT_SYMBOL_GPL(snd_soc_dapm_clock_event);
 
 static int dapm_widget_power_check(struct snd_soc_dapm_widget *w)
 {
@@ -3668,7 +3668,7 @@ snd_soc_dapm_new_control_unlocked(struct snd_soc_dapm_context *dapm,
 		}
 
 		/* set to sleep_state when initializing */
-		dapm_pinctrl_event(w, NULL, SND_SOC_DAPM_POST_PMD);
+		snd_soc_dapm_pinctrl_event(w, NULL, SND_SOC_DAPM_POST_PMD);
 		break;
 	case snd_soc_dapm_clock_supply:
 		w->clk = devm_clk_get(dapm->dev, widget->name);
-- 
2.43.0

