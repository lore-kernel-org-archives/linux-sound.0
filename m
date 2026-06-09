Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011027.outbound.protection.outlook.com [52.101.125.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5E511386C9
	for <linux-sound@vger.kernel.org>; Tue,  9 Jun 2026 00:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780964594; cv=fail; b=O8uul4N2Edl8KqbwOPhw2NpfaGUw314hRtJueBFrcWwq+hbbMsXCAWh5UJz2NfGkA6LEW9lbRUHokIDQyr9eWd1yvk5YrKsGWNE6B3cf95/zbuLx8EtMDjIOjnL0WIQN/d5vMAt4Md8I4xZWhQUAjWynPjCt2FzhtW8cUq5aYpQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780964594; c=relaxed/simple;
	bh=FWsKiUo7JvSxfNFc6i0ooICE5Ol/oXAB5tewnhQOfks=;
	h=Message-ID:From:Subject:To:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=PQGSBkdMVqzuavTplLDaQXJVzz0sdw/dSjTtUrtR7cgbwccw9NiIJhWHUlY5vdzVyPvVj6sbknhUkEOpxsZpRxO5metsX1lRIhhyl3Fi4hQd0gFRFZC/guI7fAiKQLPxXH8tDV1uj5qAxRfwbKHFmAt9QdHK+bZAH3hQYmISJbU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=KtAydIKC; arc=fail smtp.client-ip=52.101.125.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="KtAydIKC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bVtoPh50NgWUPoGEe/AnwOsKioQbmPWm8EJLHECtE4FzhZdLy5H8ESAS8KN8zZDYYMtV4ytc90tnp2ces44b5lceUdGnV3s9xuTDrMuansIpq3CMGmecn0AbdZcfUMKvTwqrm/XQFIicag1Cok8K9nH6Cdyho1KePTpzgXUXAVD7a+u5zKrqf0wV8uG3qZn8MY40oy0fsYhOm5Gn0x+7ntX05BdciXagaAN7gnbQ1sK5h7FWtHX/JZduh6U2OoRRmv/zLJCePxL06hriYJ8/FUMqX3ydRuooyO6IBlfi8C7edredkG7Gad+SN/ckEV9hY4PuxvEegO/GTQUMvD3Pag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=05/fZJ+fRPdUcx6zuq1xhlQW2hYKyYhgpWE/ytPRZtA=;
 b=if819HM2s0Z+ER5aQHlM+FE0bk+0yOFbAEPgTBjp9A+OdEAchBnPNI1AZsbn0IRpphGKjxRaETkmdBaeDjnVQ8w3YbDqPpMcSyRsyhF61JOxXce0mBZ6mkplPsNYgRP84/TUDRlS9aoZQiCPnG/29Zpft1QTllOpbRyjZAeSlhruaRFMRYb8PSaTUz5gAhc6O95kd9TlWTwRpHejqhswC8cD30uqUtM3y2oCB7txsToFXlK24q66qPjObCVlO8mQ1EtndW1ieujhS44/mw3MmuU+JGublhd/9W64HaGXG65NZgBmx3dRm+/U13+lF1GMyQrbqLhvI3O6cUsB17xdFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=05/fZJ+fRPdUcx6zuq1xhlQW2hYKyYhgpWE/ytPRZtA=;
 b=KtAydIKC3973x2e62Uc7w+qCkmzYB0cD+xvAdH13tYFgNu0c6eoU/qx9Ivm0f0zIwUOgggnx987BQ54oJs3lq2yqwJe9NsMeVBrhNR+VfFdW4l7IKpF/usXLBLWfLiZFmowligCrDiJpDcf97r045ZKF74lsSMhO4JR9K5RpVtg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OSRPR01MB11811.jpnprd01.prod.outlook.com (2603:1096:604:235::9)
 by TYYPR01MB12760.jpnprd01.prod.outlook.com (2603:1096:405:15e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.14; Tue, 9 Jun 2026
 00:23:10 +0000
Received: from OSRPR01MB11811.jpnprd01.prod.outlook.com
 ([fe80::a2c7:5e53:c133:d834]) by OSRPR01MB11811.jpnprd01.prod.outlook.com
 ([fe80::a2c7:5e53:c133:d834%3]) with mapi id 15.21.0092.011; Tue, 9 Jun 2026
 00:23:10 +0000
Message-ID: <87qzmg36ky.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 3/9] ASoC: codecs: idt821034: don't use array if single pattern
To: Baojun Xu <baojun.xu@ti.com>,	Geert Uytterhoeven
 <geert+renesas@glider.be>,	Herve Codina <herve.codina@bootlin.com>,
	Jaroslav Kysela <perex@perex.cz>,	Kevin Lu <kevin-lu@ti.com>,	Liam Girdwood
 <lgirdwood@gmail.com>,	linux-sound@vger.kernel.org,	Mark Brown
 <broonie@kernel.org>,	Sen Wang <sen@ti.com>,	Shenghao Ding
 <shenghao-ding@ti.com>,	Support Opensource
 <support.opensource@diasemi.com>,	Takashi Iwai <tiwai@suse.com>,
	=?ISO-8859-1?Q?=22Uwe_Kleine-K=F6nig_=28The_Capable_Hub=29=22?=
 <u.kleine-koenig@baylibre.com>
In-Reply-To: <87v7bs36m0.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7bs36m0.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 9 Jun 2026 00:23:09 +0000
X-ClientProxiedBy: TYCP286CA0118.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::11) To OSRPR01MB11811.jpnprd01.prod.outlook.com
 (2603:1096:604:235::9)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSRPR01MB11811:EE_|TYYPR01MB12760:EE_
X-MS-Office365-Filtering-Correlation-Id: cb00925d-9da5-43b5-c137-08dec5bd48f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|7416014|366016|22082099003|18002099003|38350700014|921020|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	Pkqw/MqvkPe4BQSdZ5ICijqQhsnAKVIz0hmefaf4TOGhR8LqyW5HwmI1Vt7RmzodvWVyOXY1Sop/SMPyAId3pbuc+uWab5QtJfZNgHTFO60vVu/QHNt5SMiJPPSMm7/7aclvGWPmJdXno5Kupm6C2LEllnLLz3LPqQIOVe10qNQ1kWcYM4fpzGdKnn+Shfkx36I+zgNeH7UrfqqFO0CQM+PzVzR7g46Q5fHnw300v35XTvVovgUeYfeh4czGSEkTTWMuT5TZLqneqHgpBkdqaNh5kw7S4SiC0PHmURU9KgLCrhbGydbAfWSxH2S1QtwkHTj9M3fjU8TNe+ONBRezLBG4+T8WFtSiodq0wxMgVhiKUlgP5bVTJH0gUyUq8SNVlJ2jZTox+cWhqgr8Eu1hAZgUD4Ay6x+aBBifBJ1dDtVw1LFXPp5MYF/1GmVNxCl372WMzHtQA5HXDTc5FfQfqvXkRJlwENnPNaQ2jXf7kp7FVtNL86J4v8wd76BgmdK05htVQlGxhQHdIwxzPBEM2EIOxdpadb2AkJ0gC6m+rdf3OTmt6AUxBFE5FftDmY1kQVO+2M5jEQXDY7sbP80GWPDC77qrtFUkSWDXKePyj/r2hdlE8vKyU68PhLtKVcC1zLJiCIJCsjf/cexHmd8ktaoKpCoG1ijFXEz7OIaKgeAGzSlFYoLTK+taJ566pqtDNbMvhviSmAJ3nC9/Fs0KStpR8DpdGikgeKnxyxXSgfpVjUKWjPebfSxXAu0Rqi8/ZmDIlo403j8G919nc4Czgg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSRPR01MB11811.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(7416014)(366016)(22082099003)(18002099003)(38350700014)(921020)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xBNZDotsb9vyOyukS7MHBdcyxmrhkbZQoVgBZ5cVpqfitR7PdMyhvG9mnkOn?=
 =?us-ascii?Q?bvR9Ub+xonaQEfwhMCuuP/I/cUqICGJunzc+XV9i5KUNr6TAix2S4g2lpG6W?=
 =?us-ascii?Q?KwI8heSRHT/TaNU2IMC/GGt5LxBxmqYVxm/8ggIvTkp67J7BHs8FnZjmMVu7?=
 =?us-ascii?Q?4ofOlykvJftgjSTzaUa0XAktw59Uze67/+1RcWLld1ggOJwx1ZrhOydbGpKl?=
 =?us-ascii?Q?+i1cRaVm85hrLYNuGfzUNyXCsktwe7jNCrnD3P1P1tNP0ClgvMRjinc4Yf1V?=
 =?us-ascii?Q?2eAEoepJ32nC0XN/iPPZXs792C0pUUTG+ACVoovEpuObEWStu2VairtO/FSn?=
 =?us-ascii?Q?Ue5mT5vAgGS7Ch/AKzSqUm0UxpOObBYFRlIm9QVBeIxR/5km7fnCGYs2e9Vz?=
 =?us-ascii?Q?DBB9KZ9fOMw7UqVCWtwRQGZk0pnHm6kPzoxeod8Ig+rnX5D5m0ZeIdv1rx4T?=
 =?us-ascii?Q?Yq7ka4O2bdy6L3HJYEbsq7G119MuQY6QKsDloaQX9ZBxJRudVk7WlBu3h9gw?=
 =?us-ascii?Q?nq1amsA84a8ZErtDo0CpQ63qzx2+/GYb43Ka71cInX+vL1zyx/ejelMC1Q8l?=
 =?us-ascii?Q?kKKAN9TxJrH6BI8jqMHzEHCPMf+i30p93BiawGgWW1W9A95+kKeFZ0hHmXK7?=
 =?us-ascii?Q?cZQaP8VDxTHE/cllDKypnvVrXskN4PzI0o4gQDrhzIBgkqWBoo5ugwFOvfx9?=
 =?us-ascii?Q?QaB2NDiAkh27El2PT8mSyYF9C+gU+C5ajmZQIIczKD3pcaYcwAqrR9NnB89V?=
 =?us-ascii?Q?2iYggXOdF5F4s7b/eLFC4MhU3Bvcs4OMP/dAOJSy1eGdbZOQnvfn8qSKsNq3?=
 =?us-ascii?Q?zXQIYD7G0Z73yLQzfkBdVw+dNH871nun0IFQx9ywx4F1gozPzFsut32tXQ3w?=
 =?us-ascii?Q?8f8ex2E5llspC/AWrNSE63DvVVkj01I8cYxYkStTn/Oiyv8KeNTOTyp5XBG7?=
 =?us-ascii?Q?vOuMLgYqs0y3ofGGJmDahhrcNWPY8+Sye3j1l+4SRN8NkDAel7ntm3M2UhEt?=
 =?us-ascii?Q?yryd4aP3UnUNrQkeAt/3xJgZ8h8XNAFj/n/QHZEk1qoLe1BXCGzFQ7zkGTa2?=
 =?us-ascii?Q?r1MFGcm9tdyMd3CcON8lXkmtOmNCuXIbm1tYhkSjybb+Jyth4JtxtYM8P66s?=
 =?us-ascii?Q?KUjBSgZrhqeLwbwX4uy4TdUyQftXtaQdViDuPGFT7yJ2q83abomaWWxTFdZO?=
 =?us-ascii?Q?f6czE0PWKxgPGg9V1Y/8b2FQ4XKGg5Vr46Nh0bUJ1TSGpkcxQ+u8EcYNzOMZ?=
 =?us-ascii?Q?JWRULpl35W/zcGBw9RebA7OJ3/Y3RvI33gyhKbfT+fb5QgqSSuNfRsynQJlv?=
 =?us-ascii?Q?SETREG3rMhUGSUVyv/DovZ6az2HJQTWmv7WPbrt97BDbb79S2uc+LSngCHmL?=
 =?us-ascii?Q?3m0sjPcU7jnfLKUfJxL+hw3fEjCJLfR3amIpfUz2rkN5zI6ilsLgcPsOIgwI?=
 =?us-ascii?Q?7nlNkcgvm2phAHkJsVc6JigxBOcKqkL1CpUT9WQiqz9jBARWbv1Frt2M/cU6?=
 =?us-ascii?Q?8arMD5OtXKRj1QsKz3lHAw3x4lYhAxu8jHuCSMMOJxaLCEKj9w7lJNBK0lHb?=
 =?us-ascii?Q?T6CWaEL10zMr22TWNYL/Zi8enuLJnveTlZstgGAX4wobQhMp4pTgqWaB3IUW?=
 =?us-ascii?Q?rySvXEvuOLAZNH6oiwgVKnm2mlFG3AxEnswxIZCPBCeWVnknzirYc8fRxsFM?=
 =?us-ascii?Q?WQRK3aV7OhU+lb63fIrkThmBoGHFsBHuyqGJK0607TKxqhc+o8EiG9qfhOUh?=
 =?us-ascii?Q?QGf7M1bWqGr8Ml+2hA7JKD5tlrV/MC0csIPIwdGwuWwMD7v8MILG?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb00925d-9da5-43b5-c137-08dec5bd48f1
X-MS-Exchange-CrossTenant-AuthSource: OSRPR01MB11811.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 00:23:10.3802
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TQOm/mKb2zdL4oz5yenIEcwJJRWaVfR9X/wj4t8Rr3/BI3EXaBARKmxJ0ckn2wxT71L3fB+dXUMrHsnS+fUcgnYLpz1W8iRZmGR5rkLPf+rG9Gr/zPruq7F1Cc4si77U
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB12760

Because it is confusable during debugging ASoC FW update, tidyup
auto format style not to use array if single pattern case.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/idt821034.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/idt821034.c b/sound/soc/codecs/idt821034.c
index 39bafefa6a186..084090ccef77a 100644
--- a/sound/soc/codecs/idt821034.c
+++ b/sound/soc/codecs/idt821034.c
@@ -860,18 +860,17 @@ static int idt821034_dai_startup(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static const u64 idt821034_dai_formats[] = {
+static const u64 idt821034_dai_formats =
 	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
-	SND_SOC_POSSIBLE_DAIFMT_DSP_B,
-};
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B;
 
 static const struct snd_soc_dai_ops idt821034_dai_ops = {
 	.startup      = idt821034_dai_startup,
 	.hw_params    = idt821034_dai_hw_params,
 	.set_tdm_slot = idt821034_dai_set_tdm_slot,
 	.set_fmt      = idt821034_dai_set_fmt,
-	.auto_selectable_formats     = idt821034_dai_formats,
-	.num_auto_selectable_formats = ARRAY_SIZE(idt821034_dai_formats),
+	.auto_selectable_formats     = &idt821034_dai_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static struct snd_soc_dai_driver idt821034_dai_driver = {
-- 
2.53.0

