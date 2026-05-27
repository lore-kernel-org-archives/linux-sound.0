Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011068.outbound.protection.outlook.com [52.101.125.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24A793B530A
	for <linux-sound@vger.kernel.org>; Wed, 27 May 2026 06:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779865032; cv=fail; b=b9fch1l9oe/6GTcgPXbeDnuYzzdE/ySQdWYPMYBa8WNzCc4SsVORNl0JkUPadLOGjLWNezD8R9ZXX+m6avjvVVMIdcXuNzft9rvH2qjzYKtqfMPhNH2LuC+nMP8Ty2fEjq16q28TTqN8trraBM+ZCjvMWbPSCcGyTVJu++zciE4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779865032; c=relaxed/simple;
	bh=TpzrQ6yccYQxlOcftwQXxG3QXPx1br7X6ZzY4k6mVAc=;
	h=Message-ID:From:To:Subject:Content-Type:Date:MIME-Version; b=EZSryPsXEdrmNi9SixpURdq/7mZRTwB4FWv/j4pBUOYbGI7mGYHJv1pBkV2rKloCbk8AUbV9QXBvfOXGja09f8e94WJ7H+t/YPIWv2OToSfN3fdkWHu8jHZsMNHVijPoOb1aqU/BPBypCNJBwnjeEpLkDZ9cJuCdBC1yik7HU+8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=cXnI5aAQ; arc=fail smtp.client-ip=52.101.125.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="cXnI5aAQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vTarHIlEOqOlPP6N9/H5f/sejXZeGrMCV2Hhq1jgJZEUC4sV5kdrLZ48lLullrkKDBTbutImhj/Gok0dW8QyRwK0Kln9aP37Il+DfKgOulohnS90b2buG/nQVe0DM64UP6I7JdrY//jbeRfCJfiJTHISaIf9Us6bkfJF2W7UlkbcvHQTJg1dMz2p/HJ/v9pSc0Eg3CPHMzudidcg1yz57dLO2q675Zn5BXW5ZbasFqN5kJwr/ByC+BvxNnOStVNuzJaWjO914DM8MR14oKbup3gfJ59ILCh4PFGTZvgiQg4UZBszbBYCQXuoX4icUVCoBeoS6zY6BTRg4eTqKNGAeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bOM1ZCdxtAgRmoVB5ewH7UaQMH8ceOMVKJL6hCjBg0Y=;
 b=ZYPkk4MgRyrK9KA5Hyf810gwCuhRg5TKqxCUNgM1hcfB/RFRFhp1Tya3JObZ4IcK/00gesAQijBKtr6wGW2sWrEq3+FJ/6LLBB8JURvbNbkS2Iwg3DEWeiiuoGfcI7q1iEboxQCQ6jekNoO3x92ZtK4vqHtybxReswBHx/Z0rkPPPO0GOSvFDnskLXUfaoamvdzNNLBxkO2mowNXEiNe2jDQn+A6sLmybluIPJ71J34DCzxjcJGDpeB7/WsXq4a+EGDoLmEBcdbzLh7cDbyq+zg95Q30QHaYLPlW30tCd5lsMO8lPQN2KPA+FSeGubiyzUIvKGiq3o33QbHlGh6IqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bOM1ZCdxtAgRmoVB5ewH7UaQMH8ceOMVKJL6hCjBg0Y=;
 b=cXnI5aAQctbAWDF8mG5rS27UEqsW4zP8dmfwc/aQj0Y1OnN13XOm4zE6xrTwtRPjP4nIa3k09xcivwVWFuUQJYYg1Q4DxdrjfgRWLYxfJEFo/0Z7jIQqdIyhvkKXa4bSbxBQzI73XhmBT4UFI8XbeB5kDCSJs9kIrtDvgrEtL08=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OSRPR01MB11564.jpnprd01.prod.outlook.com (2603:1096:604:233::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Wed, 27 May
 2026 06:57:05 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0071.010; Wed, 27 May 2026
 06:57:05 +0000
Message-ID: <87tsrte3wq.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
Subject: [PATCH] ASoC: soc-core: remove card->dmi_longname
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 27 May 2026 06:57:02 +0000
X-ClientProxiedBy: DUZPR01CA0047.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:469::16) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OSRPR01MB11564:EE_
X-MS-Office365-Filtering-Correlation-Id: 15504eba-f39f-415b-13e6-08debbbd29c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|11063799006|18002099003|56012099006|38350700014;
X-Microsoft-Antispam-Message-Info:
	IWjip+uANwvvtyDvjcYenrljui6qG9wZ7XXyBGuiMURswPkJAIIqXLJTGWmyowdbyTdyCWYT+H7TDB/5q6twHEC+ajy8Z2UdyCZtJiNZ6B0+QI8t5BsbZyh36C1ooD70/vj7sYhAjqymNPFm5GeE+exCpmLorDrPbZ/hh0+kanvxFoffVusb1Yd/yVkO4uW0aRxOLT8Cw0yyZU6L1hV8Snhk6zkREuIxpMDricbAgz/u9DpIH3OKugqllIwqVMnts3kfk3sZP+AIN4pLuWaavwCG728RDhL35iyictMigm1yxcfeiFaPI+Y+drI1T1Y7V6uvkovyEzjXzkcTAH0Ocr+YngsQpC/B0PmxMrbDN92HkDOgQnKvaqce/00gGDX8CAesZ69o5PrZSiaTr9I8giS9s4sIyRXKYi1pERriPhgiPZoBKafD+2OxG1ShXgPAMZYMBJgk8Ae28S5RQvzO50lZmD7C1Cz4kOPhM1TPEPeIK0k2rSZ8neTuMbVx3BrD4RkLB317AC0YJOBmK4YdAs3SZlxGXbZyINNFfIekYZwqkUdqWSVevr3qKUyTW7IWBQIEfL4BIt1FWG3ZYJVawoLPpVIyjYDQlSkPfPZfuoGLFkCPBKqZ0GlFJGZXl9aTxeah4dRoTRCRBXp+a1kaUMg2wIJuY7cTaNYKRlJc5dajuMvtIYzCOLh7dVxHdtKGZsSzC6tqQSOlgYV3cMWMzRwaexr7cVKOsu0xim9NdMTFxXa5sTyks2AARX3BdrRl
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(11063799006)(18002099003)(56012099006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xDiiGCgPVbNI2+WiN2LCL/bxppss7FeP3Zdsm17/A3UX3J8lsgk070F5bicT?=
 =?us-ascii?Q?VwRXfc2z326AnEz6w0WU9drVJr5JYMxRkwRaj0LSZvTLMmBsoEjbBNTXgzLk?=
 =?us-ascii?Q?WSOkFbelttKSOhJGhIiz1/8NkDt1evoAe4Nn6CZJjEDsAaDbl8r8K7dUzyAB?=
 =?us-ascii?Q?jZPOscglyQxHkoEx6rUu9l0ipK5iF7f1sn8W4LKQBo1RDsqFbl4WO/lZX1yU?=
 =?us-ascii?Q?iH0BYp4qnahXwqXpeNqQigw+mBIm4qEFubdxe2uyBwfy6OL+INUP2FVAK+i0?=
 =?us-ascii?Q?T5QNcpTCPTSpwonOE1SylFhTRnoEkA1vPdpgTFrPYNdqMEDJu/hmt3pnWkVl?=
 =?us-ascii?Q?2kohGG/SDfZHugwF5A9Qi0eLcvS01O1PYFH0Z+n5qadewS5dwEfoFxufShSJ?=
 =?us-ascii?Q?IsOgIJFedI0nITVZG6s5udJ+eSFDmTbWRzMiNlH+PMT3w681UxeMFyLNFPx0?=
 =?us-ascii?Q?VE94UQDkl1K5oUoE1nZoHs9+L1bjPfJCmBlQwy/tQ0GvESBafMUd91lQDqgS?=
 =?us-ascii?Q?8eqvjHChAh6kW2WtXkBnBwTHb5z3IH6YnuqoG+dMKGngpGCm+SfhPf670kGS?=
 =?us-ascii?Q?Kowf18gkpTcyBgsl+ZaQbaDbB5ej/Pr8Z1xm/g6Lpetfui7idDYydMcIz/iJ?=
 =?us-ascii?Q?UTG5OmX6wSdxova5K2gk3AO+QOvxvHHkcZPfLl4sjh8cAtOPhlIQVN4yt8Jq?=
 =?us-ascii?Q?ILDZeTtD7mTinFyIR7Dlrd2XfYCNoXKyg+TM6QraEFKHw1ntDxldHlTJ4SGt?=
 =?us-ascii?Q?EMJxdUW1e0vrN9qIm7Ay74pLAi3XaX+3sVH01h03yLnzUTKvrd8M/zkGLMDg?=
 =?us-ascii?Q?lzPtXIhQkmY5yIG3JNwJxk/8gVKDVGYCwe1y22yp3QWifZon7WydQQqA9/Yf?=
 =?us-ascii?Q?bGBOAxvvFMCeu159Ig1SZ5d8U4k4+i0jvvhoKs+UfIW76d5y6Rl/70Xf8StZ?=
 =?us-ascii?Q?dCG0Xx6Ez6RvHdxqaFE1gIZj5FHSjAXNyiZlOvPv8ittOA6i4VNilv7LJrmi?=
 =?us-ascii?Q?UfpqVT1/f9N6AZErNXKmAHaBVkr6BQlJTtt28M13QtVb4+e6z5F+MWdLmNSC?=
 =?us-ascii?Q?2JntNv5jI6G5bQtd61/yYECXfLf13L5J6R+fUg6UHyJbEOaubvqXo88VXlnx?=
 =?us-ascii?Q?9HWz3p6GukPeluJDSNcZo0m908Ey0Zr46qDsb/HtIdhXbKOSc5cDjzQPDTKT?=
 =?us-ascii?Q?GZq/KufQ7gwl2HgyRXlE+VfAlnplaEAjAJqzVvk5KUVnF0G4cuQdXjhnik2R?=
 =?us-ascii?Q?9mJFDzV4M9FdghOHm5ytdfCbJB5krRKEt4Ii9AeGq/5ELO312iMJMTbIC1WG?=
 =?us-ascii?Q?lXJKh/9TG0e/t97Hksbe098T+ENqdQXl609YGHKOx4VJvClakHVMsySSpL09?=
 =?us-ascii?Q?4p+teRKXZGEOFK/hriTaR0RrsndNwBVl08d2rZtLMsvxT3v0kadiuu7DgTnh?=
 =?us-ascii?Q?nkeusUZuqACtR/E2OMEy6zosM2xdPtPhtw+S3lLHI8UTGKG1g1erP1UG+HFu?=
 =?us-ascii?Q?yvfjuPdWD+tTHy+QtA00cMUzH7suWoKDxVPK/EWzNCVadAvw7+qSutdXXx7R?=
 =?us-ascii?Q?SJJt6cJBy1HlFchuVU7EvrjTRb5xGDnARhDGCjfGgbQ1zqboSXJ/WEVb0YUe?=
 =?us-ascii?Q?OQwF2bQ98NtTjfwRC4ugDnagASiCy4fer/8BcrhwoNI0mrs1bkoeWIyhaDL9?=
 =?us-ascii?Q?deRvj6ncM43ZFxB2QBcG3y9k2eI0H/0F0m8CoxBTBd7aOvFcahaXHjtANKZM?=
 =?us-ascii?Q?h1DGBo4p7CjYNcp4w2h3qpiPAEFNLgU7Uv9ucXOdyp+K0FECqxyZ?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15504eba-f39f-415b-13e6-08debbbd29c2
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 06:57:05.8401
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MFLnmE5suWiSYDUXxvXaATXRu23qGyuSHHYOMRX8vmC3Z8r3ila2IP6eLOzULPFzrIrJ+2FihrFIqWLEElTOFHltMuj+cCu3SKpPE1+hOQ+YS4WfR1jO3vOf0hQRGIPZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSRPR01MB11564

Current Card has dmi_longname[80] (when CONFIG_DMI), but no need
to have it in Card, we can alloc it. Tidyup it.

This is prepare for Card capsuling

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc.h  |  3 ---
 sound/soc/soc-core.c | 22 +++++++++++++---------
 2 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 77a7539ef37fb..8681dd3f4252f 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -976,9 +976,6 @@ struct snd_soc_card {
 	const char *long_name;
 	const char *driver_name;
 	const char *components;
-#ifdef CONFIG_DMI
-	char dmi_longname[80];
-#endif /* CONFIG_DMI */
 
 #ifdef CONFIG_PCI
 	/*
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index ec744b9d6fd1e..a1adec44e77b0 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -45,6 +45,8 @@
 #define CREATE_TRACE_POINTS
 #include <trace/events/asoc.h>
 
+#define DMI_LONGNAME_LEN	80
+
 static DEFINE_MUTEX(client_mutex);
 static LIST_HEAD(component_list);
 static LIST_HEAD(unbind_card_list);
@@ -1882,10 +1884,9 @@ static int is_dmi_valid(const char *field)
 /*
  * Append a string to card->dmi_longname with character cleanups.
  */
-static void append_dmi_string(struct snd_soc_card *card, const char *str)
+static void append_dmi_string(char *dst, const char *str)
 {
-	char *dst = card->dmi_longname;
-	size_t dst_len = sizeof(card->dmi_longname);
+	size_t dst_len = DMI_LONGNAME_LEN;
 	size_t len;
 
 	len = strlen(dst);
@@ -1929,6 +1930,7 @@ static void append_dmi_string(struct snd_soc_card *card, const char *str)
 static int snd_soc_set_dmi_name(struct snd_soc_card *card)
 {
 	const char *vendor, *product, *board;
+	char *dmi_longname;
 
 	if (card->long_name)
 		return 0; /* long name already set by driver or from DMI */
@@ -1943,27 +1945,29 @@ static int snd_soc_set_dmi_name(struct snd_soc_card *card)
 		return 0;
 	}
 
-	snprintf(card->dmi_longname, sizeof(card->dmi_longname), "%s", vendor);
-	cleanup_dmi_name(card->dmi_longname);
+	dmi_longname = devm_kzalloc(card->dev, DMI_LONGNAME_LEN, GFP_KERNEL);
+
+	snprintf(dmi_longname, DMI_LONGNAME_LEN, "%s", vendor);
+	cleanup_dmi_name(dmi_longname);
 
 	product = dmi_get_system_info(DMI_PRODUCT_NAME);
 	if (product && is_dmi_valid(product)) {
 		const char *product_version = dmi_get_system_info(DMI_PRODUCT_VERSION);
 
-		append_dmi_string(card, product);
+		append_dmi_string(dmi_longname, product);
 
 		/*
 		 * some vendors like Lenovo may only put a self-explanatory
 		 * name in the product version field
 		 */
 		if (product_version && is_dmi_valid(product_version))
-			append_dmi_string(card, product_version);
+			append_dmi_string(dmi_longname, product_version);
 	}
 
 	board = dmi_get_system_info(DMI_BOARD_NAME);
 	if (board && is_dmi_valid(board)) {
 		if (!product || strcasecmp(board, product))
-			append_dmi_string(card, board);
+			append_dmi_string(dmi_longname, board);
 	} else if (!product) {
 		/* fall back to using legacy name */
 		dev_warn(card->dev, "ASoC: no DMI board/product name!\n");
@@ -1971,7 +1975,7 @@ static int snd_soc_set_dmi_name(struct snd_soc_card *card)
 	}
 
 	/* set the card long name */
-	card->long_name = card->dmi_longname;
+	card->long_name = dmi_longname;
 
 	return 0;
 }
-- 
2.43.0

