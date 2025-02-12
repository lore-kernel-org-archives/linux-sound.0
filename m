Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011047.outbound.protection.outlook.com [40.107.74.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D66D18D65E
	for <linux-sound@vger.kernel.org>; Wed, 12 Feb 2025 02:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739327069; cv=fail; b=mUGgxEyH1Jgq+VeC0owN28AgZkOit1YAtGOfzsDFPd7YGzbGbY4j+5k+nhtLrStW2ZVMkGyLoAEAKak9Zy227BBKqyDkn0vyzIsDlzNi3vzlgO1yS93YaYQ9UYBqJZ4rt+UszNbVIAcOW8b+Sa7ihVBw1NAYETxCQABtiwYd2LE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739327069; c=relaxed/simple;
	bh=zqDwDfJPBNz5kNT1s+WJKFSPZ2uMp53AntVUnR9ksG4=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Z9D5vs1kSbJi9E30vOXLLMi1P16YlG9xXlydXodUx1yBHCiuMpp6xfpYGZUbldih4pzuivOHOiKKpVSz7Otpqg0w2LAvZJjSqFMT1TFexKdDHj9wZYfgR2ILBM9K1J9g1wLZlGoYMXe2IqiKqTuO4F6l9YTO7iP0V8Odgn5DRSc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=NQi8FgFy; arc=fail smtp.client-ip=40.107.74.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="NQi8FgFy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uDB0iM/J990M4pD9akME4hX73g5Rpk/6vto6G/LhGJ/DM+yY1x1yZ0X+ILeWHK6oNulN9FqY4CZ3/EVT8F8MSm0GOp07hmnC9q5sYgfHP9T0O7nsTpVHI89vNgXBEXeUMdKrPOkC0jKtHtt77wfIRXYHA491vMn8j73oxtkqUgoP7gZ8ljf7PaOvDR2IIUoaRaTTqNT0BBKR+XjkIolj7ymxoCXNuzf2vaoeCLtcPsQmAGYhwmW4LoWrfSrENXubJ2K9KUOJ8NE16C4vmlXIsBSyp/l3B3o9WGEEP7RwiE8/DfUVyIBgotAfV0faieslmU4hZUhcghJGg9lUaFaF/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vssr6/BDyNTd5376ESwDDB7hxvFXDWlAyIYQbyOQLJk=;
 b=f77OZfHsYjH8JM5dNKJT4egsL5LEqGp08OStiGfP2kIQulfW26aE3D1BwhjCbqT4eM+BjHgSs0kg9ApYmnaiuZuz8bMH7Cs/Pfw+t8A1N3V1vNZX78T3rPaXY6OuG7BBap5u9+en2OOf1GXUhUMFruv9i7Uob+R2PekkS0EXmSLY8TnXD2S8eEBIlC52hUIKrxIJOqdPJlpbNFiCCkgIClwGyuEuxH5u6xml0NboCy+BUDuDdA2fdGORXuKARnJwrkP6Jiyy3hYfF6+uha1EOBUN/jyaU8GeZYlJtvprysS+2OYbePPKg2AbUs4T2WBjF58L4ulYyKGi9Au2a5Oelg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vssr6/BDyNTd5376ESwDDB7hxvFXDWlAyIYQbyOQLJk=;
 b=NQi8FgFyhITwJvB8fR+AYq0lo6JFiXHr4QnlVVGhcLdRWz43t5CvoUsBfXYzqbjLYT1p3O7TxNnizHVMFkGKiHkgMmPTFJgYzr37mKGlkp0qITxrbzUQykrmUuv+YOayHCgo/TEn0kq+xbayI3/ZzscMQgKG1K974OFrQGkncqM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY7PR01MB13706.jpnprd01.prod.outlook.com
 (2603:1096:405:1ed::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.11; Wed, 12 Feb
 2025 02:24:25 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8422.015; Wed, 12 Feb 2025
 02:24:25 +0000
Message-ID: <87r043yk6e.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 05/12] ASoC: soc-core: line cleanup on snd_soc_bind_card()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87y0ybyk8p.wl-kuninori.morimoto.gx@renesas.com>
References: <87y0ybyk8p.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 12 Feb 2025 02:24:25 +0000
X-ClientProxiedBy: TYCPR01CA0203.jpnprd01.prod.outlook.com
 (2603:1096:405:7a::12) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY7PR01MB13706:EE_
X-MS-Office365-Filtering-Correlation-Id: a7238b81-e59c-4cb8-4d38-08dd4b0c5ead
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?KM8WleSV8x0zk5Y4utU/UxRPnqLeaymuw7+ehav1vIxMWebuzoSVrhmHU62o?=
 =?us-ascii?Q?Tq/19e3zh/2PrqSuwlmv75elT9oHpUqCSJXM8zR0lci7R7bvLSceB+L8W4IP?=
 =?us-ascii?Q?rvXaLePqtjLcHi6CkGKR1/UWYdMFPj0EzkIwtxHUFbmfmTjM0p25rdv2029t?=
 =?us-ascii?Q?XZBRV5SzgEeYPEJh9R8ddTkA9zfW3aOuWrICuWbG8crfi/6T+C+aisCCYk1+?=
 =?us-ascii?Q?NDyGFs8yQ4k6KobmWOets1c4uOORu6blQl8Ucq5wiSo88GA8sMJzCKRAnJGC?=
 =?us-ascii?Q?3K3ASfgY6w6fCEGTkERmHRVgxZkVASboXxmwGwdB9eSc2DDaidV1GgHoNCyK?=
 =?us-ascii?Q?7oekM+XRAKDZL3G5Yedm0KadQ3Ifxuq6LlgcZ6zlkA0D8zSzdEspfL0CYWAZ?=
 =?us-ascii?Q?RpVvXhQoJIw7ANTOaEW95xm8/DH2zySg4uemguEafgTHB5aLBerTlZLj7Rd7?=
 =?us-ascii?Q?XmrbCKJYwwUWeV02+Tv4lUpiUTjyypwt5/QaZXButxfZ1+PBhLd9MHNSG8/k?=
 =?us-ascii?Q?TPreKGxpmCrVDIjvBtqIhAFw0UgfQHS/zCuhpZdj3+gAPklUBFkPVbFUhPd6?=
 =?us-ascii?Q?FV+vpFy6BVSdyAd4nx9OE1NOfRCAbUEAFS5LSaJzPS89egpclJpabmLfZzk+?=
 =?us-ascii?Q?3bmIf19G2dLvzu+Ii6Ecwkq7ZlojxEpaGGqzewlUOCJFq4r2fvf1Xw/IAu8E?=
 =?us-ascii?Q?7DOqgX+5pSPo7B67KEm1uLUGmbOZLvxcHzg6xTG/6xxKH2NBEfRyx3hkrcJC?=
 =?us-ascii?Q?xkYVVYZ+WYoJMe8oBKgOflwU6xOI2cjEwKlak6bGmL13BV/YdFFaGBJs7SHQ?=
 =?us-ascii?Q?80UFfZi5OUnoOS7mP4ZRQLpC+FWOd6+YuTiWu4LPplFxRytrdFjlrpgm2joF?=
 =?us-ascii?Q?89U4fSNzbt+nV053HdMy9HdBm3ULaI3y+wkvFu8aubAeHiI5HZkZqZKoNI4H?=
 =?us-ascii?Q?QpeXqXgF2K36Ve8ffqF+FrQeF9CLKjDPhdIF9JfvrrI5cvtWaiicyWf4f5XJ?=
 =?us-ascii?Q?ealuZaTyVwvTjOhm/vxM5NG4vrRZG+qyebG7knAAOd6gibA75MMtrgWcPaS0?=
 =?us-ascii?Q?edtfTEaNekk7Uh0/AWySCHw3uSy2G0BlL1WiNXXbU3yKMo+cq+hacxfaTqqb?=
 =?us-ascii?Q?4N2s/qpbuPb/KVM97GUPr7kJ0aLSzBTZs1SzSWwGrT+z0Zc1hfVVkFT6Y6Uv?=
 =?us-ascii?Q?KNY4C4getyHuH4K+F8Eb5HIup7Q11kdWm3Pl/EyMqPBcB9063EY4nXxvNKNv?=
 =?us-ascii?Q?+349rMqbTvC87GcbrENWNoaNOLHP6BRTzt+lvAI9pypLHTUpLvg5vV0Id73h?=
 =?us-ascii?Q?lV0JgjEfk/WlkDdvEB0wHub4+LCKjcwd6+PRh2Pw2djCF3cVQ0+hA/iCAaik?=
 =?us-ascii?Q?0UoyPuSZZXWrGFMxOpfaVM5HQCqeN97fLaEpy7ueSA23fRqzN4o1ibfUq4iu?=
 =?us-ascii?Q?olRd69tKJYLhKEEcTflXGvSF3zc3IE0k?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nUJHsvrVbSdemp9TKLRlvJ5jhsLEcii0OWm9phUN+nMpvFtIweUnbbqPpkKs?=
 =?us-ascii?Q?0tMYFj3obPR4CroW0X3d61KUlcENjDcYcZ0oJV9xjD2HJbAZvIyGulEB/IzD?=
 =?us-ascii?Q?NZ7dCUraDjWx46oPWoT12G7a+vXdQoMnvtWcMsNHxXPSeLyzxsHMlbkqHagH?=
 =?us-ascii?Q?Uy2EqaMNZNNEUWVI1q7Lo6QTNFaJrBdkdZMOG01ZCioTm6x6cRZQhw5v/zLp?=
 =?us-ascii?Q?HPXqL4TLFb030XR1n6vWAGUDLNJZX74XKN/rinYMfxcGdCvARinuGGwXxHxi?=
 =?us-ascii?Q?N+J6Mf117IGicm14e/jLY7asoxqA33SC/BTZyw2safhlRMWE+/KmysRfEtwM?=
 =?us-ascii?Q?+9GW4p+UU8iBMHwJ+FMHN55QEeLGsapH6ZIsZLB/w2fwSwlaLgebe6HN8BIv?=
 =?us-ascii?Q?PYhxdVWg7grupmQyR6IekeuAYtZMa2SZTO+mFmr4OcIn0PThTAzYhKc7bC9L?=
 =?us-ascii?Q?v7OC3YATlxPF41CUvslIvBa8ZlH3XJNfur5wAp0Wl4UGnKhnXtV/YHdh4pFI?=
 =?us-ascii?Q?sVm79TUEfp+CROvTlMEUKbwu6DuU1eWFU29nGe+bJeJrCYl6uC95VIt8SVqi?=
 =?us-ascii?Q?ZW38ZjWPCJI6dfV22+pNizq6oZ6frc8jDCtpWU5a+/DRgZr4i00YgcJWqEoY?=
 =?us-ascii?Q?AV1oY4dLxfQAm5+jNbYLYlcLNS2WKCy+LocjU51uYZ9R0ZIeG5AnUdogoL7Q?=
 =?us-ascii?Q?bK5fTB60IPRWvRs2wENCN7ayad50TDsRDHI7Nt5Ep3EdZmNLE7V9fEdYtLaz?=
 =?us-ascii?Q?53pWj8i6wl9Vi8kvEjS6B84eKS1ghxcYknyW+Vowb7gz8zMkiXvbpfhhDosx?=
 =?us-ascii?Q?p9s5q7cOIgqyF2pmqHqjAI5l71cYZaNR/flcekPJcPcD0Wntk2iwRALhUAZK?=
 =?us-ascii?Q?RWlt4pem0ozVovAtZqN6ySJCjXN/cPF/6T4IDB/ePEbu47GFNwM5pHc8jFGX?=
 =?us-ascii?Q?ead/CtWio6OwdOoHUCvXB0jhNjLrbHUakq+XuNPFAA2jUAwBa6lEwEzx5ATt?=
 =?us-ascii?Q?VVSAYLXVcx8byAmuGVjrXqnTAQMAPOjpRc0guTISfdcJIyNIfSbGI7hHUHFf?=
 =?us-ascii?Q?aaL4+x1o66wNQTWXhzqgVuXVppkqrACzsWFJfcBSB7kc5fI8QUorihvUzBP8?=
 =?us-ascii?Q?vmm2fzMvTbtxVneuFhM4y4GrVO08QNs7kD57DY+VPsFhg9rG71ajb7I7yD/k?=
 =?us-ascii?Q?Z62C9o0HYrFMVr/9m1LNOC5bko6HTpZR60ir9e8TsiLzGbizQn7+jaKXtbIk?=
 =?us-ascii?Q?HFKoNlfdi5sNRyQsBhVxfw4ngt5J7z9k/9aqK49Qpm2wYUmFl3Qq+10IYko/?=
 =?us-ascii?Q?tsd8hKPytgZEcy6DEFW9LScVEYdHz+Hb6ZWUwNoBHqdEM7mg+EXME5peSPxe?=
 =?us-ascii?Q?manBWjGMntI5LprcIWir+Zvzc+IIYbJ9y1tHoq+6AuzxavCxI4tv1DvS1k3B?=
 =?us-ascii?Q?siMsGU7PoVcUVgoufXjcBpkzw9W3NxTALYo9U0N8w/2jEPzPalESf2Z7r8le?=
 =?us-ascii?Q?IYAXMgTNuYWJgmlBxtaGTgoZZWwzAjMfosopKejXcUOtPsTIEYj/A5edXyZo?=
 =?us-ascii?Q?UmJ05oWI2IXSISGmtpvaOG2EAJs8r+mBtjkJLR2mMTVaGpTV1eJU82io5HyH?=
 =?us-ascii?Q?2Rh1xYPEEqkmb2T0IM4U16I=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7238b81-e59c-4cb8-4d38-08dd4b0c5ead
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2025 02:24:25.7921
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HPz1TpLusSKbwS5YttpsvOoK+3joysV7crShTdDlJxszcoov6/fOfq5SheNCJnfOXefiC+oRGZ4TIIfnz8xiv3TRaBoSG5PMcJVNj5rmZrW5xIfW+zIKZpqgz4kB5jMK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB13706

We can use 100 char in 1 line. Let's cleanup code.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-core.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index ae7b3e39d5ffb..af75e59dec377 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -2257,12 +2257,9 @@ static int snd_soc_bind_card(struct snd_soc_card *card)
 	/* try to set some sane longname if DMI is available */
 	snd_soc_set_dmi_name(card);
 
-	soc_setup_card_name(card, card->snd_card->shortname,
-			    card->name, NULL);
-	soc_setup_card_name(card, card->snd_card->longname,
-			    card->long_name, card->name);
-	soc_setup_card_name(card, card->snd_card->driver,
-			    card->driver_name, card->name);
+	soc_setup_card_name(card, card->snd_card->shortname,	card->name,		NULL);
+	soc_setup_card_name(card, card->snd_card->longname,	card->long_name,	card->name);
+	soc_setup_card_name(card, card->snd_card->driver,	card->driver_name,	card->name);
 
 	if (card->components) {
 		/* the current implementation of snd_component_add() accepts */
-- 
2.43.0

