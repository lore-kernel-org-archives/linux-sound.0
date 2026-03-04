Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011017.outbound.protection.outlook.com [40.107.74.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAC7137F8CD
	for <linux-sound@vger.kernel.org>; Wed,  4 Mar 2026 06:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772605443; cv=fail; b=jgEISdz/hHn+Y0a/TYHT1GTbdFAIZBKt6V27rJ409MQ16H/V/KkKu21PeSBLEpSLIPAtvc5BVrdQL+lDkMmod05FbwZo2kji3S8BuwZ0v2sVGRciCWZ4xeN7Ovuw+c6BzbMc9upxE1SENzETGAqHj01A7T8LxxSMn1ZcK/olszk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772605443; c=relaxed/simple;
	bh=8cd+wItVdJjazVmnrM0v3ZinIqg6GU5X8gUhasZ9Jss=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=sYkXh7tFTohx7peWpB1LNxzLccga6k6Cc0ZVGrqZ7Fu5LzaA2Q2pnSFwngATLorIJy/vBkAlrhJiRZZNI7Zc7pEaSIlSU7lyREc/AISQFp2womtUkzPVF3bNmnRim6sgCzwrI3K+LNyyrUWhn5RSZMeHB4v3sO5U+f36XKsHCFg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=LELXu2W7; arc=fail smtp.client-ip=40.107.74.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="LELXu2W7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WwRh8nVha3nFX6fAHuE6q9krjrpYaSBSDgxprCgVMykLNeKz20YNgXrXQLDDcMWmEHn4fKKLqsJ/JS0RrUypOhembQk+cVLHm6JlbomWVprodoWXt7zPumg5pY0+HC7kXhCGQihG4/FLdfKQL948BVrhblVRjR91U/xOkd8TTMTqArtWsyG/r7YbdlaD031SAYlYisDmkj88JX63/ijInkWr7ZIHqkdxsEBiB+5NkrMbBk+IhdeoqCGReduxy3uha4w/mVa9YkarU3hoG6G43IpYY/gmifMPXriFf2XH+/dvIuL+JAAZIeHIV96nY0HMmCq0m7816QlyAuu5i1haXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8UMy1NdEaIzy5L21p4LpkoTzEJrETcN4W8yrZPm4SR4=;
 b=JtRijU4Ec7QQ/vp8ZpNegxOqMKlV7OkxZzNwG6Ia35m2XXvjTAzT+cV9JUaw6Mti8K2jM/3xPergQIzd9/i7ly7vJ5UmIQxJW52dZeOqd1ypFnQwAa4DH8UxSi/ICxf2nfA5MdcUhXoeD+Z8VZkOvos5VtJXSyugoKRjcE6Ea7E2CmZuAt/zYiGDa1/EyRTOqo5afyjBNajg4Ve9JccB0raaeIYgY/AdJJ3Dag/V6KB2qjTJCloXhv4asgRpeale48dqukmSfLCDAKyalo+aS0zqhgCsSgMowRAn02g5oxY6l8m3bhWV+gT/YJYZ/yj8YPf6fnWsDM0Yu8nMRFo0ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8UMy1NdEaIzy5L21p4LpkoTzEJrETcN4W8yrZPm4SR4=;
 b=LELXu2W79FEor4Bocy2BdHwP42VWisEybKeKiC5S+366wmKrJgGmjTMRGWpWLsSsAhYxK2CpCckapO0rWRbkkTNbtFexFNk2ZyUPfi2Npkoi3CVRVDkIAi0TPWr3Z+Kix0poukJTfo1vbjTn6RMWwfdnRhcYxxWMcBnMBZSGE28=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com (2603:1096:400:ff::13)
 by OS3PR01MB9755.jpnprd01.prod.outlook.com (2603:1096:604:1ed::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Wed, 4 Mar
 2026 06:24:00 +0000
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9]) by TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9%7]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 06:24:00 +0000
Message-ID: <87wlzsnmdc.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 24/29] ASoC: stm: name back to pcm_new()/pcm_free()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7fcp10x.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7fcp10x.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 4 Mar 2026 06:24:00 +0000
X-ClientProxiedBy: TYCP286CA0280.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c9::8) To TYYPR01MB7976.jpnprd01.prod.outlook.com
 (2603:1096:400:ff::13)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB7976:EE_|OS3PR01MB9755:EE_
X-MS-Office365-Filtering-Correlation-Id: a7b30a3a-8783-43fd-3efe-08de79b69fd7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	xNdmBdRoSASkpMbZdt/DnvxG5va+fXtwWnUeS+wgAPRC7S93qGkIAipMy8mV7mwzp0tymblxaGMrZvM3k+vex4V22UI/VJ3JlNwcVfEgeDAZEcl46x4AhsLsl3CkkHvMCYnvTKcZ2P7gMDZOIXJfEM2fdszrnnEksAkCfVPM4JqB1wbwH9p+o9V0RGXwLn8bNv5kxHBidkt5+zOx0zY93DO4yEm1lADDy9b9gmh7rv7TOtFLwgWI1yu6T4FuT0qHPAJrbX/8UqQhFRFandxAnaeBWOIFBm1d3BeKabF9gotGe+oKYObhq01iG3i+sPtuonmA7fp/oOxG2aeRUJvR+3AfDrRjXIknQiBK7wYRK8ZAQ4uuuuFtq1Tx2oROK9XTH1V/97MJyvQG37e4Il5EBaBf4sypsoc8EgczmeeTcqDA7HNKstpKfQ+dr6yYCpYEw9krwH4LAc2Zhhn8gDKzgBQVRp1ina4nGFlB8tSA7M3q7kZXMpbg4w6lCGJd0Obs06i8IMad/NSQ7NYAEXgnZMS8pCKD1GXtViODTpc4xm2HUXRJr2wd2qOXxbh3NAB029HGFWX/WTzL8iJBPjODp2obgEmKB91YF0FcODiNsvT24Uem4UiOhigsLGoGqEPKtMwnoobJ1doneZ5tK6ky9k7cwRXjcXNQz+X5GSEcyR0yPgMijzK9vnl9j6i0qYRQkSjOQ1fB2VPoGHSA5VApbbiIUzuLLfTQs8/Tijj+eim25DSUVNsQKsRkIURa1atUpqufSZNUW7R8tFexMmLu9InECSBIcIuZLax1Q8hmD8o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7976.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?G2CWEUZOwiL61qKxyWNsY6wlKWfQpbIKKGgwFW6+Nnj5UxI4omkBGptI9Zeq?=
 =?us-ascii?Q?Q2QgZEYRDJVJWMewQK84n+id3BZdmrC32q3Cz9g6ZA0e5LKe953N3P4pdJxw?=
 =?us-ascii?Q?rq5DDWwo7Lra9WvMzFPDz8XmK2QozZ86nsdvWxekpJegrt4gjciuRdyqtYGq?=
 =?us-ascii?Q?rcKn6aYg2KMD1ctV6XiZhrsj9Il//EkJG8Bruoj8MGMkxvZVAm/bfkzxRjvU?=
 =?us-ascii?Q?FWwZtVnTV3a187myx8IjT5/e3lbbQvsodLzS/mTZR2Xw4wUBYbKBed+t9sZY?=
 =?us-ascii?Q?vm4aD9C35lmV4A0nZrJMSWoud/SCRL452LznkNAitkIy0Y+4D1IKJwVARKX+?=
 =?us-ascii?Q?9uJXpeZ+mBqPDsjCKO1yqRmgnxYy3ILwAx1iXVvpIDfbsrDxO21Ehfi0WbC5?=
 =?us-ascii?Q?EPa9N06tVH6zv2i70DY4wWdjtx71NGaQlVDUMjmm6umJKyt+uijkNQNBRnea?=
 =?us-ascii?Q?Y7KgE9ch9aDY23/GQgL7/42bHILa4Cz2MzZzXnby2ygi1RC2okrU3J0jSBek?=
 =?us-ascii?Q?yJRqOAcR79u4TCIFxuIYIWYYVP73RCc5lO2Y1iJ5R/+InFC+HjS93qGeM9ds?=
 =?us-ascii?Q?9HYWkwkRAL/dtu++qm0dzolz2VX7RV0U8HM9KCvcXSfG+5WfukMJ6LaxKOaN?=
 =?us-ascii?Q?2M3mOiumCQJAcmTv8DHIj/uhYhFiyBb7ig8GM8LH6Y+3h787pGd4z/aLoIvF?=
 =?us-ascii?Q?JowRk0vucDcdJX/Xdg2PhsYdgL5IT5NkiMuzD0Q4A4m8vVFkKhMOEQ3ocQBR?=
 =?us-ascii?Q?QmBhmas6nfHq3Re1sz9DO6stzZ7JSlyaekAHDwBGhReS1q8q4JKHmOSe8Or4?=
 =?us-ascii?Q?gmyw/pYcP8SuQENjw7/wjTvgqG0ntB2voJ+DbB046g5Zx4uPOx7NfRrGm2z7?=
 =?us-ascii?Q?ZOtrVyF00pkhZciA+MJDfZWJLJKAuLMG45jeP2dCG4fuA9KUeKhkTabisRDp?=
 =?us-ascii?Q?HAP7gzZ6qqRNBBp13XKTwqQW+qj5UGN7TE2QWcMGPsUNvevrR8YqmxYXF4lP?=
 =?us-ascii?Q?ptgLJZpPxN/K5tdWIKdP5XWE65ytFaBxr6sYw1gTVdbBqzSDheq/mf/7tPiD?=
 =?us-ascii?Q?tHvh52TPUof2trS+6CPe0KBYfm4d8ccpfENrdDscrRQaOGM8hFs4yNOpDXmL?=
 =?us-ascii?Q?h/fH0yXtPglZNvbOeyAvF0CKPrnVpZH3r2bBex67V+6nS/pzoq6pVFSL5zuK?=
 =?us-ascii?Q?zPIdywHs6PMzH8Ynn5HPgJQiUc7wBIrYjeWUSh2wsfQy605hFQLCKzASg4jF?=
 =?us-ascii?Q?+q83qdmsfdi1seY79bpZ+YwUxn8aewd16WshKtDsj19VE1jHIRH8olKM+BLR?=
 =?us-ascii?Q?LJEpalRVdUj1hUSYNilfzry+JI8w6fKzVo3jyC8UuIWVc4+lerJ5JZzff1Nc?=
 =?us-ascii?Q?0/40RBOcn3GMCBRGDqY7VzaONwepvIM3WhhIg36+amaCLyIZfiHiYoarljTV?=
 =?us-ascii?Q?oaS7fnq6ua7HVslkv7GpNfRWtMSXBPmAN1dn5o2tZmJkFijkXA8U8GDs112T?=
 =?us-ascii?Q?weY9ORuL031zA7VzTzIEXKcoAax+HRdrqah9zBpkj68UbxJngwMOcN55nO+3?=
 =?us-ascii?Q?ueP9PPL9bVYKAk3fuuzrrgd2R/G55BCXKRW3jHCvZ3mva2xRhIhmnXLaWi84?=
 =?us-ascii?Q?du4nYLWPYnkXKu3bKcAytP+oLVo2BShe/bMFTgt9xjLm9T6CXmzKcUp3CyQH?=
 =?us-ascii?Q?gYUrm9e+xUHD4edIE9ePIKSUzxPJFCdxxgDmv3itDltxQYIF5oc/8X7VQhST?=
 =?us-ascii?Q?QWZC+2E40EXfZhGEISigjYCVlDmxZTbF2aRXjJJAjuUZyPGw7e7Y?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7b30a3a-8783-43fd-3efe-08de79b69fd7
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7976.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 06:24:00.7439
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gU3Huxywr7lSv2uYHOLCFtA2IoWxUHzgNJ66r+vfV8WjVHyb14olKw76TsQva1NYJisy+FS+hy36TqZejG755xwTA4WjnXCuh+FHCH61iwshrCyO/25KIoxgxduhTu6E
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9755

We have been used pcm_new()/pcm_free(), but switched to
pcm_construct()/pcm_destruct() to use extra parameters [1].

pcm_new()/free() had been removed [2], but each drivers are still
using such function naming. Let's name back to pcm_new()/pcm_free()
again.

[1] commit c64bfc906600 ("ASoC: soc-core: add new pcm_construct/pcmdestruct")
[2] commit e9067bb50278 ("ASoC: soc-component: remove snd_pcm_ops from component driver")

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/stm/stm32_adfsdm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/stm/stm32_adfsdm.c b/sound/soc/stm/stm32_adfsdm.c
index 1797a91fea7ae..0f6d32814c222 100644
--- a/sound/soc/stm/stm32_adfsdm.c
+++ b/sound/soc/stm/stm32_adfsdm.c
@@ -315,7 +315,7 @@ static const struct snd_soc_component_driver stm32_adfsdm_soc_platform = {
 	.hw_params	= stm32_adfsdm_pcm_hw_params,
 	.trigger	= stm32_adfsdm_trigger,
 	.pointer	= stm32_adfsdm_pcm_pointer,
-	.pcm_construct	= stm32_adfsdm_pcm_new,
+	.pcm_new	= stm32_adfsdm_pcm_new,
 };
 
 static const struct of_device_id stm32_adfsdm_of_match[] = {
-- 
2.43.0

