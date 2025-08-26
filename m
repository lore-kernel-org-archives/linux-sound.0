Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010057.outbound.protection.outlook.com [52.101.229.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B0D62F4A11
	for <linux-sound@vger.kernel.org>; Tue, 26 Aug 2025 06:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756189344; cv=fail; b=MxgkM2jd4YL6zRK6GKWcdvygT+UwlSQ34/vzehQuwmeNkN8+Q9iIGzRs/tBxRSAw9E2wzA1XYdCsyogRhCfi8u+VysJ6+ZAwMN/rpDEghbG8QZ1srOVCDD8G8WZGdCm/Qq7DEpDjH6sk6s1I6jAqe5RnoTXMK9Xl+m1XRhcK7pg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756189344; c=relaxed/simple;
	bh=sBs//B6YBLJ2pwuVS69PvlHlvXJnt2obIOSqvrsPkbU=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=tVBIzyR3LKNj3Rlty2xWbnYq1VB9fCpvVic72GOvcIQXQSTTs07JGXEq3yn2kuVNGGxnIKCBiki5oXvwSq0sAFWj/b3t46eN/OKUzjfoGG5bMM1L9HuK44s4C3ozPuAs74U86L8NlPYs8ad2OuAAi3V9I/+yxQjSuSZKsmmDWC8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=d0fkaJDz; arc=fail smtp.client-ip=52.101.229.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="d0fkaJDz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E8LzmQ5UoheVdJvk6oDR8FfSxapa0B2IEEF8gS6yRCLZjYF1ruFIx5+PLVfRONfFL7FhEDSyKh0wixnhxzFABw5euRpgyBO1k6r4HPpgUHlgoXMojwNMaQlXc5RHcb3tqNPtVxDfBljChMVo6ciQ1SjeInLs4hizkjjLwNjvBNmqdAD8PhQ2RzcH3c/0ExflQLecpJ2voZqyw3Q55jrFOD2gvzZGD/moZ7pkQm1NbLsMEfX33Z2LXNRfGNhw9DHjmp6mcnMPZ46+kncYueHb1LPa3zeGyDmlMXmlW7a5cVugDfzi3UoWF/K/YKesLWHbBwvY/CoxhK/ZsXMD/6YObA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bMJJjWBNSOulbm3He5xAXQBc3Xrsf4uMfyMqx1cxVRs=;
 b=zP/v/VIxIC2MEYmbvp+uprQd5Y5nsTzNiOIJyRLZ9rqnDeNC31T+Ffz52PanMUzY0rbcPlRFFs8cXIMSnMolsgf+5WOmEjum+tLY815lIU8XWpmVjHWj/Hi31kU+SpEORQP3Q9pHGZrRl3Q8oO12HCSeNuANhHeQgPfEzIhXtkcvFa03s3sFENSlydzAzTZV27tCeGOkmxmnqjbiDecuQLuUSMu/5AMDbGiJzHDJjDNjRWYh7Vxi5lBVAidMkWiGOp11WFsTXJGL8DoB3bOVyBxZi1+fLTzpz4WVSLA7P1QlLIUBlZcmltR1bJfkAntEsynwQck/YvJqUzNzSbhwtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bMJJjWBNSOulbm3He5xAXQBc3Xrsf4uMfyMqx1cxVRs=;
 b=d0fkaJDz9QHgvMgTkTaxaReu4m+TV0KpbGyfU/6CrUu3A9gWK+/KK9IS/M7x+bMNnLMqCjouIhPltpb/0oDiy+IplsbFKkjd+1WkIcEogdoqSogHYmMcgWR/oVVY2JVQ28RK7iiyywqHTxeY8xi2ekH7bRNQo0ixqzU49g1iYrU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB17440.jpnprd01.prod.outlook.com
 (2603:1096:405:354::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Tue, 26 Aug
 2025 06:22:20 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.9052.019; Tue, 26 Aug 2025
 06:22:19 +0000
Message-ID: <87349ey546.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 3/4] ASoC: soc-dapm: rename dapm_kcontrol_get_value() to snd_soc_dapm_kcontrol_get_value()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <877byqy54y.wl-kuninori.morimoto.gx@renesas.com>
References: <877byqy54y.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 26 Aug 2025 06:22:19 +0000
X-ClientProxiedBy: TYCP286CA0283.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c9::11) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB17440:EE_
X-MS-Office365-Filtering-Correlation-Id: e57dd3d9-b4ee-404f-995f-08dde468e944
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?CCyLO/Noukj91Jcoivc4jxkVw+fqDzD+OYbGMgW36CRWCCHV/47U2KrzUEdc?=
 =?us-ascii?Q?uMG8oUpuLknoDLu83co+vjE/Nrvmnsrx0AFBgYgrMRkfZkXRZJg/663Efo2/?=
 =?us-ascii?Q?CWbkI/wZ7OCSV//0B5GW5p6+9HxBRWENwx+nPFnObSlY92JJRWKdIMW/+3lN?=
 =?us-ascii?Q?Onb6nYRlDxn0yC3+TDt0Xic7XSHb8xOdxbba9HSgaFOi4L1ZBMmGfAESpuHo?=
 =?us-ascii?Q?db1oe4boRdN+tTjpQHPo1dx0W4NVXKrTjNgpfSoZgHtOeZ76I46jxoh7x8Ca?=
 =?us-ascii?Q?sym6yVDna+L9vT8DIXzeh3/Jp4GacVYTV0fHvrBvipyXKF4EAFYSSOU9SkPf?=
 =?us-ascii?Q?oQKcC6BhI3B7h/mIJYeP3hBP6DQsmhFTSviQ4n4kDwSnrCF1oFlHq1O8ZVGm?=
 =?us-ascii?Q?E/y98t5Gczymtrg91Xg48bpUVxKZyiKwZBXDSBseTd0fsBpsEmbkoxI8Q/Ff?=
 =?us-ascii?Q?scWk9GSmHbwyX0s+bzbxxpmHzto+8cBHMUUCX59n8Qhyjoj12QQbPcNoz9iQ?=
 =?us-ascii?Q?uED8UzpVlxQWENi5F5L55ls29EsI1TqawITTq80H88YE3NieaaCClB1tUxvS?=
 =?us-ascii?Q?Hl6wwp3COL83X7uXl7P097el6TWHCDE8nTqH6+aujTcQ7i7JDfXpKE3WgJ9D?=
 =?us-ascii?Q?heOA/w/x8MNCbN6MPwMXfiBsB2WLmsBq9jHeIeMKbKefG4iDlT51bzb/e3D+?=
 =?us-ascii?Q?HSpA5anucan+YdyJBZeNCGXBJEHDqqt7QhjQrHs8zwa6uP47A+whjdFA0EMN?=
 =?us-ascii?Q?bIQW2+EviNvQoWMsGPOVbKDJSS9DRj9jWsr42hq+N5G62IfDaaQsdc1EA9hj?=
 =?us-ascii?Q?mKwbe3BYmjir/+gkVx1LNEgN5ZvNWtw6kCoxoPG7ZLzzFTBIUqxj9JAhtWVi?=
 =?us-ascii?Q?6dHIXGonwZDp36kXGjVgxqkdBBsi+FoNiAwfx9aHHIy155c7k0062urz19z8?=
 =?us-ascii?Q?u0M/adx5/7MSoLYwFkXvCUx02qlkJlZBrMEvbss3EH19UYMJZHo2q1++vDOH?=
 =?us-ascii?Q?YP5RTE1a04NFow4Js3ueemiKVW6jFjwRdSr8x4ZpOcYLC+87adX1ENKIJxfT?=
 =?us-ascii?Q?fwJFkVKahcQsfEDJpGw0bIOI3JuSmCfrXRlprbE+oJ4p9gYuyhW/DVWfoK7X?=
 =?us-ascii?Q?8ewy3Rsmroqr6w1A76uwb7oNceYv9MEqY6lpq2jw3AZx7NfBqydsckT7nOnv?=
 =?us-ascii?Q?W2hPqbJh9x1+Tf6XhHAtvZxM5XlJj1z3LRy1woGo7e8zCtPQEHVchhFOJf7Y?=
 =?us-ascii?Q?1uaO6Mqw6+IEFJob3YSUWbFPcfvUr6DG8trh5fZ+YEe+p08J4BksDMxkugFp?=
 =?us-ascii?Q?IQ2A2Ssb89JuDwEY/xc7/PLis+/8Ze1jjOxaTebKmHkjZVM0oruH1DRHvdWf?=
 =?us-ascii?Q?/lBR3lyZxnyx0qEtgpXPi1fa7f8QHUhUc9B+Stn2cv1bp7FxEINBuA5S6pNM?=
 =?us-ascii?Q?RuuMaIEs8RwvInpXuf8JBLpqmnTBpbDTRSdbhi51N9Xyx5ihMoVg0g=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cA5yZv0snQ2dnIU5+ohxzJDQFwbK8Wks+r2q7ixaoPDCw8o19MFZf6MnbtWS?=
 =?us-ascii?Q?pU84fsg4SVJMBCWiUQI4xNJUN8A/wHIBtVpXbzr9tYsjpkoVg21ivnZLxEJq?=
 =?us-ascii?Q?Yt0hCIdPua2rbYkKINiNGBAVOFibCu5E8BurmesWRPaXiOSoEDqtRe7GIkX5?=
 =?us-ascii?Q?wpHI4jU5JyiuLeCPIPIQ8MszAJqZ+Ey4GAkf8QJAa+Bp5T8c/IP+sTx2MWQ9?=
 =?us-ascii?Q?O5oOsmP8W17YNoXgJP+KN4GNrZFSqohci7PPJVLTKhPTj4HJsa7OlH/ILE7I?=
 =?us-ascii?Q?oBJQN81sDo+CjvCZeFnZPgjeJ63UR7jWRTgKY91bngNuSGYbYwtRxn6yz58C?=
 =?us-ascii?Q?Gfsm5yyFi/kMDXfvvrhTpCviBj60AbZSDSeRSYF1MHjZ7y1cn4rsqPmJjMXu?=
 =?us-ascii?Q?zaYSHDcuy6JKT1KeKCfN3RwDCxMb6vOYpg5F94UMrfsyMAJu53TkCgDW5CqJ?=
 =?us-ascii?Q?n1g3FEvKeEgBRWPuNm7HdbJ8WK+RgKnncmwloyfi/IiM/GG8lMGGZeBTLhMv?=
 =?us-ascii?Q?rzYVbt5lzN8pDoAQDBIfFLuNyBZ/dRhc/fjvGlAHu1o+tXy/0tLGtMSp22Nt?=
 =?us-ascii?Q?2puIHcDwPD+r86aT4r12vvjld8NxztdDePyVR64POALN+ElpXzjxO+F2sudY?=
 =?us-ascii?Q?vUY5BjyNXIyWHw6v6a2Bo/zTHUOUq6OJstJIvlHJASEk3dGjPV+tXpZpzjF9?=
 =?us-ascii?Q?W0bBl561iHeIg0EBwHBC8whsDIags1bjRaKPCtVvFa6tc1tntKHGQogv5Hpn?=
 =?us-ascii?Q?rN78AGf5fz2TsiNvRBiIHQU00sb6DU+6aEncUxrVowf695mKn306yFqq2ezN?=
 =?us-ascii?Q?V5CB8jiDre5fSG5LT6EmmNOCCD9h0PSHQmNiw8uZ0BcdZU+7/jWy2YSWreCx?=
 =?us-ascii?Q?gMgzx/rG61fg7oqjLRP9laLOmsE1OEQW4KPhVw9jOXdqgyJx8JBqvnSBVeA0?=
 =?us-ascii?Q?DNsf8HmrG3yON9I1aawBFeGdcEaYbwsRU8eIzHbjgNsHhfI18mdCWEVr7Uya?=
 =?us-ascii?Q?SnKnfJVGClmxHWXE/0CkDEWLURU47RTA3rCYWGOOwMvyDXAmgYAel4yZdryA?=
 =?us-ascii?Q?LIujj8ZslAXA9XaKuZL7g+tjs83+F10A1nB96l5pko4eVhmWjrEQ6ZqSrQUF?=
 =?us-ascii?Q?Ugbhm+eNLT6vjnvXfCIL9nHErz+zxSGFSbDr47Yed5iCSn8Ml1SHqZM5UR3j?=
 =?us-ascii?Q?7ZiterKzndsL3/h3wj1QF42xbeUo5CDL31Z2jBapjs98LhzxFb6C0SJkKb13?=
 =?us-ascii?Q?fyO/y4ieUG9XqdbZyttf7S+o6wVmwp3XRkNQRfCQ0VKk8tAHkr5OJ0VV0Fb2?=
 =?us-ascii?Q?Bcq1CM3t/xn1H92T2+6K57sVjRsbumz8zpxN3HWZ3RLdwQcaFaBGrvY+iWNJ?=
 =?us-ascii?Q?7vhdLoh7tHIgHE0v+5VQHKjX5RgR+Ri550TDo6xA2QrHxrJe6LaKdUKgp2eZ?=
 =?us-ascii?Q?lZQH4iVxjEhKJ6GaUgxhhKRel3s/k7j0chqITAfrQC3eUv+ETttMMCXdw3h0?=
 =?us-ascii?Q?7jUcZhaRk8LrIs2iCOdCr85nFKU7tCsBFTtF8BHSEcFtdGfqFMyRgnedY3YZ?=
 =?us-ascii?Q?vnS3xL+ewG/M7OH2nDMQ2G1gCQ5PUlTW/x6NrO6/hZha250+QFrsx/cEywqD?=
 =?us-ascii?Q?0boBprf5eKoq4J15TPTLLVg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e57dd3d9-b4ee-404f-995f-08dde468e944
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2025 06:22:19.8982
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iw0AX7LF3pudmfI5STFIbvJrmvvuddRiuKRCtMVYTh/W3KSbmDchhOCzpW1yxRk0KMOk1wPhmFSwoc2VbOe1fqs6/tSPBCQj4Llhc2Bh4BazOFP60bqIxfq9R+1re/0z
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB17440

dapm_kcontrol_get_value() is global function, adds snd_soc_ prefix

This patch keeps compatible by using define, but old name will be replaced
on each drivers and removed from ASoC in the future.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-dapm.h | 3 ++-
 sound/soc/soc-dapm.c     | 4 ++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/include/sound/soc-dapm.h b/include/sound/soc-dapm.h
index 8add8de7a8c94..cd02fedb2624d 100644
--- a/include/sound/soc-dapm.h
+++ b/include/sound/soc-dapm.h
@@ -699,7 +699,6 @@ int snd_soc_dapm_sync_unlocked(struct snd_soc_dapm_context *dapm);
 int snd_soc_dapm_force_enable_pin(struct snd_soc_dapm_context *dapm, const char *pin);
 int snd_soc_dapm_force_enable_pin_unlocked(struct snd_soc_dapm_context *dapm, const char *pin);
 int snd_soc_dapm_ignore_suspend(struct snd_soc_dapm_context *dapm, const char *pin);
-unsigned int dapm_kcontrol_get_value(const struct snd_kcontrol *kcontrol);
 void snd_soc_dapm_mark_endpoints_dirty(struct snd_soc_card *card);
 
 /*
@@ -720,6 +719,7 @@ void snd_soc_dapm_dai_free_widgets(struct snd_soc_dapm_widget_list **list);
 
 struct snd_soc_dapm_context *snd_soc_dapm_kcontrol_to_dapm(struct snd_kcontrol *kcontrol);
 struct snd_soc_dapm_widget *snd_soc_dapm_kcontrol_to_widget(struct snd_kcontrol *kcontrol);
+unsigned int snd_soc_dapm_kcontrol_get_value(const struct snd_kcontrol *kcontrol);
 
 int snd_soc_dapm_force_bias_level(struct snd_soc_dapm_context *dapm, enum snd_soc_bias_level level);
 enum snd_soc_bias_level snd_soc_dapm_get_bias_level(struct snd_soc_dapm_context *dapm);
@@ -731,6 +731,7 @@ void snd_soc_dapm_init_bias_level(struct snd_soc_dapm_context *dapm, enum snd_so
 #define snd_soc_component_init_bias_level(c, l)		snd_soc_dapm_init_bias_level(&(c)->dapm, l)
 #define snd_soc_dapm_kcontrol_widget			snd_soc_dapm_kcontrol_to_widget
 #define snd_soc_dapm_kcontrol_dapm			snd_soc_dapm_kcontrol_to_dapm
+#define dapm_kcontrol_get_value				snd_soc_dapm_kcontrol_get_value
 
 #define for_each_dapm_widgets(list, i, widget)				\
 	for ((i) = 0;							\
diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 25b2ea14d6599..f8ecf86a3d2b1 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -838,13 +838,13 @@ static struct list_head *dapm_kcontrol_get_path_list(
 	list_for_each_entry(path, dapm_kcontrol_get_path_list(kcontrol), \
 		list_kcontrol)
 
-unsigned int dapm_kcontrol_get_value(const struct snd_kcontrol *kcontrol)
+unsigned int snd_soc_dapm_kcontrol_get_value(const struct snd_kcontrol *kcontrol)
 {
 	struct dapm_kcontrol_data *data = snd_kcontrol_chip(kcontrol);
 
 	return data->value;
 }
-EXPORT_SYMBOL_GPL(dapm_kcontrol_get_value);
+EXPORT_SYMBOL_GPL(snd_soc_dapm_kcontrol_get_value);
 
 static bool dapm_kcontrol_set_value(const struct snd_kcontrol *kcontrol,
 	unsigned int value)
-- 
2.43.0

