Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010054.outbound.protection.outlook.com [52.101.228.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C23CF9D9
	for <linux-sound@vger.kernel.org>; Thu,  9 Apr 2026 04:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775709461; cv=fail; b=OByEkAKPQ68GwcEnXTyvrN5OIeK3BLuWrW633KWGSfCrX3n/YBH+OQ2wXqn7yOtuUYT+A2lY/AMbuNcOoqVTSD5dio0gHksUodMow8YELM4lgvgKru7XrX35cZO0J1kireB6AFcdLjkxltJEi4Wh26DOYQRFT3lr7CzYZUOjHEc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775709461; c=relaxed/simple;
	bh=KlAJATVUyI2lDwoQGf45bgEjs+Kz85hmUbsuywG1BHg=;
	h=Message-ID:From:To:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=YDmKVXK+N6BQ1Jj8Ufh22otS6HK58QGarQdkkY6PHtpcvZz6+dZqOBiE9ni4K5pQU9STGa2J549hRXv/aDkiDmmWN6etfJC8T+CLUDXGNNGsTjEjHeFCXH3rZ9rrOB5Blna56cPqFm5ZD4jpVsOSOhmJLC3mDaeumblw3U1/Kc4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=hsAYePiX; arc=fail smtp.client-ip=52.101.228.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="hsAYePiX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ne6W8f59uQtxXSQQi0To748aZ/0PwNg71AD1xcFQKzQUNF/jo/BT0tEBQTX3ZFttvSl46ET2la7rsK/bRF5VI+qBIvsGMCZHTpqN9o6VvMLX8a4Sq78W0IcPmg+aYj37LL8CCektTr4adgJCqlMZdMH0oO9LqFaJKQWKuZwLfaqbRTB+CEZV8W84gMPhIps8V0DzKKpEeMH9gWv2MIUZ+eoeVgqf2CYUKS+I9EIAwTIKtzpyTfJT8XTkKRfVc5xiEqR0hsUBQQA/SKbhBbAvWyNISCmKvOn9tjGPI0R+sye427YqnoEc0vDdX0XpaMZkZfDfWyvLG8CSEWyW3kmh0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/XmnwH0LBsQhxuquKyHcgYACvQVE+X9E8wbzyvDvuXY=;
 b=M43mn/pc9zL4qXu7Qsm2/tNo7xLoaITVoZzWW1ailDtnIRh74McPmKI0ccKQL4pAM/hnUSIGG895nlPZXLqqDm6VD6DSim1MNOqbifMUvdHmseodL+K8UpZKK90Lvpfs3FdozYHgi1pRE8yikv7WdIbfVipIU6vSP98F300kvQZnmLRcpqpWZMKkaEeVfcrv0DQXo5A8qRKwIH0iX3TNCCoqZdUW+Y5CV4zpIoDR27TUnY/yCt5FYada6LmYmNAZ6pNoZQlzf1J9qyEQhicmjILNfKg/XIcba9w+7WBsrhoeMvJSTgoo5cixv427voqpfHDzor2t2ZSur9QyayuEbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/XmnwH0LBsQhxuquKyHcgYACvQVE+X9E8wbzyvDvuXY=;
 b=hsAYePiX4plFhpNqHEWNk3M7+SnIlnMc5O2Z1/Ao7lH4saV9wprMJ5qqBiAPtIaVIcDD0TZDWN9szWraAIPhVlnYGgbOYW5y6lHbxX6DsOSRMC4jw69bqew1ZxvJEcppOctZoS9RwMUFlAOKYqfn3vu7zXdfl266vL7mwa65K9A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYYPR01MB16304.jpnprd01.prod.outlook.com (2603:1096:405:2dd::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Thu, 9 Apr
 2026 04:37:38 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.20.9769.017; Thu, 9 Apr 2026
 04:37:38 +0000
Message-ID: <87cy08da0e.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Peter Ujfalusi <peter.ujfalusi@gmail.com>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
Subject: [RFC][PATCH 3/3] ASoC: soc-card: remvoe card->pop_time
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
In-Reply-To: <87h5pkda1r.wl-kuninori.morimoto.gx@renesas.com>
References: <87h5pkda1r.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 9 Apr 2026 04:37:38 +0000
X-ClientProxiedBy: TYCP286CA0193.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:382::6) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYYPR01MB16304:EE_
X-MS-Office365-Filtering-Correlation-Id: a8dda9f6-6446-4353-49ed-08de95f1bab2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|22082099003|18002099003|56012099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	br9MGAcoqMdwudUjILUwv/og9vC8JwtDaSaWgS5Jf1EAkAoz4azWUSV3jrMRN0xLVsBDjIlwzA0aMk0qA0gTJzZ+vXat0GI5PVBi5Z/MkfOaq9XIHYYj5GoXIbgcQJ+WVlG/+nConm6IS+v53yUxEZrunWTvmhqLhqXWIOzOXhNNFjb0z6C3pkqacHiywZNBNguBapMnu+dysiBZ5MolyiKAy5URmxVlVeAXp/9ffvWuF5w2F3MSRRaSqJxwY3193qyswvAuQxvakWCdZi2hEpCPJ4vPAxKSUJ+q7hahcFwZdedB9LyJXDbwJ3JU8uoudpwGIJg7ahp1touiSowtTCjXmegw37xa5FL8UiDE4SiiZ2rbAnCkDAwJrEauVUCOzQa/c2o8c7yLof93QCppHjB+pgs5ePPF9QDdPPlI4VRPp5dvAn8RbjQOwOB4PFTUc41XrGkYi0gJty4Gskv2RANIx46ozXtikBBbq+ikNzm9dKCKXytnpjukrUB7rcoYyRei6qYeW2e+HaIDiCxrOF8qEZm+9sKhx/2E3oWQB+98kKK6zbiFJuq3/VTbcw31UgobsaomjebGNMCMvm1EGd4T+fPaM+3BsE9MzP9bxZmFJstcVm6uh8OsEURVwRX869vM9MPYR1cV11LWULtUmMZT1y0sBMvj2Fdl3vsXoOVGvHjBtrhWlTDHwdRyXi3k7vmZTsJhNUYr/HmCBSl4HILg6NielCxx0U9nF9jCulYKflGkrooCvVIdsWt/q172jdVgaArvillkOo/pB+jUixQ1BV7XqU5QGFee9ic4FGY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(22082099003)(18002099003)(56012099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bQDGNKrLjICLGn6uEYe47OVBLlLyvn49vb/FtS7O+9rkP80gNcYO5Jk/L91I?=
 =?us-ascii?Q?xFF2cyUw8eG45ryZciUhkc+y0uwMKBAQ8Kf01eWiAAuwytC7zz4puWJlNvSM?=
 =?us-ascii?Q?003KMfBbwdzY457cKnKcr408Hxbn9ijwobBa0kfqJ7pIQDeeJq1TLk6/teml?=
 =?us-ascii?Q?Mc10Md1PJJeMavKq3f1ykwotdrZSzKfWIKeQxux0iLx16Mc5gMGDeW9Meu6/?=
 =?us-ascii?Q?X22lRlB+2bZDLwREwB/sEGy399B+qkrQEI8t8GEUuTtmKzkCIXV53uIy4hnH?=
 =?us-ascii?Q?STcn1QNEz8wHyhPm2ey7en7kRRdGCBOXHBliqKnYzO9ZmqWxjLay8adaPyKR?=
 =?us-ascii?Q?8JOz588x+o/VLN0QSDe7IDnHkNUK7XLQDTW9LlT2kSetf6JLQByRAsLqVdzc?=
 =?us-ascii?Q?Q69Wy0gjCNmh8vumlNHgJqTcIHIrkOUa+0BXUQxy0a3Bf6EWfVP33eT5Sfgw?=
 =?us-ascii?Q?s+r12OmMFFANJERlUh0AomivroYIb6pZHtRYi/ZGfhRLjZs2aPwLshhCxppH?=
 =?us-ascii?Q?4J0BZqI0fJZFytpsD5M5kBLDQhgDL8SABXQ27EfN3frshUbmO0pE+HUQAMoe?=
 =?us-ascii?Q?UsVCYpV5P9DMfUTI7DGBgqNNolVPjRi/bNPZtrgiL+UBYK7SHxQWGLYZqzkR?=
 =?us-ascii?Q?2j+RQi64LO4sNcY/MVA6cdRPSLrGVPPV9hqjicAGQ9xcX4mr3dnFytY6U6ph?=
 =?us-ascii?Q?AaKmj+TrBnVRKfANrDtQ36kjYiny/U1FhwpdhdDN4NmV5YE7GYmE1xr1Rg/i?=
 =?us-ascii?Q?QvWLG/UPkIsY1n6WEYLLrdHAzqIs6EP+19mCp/uwu2dwpVwZQcq4YTqVcKFg?=
 =?us-ascii?Q?hOcNhrZIqQMYQwmMjDQr6tbo4vvcU30aAvEPXa1HfbhBc0+q0uWrDDJPgURw?=
 =?us-ascii?Q?KPOg+WXi6N2uO7D1aBzqeygNSp/JakzNqSMirIXPIIhF6tFA1l2WXoLhJiMd?=
 =?us-ascii?Q?vd+Q1+HsSJFKHN14B5FIdKApV3TFK5Ogx8orZ+rdcTU3h9pfwu17Kfn4QHm2?=
 =?us-ascii?Q?2Ky/6BVHaPSefugtCa9NadSNfBYrA+Wuf0UzuzL3TN2CzK4DfeyTC2WPP9qz?=
 =?us-ascii?Q?qN23vBj8oN49FkaUAvltH0t7LrIoYNrO4Y2Pk9wl8IiK1YTTPOG7jDG7cNc9?=
 =?us-ascii?Q?ZtnkuKnqe5xg7MfomjKrfLa1Gdw1ZCl18P+bI45Sb2DbrxyxKS0Xrtzqc1s3?=
 =?us-ascii?Q?H6RnPprwKnoWCbGnHXVXX6iG7dTpMPzT0L/sCueDoNvVQpsq/gz0miVIQw7e?=
 =?us-ascii?Q?ag50DhjAOVHj7VuyHZ+AI5A51m6pcs5AbIxD1o9gAI+vWMx1bop0Qg024AFl?=
 =?us-ascii?Q?4qIOIudV8OvrkWOl2WfRzkDjlPa1/KW+dc9z3fMp2qnY8i2+xgqCaC4oecH4?=
 =?us-ascii?Q?Ke9gB8TcKnEvVhvs0Stm3n1k0uJX92GNBxvHVhXMvKXabh8ZOjRdpoBqWguK?=
 =?us-ascii?Q?gXFauPj/q3UQ/XagDMf0lfPFuiqJLVX6aPKYncG5qmDKUALd/TxqIwD+rro/?=
 =?us-ascii?Q?TvGkZUOJ6F6FJru63Ql5N+SJONxiiSFiA8gBJkya2DN0kOgoU3nmmF3uHh2a?=
 =?us-ascii?Q?HZP19u7mO5BXJxwAs4S/WCsU2wc/t5/653esNHUhyyZ3swbHMHJ5y4zMOmT3?=
 =?us-ascii?Q?hpZIci0NytEqQIGaSOgF6FEBmEbofI/1oTpVvIuyLsRiDkZD9fJfc2GB4dKv?=
 =?us-ascii?Q?fjhxsrjzjfy1uU3h8fCN/9L8xOj2X1nvyjM3wwKQzgN0lXzdLAFVDNDSzjui?=
 =?us-ascii?Q?j4rDDutxdF7itiWUqBWfi/w5W0I9bbXe244FmP4Di6Mfec9lvUGR?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8dda9f6-6446-4353-49ed-08de95f1bab2
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 04:37:38.6597
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WPXwU+f6G6yOEVbDFqNZNTtTKv6bS2BvikoCCH8jl2iw1kbRXwIX8nDtl9692LX/p4jqHtqMmCNJqbXrOpWwndfWvu//pZMlKesdOZg/mcbahRR/jWCsVBDl1DAC2gSj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB16304

card->pop_time is mainly used at soc-dapm.c, and actually used was only
2 parts.

	static void dapm_seq_run_coalesced(...)
	{
		...
		if (reg >= 0) {
			...
=>			dapm_pop_wait(card->pop_time);
			...
		}
		...
	}

	static int dapm_power_widgets(...)
	{
		...
=>		dapm_pop_wait(card->pop_time);
		...
	}

No one is using it, Let's remove.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc.h  |  2 --
 sound/soc/soc-core.c |  3 ---
 sound/soc/soc-dapm.c | 43 -------------------------------------------
 3 files changed, 48 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 5e3eb617d8323..453548988d381 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -1081,8 +1081,6 @@ struct snd_soc_card {
 #ifdef CONFIG_PM_SLEEP
 	struct work_struct deferred_resume_work;
 #endif
-	u32 pop_time;
-
 	/* bit field */
 	unsigned int instantiated:1;
 	unsigned int topology_shortname_created:1;
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 3fecf9fc903c0..d72cd66cdcf94 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -194,9 +194,6 @@ static void soc_init_card_debugfs(struct snd_soc_card *card)
 	card->debugfs_card_root = debugfs_create_dir(card->name,
 						     snd_soc_debugfs_root);
 
-	debugfs_create_u32("dapm_pop_time", 0644, card->debugfs_card_root,
-			   &card->pop_time);
-
 	snd_soc_dapm_debugfs_init(snd_soc_card_to_dapm(card), card->debugfs_card_root);
 }
 
diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index d6192204e613d..9b86ba284d038 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -161,33 +161,6 @@ static void dapm_assert_locked(struct snd_soc_dapm_context *dapm)
 		snd_soc_dapm_mutex_assert_held(dapm);
 }
 
-static void dapm_pop_wait(u32 pop_time)
-{
-	if (pop_time)
-		schedule_timeout_uninterruptible(msecs_to_jiffies(pop_time));
-}
-
-__printf(3, 4)
-static void dapm_pop_dbg(struct device *dev, u32 pop_time, const char *fmt, ...)
-{
-	va_list args;
-	char *buf;
-
-	if (!pop_time)
-		return;
-
-	buf = kmalloc(PAGE_SIZE, GFP_KERNEL);
-	if (buf == NULL)
-		return;
-
-	va_start(args, fmt);
-	vsnprintf(buf, PAGE_SIZE, fmt, args);
-	dev_info(dev, "%s", buf);
-	va_end(args);
-
-	kfree(buf);
-}
-
 struct snd_soc_dapm_context *snd_soc_dapm_alloc(struct device *dev)
 {
 	return devm_kzalloc(dev, sizeof(struct snd_soc_dapm_context), GFP_KERNEL);
@@ -1872,8 +1845,6 @@ static void dapm_seq_check_event(struct snd_soc_card *card,
 	if (w->event && (w->event_flags & event)) {
 		int ret;
 
-		dapm_pop_dbg(dev, card->pop_time, "pop test : %s %s\n",
-			w->name, ev_name);
 		dapm_async_complete(w->dapm);
 		trace_snd_soc_dapm_widget_event_start(w, event);
 		ret = w->event(w, NULL, event);
@@ -1888,7 +1859,6 @@ static void dapm_seq_check_event(struct snd_soc_card *card,
 static void dapm_seq_run_coalesced(struct snd_soc_card *card,
 				   struct list_head *pending)
 {
-	struct device *dev = card->dev;
 	struct snd_soc_dapm_context *dapm;
 	struct snd_soc_dapm_widget *w;
 	int reg;
@@ -1909,10 +1879,6 @@ static void dapm_seq_run_coalesced(struct snd_soc_card *card,
 		else
 			value |= w->off_val << w->shift;
 
-		dapm_pop_dbg(dev, card->pop_time,
-			"pop test : Queue %s: reg=0x%x, 0x%x/0x%x\n",
-			w->name, reg, value, mask);
-
 		/* Check for events */
 		dapm_seq_check_event(card, w, SND_SOC_DAPM_PRE_PMU);
 		dapm_seq_check_event(card, w, SND_SOC_DAPM_PRE_PMD);
@@ -1922,11 +1888,6 @@ static void dapm_seq_run_coalesced(struct snd_soc_card *card,
 		/* Any widget will do, they should all be updating the
 		 * same register.
 		 */
-
-		dapm_pop_dbg(dev, card->pop_time,
-			"pop test : Applying 0x%x/0x%x to %x in %dms\n",
-			value, mask, reg, card->pop_time);
-		dapm_pop_wait(card->pop_time);
 		dapm_update_bits(dapm, reg, mask, value);
 	}
 
@@ -2392,10 +2353,6 @@ static int dapm_power_widgets(struct snd_soc_card *card, int event,
 			return ret;
 	}
 
-	dapm_pop_dbg(card->dev, card->pop_time,
-		"DAPM sequencing finished, waiting %dms\n", card->pop_time);
-	dapm_pop_wait(card->pop_time);
-
 	trace_snd_soc_dapm_done(card, event);
 
 	return 0;
-- 
2.43.0

