Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011066.outbound.protection.outlook.com [52.101.125.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 465CD3A1685
	for <linux-sound@vger.kernel.org>; Wed, 22 Apr 2026 03:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776827085; cv=fail; b=T2QfVo9us/UQj4MiSu/w8AJOcKMIn5qKl8Li0Is3P06sjBBRIWdOyUw6ycdVXws0xFUa2mlsSSUWsCxuIxbY1/Oz/tgMXHE7ijDJFUkN+/D3c4iACoUlDn9kIJPPfrTAT6BL2djp5MRxGLGswGCyp8GWGF3uAtlrxt/cD6cLRcI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776827085; c=relaxed/simple;
	bh=y0ldjjKTGNeS+hQhgaS3WJ6epaxub8u/dRU2/bwMMN0=;
	h=Message-ID:From:To:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=ErfH70D7wNG2FN8IoOj0xrDuPUB1zur39rGFgjpKT4r2xk0ouy1lY5RSyq9i901S4bcsymJWmed2bVwgzQIUT+dmD34torkI/lvcTdE56sV9ZIr+/2ts68SmFyn65aN8X1WL9V8uRZIVhTqZpVFMftWuCv6a1YngKmJ2pWwWpiE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Sdeo92Ys; arc=fail smtp.client-ip=52.101.125.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Sdeo92Ys"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hMiFdFaJAJVbw6PRjjE9e5abqmb/Y3+Jo/c10hmU1aNtK+fIOPc5xprPdGVlKhXJ7rN1QJ0Q++z+ae/ukT0FqFlvD82tcUBTmtQOXhvq2Wkgt4PEWqPU+rJVLvuqWjo/VZG6hOHnM37bflQ14Levu49tD7x1nXVQWpUf6+8PlUWI43zWpBKJSqJHGUHDTFaJ4gXIlyVlBL8Eyy/f+IA49i2l5N5KA9tkFHqeiKbaFJAlEvYUNrBNOiNTYmK3U+7+wLrxTg1GGmXNN4hvTg6RlXhdEzo3RCi4pVNWZVuWS664n9kPgzKNowSUJd7K/XUkzEkuymPJsYn84mxBIXCLzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3yOweXxGwBgljymPwiB4r5BpE5YqQLK7KPOyT3IVUfI=;
 b=U5Lqd7tK9BZ4ezxA006KD6U8Wvy4Wx8gtlfVmR0k/Oe9FZGia/tD9MaoDuxtG6BhnRNB7yJvX5bXFUAHzUjcdaAB96wVkGYdaORmJbmpGI2LouGTSYNe5ZowB/KpYHSpO8JUxzPg8F3XGDmSsmjz7RKCi+sXte0Ng3egGfzu7A7RJJ+0vt+ImImiutk9akcsfWpzl+w1kx0kM66lG+hwv55b0LSAZog3MMvMmgzrxV7sHjWfgRGv/Plw9GFzJTzhArhcPAWZk0nWay3OgIKF60xjAlZNh2H5FykZsHmsPj798aJ2bTrIqYA2LiNXc97lbTpdE9pTBPSk+bJ/XXTdrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3yOweXxGwBgljymPwiB4r5BpE5YqQLK7KPOyT3IVUfI=;
 b=Sdeo92Yslkv4LQyHj1MYSU/O/Qduer0xjU7AEQ01pvaZM7G2HHCXMRIAv9zsK3xu26+iijw0VeCl6cjrlMpHBVzwAiFbHbQfoDEIciFcypNydtaK3I8oh26tumsIuAdSQ2vzxEcZPGhCfa/QjT6U+71MKO/lg8+heuwx636ZY6M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OSCPR01MB14402.jpnprd01.prod.outlook.com (2603:1096:604:3a4::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.16; Wed, 22 Apr
 2026 03:04:32 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.20.9846.016; Wed, 22 Apr 2026
 03:04:32 +0000
Message-ID: <87bjfbk85c.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>, Cezary Rojewski <cezary.rojewski@intel.com>, linux-sound@vger.kernel.org
Subject: [RFC][PATCH v4 2/2] ASoC: core: use Complete rebind cards by default for all users
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
In-Reply-To: <87eck7k868.wl-kuninori.morimoto.gx@renesas.com>
References: <87eck7k868.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 22 Apr 2026 03:04:31 +0000
X-ClientProxiedBy: TY4P301CA0023.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:2b1::15) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OSCPR01MB14402:EE_
X-MS-Office365-Filtering-Correlation-Id: 4bac7f5a-adea-4919-7bb4-08dea01be03a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	rJ17HLFlRk2Oalw86syxwHSF5sqjcWhV3IuWvn1aJkRwS5/PSk/fYIsxUjZAji+9ZEEGN6bSF3colOEOAYwtHkXjApjIt0yeR4Zqa0dwXKm88HWXxWA9F8ib3RxBbt/qS7n3tu96piUSlSZEgP/UMoEq3TUbFgQFHYxaAuZ2szFkAlPX4RXZMd3EOCEHKqz7xIWLYjnaFm9qHferqQEBc2ozw7lwJFd1uS81ih3nmM7ckHLyXsDix2/AFIqPdhLxmDsLxVVtb+rGUO1vBj4bY2ctR2bUZh1qP8VH/mh2nP+mlJh082VZ7kPqJqBDvlXaHQXHxdsA0v5rIzv2ff1jc3NH1DX9U8frJXKv0Kl3WS2EG9OV/AB49sS6sNGXNYbaqaAWjgWWMRIjVH0qTvxHdJNouTXD9ERFV/2NEnlBIG6R6s5t5hePDqnkBe2venh4xFn1/XMQgrxo1bC3yVFiq1xxh7M6PHyvs79GMs1hJr0pf9974+yM2PZiNN0i8Dqx3m/1KCwGWXwg2vLHU8pDGvmX5UV4nEb/37tyQG9MpVzA4qXNk/8OHrI5Oc3grg2qDuK1h8BrByvnCnHUN9bS+868DxX0Aa51RLL22LZqlLrvw96JPjp3qKt6Y7eONxE1Rj8oQT0yOn3NePKy3LyjDl/PswVZrdPormcvWVK100TIpmjhJUHZPolF3ywm9NM/x9HdSrpXiJzgwF98qYd66czXOB/n7m7OroR2BP4SWwFOIlOhbS2xxd7ksvgqpPjnAsFJgJRgRKvW5r7XLZf+LZc+68wqOEQrzActySHIoUE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BFs7oeyXabnJXPo5te2GWbEA3qCOOpUDlMLQooYlqWJT9XFVMaeb852JVljk?=
 =?us-ascii?Q?rYkYMlT5UhJoW3hFFvvHwyXkDOhA+jYjTDZ4jldjwU8qYd+nuoP1+ccUr8Z3?=
 =?us-ascii?Q?wf/BrV9DfwIv2nFolNaXyBeUZpQglk52b02TVOU322+tf08tWLxwbtatG0Wg?=
 =?us-ascii?Q?QU8PDvK6sBy+w6hG52kW247bYmOK1/xH9EJEpMDErnrhutw7FMWFZb4eWR9+?=
 =?us-ascii?Q?qigjsQnNEt3XCYKjB5DjlrZ17dFpdtMMKuQAcNdRDPWH/SAhvqHmrGP4/bjp?=
 =?us-ascii?Q?AK10lsX1ebqFF9mEhgFuMkUN2JyLi9Vo6azxmr4NOOoIDv6xLqHlqE0tokPQ?=
 =?us-ascii?Q?810sYYwLP0WJacYPumGd9kEBRVkzQlwdLPSGQrr1ApWXqyIgkyxtkNwIBm3d?=
 =?us-ascii?Q?64Y9/acdRwAnmIqIV9Rlz46cOoBUixoJ1XZSAkzO54vHqqoTj+gc+8ffzqPn?=
 =?us-ascii?Q?CVDa1MRDM38i6dSIs3D3TDpBnHBxcCO/WYUGbP9re1SIoUuOhGI1d+COFoyv?=
 =?us-ascii?Q?cEP//rBHhXsY2lb5+9tnqm+3ta7uDSABrTm27ZhmJuc40JQeLeMf9OXjEfy1?=
 =?us-ascii?Q?nkr8lcsN7xVTIjnUoiXC7l7SR2xPmVfl65T6BJgLD65rOzq5Rl8C8Raz2yyn?=
 =?us-ascii?Q?7VzHkvbQXtfoLSQdP4/yd/UZq0xw6zB1yY1V4dI/wpuWmP98kiKRYASCtLx7?=
 =?us-ascii?Q?VtEZ2EVSmoJQjYlW9bi3swH3GziHry9dZBHTZDwBa58lmcGhXOvOD2AX6PGX?=
 =?us-ascii?Q?Qc33nwiLXIuX6B4G6db7fEA8IyNT+wftqzVlSeKv99jiAtwa3I+dQWzxn7Fs?=
 =?us-ascii?Q?xVrQPjGj7lVqyhXqISHtN3aTKKwvkEshhSstMj59o3OXcVP5vwlOYwc0yQuy?=
 =?us-ascii?Q?v9Lg5sV/dYxY//b4uKt/gbs1myRO/XUyytykJpCVN+aeQQ0fPChC4xPvfld+?=
 =?us-ascii?Q?vP7Wpi6dOH0uwdkRHnYT5vIDGsrFic/hi8zmV8IvJJJyXGLlZ2Bb3+PQDn63?=
 =?us-ascii?Q?Zwa94gxVfapKBzJkWowuj+0J4LLUwWT3jPc80HafT1FVpyix9QuIGp/V3dY2?=
 =?us-ascii?Q?jIP8F5CaISGd024cLIbGAwf+zuvudqg01qLgWOqVBuzxj21k1STxkmvsrdzW?=
 =?us-ascii?Q?ZZNgpYrJkqKSXHv3poKS2nH5HGxhz0Fq31+eCIn1HB5Q/gE2CR3/3Gj9RU4I?=
 =?us-ascii?Q?BDC401/TP3FNDd8Dt3nj0Ol0uOTIProphCHupbE1+yT2w7VsTPMyEnw2hm6Z?=
 =?us-ascii?Q?FUvu0XcdP1DXy50C5HRpvUmviXfqp+eMWBUiVKZkIe0Lb0I/4wVtTtgi6l41?=
 =?us-ascii?Q?S/cP5kNK+9HAmpQmf5H/Ya38YqKc2Z9iC4F/JHMoTEtXwktvoTHgKmo9Xvfz?=
 =?us-ascii?Q?gjkON6VmKnTU0j6HSyAGjuNeJ7rFs8setm52VKIDBf1A/OZ3m6ZxxY3AwVHx?=
 =?us-ascii?Q?zR2t7Ta0sbL3uUvVi66UYc4i6L2u9XDew6v09rcAus+FCEBvm5GUxY48PNX2?=
 =?us-ascii?Q?sTVcy1GshQZ2026AeYEAkshuj8z56+pfzctm9e4ztoZ9NbXdX06B9/qJmTuU?=
 =?us-ascii?Q?oTHOvugg9B95Gph1ugJDW8cc3b2kk8itK6jbtn123ZU3MCG6WaWndDijko1m?=
 =?us-ascii?Q?UhBVMBJPepYUWS8xRRkrs7eU2hmrHN0Ozxq7cYhCUJNV8C934bz/eo5NmC+6?=
 =?us-ascii?Q?F1oYe0i+BGf/QiHD75NopsAsOQbJspqdzefpx74SzLCW2gHQAAf4mFIi70C8?=
 =?us-ascii?Q?EwKHgs3ZHa2yMH0yYwQCBQchOaKo4kz+eMwaqxu/9pk0F2leY0rd?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bac7f5a-adea-4919-7bb4-08dea01be03a
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2026 03:04:32.1496
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q3Z2dbQglDy1BeWqQkKO6udaMTh8QY6RIRDBfESVA9tIIPUOhkxjTah8bAdwYoyqUgSgFutXRcyO5+GWsdsNFDfGBks2U8pWFdzUixYjuWZ8A47d+SYOkeYNBreB3Mv9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB14402

commit a3375522bb5e2 ("ASoC: core: Complete support for card rebinding")
supports complete card rebinding, but it uses unbalanced pair functions
It added devm_snd_soc_bind_card() (= bind), but its inverse function is
snd_soc_unregister_card() (= unregister), and it adds new
devm_snd_soc_register_deferrable_card() (= register), but it doesn't have
inverse function (= merged with above inverse of bind function).

This feature is mainly used on Intel driver, but all driver can use it.
Let's use it on all drivers.

bin/unbind functions are soc-core.c local, so let's rename it.
It added new rebind function.
	snd_soc_bind_card()	-> soc_card_bind()
	snd_soc_unbind_card()	-> soc_card_unbind()
	snd_soc_rebind_card()	-> soc_card_rebind()

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc.h    |  6 ++--
 sound/soc/soc-card.c   |  4 +--
 sound/soc/soc-core.c   | 67 ++++++++++--------------------------------
 sound/soc/soc-devres.c |  7 -----
 4 files changed, 22 insertions(+), 62 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 453548988d381..87bcb33cbde65 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -431,7 +431,10 @@ struct snd_soc_jack_pin;
 int snd_soc_register_card(struct snd_soc_card *card);
 void snd_soc_unregister_card(struct snd_soc_card *card);
 int devm_snd_soc_register_card(struct device *dev, struct snd_soc_card *card);
-int devm_snd_soc_register_deferrable_card(struct device *dev, struct snd_soc_card *card);
+
+/* REMOVE ME */
+#define devm_snd_soc_register_deferrable_card	devm_snd_soc_register_card
+
 #ifdef CONFIG_PM_SLEEP
 int snd_soc_suspend(struct device *dev);
 int snd_soc_resume(struct device *dev);
@@ -1087,7 +1090,6 @@ struct snd_soc_card {
 	unsigned int fully_routed:1;
 	unsigned int probed:1;
 	unsigned int component_chaining:1;
-	struct device *devres_dev;
 
 	void *drvdata;
 };
diff --git a/sound/soc/soc-card.c b/sound/soc/soc-card.c
index 235427d690617..04d1c2ec11484 100644
--- a/sound/soc/soc-card.c
+++ b/sound/soc/soc-card.c
@@ -151,7 +151,7 @@ int snd_soc_card_probe(struct snd_soc_card *card)
 		 * about "late_probe".
 		 *
 		 * see
-		 *	snd_soc_bind_card()
+		 *	soc_card_bind()
 		 *	snd_soc_card_late_probe()
 		 */
 		card->probed = 1;
@@ -176,7 +176,7 @@ int snd_soc_card_late_probe(struct snd_soc_card *card)
 	 * for all cases.
 	 *
 	 * see
-	 *	snd_soc_bind_card()
+	 *	soc_card_bind()
 	 *	snd_soc_card_probe()
 	 */
 	card->probed = 1;
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 13e933d2883e8..9b1ae88127d79 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -2147,7 +2147,7 @@ static void soc_cleanup_card_resources(struct snd_soc_card *card)
 	}
 }
 
-static void snd_soc_unbind_card(struct snd_soc_card *card)
+static void soc_card_unbind(struct snd_soc_card *card)
 {
 	if (snd_soc_card_is_instantiated(card)) {
 		card->instantiated = false;
@@ -2155,7 +2155,7 @@ static void snd_soc_unbind_card(struct snd_soc_card *card)
 	}
 }
 
-static int snd_soc_bind_card(struct snd_soc_card *card)
+static int soc_card_bind(struct snd_soc_card *card)
 {
 	struct snd_soc_pcm_runtime *rtd;
 	struct snd_soc_component *component;
@@ -2314,46 +2314,16 @@ static int snd_soc_bind_card(struct snd_soc_card *card)
 	return ret;
 }
 
-static void devm_card_bind_release(struct device *dev, void *res)
+static void soc_card_rebind(void)
 {
-	snd_soc_unregister_card(*(struct snd_soc_card **)res);
-}
+	struct snd_soc_card *card, *c;
 
-static int devm_snd_soc_bind_card(struct device *dev, struct snd_soc_card *card)
-{
-	struct snd_soc_card **ptr;
-	int ret;
+	list_for_each_entry_safe(card, c, &unbind_card_list, list) {
+		int ret = soc_card_bind(card);
 
-	ptr = devres_alloc(devm_card_bind_release, sizeof(*ptr), GFP_KERNEL);
-	if (!ptr)
-		return -ENOMEM;
-
-	ret = snd_soc_bind_card(card);
-	if (ret == 0 || ret == -EPROBE_DEFER) {
-		*ptr = card;
-		devres_add(dev, ptr);
-	} else {
-		devres_free(ptr);
+		if (ret != -EPROBE_DEFER)
+			list_del_init(&card->list);
 	}
-
-	return ret;
-}
-
-static int snd_soc_rebind_card(struct snd_soc_card *card)
-{
-	int ret;
-
-	if (card->devres_dev) {
-		devres_destroy(card->devres_dev, devm_card_bind_release, NULL, NULL);
-		ret = devm_snd_soc_bind_card(card->devres_dev, card);
-	} else {
-		ret = snd_soc_bind_card(card);
-	}
-
-	if (ret != -EPROBE_DEFER)
-		list_del_init(&card->list);
-
-	return ret;
 }
 
 /* probes a new socdev */
@@ -2578,14 +2548,10 @@ int snd_soc_register_card(struct snd_soc_card *card)
 
 	guard(mutex)(&client_mutex);
 
-	if (card->devres_dev) {
-		ret = devm_snd_soc_bind_card(card->devres_dev, card);
-		if (ret == -EPROBE_DEFER) {
-			list_add(&card->list, &unbind_card_list);
-			ret = 0;
-		}
-	} else {
-		ret = snd_soc_bind_card(card);
+	ret = soc_card_bind(card);
+	if (ret == -EPROBE_DEFER) {
+		list_add(&card->list, &unbind_card_list);
+		ret = 0;
 	}
 
 	return ret;
@@ -2602,7 +2568,7 @@ void snd_soc_unregister_card(struct snd_soc_card *card)
 {
 	guard(mutex)(&client_mutex);
 
-	snd_soc_unbind_card(card);
+	soc_card_unbind(card);
 	list_del(&card->list);
 
 	dev_dbg(card->dev, "ASoC: Unregistered card '%s'\n", card->name);
@@ -2832,7 +2798,8 @@ static void snd_soc_del_component_unlocked(struct snd_soc_component *component)
 
 	if (card) {
 		instantiated = card->instantiated;
-		snd_soc_unbind_card(card);
+
+		soc_card_unbind(card);
 		if (instantiated)
 			list_add(&card->list, &unbind_card_list);
 	}
@@ -2879,7 +2846,6 @@ int snd_soc_add_component(struct snd_soc_component *component,
 			  struct snd_soc_dai_driver *dai_drv,
 			  int num_dai)
 {
-	struct snd_soc_card *card, *c;
 	int ret;
 	int i;
 	guard(mutex)(&client_mutex);
@@ -2907,8 +2873,7 @@ int snd_soc_add_component(struct snd_soc_component *component,
 	/* see for_each_component */
 	list_add(&component->list, &component_list);
 
-	list_for_each_entry_safe(card, c, &unbind_card_list, list)
-		snd_soc_rebind_card(card);
+	soc_card_rebind();
 
 err_cleanup:
 	if (ret < 0)
diff --git a/sound/soc/soc-devres.c b/sound/soc/soc-devres.c
index d33f83ec24f27..c6364caabc0ec 100644
--- a/sound/soc/soc-devres.c
+++ b/sound/soc/soc-devres.c
@@ -83,13 +83,6 @@ int devm_snd_soc_register_card(struct device *dev, struct snd_soc_card *card)
 }
 EXPORT_SYMBOL_GPL(devm_snd_soc_register_card);
 
-int devm_snd_soc_register_deferrable_card(struct device *dev, struct snd_soc_card *card)
-{
-	card->devres_dev = dev;
-	return snd_soc_register_card(card);
-}
-EXPORT_SYMBOL_GPL(devm_snd_soc_register_deferrable_card);
-
 #ifdef CONFIG_SND_SOC_GENERIC_DMAENGINE_PCM
 
 static void devm_dmaengine_pcm_release(struct device *dev, void *res)
-- 
2.43.0

