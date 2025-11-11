Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011001.outbound.protection.outlook.com [40.107.74.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE92F23313E
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762821319; cv=fail; b=GLL4W5WKX66HP6xiCZIF+exA5w1oWLNAeV36m7tC860MqFU2T9CoN+f5bFn4NXeA1ELVfO5pKNmbxgHMpCHQf3FerNlzJLvfmHTxDPxh8ZdoDtsazHSHu4u7mKkqkIIij0pxnfAgJY2tN679q6CNlLK5iyAzps/iaiIQ7G9CUv0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762821319; c=relaxed/simple;
	bh=mTEoalJd4jAi7fYU0YqqSyh56GiArVhDPYUGqM2eQz4=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=YUnIDtv79hoed9EAkIeRcWPz9I/YtyLpXdjABClgDplOTw8qsoqBuKlWxbkx5yxrB/MYXvwQI5tp9NTa8g1CJZ3oaPBIYFB3HtpJTtTAGvLL7fDMUHDL8ntHrt+MwMF9bYuJ/Sm0EVVTdQN0pkjPdHYJ8ifY+gNYYbmUL1rL/pg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=bIm+3MRH; arc=fail smtp.client-ip=40.107.74.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="bIm+3MRH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XahRzU0pf9lfDXrAPaGwF0MFp/EipK9afDQqr/4UsCTssvpN04+BfbpTAipm+yoBiXletSkyH8DJhPMW9+PqQutJIFHpJPGlFVhE90gM+QBXL91KSzHuSYl+uW2RkG3InieANCvelVfE6tsL8E+g43rkolGkBcpMeX0WNApw5+LlA/fV+Td9YOarubMSaOcdpCgf0nVgBWn0UttGpeMBdy+SFgHEafTW70OYmVWw0/FQpesyMs5SE42ZslfaFtatT/3uEFaEuB7JkQ4PSRSmMJAXfxaxzlT5yzKb+sLn4m/4z9InqMTLwjTGEA1rgtPKS/CW++UpL+s0IPoADGljdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eMcZjT0d8g53hCFqMtZ91QP1bkrFldcLOVEb6RjoX0Y=;
 b=NMLX6p0TmrwwJJbHDtLUc8AhWycVG7TYE42bro7O/3ZwTKVKYnHoX1lzQyEIpqo0meUvqDWbcMAZHub2qh5iClYR2nKftzy4DHfgGAGlW1UBLJ7ihmkNvddInGffLYOxDou8s4VJNTF06W2Oco8UQokWFnVASoUuBn2Glsd8dYBNhleAT8R1cd1wh9fNl9o6bYcRXiFVy/MZAFu7lu/2ity+aoFBu/UMSkTMwJT5QjX/SIc7Uffh3JRGcG6pVLAKJUbA5st0f0TtvsrytcwGP+PmsQFRr9htIml5jGE7ureCUMlOaSPUpXm6eFd4h6OZhKlVNamFeis9/67VSTKwLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eMcZjT0d8g53hCFqMtZ91QP1bkrFldcLOVEb6RjoX0Y=;
 b=bIm+3MRHB8evuECBt8kteQNQNLKDAY+3arfo+OeHWAqufqbt7he9KEWnbJYuUNrVnQZEGR4/t6prqvZ0ErsAC7oqkbE083hhwGcg8dVkt8rkDLOLTV/6JINguFOcSbGrY+60d4TEruwUvj2XoZ5x8vGsHRCFEhKBbA8smsFUWvk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB14482.jpnprd01.prod.outlook.com
 (2603:1096:405:238::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:35:15 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:35:15 +0000
Message-ID: <87zf8ttni4.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 258/292] ASoC: sdw_utils: soc_sdw_cs42l42: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:35:15 +0000
X-ClientProxiedBy: TY4P301CA0099.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:37b::15) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB14482:EE_
X-MS-Office365-Filtering-Correlation-Id: 331ab35c-f5a9-4124-dc01-08de20ba2edc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vI9mztLO+G/oHcEoAyV1I4G92vN1/RLB5n2lR2MvsNC1oLqBl4r7MgqgztRq?=
 =?us-ascii?Q?HrmXyLSXgSmt335iAyka/e2qpWe9X2RvzkerAD0SMB0nLWIfjxcVVh+PPMBL?=
 =?us-ascii?Q?0my5zish8RLmYfkQK67dFQz/1Iv1VYOHDNBeB5qPEQ3e02HYJcBwaxWjO6OY?=
 =?us-ascii?Q?h3/WOKvUjv+qT8xbK2ENoyM0595JnMvdwGy99KHtzWuhW40d3msY8X8WPOJd?=
 =?us-ascii?Q?00Fq/V8GnYVor0sNl+bg2SlyNRL9gtAXvcBOOL1M5xiYAdkFmEhRDVjdxUBI?=
 =?us-ascii?Q?RfwZSn+TGi9JHD/UZgj4TTs1G6Kxc6ncdifd39Tnlo8iWdZ17tyeZDx7KqVy?=
 =?us-ascii?Q?Le/41CyoZb4JHbi3eDxGteFu02QAsKLBh0bBIMuDgSGyN3AVRq2Kl18DNOh3?=
 =?us-ascii?Q?3j9w9yT8RFvuHqYGX3pA4muci54/N/FDwJSW+Lbkp5kKURq7tB9I2MU/WQFs?=
 =?us-ascii?Q?qVU+Ic5QRKtfVGApjkKRVXPKIsQ2vXcXkYvtQ6OdroqBJBnLPmGGyvaD1Tqu?=
 =?us-ascii?Q?5pTEhDBknF4FUYghHCExbIgXe3K75priBekxCUXGp2Z5b4rFUrlClnDm2d/B?=
 =?us-ascii?Q?78OPKTdl/zYrEfI9idoN88QJh+d3dV97tUyUY0r57j9LTtxWrk7fZk83KLCX?=
 =?us-ascii?Q?1t1WRz+xuBRv8xyGFVxItloxuHUbTe402fnAiS9qJ4A2DSf83wTc+k9CDI5p?=
 =?us-ascii?Q?P8HPDw/EsoLZl/+LIftMB5S9TAc2mzqvOSy8ZA8bPx7JmhJX6/fcG6mU95gL?=
 =?us-ascii?Q?TbiW5ap/UgoJM4wNyUCC6/qW+Ia7c5+L91pwAgBfXnHl1lbw3u4oGoAVjJiQ?=
 =?us-ascii?Q?BKUpA/NQW3HsgOv3KS1Xbcj8oAhTaeySRWhjvI2cGmWpF0TEH4TgWjqvl+ID?=
 =?us-ascii?Q?yOcph7l+iu5EC5Ed1QA6soznrZEyJrw0PDQeRL7S8tBCThIKI79qtBqi5x4+?=
 =?us-ascii?Q?pfN57fPNC4JA1VOqsGa4MeO5W3aSTxkzEcO9ULVNvegjjhZ/jrZT5pXEk2OQ?=
 =?us-ascii?Q?xTKPo76AeXk2TaU9lt7Wb1ZOUxZmR9xa8hbC+SMTEtdLa9eM0w6NLTvbU5Ml?=
 =?us-ascii?Q?SrFTDA0qZRXAlwLrNoXxzKQKhHhXkDfe5G+I1DVjpQYnnraukRrM+fEUhW6e?=
 =?us-ascii?Q?7tyGV0uXQBVTil8tgXa1Cu4fIOtKZXvChwvQzzGp4iMuN6PEcP37YDD1RmeN?=
 =?us-ascii?Q?BEgwwEkjdSoppEwR1/4N+wlRIiXs4eekuCLsb5mIfkCGuU4J8jWvEYm9pB1T?=
 =?us-ascii?Q?nF139bJ0MBwSJ+YL66a/zS9FR9NQ/i6mwsX9x1VV6BBYprPtV09qQaqaKIE1?=
 =?us-ascii?Q?JKwrl4aETOwlISJBuwiZ0JDoSmhXsz5/KjrdprL+vEK4XNtdeNmfUChU2nFP?=
 =?us-ascii?Q?k0K1SVSgJQNXRmJOq+x1650Y7w/3GkyiaCuYKaNR2OhfN9jJRlYBFxkGyNLn?=
 =?us-ascii?Q?Ug1W1K6EJnxoZ9WnQnI5XsMdOXfzQ/JthxqvCxetK5zpy/OYs9qgics/JfOQ?=
 =?us-ascii?Q?9XGop1ScOg2jKJHn5Ynqc9i0TjIOdLXQDySU?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?w7qCdF/BIwMA47oypZrobAtRQJbOFRdjRwZ60uIRMLlsGbvRKI7BT0Sz2+wl?=
 =?us-ascii?Q?fX9iOpr+NQB2iXbQ76kdHWaYVtg9lnUIHts+FnjxiKx1picOuSO123WER78B?=
 =?us-ascii?Q?3jbtvqI0qm4F8pBw6KVltDo81gN9Zri6fe9yvRRqvbAkBQvexjEwK1XoyNrE?=
 =?us-ascii?Q?uzhHV2xT4rl2LpYnXB/AZqhEpdURjiDMIT7qgRnRgkPE8govycyAVSlKVq2T?=
 =?us-ascii?Q?ua7CtVv1xGm1FWFntf7oAC/fsY/uiOUeHeBaZxR3ogpYTCuZdSvHmT+YkFJn?=
 =?us-ascii?Q?MBWItHiKqSemXPYcC9iS9bipW8DWHOfXH0SXpEOl91YNFr7M/6hsQI4npYFX?=
 =?us-ascii?Q?75HR8H5QR1Y77wJ0/sqO6pQ40lQMLfCczgPk+YQu5YjkQllL2DZbZOZ1SIWz?=
 =?us-ascii?Q?JZQmfrAOlWE0Gg3B1JTiEXDicC1fkfz6rjKiHP/TVDsvXT255Vb0CY2xU7l+?=
 =?us-ascii?Q?XladZuvnkj7O1yslk3CWid0wz1TlSbOGzzAwgobVfp4Mz/UgZYpxgXrEwbpZ?=
 =?us-ascii?Q?HMrymlm2/COIcwlrNzxgD0GwEl2AjlsxeP3Ry6kZ+GJZUPSz8mj/WkkyPlIl?=
 =?us-ascii?Q?fjDO0YudjWr/wiljwwLSP+EI2qcdQohJv2926imOnjAa4ce0B2BReRwf0Wc2?=
 =?us-ascii?Q?IOps59a+wBOPRpajLdmiwcwbGkMAEI9c4PEaZgOdPXQZR8p/lVf7RQR2SYL5?=
 =?us-ascii?Q?yBNVmamuPhMSVaZc/MRFlSEDTopO1dhC5xl+dvAStjwOQ0brBr+v8xA4BORx?=
 =?us-ascii?Q?wTSJYN0wI7mWGT2NXABwKC4NEY+HRc8A9OjWiuq5mEUPhpiW/2z/f0YFbysP?=
 =?us-ascii?Q?Jn26lbrPWxJFRUpXsdKg+fhfYZSEJWaQN2LJjEQxu056AHaJf63N6Fyjo1K0?=
 =?us-ascii?Q?1/zWaX2/pW0/F15yp+jD9M5b/ecnx4J+Jjwk4zjDjCNvOvaVTyYbmsaRNmn6?=
 =?us-ascii?Q?d0nGu3wHK1U4PsCB/0Tm/MipgbnOD03my6A3zZk7e6JeGitYmu8SsZ7QJaPm?=
 =?us-ascii?Q?m/zSxm76aFg0lCRb8ZG+7Kz3a/mSvu2CKppo6YWXqqASwhiZoulM8kIDcyYd?=
 =?us-ascii?Q?wczIJNOub+IYTfV1j1MpGSbsdM44528fSElVjrG0JF1ConjOTPimehMGD31z?=
 =?us-ascii?Q?2JqSEXI/ixp6RU1VrX8VIE9rhq8jaFtYbpdFQk2a9FzGHdkRymVAHqmaelLR?=
 =?us-ascii?Q?xUU7ZHVErqK578Hlw6Hql092HJMhEvQpyWzoyFP5e/xhSenfjYBAZQEfg5ao?=
 =?us-ascii?Q?+zNM//QggZa4yyiiM3503NlfhKP81OroVXfEUs24Zuk8CQfldF10UmI/OgS1?=
 =?us-ascii?Q?RB6TcwnRe+D4IAXaWZaTmN+hqww8M/JM5k5g7SkNNNb3hx15XBLhHNXNOcUA?=
 =?us-ascii?Q?EhSmRfJXfsQd22aAEgqtkEwgfxhi17Oxi6i+pBAquqMD4AcDi4BXXUTck5WN?=
 =?us-ascii?Q?msd6fHdXsK+m3UzRhdiMpUG53Q1Q47S30DHTi2k0gopnzIEg2KL6SJ5K4GoV?=
 =?us-ascii?Q?h1RZTXcLIVMcmRkie7VOafhXe0wwdivGM0rHBYaBBfMilYtHfH+DSSCruiX/?=
 =?us-ascii?Q?Jr07fbSwKkXtadA3tRzPSfjwYjqt1ah5IceOKU99pUHAovRkKruh1OhiSZza?=
 =?us-ascii?Q?EnfJqwfPVntavps9sOn4jyU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 331ab35c-f5a9-4124-dc01-08de20ba2edc
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:35:15.6504
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kX6RCfCsLKc+rpmCRoZ18bzduyLdGd7H+LO12FbcYiq+Lr5261/E9XDjhbS33aeY5w2LmoxRH4I5VHQlF2Vx5tuoAY8DJ4PpfFJFGtJADY5AmDpzLOi/DLVyY5HgK+7r
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB14482

This patch converts below functions.

dapm->dev					-> snd_soc_dapm_to_dev()
dapm->card					-> snd_soc_dapm_to_card()
dapm->component					-> snd_soc_dapm_to_component()

dapm_kcontrol_get_value()			-> snd_soc_dapm_kcontrol_get_value()

snd_soc_component_enable_pin()			-> snd_soc_dapm_enable_pin()
snd_soc_component_enable_pin_unlocked()		-> snd_soc_dapm_enable_pin_unlocked()
snd_soc_component_disable_pin()			-> snd_soc_dapm_disable_pin()
snd_soc_component_disable_pin_unlocked()	-> snd_soc_dapm_disable_pin_unlocked()
snd_soc_component_nc_pin()			-> snd_soc_dapm_nc_pin()
snd_soc_component_nc_pin_unlocked()		-> snd_soc_dapm_nc_pin_unlocked()
snd_soc_component_get_pin_status()		-> snd_soc_dapm_get_pin_status()
snd_soc_component_force_enable_pin()		-> snd_soc_dapm_force_enable_pin()
snd_soc_component_force_enable_pin_unlocked()	-> snd_soc_dapm_force_enable_pin_unlocked()
snd_soc_component_force_bias_level()		-> snd_soc_dapm_force_bias_level()
snd_soc_component_get_bias_level()		-> snd_soc_dapm_get_bias_level()
snd_soc_component_init_bias_level()		-> snd_soc_dapm_init_bias_level()
snd_soc_component_get_dapm()			-> snd_soc_component_to_dapm()

snd_soc_dapm_kcontrol_component()		-> snd_soc_dapm_kcontrol_to_component()
snd_soc_dapm_kcontrol_widget()			-> snd_soc_dapm_kcontrol_to_widget()
snd_soc_dapm_kcontrol_dapm()			-> snd_soc_dapm_kcontrol_to_dapm()
snd_soc_dapm_np_pin()				-> snd_soc_dapm_disable_pin()

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/sdw_utils/soc_sdw_cs42l42.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sdw_utils/soc_sdw_cs42l42.c b/sound/soc/sdw_utils/soc_sdw_cs42l42.c
index f37c1793991a4..ff1bdf52d483e 100644
--- a/sound/soc/sdw_utils/soc_sdw_cs42l42.c
+++ b/sound/soc/sdw_utils/soc_sdw_cs42l42.c
@@ -40,6 +40,7 @@ static struct snd_soc_jack_pin cs42l42_jack_pins[] = {
 int asoc_sdw_cs42l42_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
 {
 	struct snd_soc_card *card = rtd->card;
+	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(card);
 	struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
 	struct snd_soc_component *component;
 	struct snd_soc_jack *jack;
@@ -52,7 +53,7 @@ int asoc_sdw_cs42l42_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_da
 	if (!card->components)
 		return -ENOMEM;
 
-	ret = snd_soc_dapm_add_routes(&card->dapm, cs42l42_map,
+	ret = snd_soc_dapm_add_routes(dapm, cs42l42_map,
 				      ARRAY_SIZE(cs42l42_map));
 
 	if (ret) {
-- 
2.43.0

