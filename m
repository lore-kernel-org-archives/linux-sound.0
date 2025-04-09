Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011007.outbound.protection.outlook.com [52.101.125.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EF9A8C1E
	for <linux-sound@vger.kernel.org>; Wed,  9 Apr 2025 02:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744167458; cv=fail; b=Gz1wCkP5YP61Q05zUNqniRxig8dGl6+M4oglVCtCzvzQsrSGoyT6wx1nFr6wTX0cFxblhcYPDhBaLclRcL6zDExIsvNITa/q9AcJ3Vzdy4CVoks/mMN6D8ukrNZ0nkVZ7+0aaQDKu369aZsi/kbFAmXSBn1VYEBmYcCwpYBRhLM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744167458; c=relaxed/simple;
	bh=S1H1Z+ICilo28bSZDLlEOyFP8vNnZvMlBR9+3IO0f8g=;
	h=Message-ID:From:Subject:To:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=ceAorQeeYT3uSLbAzH1laHOIHpj7TLR8fMmA7Y788hoV/p4bUpwnPdLDDZjHb+ljC02pxN1A/loGh7jzUy2eqSEA3I6h4MFD4zxXC0EhwGrFZBHvoJ9hjS+ydS4h4pdlUwwPMQXRQmdMNkpR9S4uP0ATReVzqar3fBtgIdCXQaA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=NAyhNgyX; arc=fail smtp.client-ip=52.101.125.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="NAyhNgyX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s8znqkyb7X22g2I7fjazV+sKhXV2Nfx/aKZDnAhLiukW5kcdAhLW+Nxd3VYWib401MGJGRIBQPf6GxC8Uj1W0rmi6twfoY0VVT6/YMQAmq2ElfV6t8dDbc5W8MFR0vIO1fXjW4N4gqVFVS0CF0tLqIZkFKgol48eoXvLOGRAb2oyJwoV+6nQoRBpfKA8DpUldX1+7SLhIGw9Fow/uyIEtYSDDVrbUrnPWMRddKRgqeS4a9r2xJ4c7rHe79lg+rdKg9nj53v3PbZuRjMK+KRpQ8AwAERGRuDU9uAfOJnzLPyu/D0MqO7zb9mcYieihiGPmSz4uqrV1rRv2VnQrH6U/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TUrrNulo3/vJU0+ToHdLt3t1sDWT9K5rcej1RwYSBJ4=;
 b=HPx9COmW5EnWoNMShTXdby0JRJysQ2oUhARbZnlYsdawzpiGSBfFpJ8OgmBGdoXj1CPSr1EAyN1BDMHNjBkTa53WDZe0XVm4iOtvc5wlhf+YI7TTATFEumfNUo1v5qQvQqVDEMrnO535nUdgKcg/TBQ/a6GTD6tIraOLdZeygiwaReitbkhC5NHXIQL7gZv3sh14+L+SjtVowgg126Rto8zmZgR6BupiM1dF5c/BLe9KF0nutWSSYh2klyZDMTimesRB6bN8l0AU2DhAaBQGMrsh28LIVd2NPGv5/0vvj3abpbXcaadB4lCDO+tB+kGURJmvkbv6+/0/Y/yLr/Bygw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TUrrNulo3/vJU0+ToHdLt3t1sDWT9K5rcej1RwYSBJ4=;
 b=NAyhNgyXFC/gCtodwjh3h0ZXom0sEHaMsNYm4/e8RtXODk5F3PpiJo9rN0zPk1/JV2e0uCypVtcvpcbS0qo2A5csoNfep8qLFGQzXTm+zztlhtpwTdIIvSEKW2EY12N8tjIXAlgYxyh+ngnr3bcDqHo0q3no2Sdvqk3I2Fx0d18=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB11643.jpnprd01.prod.outlook.com
 (2603:1096:400:3dd::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.29; Wed, 9 Apr
 2025 02:57:30 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8606.033; Wed, 9 Apr 2025
 02:57:30 +0000
Message-ID: <87ikne9h45.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 5/7] ASoC: mediatek: use snd_soc_dapm_to_component()
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Kiseok Jo <kiseok.jo@irondevice.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Takashi Iwai <tiwai@suse.com>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Benjamin Bara <benjamin.bara@skidata.com>,
	linux-sound@vger.kernel.org
In-Reply-To: <87plhm9h5q.wl-kuninori.morimoto.gx@renesas.com>
References: <87plhm9h5q.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 9 Apr 2025 02:57:30 +0000
X-ClientProxiedBy: TYCPR01CA0055.jpnprd01.prod.outlook.com
 (2603:1096:405:2::19) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB11643:EE_
X-MS-Office365-Filtering-Correlation-Id: cf9f3869-aa92-48e4-860c-08dd771244ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|52116014|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?sR2C9q3tsCbL+ZXwh5SVC1UlteUPtm8uLlkMiTJPXNhLxAh2xO+WsibHyQHD?=
 =?us-ascii?Q?VFluMAIgk16ZHZTucElNxvYy9Ic3GJFhQC6qIVLl7L603mxsamhOkBkt/zBo?=
 =?us-ascii?Q?ZfFGPsRJdfuAXPJBaKTIKPdYU/NQ7ydDrd1/YAKb09e7jtTWFQS5Jfgj9Qel?=
 =?us-ascii?Q?XLJcf9CMqaZngKiMyVt/8zpbcGj0z9MmywhkKpPvYRxHpnYZ//DqvBHVEQS+?=
 =?us-ascii?Q?QEaI38vVCgqg9vKQWtErvIKEOFBb/nTgoWSeeRfWQ0RHkQuxSgidsTbTR5iL?=
 =?us-ascii?Q?CmzhWc9SmG06DFmBywjpMLOZLOusS2cRRmkiw/gryf/mSNu8kQOY7N5oWUcE?=
 =?us-ascii?Q?cmcjXIP9VQwU2f2oH+okxCTbzI3BvOar2f3X5fOUfBXnEQaAF3tk62RwAPAY?=
 =?us-ascii?Q?5naP8ZUtejOLlxxom+Ci+/HW6cXNdZmCpp04ffPNZqW8sYT3hpDkGumgMas4?=
 =?us-ascii?Q?bdxgCaSnjtTA45x8WCnScMuwoib8E3Ui/5ZQPnEOcoioZfqdHT8L4MFpOAhl?=
 =?us-ascii?Q?lDks+wX1rSRDrwH+lCw3sEZi2mf9aZ4IsXRi34EaIbrUBvlszYjGQl10X1ih?=
 =?us-ascii?Q?mimH82WXtDbaCWCmWOr9/jEUgQJ2NOVc/WTUWfyXpk4oBaMWAmUaWrK+nIal?=
 =?us-ascii?Q?qgmTXEzPIjYSOYvcd1uCvHtPstlq1V/6KeXv0joQr/aZ/4KCtJi4rOBK8eHq?=
 =?us-ascii?Q?E8FLmn2cr3Zz1tNFoW3u3CzNQimWeGpD+6cWwHyORWa7NVn4mDYWLyQa6izR?=
 =?us-ascii?Q?BKd9dnZQbAJsELlSg8FoxEbIY6booLE3lhsEKsGrx/AL3xUYcQSfC/Rl8O24?=
 =?us-ascii?Q?EbKeDoXIw4nqthl+Ut+63y5YAN9rSohZQrI7/fPs1f9DPLbdJoB9KctLj+jG?=
 =?us-ascii?Q?u73TUcSRQViyLHZ5h6kY2Jktb2KI9frB51PLAYHMhYYtXAuij2dtPgkDKxku?=
 =?us-ascii?Q?P9EN7oo/NPFNqjAJOTc30/rM5mU/WOU/AOsUF4g6DVO3VKQL91JSoKd7fz05?=
 =?us-ascii?Q?iO0cW8jFQvxNPWwfeSzZzDHbdqQu7eOv+ToXk0N65dDR7u7lk5pxcg7xAdYP?=
 =?us-ascii?Q?CvlJDc0OV7vvIlP3V2nloOFF9Z6Zz11qZejVHk41eC6+eKkyMTB7n7xAeB+J?=
 =?us-ascii?Q?lO8QLZz/ZFK66JcpIvDGhynMKI0Algyqb492bMr6U1dU3M7enKoZEKPdDBS3?=
 =?us-ascii?Q?cjgAEF3e6PL3raHDgc+rvhsokUtcyXC5XwfuOF2phzYSAmRHZt1cIflgbMKe?=
 =?us-ascii?Q?1AgbechvE6eurv3pg+kW26KpL0XSJVVCD9lBHe/p6p5BFaArXfM8uKXqdVLS?=
 =?us-ascii?Q?oqq5xTFXN2XLzmXDpkEub0zu61Eu+uqmL00AYekOK6nMojpE0gvuqAaqvJ56?=
 =?us-ascii?Q?TntOXcAYkvfAFZ5OWHWLSFNvMcwDD/rIQaSFk6NciOV6+BTQCOhG2sUvsDKa?=
 =?us-ascii?Q?Rl6iKbZqantl/S5QOmJ7N50D7/00NSUGOPeDa9TenxA2vs+NspWBQNaNH1X2?=
 =?us-ascii?Q?HCSeWMCvAP0Hj0I=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(52116014)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yedq2RvXz4knxSWxCdZQFdTqluzcRzIRgpR/LPOeLTdzteCjkun8k45I7+RY?=
 =?us-ascii?Q?tEfUiCMKBOJRR5C9eH7mPc8O9DOWwqlT5zh8bUbJXJ+BWvJFIr6cA+K9Ay/n?=
 =?us-ascii?Q?+7FE3eGDJnLoV/Cxz4RbWir2J+giPBFS4CBZf7bhWs4dQCLwGvxCTxQ2M1jI?=
 =?us-ascii?Q?/SKSz0gL7/+Nyn64hYqOzmOugMZCk48HfAXIROnVNFhLZlnJlyYSAAVzgr0g?=
 =?us-ascii?Q?Wc+U8nPKUY5i+OEosUHSH4ozrKjHQmTD7VeeSLOzchwGJjXYRw63fIl43KbV?=
 =?us-ascii?Q?UlmOtV/tFfSzp+Ga4pnTWp4MSg13C7hPj3/kKaM1RhjNZN7TBlD9sFozzNWv?=
 =?us-ascii?Q?bA7LiD3HRqfAnV87xGC587Fc9cQnm5t3yoJuGwZOzBBjkgl3uwj98XRjzEnH?=
 =?us-ascii?Q?vLoLs0vQIEO6pWztqPtvkkDLyUQVn/2LK8LhEf60aSlBd/WGDbfKQowpZUaV?=
 =?us-ascii?Q?YjzkPsMgiFcSBxtox7rh7gf7rx7E4pxhcN6dKu4AEEApgvHrMp+/XpLCC3fs?=
 =?us-ascii?Q?BZSQ5AReBrFaJ/sws1tP9jnRNUieATHcDddxhYTTTj7mgd7NNGaK06+cu05b?=
 =?us-ascii?Q?lXzykNvw8hvb6HrlGDw1qYOn5fQe7yT8JrzrrrlAUKq/gsA4OHZthHLvb9u9?=
 =?us-ascii?Q?fekcPWc4UC6u0nJxDeul9KsKct4ch1OE1clsDDi5jFnHOl1YDRhh0fAd3pj6?=
 =?us-ascii?Q?ydzRP+4Peil2Sd0savgwJNqxUeT9nW9cTV6anMzjww/gTiytgQKKx1cUOa8P?=
 =?us-ascii?Q?aPTD31FqActFaYs0e7aEV0tObNmTzc1o48n+T37NtLIRZNhHV13Ger29sWqF?=
 =?us-ascii?Q?gKCLMC5vyH6Lh0hEk0jjC1B9Kr02Lft3HttHTl43Pr5rzgVXizRaBO4sGm8Q?=
 =?us-ascii?Q?1BsNob2rnwIaOne2BVWEvk0JbfRSevimmuifCw7n+G78E3fB81ll7m9waakc?=
 =?us-ascii?Q?Lrut1x3niL6SgaNM+e3ntCsidFIMnYnxYTlnL1qMighYvNaKWWlYFNY866e2?=
 =?us-ascii?Q?5MWzVJ4E14xoivW8M2R6lI2VkgbCiC/mrh3JF0eqOgBZ76tkxcn6NzcQLXjT?=
 =?us-ascii?Q?gBhqDQP2LGVpD7Jf0o7MB9BRHpaFC0TSSx81/vJ6IirAdsciHwyNH1svixtX?=
 =?us-ascii?Q?I7tzZiXotDNCv6E8tFu1719QBOUuT5658bowHTR9S6yEAbbHDk0RN+HEzhtW?=
 =?us-ascii?Q?YPnCJ85AdTUS6F55ezk1n4jUCy3DhZSoJArJttX1G3rXIx6b7XV5P5DGG4VP?=
 =?us-ascii?Q?wgR/MTlxnmkZLGdR6LTuCFKz0nW0VdEHo6oiJovgPKT4ItxGPo205HlK716X?=
 =?us-ascii?Q?97opgv901v6Z1YMMu3Y7L7T2d2TV9tm9SunYniwdPMr7oUXKkGd+zq1BFt3A?=
 =?us-ascii?Q?iChAqtckYtTYvSW1pkOPyvvPxJESZRxzL36KKSigOh4Nkc8BUhNg0K/2FQtH?=
 =?us-ascii?Q?NUuLl2HrgnWXWKD5p+deq5x5CDB/oyNl90pV/y2003B0JLxSU4a054uoqynQ?=
 =?us-ascii?Q?9Ms8ezZeilZaBLe4hov47x911XF8LqbJc77NwOXLQQ4nr6wt6eBPekqQ01Q6?=
 =?us-ascii?Q?zStmsvnLQZ8fb101kMbjIaNW3W/rfBGNqH1fPnVa817pu9WpOQ1afRKsFrxz?=
 =?us-ascii?Q?7iLln8Thn6VJH812TQo4etw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf9f3869-aa92-48e4-860c-08dd771244ec
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 02:57:30.6834
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xzmDkragVhdamOoRGbqMugv063/bMicMsvu6V90NwsAqzGh5uCWUTuMChT2tRSSy12dWcTi5dEbY+Y9Mo2YeUG8mUGh7gwFv0OSstTJLvLIWoJoWpIGUQtR33lsJWG9E
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11643

We can use snd_soc_dapm_to_component(). Let's use it

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/mediatek/mt8195/mt8195-mt6359.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-mt6359.c b/sound/soc/mediatek/mt8195/mt8195-mt6359.c
index df29a9fa5aee..d42b182f4994 100644
--- a/sound/soc/mediatek/mt8195/mt8195-mt6359.c
+++ b/sound/soc/mediatek/mt8195/mt8195-mt6359.c
@@ -646,7 +646,7 @@ static int mt8195_etdm_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 static int mt8195_set_bias_level_post(struct snd_soc_card *card,
 	struct snd_soc_dapm_context *dapm, enum snd_soc_bias_level level)
 {
-	struct snd_soc_component *component = dapm->component;
+	struct snd_soc_component *component = snd_soc_dapm_to_component(dapm);
 	struct mtk_soc_card_data *soc_card_data = snd_soc_card_get_drvdata(card);
 	struct mt8195_mt6359_priv *priv = soc_card_data->mach_priv;
 	int ret;
-- 
2.43.0

