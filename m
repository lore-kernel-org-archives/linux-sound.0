Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010031.outbound.protection.outlook.com [52.101.228.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54D1032694E
	for <linux-sound@vger.kernel.org>; Tue, 21 Jul 2026 01:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784597621; cv=fail; b=CXbzQLFgebaGva6GUfX5w9VaSRjm8ejBKjELa3G7mUxnYQiV/0K3jTeLlr0VUp7h70CNFQJzb8KS9eFsDI0lsmxsdooJ7mpg9BZk6ZnNzQg3sjNHel0o/guzeaBBZ5qs0e01igJPmd09ZLyKfYbWyfZYogxaDG2TFuLZoXbCCXY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784597621; c=relaxed/simple;
	bh=KFEp0kJPFD/8tIOUD7MV2cuZHoohum+eRcbN3yiwsyg=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=B2RN/Fa3O1gwiFWaFYmWvDmXaTTPYGUQyWUKsBTtX1y6Hz/UbqnSsD1Yro1fajuHLkWph0wBzsqaaa9+043tZcuIt/gPsHJ96Xv0hIlZtL2MQJtsJe6R44MB4WmqR/lPVglLer7fCCYJFoHZIxrtTscoaOPV/iEdNhVUaOaFfQo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=of2Daipz; arc=fail smtp.client-ip=52.101.228.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="of2Daipz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NelV5mFWRe4O+t7jTzAIN5EoPhXvNMyyAgRBVNRocYc4pL/JTbR6FITsin1b32U4YN3JHU9d97V8ho3rgZPFsf6V13znBg8AU6M0KIj7BPjQgWsKf+EyJ0J8ffYtRMSoCLd+bi3ss7CMGprXGJlmvPEsxdxWVFKc+zqAtIzMCGHU9b4g3GsawWXxbsssouCcguHpmQTlWBUTX1LgCaWZVAaTyGDTMM0Pucsk79k+F5yb1Mo/M8pzmYQwrYQfB0EnPP6NR1ysXxQQKW0+sdamCoJhgzO5nBvYTlvtEHsHLms4xl1d5tLBEQhRbP4efilxvC/BZewg+7XucMRwYj/mHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4J9uXDjs0Fy3C0KZIk1vopNcDjr8yYPaR0LmKwhBWeQ=;
 b=iC21tAjPVx9UQWoAJHOgi+kARLxBWivY36rdU4zBtSWjrPVoac/nNwYEkxMa37lWV9LVApE3nG6Xdt0oLe1iThCj5wVebya5Z2jnZjOz3BUfZ9ncaRMdhky7oTb/oSFbNAdV0BL4m2k5XRMpdOV858iCNjucTCUs/aavM915NNKoekJ2D733+6NSYoLVGdW+CobVPLQcVZc7//X/PnbQMGybelgKVCb5BIbTG9VB+pNCzeJGisWVCRXrtN1P3KmtikDvVHn6sdp5lVx5YSY5PQTsTmREkz/b/rzqAEYHrbxY1p5Avzb2tXCx2s8OvqRqRXQEtP7E6RLmjBX2U1VtUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4J9uXDjs0Fy3C0KZIk1vopNcDjr8yYPaR0LmKwhBWeQ=;
 b=of2DaipzqO3404GhgwIeug2sJePTre1m9oHCvudFPscaZSIjaaWcsyW5VgIBeSg46lbacuOCKXiOZBBYVFcpAt54ZB/z15uhWEvY0WSdGgZPWq1rfDBORkntxUzW/w4Bwsip/yvW7Icd0fGAG38FhZtJ9FwhkOJL68tvnjzDsGU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYWPR01MB7282.jpnprd01.prod.outlook.com (2603:1096:400:c7::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Tue, 21 Jul
 2026 01:33:38 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0223.017; Tue, 21 Jul 2026
 01:33:38 +0000
Message-ID: <871pcxjfd9.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 1/4] ASoC: mediatek: mt8192-mt6359-rt1015-rt5682: use *dev in mt8192_mt6359_card_set_be_link()
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Darren Ye <darren.ye@mediatek.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org
In-Reply-To: <8733xdjfdq.wl-kuninori.morimoto.gx@renesas.com>
References: <8733xdjfdq.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 21 Jul 2026 01:33:38 +0000
X-ClientProxiedBy: TY4P301CA0016.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:2b1::19) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYWPR01MB7282:EE_
X-MS-Office365-Filtering-Correlation-Id: 03519772-2397-4c66-f063-08dee6c816c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|23010399003|366016|38350700014|18002099003|22082099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	pLpwltwugpVXZNGIlx2nRyG9YvTHX3vB2DFK/Pg2iiHfOBcAov3SdW/S6EmV7AnMkncvQ/AzYjvgfw+wF0HvmXEhTbzyGx0gJYaUCLEhJ4JqAC0qGlMhKR+ANVgFu7xaC05b1tDaZXqcwkacpY9Gdn2zCWvy4V3naQ+ksOwfMGql2TEW+Q2sPVlRpMv/j5aTSGNK0SJchoHhT3T3dewpMm3WfrCOZGjE6PN09fxp/NpQunSPMnuxYJ61Jpf1P76NAFIrUbphCFEao6PeThg6Il18K6OjN1w/vuqmmmyEf/a4AchWJU1WCK+JpVqV51QRvoQncfkHdUz4/eHhD/1qImKujOcn44n7BznijbcdLcTJniDMz1LCi/iEZhK6YBb6RceKbRvrvF9aUQNDVL4NHD2SpWv/QcwaRHzH1PlK98pVR3+/dVbCucHY+CwpR4zlgMoLcO/uk6ORcZvIK03zxBhyW6ogqz/4PUoMSK8+zo1IeWxXzaJ7RdRZ9BLxXcFXtHHHVV8iTzdrJp4+0hVSuzNM5wsAM5FlUhE5JmRpZ2v7uFrQJxdYJt6bVbj/jP+G5xp02hNaVH1QszSQgqZLXns61Eo5yhJ+54fbIJ2ECXuWWbmYf4XI2DAB6suY0B8nXF2WYzhEKG/gmZRY5/lVfskTNwDFHO2P6cg+yQn7WjaMSgG8QbWC2uAZnxBcqLc07by9DJNJiOc8kO36q9JwNfH/hgv3lI5SfT2e4quxGB4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(23010399003)(366016)(38350700014)(18002099003)(22082099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QCVt6LYxl5NnkpErRwgA/HqfZYM2m/2JH/R9SYPUCB0V3SFLKh9zQ3qHw87P?=
 =?us-ascii?Q?8iRCYOKYiQ7Rf3rwi0j+3NDuzRT0xkNryrNQCA/3Bi9YNlwdJf+KnQUIhM8z?=
 =?us-ascii?Q?WIHbQhn0ZGnyFNaMTrIhI3+UPXRDp2mfk9n9mw2sgyw8qtzwsKWNndDbYG55?=
 =?us-ascii?Q?+NiEAsxqRxflJ+ZFywLqx6y6NuYbPaYCmL7hELIC56lkvjSw6ALbLPfpt0y0?=
 =?us-ascii?Q?dGyDzYeiphkX6JbungIhSXxPlN1XZB6515XKzdqxbZ5dbNKWEsOT1lLTWWK1?=
 =?us-ascii?Q?vsBFEqqckKVGZCVnjdqtan2Mqpx9XS/bUNiYFFMr3lK3lexSguZSxe+n/NZ1?=
 =?us-ascii?Q?iz8p+E88PhG2zSutK8LMiA6ojJnHmadEqdFdiRYRdEs4Iyev9EtckcfNmaaX?=
 =?us-ascii?Q?1Lgfxt0rUaRdL89qI9YkSa4tSrEKgI7n9riuEtd1VnFIg2Vx9iV7g4l2BqeJ?=
 =?us-ascii?Q?G4wyF/xltIEym2JIIkKqOSP3ps5T2jsI779QZUys3mFA9yTGUL9lCfpPXECE?=
 =?us-ascii?Q?VYuX111r7TKinz47h6f949eF17e5ss35eYAGCHkftMFgUhW7KwcBI8B+IWrg?=
 =?us-ascii?Q?WZpsiKYpqm+SUeO6pPvOMGzYtGI3qyIbQ0IEkWfjw7WoIyjDr8X9klAsYgYl?=
 =?us-ascii?Q?lsrPGzJc9NqPdySf5q9ZhHT0dHhGl/2Yp9LE9gWFcmdaU8C8xPAHCvOnY0It?=
 =?us-ascii?Q?CwgUkNyXXMVxpmXllOuEOnhtBu9HXTXnE6XV14iVsOhmZ5h0nmCscmhMIs1E?=
 =?us-ascii?Q?QneoJtvwN9ULhVo4WlGGy6GpbAgfYbCcgaCZrWYkWGU/7H+w9MK7+x6RSXQZ?=
 =?us-ascii?Q?dBDNJxjGVLQQR9H5kma2D48KcP6cgqcOnOhpQiO9buh1DWMFl2zDx6MrN/ZJ?=
 =?us-ascii?Q?mlxz1dtNuImABrIP4btbs/1gjfGbKv6qvUhakS+n3YkrNRvIq8v+am6HnaGJ?=
 =?us-ascii?Q?ZCTNG6pykpudE/Drbx8l7ShANCwbA4wvWnp3fm27zDW7t88V8W6vKd9vraWb?=
 =?us-ascii?Q?DUHAyM+EUY4azwtK1jrUScL/VbsvebezmF10Nlrg+/Du/tyHqx+RWlwP1vBL?=
 =?us-ascii?Q?rY0oMqz1PkMA4k7RI7PGpwX5N90giAUM6l7wdbJ8//aMd1wk0694+prJedKb?=
 =?us-ascii?Q?BIzByj4b3kUULnDEh9+HragJYZ5q+xkvzZDnlK7TiRyuET4zjpcB9NCPOE6E?=
 =?us-ascii?Q?3kqpdjfM1fU5nJkzAgqzXm93I0cRyg5qrTI5kkFO43aANHUrviW65z5+Uh7P?=
 =?us-ascii?Q?AkWlmW314RTyd2299aBpaEIEBdqxCognoajPfJywEUShMB+eqbznihhyG5un?=
 =?us-ascii?Q?L1MiRvpbFqhJXO2PPkvyMfm02xfDk58LXSoV6nwpuEriHE7BgBaYCfudtyZt?=
 =?us-ascii?Q?PoJJYc4dIGTL72cGU24GEenfDlqV8jjB5xLA9l2RmsQl59MHRn6gKToGsemt?=
 =?us-ascii?Q?dCP2cNYdiNtTWjRznCJpsEDysB84haYT5P2rs57sUj0dr9Wd49CIO4P8oc9k?=
 =?us-ascii?Q?3uaIENBut5rqK/HTK9exs2sEijqoIi7PGkPUL/GsxYTZ2HaeERkCMbEWp7dg?=
 =?us-ascii?Q?+NBEDHVosrTEESoOZOzEObRp2gZ9GPrZh3DHLHDCaaL0warEZGVOvIVWATPO?=
 =?us-ascii?Q?0qQVtw4IbktgpmAWmeOUiuqzN66eojtsblLgtbfR9B05asKaBaZ5PqwwYrYg?=
 =?us-ascii?Q?iF4u3t7TEK60T8aAazYVC4ubOzwHMYc+iMPpQErozdPXsekBTTPFWJHrOy7A?=
 =?us-ascii?Q?N1EGCvVo48pIvvG6thXzvgKod/MrwycVsek/HUY395pbtT8ZSLu8?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03519772-2397-4c66-f063-08dee6c816c6
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 01:33:38.4081
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BvmDuMDA/2ysgdJx5QPoDcuMROa9uD/uKY6byPzff1rUhBgcIcsr6SPRVqFjxxVTT8X0hpQwHm2ZaD1LZnW4q1ZTlQIeOweD99YFVhVhZyJnmmgVEXGgo1IY9KxS2G/F
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB7282

use *dev, instead of card->dev.
No functional change, but is preparation for cleanup driver.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 .../mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c    | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c b/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
index 91c57765ab57b..864b4d7228f50 100644
--- a/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
+++ b/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
@@ -1019,7 +1019,7 @@ static struct snd_soc_card mt8192_mt6359_rt1015p_rt5682x_card = {
 	.num_dapm_routes = ARRAY_SIZE(mt8192_mt6359_rt1015p_rt5682x_routes),
 };
 
-static int mt8192_mt6359_card_set_be_link(struct snd_soc_card *card,
+static int mt8192_mt6359_card_set_be_link(struct device *dev,
 					  struct snd_soc_dai_link *link,
 					  struct device_node *node,
 					  char *link_name)
@@ -1027,9 +1027,9 @@ static int mt8192_mt6359_card_set_be_link(struct snd_soc_card *card,
 	int ret;
 
 	if (node && strcmp(link->name, link_name) == 0) {
-		ret = snd_soc_of_get_dai_link_codecs(card->dev, node, link);
+		ret = snd_soc_of_get_dai_link_codecs(dev, node, link);
 		if (ret < 0) {
-			dev_err_probe(card->dev, ret, "get dai link codecs fail\n");
+			dev_err_probe(dev, ret, "get dai link codecs fail\n");
 			return ret;
 		}
 	}
@@ -1065,21 +1065,21 @@ static int mt8192_mt6359_legacy_probe(struct mtk_soc_card_data *soc_card_data)
 	}
 
 	for_each_card_prelinks(card, i, dai_link) {
-		ret = mt8192_mt6359_card_set_be_link(card, dai_link, speaker_codec, "I2S3");
+		ret = mt8192_mt6359_card_set_be_link(dev, dai_link, speaker_codec, "I2S3");
 		if (ret) {
 			dev_err_probe(dev, ret, "%s set speaker_codec fail\n",
 				      dai_link->name);
 			break;
 		}
 
-		ret = mt8192_mt6359_card_set_be_link(card, dai_link, headset_codec, "I2S8");
+		ret = mt8192_mt6359_card_set_be_link(dev, dai_link, headset_codec, "I2S8");
 		if (ret) {
 			dev_err_probe(dev, ret, "%s set headset_codec fail\n",
 				      dai_link->name);
 			break;
 		}
 
-		ret = mt8192_mt6359_card_set_be_link(card, dai_link, headset_codec, "I2S9");
+		ret = mt8192_mt6359_card_set_be_link(dev, dai_link, headset_codec, "I2S9");
 		if (ret) {
 			dev_err_probe(dev, ret, "%s set headset_codec fail\n",
 				      dai_link->name);
-- 
2.53.0

