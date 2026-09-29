Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010018.outbound.protection.outlook.com [52.101.228.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABF662F7EE9
	for <linux-sound@vger.kernel.org>; Tue, 29 Sep 2026 05:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790659795; cv=fail; b=VJP2vsXELOkWYIP6bg43k67stVNBFJamwwIkJ6ZrfDe6nGpphtZSnHW5e03K9gD4zMZ+tqndI4/zwQERld+9Hgqftkbcy84SlbXE/v40qg52F/wLiHeVYp85eLrXDlbQuAOnfwi9chkzuk6RNybsJw3qOCAH9TJsI2XGtNs2S4I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790659795; c=relaxed/simple;
	bh=c0XadFeg68fJVulRFCc0mBhsrdsz36KtPeaSy17x9T8=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=AChhrEJztStaHOf8WluZZnCOuOLZGHbIPrRPPLG6rHLiFCYtnBG18fvsdvV9MdYr0p/Y8vA9MBcJ3wkymPYA4G0DOspbYwMwx7x3zsRsax76HhewK29pq3x1Z6VDc9ZQwQXlrB2FyeEUvDyTv2fOBRPKl5GMxmbAJt/1syn8uEQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=nh7/n1hY; arc=fail smtp.client-ip=52.101.228.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="nh7/n1hY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cKHjCz0GXJBYLLtD3ja6ZL1TfKCPmq0rMrEZsZ3v6Rmv16RwoPXDEfQO3u1T+nwVsap3TP6cmQ0H2U6tanb6i0/ZtfRLgDK1ghGHanInHRMGClRAFJQKE53JD3iC0zgFgiSsvEBA9yIvxDCoMpktFDwB6LW7bZyPEFgqOvMj2b8zZsLOG2dQxsF4h3vGfUh33U00kARVZGNZvjwstpTlkUJY87WP910wLGmFSJnNRlvyiAaQSKt6uyW0b3sjhgpHUK+kjnGdLgFK2/krEN+lYZiZ4aIdlzij9aJkz7FUhzNjRgyJkg0w0UlYbD4EprvBJ5Dbqf2/wMlPrE95qG0aDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CSNKz2vzzilHivb/2tQGpu1CgGIRoWb9DvWdn6fwRps=;
 b=rB3kui1CyvYC8zV4HdeZ3dGu3ipcNo5+yJ2OshoQRsOdHhswrw8TPlwe9eSAxAwUyiHHqAhC50GXd7o6C8uxtp28vPYeUAq5vJzN+1ct9SoIo4mHaezb5ZSwP7QS7vGIRi+VohRP8K7I6uECbpP8sBpGdQsdFm6/Wo2RglCpCm8pvHlmdDk4STwd8B8/ISoylSwKb7SURnSy4KRNU9dy6npHRccwDp+JDKspBY0aNaGpiHnz9o7eq+yFYs4f1tPUHKFYAW+VQ8XgVxha2KUwmNCLoAE5eGlctoxLAtUOK4fsnRSUpbbnv49YlfWy1Q91AYY/woRz9VVwKKi6AJO22Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CSNKz2vzzilHivb/2tQGpu1CgGIRoWb9DvWdn6fwRps=;
 b=nh7/n1hYB/Q29fDkUdf9mvE+7UDkbFgicGxxcx5pJbHyqRJhBs0E6wD7jiuYF13aSpKw8Uy8F4k6mgoJhfF6Aogqsz4xHML7MS+gHnuhUoEFJEi+8FJ64yiOo/EpBK0hFeG62sdP29bbJN64a9Rp4Dqcson+mLuL32jImnyvt/c=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12) by OS3PR01MB8890.jpnprd01.prod.outlook.com
 (2603:1096:604:153::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 05:29:51 +0000
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45]) by TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45%6]) with mapi id 15.21.0451.022; Tue, 29 Sep 2026
 05:29:51 +0000
Message-ID: <87jyo4eib4.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 04/14] ASoC: soc-component: move snd_soc_component_fixup_controls()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87pkxweibu.wl-kuninori.morimoto.gx@renesas.com>
References: <87pkxweibu.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 29 Sep 2026 05:29:51 +0000
X-ClientProxiedBy: TY4P286CA0092.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:369::8) To TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB14118:EE_|OS3PR01MB8890:EE_
X-MS-Office365-Filtering-Correlation-Id: b22b0d2c-e95b-4bc0-8d06-08df1deaaf92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|52116014|376014|366016|38350700014|11063799006|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	W/b1ITFaSHxGC/IRd08HalY4W00Wp2QBvvG+Fx5OVoY/a3JkWAVDBgJkP49WYU8QL0nB4P0tmuY0anlYV7SXvpjzLE8Zq5OYWsJVKGi9UmX78YZqkFsVKTBuk76eiur0oS2VXwdk+TF7X8uMYTDjGraw9UQdqtWzxcJXF4FIZ9IUF71cKz0Qqoq1HfVZ7UiaU/XylcD7vxC4cWTOZkcsqp3h37MJ4RXl+cdyarGuEE0rczAwmZ6GYU8l/CygFmIZx57/9zfTGM+meIzGll2bmJ4A8HkVCi5WI7rDwB59gsvOddjMjxOpbax96HD9pOVVlQbUXh6duW3xprtsciji6tfJ8Tj0boWu6OhQWbt+QC1ovMSeBwFs+NXgo/I4fAc5Uu6Tr99fp6n6KvIDJmxCNFR+iAdxvHX1l2uozmFTOILnVTBT3KIqt6kZLK8sfanbzwBgzxYwtOiHllXNlqlHVgtasxdG+qOCFW2P2GN/4u96jVwiEa80xVyWBSKYXMevTmw89VhWV8pVsxSAJlKzvbJga/8HxNkzo29eWzNMEhhkAUA6Ad0+289woPb+i+ao2oUamTgXVWUiLUxDe4SdilSSnVZOaFu/sZOgEsyEEh+6pJiSELbdlsW4YqZwSnjT9N7KLxC8S0E3cJM9PaBZkO39ghi2Sk2ZWSTrUNvI/YyQh3Y/LHiBNo/wiqb8Zs5UHI44cWPOGdLWy75gembEfIowDN8a/LC4WYzwJCAITd4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB14118.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(52116014)(376014)(366016)(38350700014)(11063799006)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gEDrntRKAfScsSI9x8GesX82Ds0w+YRGIsek2Y2BER9+r50HRrV2aoD52twz?=
 =?us-ascii?Q?13cW+CIlN4y7bMK7Ail5mG85b3zCdXj3Y7qChMbe4Km/7jB983WFa7E6zVNb?=
 =?us-ascii?Q?Oa72eWpT9PBN9GuDLUkIF206sabbrX0T5ZKKFg1iAqHsy+AA8Ac/+YEX+DeK?=
 =?us-ascii?Q?xG/+gaoJ504EQKM0NGePrfyAL28ZPuVjS2TTwTLnwk1TuAgrqIg5LwUusC39?=
 =?us-ascii?Q?OVc3Xfr2r08FtMopsbngzkmQXHwUAgOayBqmbM3i+UYBr3qRqOwH7m/FEoyA?=
 =?us-ascii?Q?EVs+iGzJEMvxb5qYD1ufE/UgXtu/12M0vtwrLt1dCWfiaY5+Kvtvz9dYtZxS?=
 =?us-ascii?Q?LbA7tyMgY5L+BL9bW1S9AO6Eet7slHG2uZ1LQWKRbkhkcI/jYWS53nbE94sN?=
 =?us-ascii?Q?fhcL2VR8LBadpyak55yCSLp76TzZ5KqvW8R673LPPCFv4g387rU5gkE+jNto?=
 =?us-ascii?Q?dnpEr4/cYjjHQa9la+JN2iA+UpGM9gAhpeCOGiRc4OhA4syulGChYz2dphg6?=
 =?us-ascii?Q?xqDG7YkYOu//Bv2vlYAVbyOwyFQfTfA69hkE0ozPOCzzvjuI6nz6WlAboQad?=
 =?us-ascii?Q?Eighv9PcFZhO2vdnBQt9AxacHGyQsXuPErnqUR8buD4ZZbFi8JxISxba5X4k?=
 =?us-ascii?Q?lT6RxO7q/VpEjkIaKonprTx/ZZatRUtK7BlLjBs9S4V+SFe6ntDlz2IVHYvf?=
 =?us-ascii?Q?Z6hsiadw8ynICyUOPad/zCJqxjqjBaplUllRwdN+DEiClfuMeMNQz2kcPRUo?=
 =?us-ascii?Q?T1s8BflvjFBId66FGwGBk2kbQKFK8xZ22Txe9OUjdWBBBL+YumE+lTrULpce?=
 =?us-ascii?Q?Wx5ehngRe4J4xoYT8Mg0XoW3wKS6KdcQ2Rl4H7zjeZxXBmPQVn/vQ6oWf+O8?=
 =?us-ascii?Q?JqrvlDelyJNmf3AIfv+Ie3ZwRI1dHcPukUkB3zCgyNutr8xqomVrflAjs/mI?=
 =?us-ascii?Q?yJ7EhVuMfDTyo9UklfZDR09A+O6JQ8tUy4lVPa2Gy+IRF1K6BPsgRiLE39kI?=
 =?us-ascii?Q?AapmvFDwPonEWf2rqFzv6mU9Gk30lhg2nhCe5zHixORYKgMtTz7xatUFe+pL?=
 =?us-ascii?Q?d8ylpflVZMq8xl0Te34Rv2zsbYagNWdDlN9c3O8FnBYoPWqnVlIVr28aprtG?=
 =?us-ascii?Q?5/Id41p3FzvW5+p+ER0Av8Qeb0bkrZfI5PxhngDiNRfx4KhKId4GcaSbcIYb?=
 =?us-ascii?Q?ImNoIggNCVhmzE/FUBHkS3G3kZ9eDouVssjPaMeoZBP6avtodM13hQ7KzAqc?=
 =?us-ascii?Q?3eD9r1nfCHVKUtaqpAzAkd69RlvbddGzDCmxg4zhYeVci0XC6C6FgAg2dao2?=
 =?us-ascii?Q?4SwxkUG/uvoqSNn3x0NSxcOVzmVNnbOzXr7LyyaGh82dHZTOS8v6pD1jKleD?=
 =?us-ascii?Q?+ml0ztSQkfRC96vACT+ZsxxEUMIR9hBAplHpDghgu9ewRADE0uBxGgBNplAe?=
 =?us-ascii?Q?mHu0BN4/csP8jaTKGvRF2dlqPsEyfLsm0EvgE32o/+v1XzoaTzJBbLiWk+Dq?=
 =?us-ascii?Q?QtkF31mAgyrHmfJeHH07nPfHtddwuQ1F/1g0PU0MXk5Or/2oLQxCIO27pA2d?=
 =?us-ascii?Q?/xasVThva1tLZxxq2SKZgedpe62peRzatKB+BxGU5fF7f0SizDn/9bnq3gD+?=
 =?us-ascii?Q?BfKnUCHSDU9+b8ntZrDd27NOs8Xv6thGamcGcgjLAWMH9YQN0VcTIk5dn5cC?=
 =?us-ascii?Q?nvwYVuB/eGpbK1fWL40Fios14HUx0Cq9ucEcVuQZiiCT5/l0gHqJEnDI9FV+?=
 =?us-ascii?Q?p97mD39tsQSMLdT80BGJfFtTDnCpMOxGOxI5nWhqELaLFDTwv2+a?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b22b0d2c-e95b-4bc0-8d06-08df1deaaf92
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB14118.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 05:29:51.6077
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0IW46SKArtKRhpupWQFv4TbXA4rV0DqC5e5XxzaCTmfiIo2zj6CGxYaiKiQv9PzxQpQCe3DaJB91PaG17X34nVyz49WCHZIK+vwMzE73rzgMIt+WIZaNEJemdZkItmsh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8890

snd_soc_component_xxx_controls() are located between _probe()
and _remove() in soc-component.c, and are located in scattered
positions in soc-component.h. Fixup them.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-component.h |  2 +-
 sound/soc/soc-component.c     | 12 ++++++------
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index d83ba2996653e..7708d84af8853 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -355,6 +355,7 @@ void snd_soc_component_init_regmap(struct snd_soc_component *component,
 void snd_soc_component_exit_regmap(struct snd_soc_component *component);
 #endif
 
+int snd_soc_component_fixup_controls(struct snd_soc_component *component);
 int snd_soc_component_add_controls(struct snd_soc_component *component,
 				const struct snd_kcontrol_new *controls, unsigned int num_controls);
 
@@ -404,7 +405,6 @@ void snd_soc_component_suspend(struct snd_soc_component *component);
 void snd_soc_component_resume(struct snd_soc_component *component);
 int snd_soc_component_is_suspended(struct snd_soc_component *component);
 int snd_soc_component_probe(struct snd_soc_component *component);
-int snd_soc_component_fixup_controls(struct snd_soc_component *component);
 void snd_soc_component_remove(struct snd_soc_component *component);
 int snd_soc_component_of_xlate_dai_id(struct snd_soc_component *component,
 				      struct device_node *ep);
diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index 709d78ee92fd5..6077d07f873f5 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -340,6 +340,12 @@ int snd_soc_component_probe(struct snd_soc_component *component)
 	return soc_component_ret(component, ret);
 }
 
+void snd_soc_component_remove(struct snd_soc_component *component)
+{
+	if (component->driver->remove)
+		component->driver->remove(component);
+}
+
 /**
  * snd_soc_component_add_controls - Add an array of controls to a component.
  *
@@ -370,12 +376,6 @@ int snd_soc_component_fixup_controls(struct snd_soc_component *component)
 	return soc_component_ret(component, ret);
 }
 
-void snd_soc_component_remove(struct snd_soc_component *component)
-{
-	if (component->driver->remove)
-		component->driver->remove(component);
-}
-
 int snd_soc_component_of_xlate_dai_id(struct snd_soc_component *component,
 				      struct device_node *ep)
 {
-- 
2.53.0

