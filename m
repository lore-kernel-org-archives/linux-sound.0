Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010056.outbound.protection.outlook.com [52.101.228.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1496B26C385
	for <linux-sound@vger.kernel.org>; Wed,  1 Jul 2026 02:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782873383; cv=fail; b=H7W9bMYWs+XQVPOIh6NpxVrZwabycPyoqp5EaU1JahvyUkghLlAecPiotJFQcw1X+x/lDjEIIrxXIHLqOR4kp6Usnj9Drdp++3QJ+4+D/jk9hnK9jc170r43Hs9hDfk71m3E5yve0Ysh/4MhzWa/cXfmc6sfrnc37svIE5XePqA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782873383; c=relaxed/simple;
	bh=Q8+7tJF6/wuI4hedhoG5HikdQSYKalpjIQXqbl+gIto=;
	h=Message-ID:From:Subject:To:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=VBU4Q3/0yF37LxuqZ0AC7kgjO3VtwwNzo1Rs5G5TcDsnc5OcrtSGLAwTnr/yPAFBpp/ADPtdCxiU/bNaN3zO5VTGbNmaQbVVDqVP/fX9sFT0/72BXDS2x4XaFrtZ+2K0EN6f4y5vQVyKI8R8N9R3FeYoNNf2UMdAq0YVPWQVohU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=ZhkTPPlr; arc=fail smtp.client-ip=52.101.228.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="ZhkTPPlr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wp6NYTuhsiiD3JZ6t41K5FpMjUVbmbNF+vEiq3YRoeywCHaTZFHFS+IxoDKb6CpgtDkse6dnLHqP9RcCS4mzgeLCkSiR0Hg1RQUH7QPhCi7WaV+6MgJaK69NmLkmbhcurHfcw+nGoliN31+kKpYLzr6HTydywCu+c65VGWHSi97qnjD807NsdGh67VeQQ6Gp6ksZTbVnHvTeuS/oBLQ+uWOwua6ob/HVROynMZIORPnOcm8vQqwEqfVumewDA5PvuxREcBkDHRE5a3nQNA9PFa/+3zFWS+c9ItuW8dUjtLwwiBjZ5uzZnABbmHkCOaapdAUaH4SpEVTW4eXWrFmAWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iEqWNqO0LKZi9DscAebJw+TOBziWKFWn414EVOFA904=;
 b=CbXPnLbI4qdsgcpAqXaQVRhzhwF0zZ6aE3uJwGcarWx+UY5HLfDF0srmOPPP5ny9R4eJbAs8xfYx1rdQk5uN8UNQ0gQg1lhdP08sSa8nRSqzND9WhA3lzkqADy0cDlDbfWvx43/1minTsKULA9kEHJUxp3+B2Kkug+9iR2U/P2eN7w+krs5fd9Jx8ebmLuxZNcEdsnATsMBCZCJFIkqT7sU4ewLUKEObknHd8leoHfpYmO7OybpHMR16tl6qDG3OBARTPvzzop+8t79bOnpRP7/cym2czbnhPbE/WqMcd9lynYQIzFcOmGSUS1MJYrM4X/Om8vHNe4dp0QJ04sOGSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iEqWNqO0LKZi9DscAebJw+TOBziWKFWn414EVOFA904=;
 b=ZhkTPPlrt4oz+n5Mj6Y2T3PPzbuU+MnnDGVcCiaviREyvhL4kRN3d6ZDjUb7t73Uap2kuYr2E0kEITnl/ntHGLH/RfUuWlMBycvqqvK+/9FQNTvK2xXTtahQ6EwY7eRUIA+UB2mP9SdTIrKTeuJuKo3U1VBGAP75cR1MQELaxb0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TY4PR01MB14320.jpnprd01.prod.outlook.com (2603:1096:405:23a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Wed, 1 Jul
 2026 02:36:19 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0181.008; Wed, 1 Jul 2026
 02:36:19 +0000
Message-ID: <87h5mjcu70.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 1/2] ASoC: sof: nocodec: tidyup sof_nocodec_bes_setup()
To: Bard Liao <yung-chuan.liao@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	Mark Brown <broonie@kernel.org>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Takashi Iwai <tiwai@suse.com>
In-Reply-To: <87ik6zcu7g.wl-kuninori.morimoto.gx@renesas.com>
References: <87ik6zcu7g.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 1 Jul 2026 02:36:19 +0000
X-ClientProxiedBy: TYCP286CA0220.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c5::20) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TY4PR01MB14320:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b7f8e6d-86f5-4ee0-a6c2-08ded719885d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|7416014|52116014|1800799024|921020|38350700014|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	FXM1KSpDUCiCbvIwSTatCV5YJqJZ96KjhORZBwhxVeC+DGsKFh8IvpcTXCZduzJH4eeD/T64eXzZCLYIJRqQvs4j82mPLO2xhhEwcHdEBDsBeVr8lIKaIxT7AnT8ROjIOGMyI/f5y3qrdFyVF1pkWrmTDCZxbK+RlTfY5OKOWftMAjFbilH4NyRm0U7T7tsv8+EXRYoqxzmzQWtCQaeSHtq+mJy8TQXp59sVCh+/LGKUVVlGvhih8A8lpW2mgd9HN8zd06B2K32qzZem/P/02XbOg5aCdVadJxhE3cJ7tcX10kVSobkxaUkScQfqkuYl/RJ55Y/dX+lzuKaRxD1wuGHPPXSSxEdm580llaRLY/rUrhdnuuDmYl8fjfMOvfj54ofMIyCfAbRKqvj/oFFui+d2fMez+HEIkZD2pW1fNEL6tvcYn6sD6t9l43inCQ+/M4TMqe2/iOecVnaaHntPdorX3+hXs23uHQnOGSlQsxZRCalDPelHyBVs50zQeaF7wDs7AWAgcX2cP0HLoUqKkp4G7eiOasSSNEtIY2CE8Vy5VdVxfGQkMTavu++Sl9hFcrtPKhau8DuzYZsHeLrVunEX5tFxoeAn63sJiVXLn+d1dXrTBkouFi3MXCSqX1VBLOxc5YkA4eR6p8pdGnCR+KfU2RHUox1KMvKSKF2erTwE2nL9R4PQileVmRTwrSyozGuxcBElgAZIail9H0XoLIwRQunacHAu4zTV2fKf37CzoeKKw9DgCOGIQoZ/Vo/H
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(7416014)(52116014)(1800799024)(921020)(38350700014)(22082099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kylf2tA/K11dL7AOGC9AuuLBxR0S7nDZ2TAF4VQIHhilvqp5rvh/o9ifYuYz?=
 =?us-ascii?Q?bknWnaBSI2qkC8DBrJnjfkaXG7depEmhoLTpAGyHPdKk0dtNB50Nq5Ki2PSE?=
 =?us-ascii?Q?40kyxdcoAFH6yY1+Ozeqg5lJeqIkHeGke4FdZsYSJ44pRikH6+b+rohaIziN?=
 =?us-ascii?Q?VGSWXoifrtZKssDZiFZaMLWhPDELZClt9MgNFF83h2T55gV3fQ70/4dmF7eB?=
 =?us-ascii?Q?L3bYbc7bknTqe+WEEYYHQxL7+1DlKsPYTtUNV3HMpULgAT2qIP6TDB06Vsnf?=
 =?us-ascii?Q?O73gopMK8RaqCffI3NToQuzyNkDdLeFI1+mjwA4hwXzbTaTpvCD2aLy/e0iK?=
 =?us-ascii?Q?AHK/HfUpr4pZWTltjrmb5ksHrdZLVFR0NN7woBFamqsdgPAHdP/K44WDr83c?=
 =?us-ascii?Q?LZLJRkNTaFRDFDcYC6vGtCB8D4Vi4y0f02zRTr/+Gq7u7Vs0rpQF6hEZL3Bm?=
 =?us-ascii?Q?s2ixVyGdlKMliQmzMiP3Lt90Apuc3j6ARCIlW/lt62QVZC0G2Y49CuA5VvdM?=
 =?us-ascii?Q?XXZcBfXlaVu32v/tRXsJXu4RyWqWhGMUJiyot0ALV23mIxB5C6mC6S95yoxl?=
 =?us-ascii?Q?hysJG+XfXM+eEwmlKtKupgxI9/zgQQaPZFs88NkW/m3H6h1pfI5uAtx/e5H+?=
 =?us-ascii?Q?0RIt+5Ppzhc+BTWDZAG7dosBHOWUCivCcQNwPJw5FSsMqyUT7luxo4+PZBVu?=
 =?us-ascii?Q?/ZOulXVyfx1BvEAou2GacyplUjDnuTd0l9v9VGYP8KE9CVWhaIQBCI7NPg26?=
 =?us-ascii?Q?JDXC9tstL1/GOIUY9VMjesmiwaYOu69TyQLRQSGKP5LM5ViUPyKt9RYqO6s2?=
 =?us-ascii?Q?ai2r9nbwnXc1bMV7ELlmh8gMaW/2BPZKxGPkM5VOKuvYmDzXGbAHoPBGaIGK?=
 =?us-ascii?Q?nmAF1SyWyLYIzU5j9u/hUMXdDLSiLTzP3Qdz1xgce7mtwCTk93cKfJfOEUQZ?=
 =?us-ascii?Q?j8LGjTi3zng6ZrDXvh1oMt/rOHqEUGBBicmmegBMvYfjKcxqd0S+8IeqSDKI?=
 =?us-ascii?Q?JXLilOBLFjdqv5HvqX0C3xUKJ5LDXPfehvZwy/ModiqjFzIlKwgoMOXWIolx?=
 =?us-ascii?Q?nxBx8CWhQFOycHDrhu52NbeA8Of5n76yf3Io7vdUDabC1c8RXuZp0xzXMKK3?=
 =?us-ascii?Q?zriBw7IJ6d/JNlq1BxFo4+OnRo8inXHHC0BaoEgJIf6XQkEpofsAPBlxKfzT?=
 =?us-ascii?Q?pPhdZSKJUyo5U3PmSi4xb50coLd7RdeoIF0FG0DTcT9KWkudkIp48ajEpz1U?=
 =?us-ascii?Q?awcEicCyK98ycgLXc+hIuO4twO4K/bKZL6SaOMlXsgs/62J2JqpZL0RWPdXA?=
 =?us-ascii?Q?EvYzuBfBfypq+cmxUvb5wbnE/e20Db+JmFy4cAa2ipjtBecI1X276ZqoGdtr?=
 =?us-ascii?Q?bbs4XGjJmpQtzDdH93+S5T5MPAGD3Q3FWki79PoU8rZzQ+KY6zGH141tpG5c?=
 =?us-ascii?Q?JD/HuP903794zpo832/0G/hxGqlugfgncphPhfLCX383ZkX1VfMeHZPx2MwG?=
 =?us-ascii?Q?ILpWaUkr3m9KcB7IDAbGZu7vZNlySIyy+JDOE+dFjXg/TYTWeskMM/o7oxun?=
 =?us-ascii?Q?4H/fyKEK0dyhan1+K/sdE7LT98n1jUjeP9gOnwMpQ6yHoawnAXr8EkcxbSJG?=
 =?us-ascii?Q?5/Lw80qO5X+C2JOYumvTxLJ0WL6Ky8o+SpkcnCNovQTpOCvF0FvwJMGDSGyR?=
 =?us-ascii?Q?4SgVUyC+KOq6ilicHLkLWvazqznx6wwbYuYpt/krgwWdzo/S0APWQKMjmy0X?=
 =?us-ascii?Q?6+OpniYDjFoiyNpubI2xnjbbg8Wt2VI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b7f8e6d-86f5-4ee0-a6c2-08ded719885d
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 02:36:19.6133
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KoNOzVFMGug0tSGkxeUV9w5RdGcIRDqRp0v7fhBxVVcv3JJCVzjA9mLpW1H/iMMtKylZ+sXyReKKbZ4LG4wxdNahVJJrf6jaHIrC5iWTjwylkfYZWRl0zeNfihy1BCm6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB14320

It has only 1 card (= sof_nocodec_card). No need to use parameter
to get it.

Current code makes old style / new style conversion difficult.
To make future conversions easier to understand, this patch clean up the
code a little. but no functional change.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/sof/nocodec.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sof/nocodec.c b/sound/soc/sof/nocodec.c
index 11a95dba3c9cf..fae36595b81aa 100644
--- a/sound/soc/sof/nocodec.c
+++ b/sound/soc/sof/nocodec.c
@@ -21,12 +21,13 @@ static struct snd_soc_card sof_nocodec_card = {
 static int sof_nocodec_bes_setup(struct device *dev,
 				 struct snd_soc_dai_driver *drv,
 				 struct snd_soc_dai_link *links,
-				 int link_num, struct snd_soc_card *card)
+				 int link_num)
 {
+	struct snd_soc_card *card = &sof_nocodec_card;
 	struct snd_soc_dai_link_component *dlc;
 	int i;
 
-	if (!drv || !links || !card)
+	if (!drv || !links)
 		return -EINVAL;
 
 	/* set up BE dai_links */
@@ -78,7 +79,7 @@ static int sof_nocodec_setup(struct device *dev,
 	if (!links)
 		return -ENOMEM;
 
-	return sof_nocodec_bes_setup(dev, dai_drivers, links, num_dai_drivers, &sof_nocodec_card);
+	return sof_nocodec_bes_setup(dev, dai_drivers, links, num_dai_drivers);
 }
 
 static int sof_nocodec_probe(struct platform_device *pdev)
-- 
2.53.0

