Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011044.outbound.protection.outlook.com [52.101.125.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8BD423909C
	for <linux-sound@vger.kernel.org>; Thu,  4 Sep 2025 05:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756963308; cv=fail; b=QWxPEXn89r+3mVuwXvNZZZuLt9HZuLAL5hnIN5Rq7UUn3olfIypZ0GLS40IzmU2sdfkSM5W0sAQQKAGqRTLMpImvLvIQca0Mch7L23ZLU+VN9eNvF8kRY4gsHbQs4vs6gt8z5dlm8nEyik2mLqty7lQHLR8plZz0JX4BmN7uqFY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756963308; c=relaxed/simple;
	bh=O3DrYeomF4bgurXLdk7Iq8DeDJfAH/EPbOuIQTyx2No=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=W10C1MxNd4EiJo6pn7nCYYr+KwGaZvxJT2BCeGczVoJJgYGK14eLTlHD+WSf/vFGN8UG9qlPV2oAhBeqHXU/tWAfhHY21IYVCEjBMBC6bk2YFBMbye5C2RhxGSfUWc9El355+Nb5+3lCEdprHIWEHJzbVb2SX3tzpWXVU73dBKA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=MDagaVmA; arc=fail smtp.client-ip=52.101.125.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="MDagaVmA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gPeTEn3vXIf8e2Qhpft/qkOnjplCJ1uAV6RQyBo2Qt/0dIM6mI6PSoT7N69bG4O9otUM+1suIYxXmp/T2aZd3Buv3Xt4jwI5RZXWb9ym51wYaLJov7jcQlC3TgXEiieFHQMSPaaYpiN1A0157V+uUCqz9oDfjsblZGCLhUovxb3xVsE1Jj6EfJiUbDM1DmBT49ab/TF13JTl2f46pdqSqkmdVVXPzPzyNoUzsEV0JliR8UdqCasObeddMJRXZgkoGPGy/nH5x/e+sAnV5/xmDmLHPg34dEfGtizmG2MJgoVHfAXBBSUK4x9Zi0zbJb6wRrSxooZe/5NjtgKkdTQ4iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HHdCF/kcvkIQkQJQ8AyqxGarDmjAuafUYvX8Ve4nZwY=;
 b=D95yL6N9b+zdEYgb1QCoVxjS+55vKcTI/nMBfXliafysnp/bpzoHFUrnPUf/+U3xMQK84h8nZZy/h0H1EYurl5yXglmAv2H40DGW/bx3tXzBD4XHQVcjvu3hhkotGLBdydQ+qgaa/CuSYHLIobjfxbYjcYoCYQNOukD47IJDB2/EtNDgkzorWi/k3uvhbtd/AgOIVLTVFvjiTtb8+JCZMtcg/L5l7ny2VaEDPz3jZ91kX32qIGXUxJHiWRPLzuwLDEFMuQ2Bsj6jJQxppq/bbaxsQ6G6kWp+CZnNyOHY6MoFyFI1nbFgQfAouUKhQdbXgmgfRWq4B8c81pOn9hRzfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HHdCF/kcvkIQkQJQ8AyqxGarDmjAuafUYvX8Ve4nZwY=;
 b=MDagaVmAaOh+hGiIIJA9JoXswjrZNwj6/PKjX2QLuKxQuyJBI1eTxCkaJdCJX9tHMnYtlbboI3v2LwVg2qkaGh8DEPkzDeOyJ+LZpZZSt/e5xYSqo0W6PmfhMZUS2Apq4mdxEBG7/yD7eEJZtI6Kfli7pNA8Wnv0vXlC1a470dE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYRPR01MB15650.jpnprd01.prod.outlook.com
 (2603:1096:405:288::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Thu, 4 Sep
 2025 05:21:45 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.9094.016; Thu, 4 Sep 2025
 05:21:45 +0000
Message-ID: <87zfbavllj.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 10/10] ASoC: soc-dapm: add snd_soc_dapm_set_idle_bias()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87ecsmx07m.wl-kuninori.morimoto.gx@renesas.com>
References: <87ecsmx07m.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 4 Sep 2025 05:21:45 +0000
X-ClientProxiedBy: TYCP286CA0049.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b5::7) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYRPR01MB15650:EE_
X-MS-Office365-Filtering-Correlation-Id: 857d5657-7f9b-4574-9aee-08ddeb72f0a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?bhDvTlAgH+MjKoYWWZy23uBxecgfj1/SW/qVLnNqH9VVAq9XZhajbQjI4+GS?=
 =?us-ascii?Q?wQCSr+PLzX2AkP5vZ17dhbh1rg7NzmYcy/YOiMPmBHC5/rOg4PezCCOgkgtR?=
 =?us-ascii?Q?6F+ESyLE+/lCDU5sH+PmRGGwzGPr5IMrZeO4ci9Z3nMrSGnQzumv4j7O/8K1?=
 =?us-ascii?Q?HovpmhdgGbBTIk8QypquWdZhDAPnEsyP4uMhAgJwLuJgZlmSbYLRYhqpB63O?=
 =?us-ascii?Q?Uekb74mVUOlrnKtqzZvpC9cxz0HSDzeEz2opA0tAaLhjTMQTj/qqI6dUS/eT?=
 =?us-ascii?Q?HEO2djiCysEC98U5xI24ieg/a9K6MFz5xiuvv2ELgIT8PAZEnFjnRZLjHnG8?=
 =?us-ascii?Q?08spr19G9lHLH8494/qmfUBuyyhB5AIwI2i8lU47c6WzSCGWccLZAdULli7S?=
 =?us-ascii?Q?Ij2S0Sw1lWk3phAD88v+U0YfulKxUcNZT6rmok+7WqaJ3wwaimVayv6foOG/?=
 =?us-ascii?Q?dtni6TIM9ywWHoO8QF2s4E1Fr05TTrLOLstHP1gJBKCzCAY6ylnSWjRPKLUq?=
 =?us-ascii?Q?0UBnd60AiD2buTM2I4REvOkhgCJSdDllYPKVT2Puq7tr7rlsKLCv7tJMfljP?=
 =?us-ascii?Q?rC1nMo+FaHxdjpK3gsKF7j2CRGN3IW0y8GO/Q/lvrC18VdwemB5tXk3Mda+a?=
 =?us-ascii?Q?KhldQzXlDoVhhJc//bpN06g/IGOwiky1DpXVMCzGFXCO125vGjPfg7UK+97V?=
 =?us-ascii?Q?6iPU0yjCD8OC0vcHOfNfcPlFjcf8eUYkI0f0gDyuQwTH8LvRE2IU3TukpxM8?=
 =?us-ascii?Q?R8p8qNDX2b0GtdtOJVFXPcDPj13FwnkwenXx0KeBLl3DeoESmGeNV69kcIYa?=
 =?us-ascii?Q?3LlBLbClu1lTjjcbdvsOqgXQ962VjIKMuc0rEQ7pNyVDTHhp3jOFSBSjl1u6?=
 =?us-ascii?Q?6ibwI6Vo59eKKY8KTnitqDfzyHPzCG8bGzV2wjP3rMqtrMiIqwIPo9jj2/X1?=
 =?us-ascii?Q?3xkwv/J0x/sYZdJKZ67yzAWS7ES5PxYZcCifpnZtcCAG8zSa3gSj6CX3J8Nq?=
 =?us-ascii?Q?+XhTMV4AI2lWBVqmooK3sfqeBo2+3gQFFoubuZWS3tWtdYyK+k4tHJSvYzaG?=
 =?us-ascii?Q?ZXAMaRlKFLJkMvXvl8Qi8AIcoTlmyja2wVYzPKzF3Z2aglNWV2+mOR9i1o5J?=
 =?us-ascii?Q?vatV3zJnju/SUluVgri5KzlGAKgQL6now0PAtw5srlSOnmXApyNwA2lhHx1R?=
 =?us-ascii?Q?q8KGT02yheOQ1NuW49c9fthbGH1+Szcqb8DibX6psiXAKP4pK6vacChr8XiJ?=
 =?us-ascii?Q?prabln5/glgyK04+hKyrkkUjW2ZpqqCx3VxzuJ7E20GqreTVGMZ6g9OT/BdN?=
 =?us-ascii?Q?h3gxBTLyvY0XZQ7oTDi/llBptfQ8e7Xh3drRd4LT42UW4QgaUfJXs/SleNAf?=
 =?us-ascii?Q?+T5tLGzpFVP46s+Xati4xuHI9neNI/6C7b3p9kD9H0W+gugLUzhILOLcHlaB?=
 =?us-ascii?Q?PexeTh3+9AiilZqcODt+WRuuVM+B71wcpxCjfLI0DpInND6Jj5eFjQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?icvCOFZ8aQf6wSKtgPkj4fKWOD0vrZmH3u2zqSkmpGpBa6U0SU3383c+ysJx?=
 =?us-ascii?Q?jMjVb0XbHYDUdiDNb22q0xNnnGFR3jg6m27tdxqNF9LN7mnRZ9xNVk86bLkW?=
 =?us-ascii?Q?oIgPeQMPX4VJWF87QZfnSpAO1ZIsRdGpgsrTACy/k8NQcd6pEkgaabyeNcF4?=
 =?us-ascii?Q?XeDfgm1SOvaPso88NO7OCBHs0vp3kwuKbDwReZlt1J5nvBHb5msF9mH8xD52?=
 =?us-ascii?Q?kLka4hlJNZoPmYH0UYvFtg2U3l+Cs+kdo2auTsrd+kZNL/z9EQyC8ZbnZOAs?=
 =?us-ascii?Q?kuQocPsqvQz/xfVZn+CtyGijHLjgCFb5dhf2dvUiRXKg3TcZjcYrvlnJlIk7?=
 =?us-ascii?Q?cfz2Wjl7+Aq+nygb8L0SCkWZcVmARm6JWe+24+y4yTqLgp2/41kLSb41kCJt?=
 =?us-ascii?Q?oZSlmlGZUCbYSY1CtRAcB/JOuRWyjBq1HU/5jPFAgpo8aAcG1vvkS/g50Tqx?=
 =?us-ascii?Q?yoXTs+/vuTB5wiWbdFjelS5t+Xb2TfP4UQrs8dWwgA3tPilAW7AUouDG0GV8?=
 =?us-ascii?Q?U4yDvcykzAadxzKwqsumE8C5nMF8JJxrT20hI+ssv+Ql2sbZlu07zWAfJYYb?=
 =?us-ascii?Q?u6i9dYwdt5a4OmGK02sOSAXvklUzvZl6P/ZhUjub0R92YQE5JHnc2V+5mk4J?=
 =?us-ascii?Q?yhVs/w6t6v0pkG0+VAnbjPBIdt6s8O/IPxyGnCBBsVj3g1kljdqqDNGZPvsH?=
 =?us-ascii?Q?yoBAYuFrk2dmXDgEsGq0LzJZNbCPgtDesptvjHrDrTG9KuLFHedcI5Uts/wf?=
 =?us-ascii?Q?rB9lnmw+ZB/44fN/imOVvJMDz61ul46h4xfCgzfEZqQVzSu8PQz+whL4WQVo?=
 =?us-ascii?Q?asYBjtfOt9DvoznVdR/7MlFFCC9ig5/qFonZAwD5CXglK/8lZohKeveOHWoM?=
 =?us-ascii?Q?NVvWoBQCDJxFiFuPZOFLasT8UzEl8C9VSTbzaDsJ5C7OwAPj7jTdv8dpGgfh?=
 =?us-ascii?Q?dsz+O6WbSTTdo8swbH6gCEADqg35z8RcGBKoYCG8nw5AKhACjvaTJQgGA1nw?=
 =?us-ascii?Q?9uvHko2XHyF3r1xf24LReOhQBvdiOcle5OsoxHzfmuRq0vOeWHCLNR1tUypz?=
 =?us-ascii?Q?s6T/pYnwykaxUdaWbVJvH9Wf3YAvW0vfWEs4u/kOOKBtfaxg5u0BXSZpb1cd?=
 =?us-ascii?Q?XWwf9gBzX30PD3s1nqQ4dYeEPJN/Kad1BxiKy7IosE970tNmVJ9dTRjJ3mKQ?=
 =?us-ascii?Q?mgE7s7O8MpWBp28GR00y+isG7gywTLZ9T6Jp8LNEcIzcQaezuaOIrg300iTy?=
 =?us-ascii?Q?PesoX+4NMFGgXUKengAVCx5BeAvwaRF4cYIZ6tRPZLf9GEJZhpkPF+oZmVgn?=
 =?us-ascii?Q?57/RQxEqmj5ASjLHmAmx1UZuLgB8EHaumImSl/XaFEHykeIlJnM6VLe/Uqzz?=
 =?us-ascii?Q?dTzQfiPJf7sI1EUaHEZ/U2QOVB4tNNbmZxsSIzOsUPC+Lz2gHwYr9IdBf7sn?=
 =?us-ascii?Q?QjxqNaZDJJq88l8/i4lkJGbgpuKXa6qPASivpLFx41Jw+myALQrtxMHAWVlO?=
 =?us-ascii?Q?wpFmRTU91ldWcd2JmnxW7pUbYEzd/kVgaM+fbLsE4xaNbFMAgHN40uf9gROw?=
 =?us-ascii?Q?yAZmotPTgCE2We3Tx8aFjg7zoaf9Ce8h2U/wXZaWW9nSIqAc34z/aJeJYZzh?=
 =?us-ascii?Q?d4YfztlTppQsMR5LTtywmKM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 857d5657-7f9b-4574-9aee-08ddeb72f0a9
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 05:21:45.4755
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TzfXVjRYDEqh8VSd4YLqqT9UuQN8JwEL4X3Oy8tr9asC5raEEbJWUmcEgtr60O7QYo6ABnec7czUNtoCXRqB/CSTw+8Yz/9FdrYddtszhCsqwt0Qkvmlh6tAB6TGWNw1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB15650

Because struct snd_soc_dapm_context is soc-dapm framework specific, user
driver don't need to access its member directly, we would like to hide
them. struct snd_soc_dapm_context will be removed from header in the
future.

Many drivers are directly setting dapm->idle_bias, but it will be
impossible soon. adds snd_soc_dapm_set_idle_bias() for them.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-dapm.h | 1 +
 sound/soc/soc-dapm.c     | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/include/sound/soc-dapm.h b/include/sound/soc-dapm.h
index e978be4010b84..75941324886be 100644
--- a/include/sound/soc-dapm.h
+++ b/include/sound/soc-dapm.h
@@ -663,6 +663,7 @@ struct snd_soc_card *snd_soc_dapm_to_card(struct snd_soc_dapm_context *dapm);
 struct snd_soc_component *snd_soc_dapm_to_component(struct snd_soc_dapm_context *dapm);
 
 bool snd_soc_dapm_get_idle_bias(struct snd_soc_dapm_context *dapm);
+void snd_soc_dapm_set_idle_bias(struct snd_soc_dapm_context *dapm, bool on);
 
 /* dapm path setup */
 int snd_soc_dapm_new_widgets(struct snd_soc_card *card);
diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 209da43bc023b..51fb09d56c5a1 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -2195,6 +2195,12 @@ bool snd_soc_dapm_get_idle_bias(struct snd_soc_dapm_context *dapm)
 }
 EXPORT_SYMBOL_GPL(snd_soc_dapm_get_idle_bias);
 
+void snd_soc_dapm_set_idle_bias(struct snd_soc_dapm_context *dapm, bool on)
+{
+	dapm->idle_bias = on;
+}
+EXPORT_SYMBOL_GPL(snd_soc_dapm_set_idle_bias);
+
 /*
  * Scan each dapm widget for complete audio path.
  * A complete path is a route that has valid endpoints i.e.:-
-- 
2.43.0

