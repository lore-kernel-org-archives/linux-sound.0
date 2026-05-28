Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010068.outbound.protection.outlook.com [52.101.228.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36F8D1A6802
	for <linux-sound@vger.kernel.org>; Thu, 28 May 2026 00:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779929210; cv=fail; b=P5V0NZAtcD3/R0m05LNfCW24xUv4EyZHD15uu1Y0DZTD9t5AA0AI9MxFL6PEnWELXPSrLOdoI4K+IBBLeZGUXOs9Sa2a7TUV3bVRuyY39xQkg9DJ3UHO3++VYG8NcH7EBxHjNKlHhS7UYbzzI7a57wJqcg5UL3zt3kogt1JQeHA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779929210; c=relaxed/simple;
	bh=4pmtComD6mqIWifBUpCxws8mp54l55YZ4h4PFxEByas=;
	h=Message-ID:To:From:Subject:Content-Type:Date:MIME-Version; b=OSANYlV5KiVCBiRxR82dH7LDtYGDmSfmE8aLzG47UGDgpGMyLdYNnK9kOzywL/AUbW8vvQpCv6VCsWvpFppLl/R8gc/EtnvwgbiXcvSyFo+iyr/CGry8zaFpXa8xZJne2Yp99kDQrgvPyH56eoLLFWAZZsBjN4MNo3C+bcWkhJs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=aWMma47F; arc=fail smtp.client-ip=52.101.228.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="aWMma47F"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qSIqvHkt9C2/SouBvu8LmnIAjbv+wj0kIssqk9duTh7lPGkD130nrY3TM42ZIic9WMRlNx49h3bh4yufYqXkE052QbbeJKcF875EDSa5w5dRoPwG7W6Fb7fcsS9rDobQY4lOC+dtcSLRamth4u+Sj+SiPmd00lhxDNoE1DrG+z/mkZ9O23MCpaHsuVGMeB1qPo72mc4EssWncbE5BhE19S8uxwN3p3H3eaJTn8R9slpCvDHzFnPCDL3fXybkC1wjGkWdWamuqAiUrN1Aw3BA4BaP2WSMohxl17o2Wki+Z8HYGnSHdZ9kFltSnTgAqY6oYjRUu/ukWUDF3oQIWXTPUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=phGgsXvwrY0QcZzUNynJr65+XINDKcv+xmIEBAp5TR0=;
 b=LKCqttYNo1HY8PuaujKmc6gfN2Zk4ss1SjivF9bvzhugK6Cl9VXUukDsSIhH7ZPVRvtP/sT4DzPgnCJqQSPZSKt6QHdT2baGg9kOraGer6+FtlgyB7ZnFkI8JCvY/MqMnwl04p4/f4MI12p7qmGnilzcMcFc+JN4cZiX1h6BeBLL5TgWSX3cZrIHLbXEA7k/KaLldVQgTGZNl8X4LBvX2+dZ4Y5CepCfDRkMwk2LijOXSpNZwnaoRw7m+T2Bzc6NqtJmE1XjAfK6YeK8uwOJ+F/ri+goe4o9DPddWWavlMrA2jGtQGZ40yz9+jVYwu3/ai1xvUSOLT9NZQjGhQ/xlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=phGgsXvwrY0QcZzUNynJr65+XINDKcv+xmIEBAp5TR0=;
 b=aWMma47FwNjzBMPvdnBN03o1wkqD6uSApNxJVbnPC2z9YtNKTeEfPk9pwE2g9JBNCgdzHVSlWLienxXuU71nMfxXW9Tr5floDw3hP9QG63x5QRhxG0idLmJa9Jbp0EUoifoXws6Jb3cZmpp0mWwspnFHQGCDwUmtza0xgH+fnO0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OSZPR01MB9298.jpnprd01.prod.outlook.com (2603:1096:604:1d9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.13; Thu, 28 May
 2026 00:46:46 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0071.011; Thu, 28 May 2026
 00:46:46 +0000
Message-ID: <87a4tk2weh.wl-kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2] ASoC: soc-core: remove card->dmi_longname
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 28 May 2026 00:46:46 +0000
X-ClientProxiedBy: TYCP286CA0287.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c8::9) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OSZPR01MB9298:EE_
X-MS-Office365-Filtering-Correlation-Id: 18504b46-b74d-4947-e4a4-08debc52989a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|11063799006|56012099006|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	XEn9E89bIhwd58QncQ47RJvw/fYxCjFw3n0QX8NaiDwYN9soJzZIrlODpxFRjJbgtp0PPTNY0rIClIr4Gkq15ykPtItRAnt/QMsZIyJ8F9Y4oiaKJNOWrlbTejDuUqN8pdpTBIyAEI3Zy0jgkk9GhbknkEEASQQKhcQaRkqe0P967S/Fjii4LHtXfb+Bi6G/fW07tEJoy3fJJmPoJMvXQ1kCOLO6z5k2qRxqer5QI7UiaH0/Yh/m8fRd6+KQ/Y7bvohDZqEsVQFOpmmD5UH5L60FQFXKepccbrzkfUYCFoveoZZTvM5LnF3HoN7ajbgF2RIWg667wqkaxMPLVZQFnM49osLf5fYuoKZeTdZvxtO+C4jB3CZOeUwLUl1qJDLp7PGEUFctp2tTBHrYw0qkZgrny3YPViMo564jGNTX3iiu7+zxpBJLrwXld1VK6UoSn26eUrHNNAXDWw4AwoCv5KwJPjKMH+2vzIgEOpdIpxzBIlc3Z/x0BbP0wu4lz7jbILZpl2pwo1WZ1I4QpPGSeNDSM2VsUP6naEht6TUl4D2SIkR2tS5bG+lAZiZFR1LrJtgdkyO9k7iViu00kNJvNMOwSNKky2aJ+tKuI6DzxHgLkfAYzxsTpuH2h76YJdLn7ld04DbOU+P1pO8rF7Aszx8jbxOXS30XWB4954KgsjZ4KEyAG5s9elhjJwcJWqeqSnac+SmWlGrNhbYyjPCka9GDh+xvS6BV8zHpbiHwM8s4yENU7yd0VgwKBbwU6VtW
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(11063799006)(56012099006)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LAAGvaHzFHnavNcuwjRJSmv3WgG+ny3f1U1h3m1fWyvQXbfH7Cdlatx1oOZY?=
 =?us-ascii?Q?aIfyuAWpAupimQAmFvyxsIbKFF+GAjG0v3j9gewTz0jHe5NjoVUzUCUNdfhh?=
 =?us-ascii?Q?+1CYyhB29FfzEfyBP+IC/xCAIvGqA6n+S0xb6kVm4KbiHEONgf+8vqxFirgR?=
 =?us-ascii?Q?5KrCOb26z743Hc6vYtPQsVOtuesLRMivgO6jzKdSfHa3lZPGDNf8152+c9yo?=
 =?us-ascii?Q?CVSzo9GET0zSvxKjqthMGxx6V1R7jc+PBoLLBdQkQROe8ygbdmBb98SKnjmG?=
 =?us-ascii?Q?nX/2qAWPJ8fwAtFUlGbUwLKS+lbFXrNeZDMalJ5r97CgLLt2V8CKzo8J6VfE?=
 =?us-ascii?Q?39hs3XojppCF7mkCHjvfLUuXWk/cWTUkyh11JABb11eHPDkITc3iyEA7bBGS?=
 =?us-ascii?Q?t0m1Gez8nfiJ+RQpfuvmACL4FWSoOFXuEMczTQfETRddmr6eVfKCc9jSPn2q?=
 =?us-ascii?Q?WdcNiXdFeyooKPux+SPsrS7+ma1gIp9IGjecFXagDZwxwNwzn5H5b/dIysy8?=
 =?us-ascii?Q?RZK8nEF0c/dx9GnzMnmCDIL6HxUhEUl70H4cT2LDDOfWsE/8uncsudxLyEmV?=
 =?us-ascii?Q?t07zYgVaRxRVJY7+ATboI4Ftm1pWW9WdI6QI4f6EQpaxuJkckJ4V/VG/WBvA?=
 =?us-ascii?Q?0HVRVIgpWA1P06r4JZ8/ktf0XY8oSl5Jack9ye/8WF806LgdeR3ix6JtA60z?=
 =?us-ascii?Q?XEKGYtX8/7zQ+vYQH4uYp7pJUHoeCoovh9lVUTKfWpraIrjEpzms9O+rTzwk?=
 =?us-ascii?Q?RIapqzmt82sYh7TnhHeMZy7TlaVjN/9DnMNU5oZbz/kYubayscNrTZl9j2fX?=
 =?us-ascii?Q?fiPcVnCu8JPBxEp0KQNz9peZMzvGCT1h5psWyMjd9haXcnMJ8g5Zz2Mq8TLF?=
 =?us-ascii?Q?/Z1/C8Y2qnuaMH/8Da13r4UVHH/akkCvQgdtQPAlGSXwcgSEpLUSlYThWkLq?=
 =?us-ascii?Q?Nx7lbBoVWsOm3EWniJwGkOdQXCnto+s7ECNgCTZNSGz8ICW8PR7MC/cprVup?=
 =?us-ascii?Q?xjyxHRiq4AFdjTyDCreQXeHche5ncK4QbPWw5EsBhoGGpC6pwc/yfmTkAY6f?=
 =?us-ascii?Q?f7cwAak2SL6stQKOXmERx10FpcOcHBHvO0VBIfeULtJvWQo9VDDEHCMe8Hs9?=
 =?us-ascii?Q?GHP/JjIHE3/bmKxuwJeiWNGHGKU3H2q/bLoH7dpKBQd6YSJby2hy96LFeFHD?=
 =?us-ascii?Q?RQuGO+glB/N9AzekUn4hMnMsPdTz09hP5QEa+7lYvm3WIQ3A58Aof09x79Js?=
 =?us-ascii?Q?LZIt5lqf8bp1RUHTQ9+E/bFe6ICO3NuDSO4mJ62REhICT2x9+TgCp221jnhu?=
 =?us-ascii?Q?qypC+qoaqtxYdga+jzWEx7ngNY3RZp9JoeknqbOFuqCpiZv6rFq8oYmdWKBh?=
 =?us-ascii?Q?ZVo2jtLhxINSPzhf+YusIBUPx70Mjj1f2dq0V9UdEWKPOaqpJyQFwvlsHfZh?=
 =?us-ascii?Q?k2Qo26030SgF1VC5q7XHg0VlGAUnDdKodLIG/OVMFStd01pLjnDkZQv3nWhF?=
 =?us-ascii?Q?1nLOUujkj858vn1v0lcf/eO9syJym0RMfQ4x276pg6eAYlgsKvYNdTX3nsDj?=
 =?us-ascii?Q?13MEDl4SDER75fC+TgKPyQYhDsMdXb48qNi/8X3w7Uke6b9Trz2gDcebhmE/?=
 =?us-ascii?Q?BYJQNmEwsP3nb1UoErWdkE5Kk2DYkM8zDwIc60yaRkJobndD54fjy7WxGzu5?=
 =?us-ascii?Q?Xy1khf2+eileLaaNdedP4UqstNbyqAnot1ZoodIsYDOqOTJEXDhS+Ezwya/w?=
 =?us-ascii?Q?lB9u95KEsrRZ7S1O5K/BQ8Rtg4wR6hl5dMkoXV9QVhr6tj+U4Qr3?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18504b46-b74d-4947-e4a4-08debc52989a
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2026 00:46:46.8045
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /Igra3uGG3v5tXqB9r7k3E0R9FEAZ9Nr8mWH4LVxATM22D6f9ukAZzga+0Yv4blYMu7HiHBzHlUo60egua+kK5KWo1WQJ5WUYXCROMcEkGqNEgfPQOImfccmiDeIXFj4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB9298

Current Card has dmi_longname[80] (when CONFIG_DMI), but no need
to have it in Card, we can alloc it. Tidyup it.

This is prepare for Card capsuling

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
v1 -> v2
	- Tidyup tidyup comment
	- tidyup #define position
	- check dmi_longname before use

 include/sound/soc.h  |  3 ---
 sound/soc/soc-core.c | 25 +++++++++++++++----------
 2 files changed, 15 insertions(+), 13 deletions(-)

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
index ec744b9d6fd1e..55130eea04544 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1880,12 +1880,12 @@ static int is_dmi_valid(const char *field)
 }
 
 /*
- * Append a string to card->dmi_longname with character cleanups.
+ * Append a string to dmi_longname with character cleanups.
  */
-static void append_dmi_string(struct snd_soc_card *card, const char *str)
+#define DMI_LONGNAME_LEN	80
+static void append_dmi_string(char *dst, const char *str)
 {
-	char *dst = card->dmi_longname;
-	size_t dst_len = sizeof(card->dmi_longname);
+	size_t dst_len = DMI_LONGNAME_LEN;
 	size_t len;
 
 	len = strlen(dst);
@@ -1929,6 +1929,7 @@ static void append_dmi_string(struct snd_soc_card *card, const char *str)
 static int snd_soc_set_dmi_name(struct snd_soc_card *card)
 {
 	const char *vendor, *product, *board;
+	char *dmi_longname;
 
 	if (card->long_name)
 		return 0; /* long name already set by driver or from DMI */
@@ -1943,27 +1944,31 @@ static int snd_soc_set_dmi_name(struct snd_soc_card *card)
 		return 0;
 	}
 
-	snprintf(card->dmi_longname, sizeof(card->dmi_longname), "%s", vendor);
-	cleanup_dmi_name(card->dmi_longname);
+	dmi_longname = devm_kzalloc(card->dev, DMI_LONGNAME_LEN, GFP_KERNEL);
+	if (!dmi_longname)
+		return -ENOMEM;
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
@@ -1971,7 +1976,7 @@ static int snd_soc_set_dmi_name(struct snd_soc_card *card)
 	}
 
 	/* set the card long name */
-	card->long_name = card->dmi_longname;
+	card->long_name = dmi_longname;
 
 	return 0;
 }
-- 
2.43.0

