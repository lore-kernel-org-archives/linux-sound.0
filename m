Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011055.outbound.protection.outlook.com [52.101.125.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18188379979
	for <linux-sound@vger.kernel.org>; Thu, 23 Jul 2026 04:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784779931; cv=fail; b=CU+KunGJXj1A4eYgEeUgE2pybv4O3y2764AuZgHTX7OHEo9IB/E6nbZP1x9Aw3uEeJ4F5NrMQ/wISJlPBAWKBBQx2h0onAQRfJSEoVrDEsWhgmmKTuoV4UJWhHBHJF+la3/xKLvuHNokIpsjjjLDutId0lr4geNWSBvhLymZUZw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784779931; c=relaxed/simple;
	bh=F81e5tBs61ZxwbzIyR8XO4i6CMgbqqb9GNcdS7GgzvA=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=il8zx49AwlO/Ug4RHev5Wgx2xh7IyL2MRjAphJzsQ9Zpm1CO9B+X1rXS0t1lfJNwWfWf1zVTfj9cEIZhOrIvzKgEeO07Wn3Bnq1wznY0GWvixZ4dzR6knS9ZSDCmfOriCgOM0s4ceML9SLAOnb4lAra+V+kDNxFBwkTbhUs4sT4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=M8to08pK; arc=fail smtp.client-ip=52.101.125.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="M8to08pK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fqfmmNS3olclXtRLY7Menwoh98MZMcHXbmHsZ/AK8tWcucBcVzsWVqJ6D9kffv73yQSXWjVsRqYbku6V30XRyN4JxoyzmLmwtAAf+MhpyCtIIs8rldjg5WR+3pWmjRT4S3s/r0q5gzUBH5vGFIe6Z/vTv6P75Cfd1GQ/pvOP1mnUVoanbaN0KvY0maYf2Tjos+vrpI8TMTVnYACHkATErmQC1fdG+JQYBgRnhltEWsU00esIHl0FOeKWrSc4hnI7X3ldOmzOWSQaE7xVUIP0idCSDpIK52TCPUJ//yaFq6njTdZJ7l6fgqNFeqQ+7BJBByqW2Sp8nhF/vChYrcNhRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9N+GvNU9bsA/hLrHLUqIZUDp3bq70y6xtBFspfIULks=;
 b=PS+dvB1E4iCI5xA2J/d+iEU0PnTP0KyYcXLHxxyUweNvWolRDh799gcch2OVH67xD+ZebFGm4YjGN2DMoXJbY7MUQj/dnn8SqSVRjlYMcdx4AZAO44jQN6OznBcTQzU22iuakV4Qd+w34Uci1bMcGG64vdrKc61vdLk9VmXEyATLk6UWwG8ODXcmXjUHKjAZUOvtw8GdgHMbi6Ud2WZW75sEN803CKLZ3RETWKLh/aT3Oe8n5cKQph5hH+IS2nGdCx7D3LEmizjLH1QF6cb84jWgp5O46AeiFPEVZGuJ2MqSMqt6mtlwJ9O8zpYc8j8hj6f913xolFAGGUrWMKPCBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9N+GvNU9bsA/hLrHLUqIZUDp3bq70y6xtBFspfIULks=;
 b=M8to08pKEYmYsboZpv8KzASVsqMtD5/F05BMXHgpZ7d8KNvUbBh+J1aPl401YXPiEtQp7qfliQVAOm4w8oJ1X5DrNqhRTEpMAGkSez6ZXZa2RO4lgA7BakFW15wg7EtA0W4i7gOeEcP2AvDAry/CERwVtDRG4gqPn/kv6LU9qYk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OSZPR01MB9329.jpnprd01.prod.outlook.com (2603:1096:604:1d7::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 04:11:51 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0245.009; Thu, 23 Jul 2026
 04:11:51 +0000
Message-ID: <87a4ritke0.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 1/3] ASoC: meson: axg-card: tidyup not to use card->dev
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Jaroslav Kysela <perex@perex.cz>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87bjbytkej.wl-kuninori.morimoto.gx@renesas.com>
References: <87bjbytkej.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 23 Jul 2026 04:11:51 +0000
X-ClientProxiedBy: TYCP301CA0074.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7d::14) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OSZPR01MB9329:EE_
X-MS-Office365-Filtering-Correlation-Id: 24746f14-8951-4a8a-cd95-08dee87085dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|23010399003|376014|1800799024|366016|38350700014|56012099006|10067099003|11063799006|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	0Y0IQAJByJLh6kOCSyrAsk1yO9YE48UWJzKIt3bknP4CoaMyhWpMlWcKb0ldYEGyAaKEyKyqr5tOctVp80dQtf/dZ6ThTPI54YxOkKSIYdrFq3tN74a2DYaDAwsnVP4rsWTW3Xf15yDgj1bi5+WVGHidDxtPgHbzJzx61gNY94i6mgBfZasDeI7KjdfwWnbI8Rrn1bg6CzDsSlmgglwuKTjGVQyfcc7Fhzilt9Z/yzgvSA6/e4xP/NFjKI0IBzNf/T1Qj3QCWPa2no7j5Lrlozl0FngKVkeJjMxw/yCocegQTIB1FbeQl4WWc5IZzH9KC6Ngf4pxm6jm7YTBaTCVZAVW9E1N/zO+2jfRAmGPi8PjI8G7xR1KXrbVLMOBLbWjFXB4ZKJ1edvTtu07e2xCEiE0K13aDPiRmJqMu/KA2gz6hSS+COZ4jQPJqqDYqdzN66jBHDpU814BXFpEr6KdkMTvGatOCdrvgO0lqxhdVoCedhpAhrGoQInnPP/IeO5VyO3Cmn9g1Jq3u5dP8axsgcPDEXOhtbWfqm7mza1RXILbgU0sprwx5PxItALkzE8M6mWiGaXsWIb9jo20obMdKnPRGNg13TCozf92qqUr4L1CK8LyLWYiLX/KK6E81t/YhghLn+5xtwIkL6Y0KSOkhfEIXZf35o6Cdl5mZDAo/sXyDmwLifwXBDPa96x+98gfdbfSLl+kkZv8Pshm/10s0PFobII2qOeOBBpWBsgeg0s=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(23010399003)(376014)(1800799024)(366016)(38350700014)(56012099006)(10067099003)(11063799006)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SuNCs6SqbWHv3NTtT74X1WKJTgJXLDmN+wTYj+2JcUGYER5jG/dsyihE/aHa?=
 =?us-ascii?Q?ru3rYjWs0ff4wSFvNmOiCj3cNDXctUM0QEXLIt07v1qG5zs+dmuzo0biEF8L?=
 =?us-ascii?Q?/LoKhA3E3FxIcr9XApXUMLq2FCSTzcfL1IKmso8+t7V2bjGMzJMTaXQ/aSwC?=
 =?us-ascii?Q?1MfINVgBD4vD2vp5fyXzk7r9eBfK3O4rXLH5AyKDCNAxU/ERP1To7qTaVeUw?=
 =?us-ascii?Q?zXvI45MU02kmS7jhX6FhDZpbKMWL+dBEV0vEuz1Rkg/aUpNbjGNjJak1EUD7?=
 =?us-ascii?Q?GuI4o028QCGsRH1Ieb2Pi5dBIfEofaIuq9qmLHNQF5Dqz8EdLX8gEZE0lY+k?=
 =?us-ascii?Q?HjdSTPpt/SukrbpEIRq6BJdr/PuKUJwcP3Bo+SY0mRdpmlqJITTm9lXdnhlw?=
 =?us-ascii?Q?4mV/NCM+acAXAgRYaDfr3KqDMqO35QiMercaFZ6l3Low9l4NbUistzMFnBDV?=
 =?us-ascii?Q?4navw2z9tNLjATP4bHGr92FFn5Pz9yIANZnMp7U2EDobcC3vQmFFOBHP/Uun?=
 =?us-ascii?Q?l/WUJtD3+2hM08PXNVR3DEMpnj5Y6OohqfpZBmIim3wvBav92/P7wdSFHM1R?=
 =?us-ascii?Q?mzxOYJ7H5BOCqhA5kOv/1F2FreR/vkaIVb6JNEsSC35RIi8DwEaJlyYUDa4J?=
 =?us-ascii?Q?Bc4cd4VhK+uT/2/NYX0CXKNP2S3V8/sUm/GkW4lo096VGKzVjeXyFzcjwjtK?=
 =?us-ascii?Q?KDuKBKQiltOyg+9AiXSJrEdC18oQoMjkGBWN+qIZIiMa80lUHwUQIwXIDUI3?=
 =?us-ascii?Q?rONnYtkON3bXw/lCNgxP7Q3HQxHIDcQRWK30QVNABwxi5kQccjyj/r8Xdx5n?=
 =?us-ascii?Q?lYc6MAROW/HHR55zJ/ItBx4HR2G5wldFwFiXS3orV/nxe8StzKfD2LhjBqa8?=
 =?us-ascii?Q?iUljAi6TG31GHG2VkxCaGSsNZP2we8JOCUivJQlU+2OEc37MnFDSLElTNQ65?=
 =?us-ascii?Q?S6RGpFNv4h+EjyXv8vgf/qPPlZ0bRDjAt9HUEr6GsOsx03XqWhhBJvI6CbCq?=
 =?us-ascii?Q?PWdPkzAkkeNGpakPW0PHVuSQdSohop2tDW3zm5hsYQVl8k5taLi/nSD3itcW?=
 =?us-ascii?Q?SEnhmaOtRtYbiaV4RKUmu5zBy7NSZq1wK+m67yVcSpmZDCbTlWGCRn1L+ylG?=
 =?us-ascii?Q?UzUVq9I/MR+Nk9FQjwerkY1zU4aE7Y6lB5YODNWshzq0VQtYK2PcJUcVDHXT?=
 =?us-ascii?Q?TYKAOAsOehQiaKKtJejlpj7L8WyeIFPzXMagX0A2waPBGe1wXeR2X3NosZFM?=
 =?us-ascii?Q?UGevWxXdUjpf+a9xEo6uSLu5gPQ4kXeBbs96aoenc8M9Ok58dlNQmXxROX9C?=
 =?us-ascii?Q?I0ypdrglN7XbrKzJA2Q5OU3O0azg4usWyu0PcsvRAKur5a2wiQJXWfMXCerT?=
 =?us-ascii?Q?0SKhMTyXxvB0QZQsY4EfJh5KaZhEVbhYcfLQGCpKY/WG8Ovmmmpu84BT+6SU?=
 =?us-ascii?Q?agrbkvxCMRzzj/ibj6ZJvAxvWPnSLOsu7AZ9qWhWfUNOppjg+wy2gJcdIVYX?=
 =?us-ascii?Q?75MNZUxEN4V/A5Ee7zYwCaYR0xM+yDP7aDJww0/BAkLM3smzAl+MXCyGWfQi?=
 =?us-ascii?Q?roefCJkzEjOs62IBFwdNa0MI2HXemOyJsoq/ntHRamzkTYytU6UCH8a8H4gt?=
 =?us-ascii?Q?qX7/zOLlizkL77hXkqntfKvJPsVYOk+PUfdBoysk5iTxXDC0co+kLKw7GaeZ?=
 =?us-ascii?Q?JHBtoto/ZxPEgVI9GVlKdtWdave1itxS08rOry4+qfbeUTGoeLUsgOYMGGgS?=
 =?us-ascii?Q?XwGt3Bl6lXng5abEKsWYRdjaST850CU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24746f14-8951-4a8a-cd95-08dee87085dc
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 04:11:51.3974
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XjrGHcjrjZmYeJEWERz9NeW6GJiMFDlYTBkyxozG6/xrR1MdQ/yY9Y4xHIHINCijpWyD7IS2RjiwnMKNtMRl2VC5Xz6fcei5joFmt540ElIXv4jlqcNyxdoL4/9CgzD9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB9329

struct snd_soc_card will be capsuled soon, its member will not be
able to access from non soc-card.c.

To reduce the difference during conversion, replace dev.

	- card->dev, ...
	+ dev, ...

No functional change, but is preparation for Card capsuling.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/meson/axg-card.c | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/sound/soc/meson/axg-card.c b/sound/soc/meson/axg-card.c
index b4dca80e15e40..c36f727af4ba0 100644
--- a/sound/soc/meson/axg-card.c
+++ b/sound/soc/meson/axg-card.c
@@ -107,6 +107,7 @@ static int axg_card_add_tdm_loopback(struct snd_soc_card *card,
 	struct snd_soc_dai_link *pad;
 	struct snd_soc_dai_link *lb;
 	struct snd_soc_dai_link_component *dlc;
+	struct device *dev = card->dev;
 	int ret;
 
 	/* extend links */
@@ -117,11 +118,11 @@ static int axg_card_add_tdm_loopback(struct snd_soc_card *card,
 	pad = &card->dai_link[*index];
 	lb = &card->dai_link[*index + 1];
 
-	lb->name = devm_kasprintf(card->dev, GFP_KERNEL, "%s-lb", pad->name);
+	lb->name = devm_kasprintf(dev, GFP_KERNEL, "%s-lb", pad->name);
 	if (!lb->name)
 		return -ENOMEM;
 
-	dlc = devm_kzalloc(card->dev, sizeof(*dlc), GFP_KERNEL);
+	dlc = devm_kzalloc(dev, sizeof(*dlc), GFP_KERNEL);
 	if (!dlc)
 		return -ENOMEM;
 
@@ -158,13 +159,14 @@ static int axg_card_parse_cpu_tdm_slots(struct snd_soc_card *card,
 					struct device_node *node,
 					struct axg_dai_link_tdm_data *be)
 {
+	struct device *dev = card->dev;
 	char propname[32];
 	u32 tx, rx;
 	int i;
 
-	be->tx_mask = devm_kcalloc(card->dev, AXG_TDM_NUM_LANES,
+	be->tx_mask = devm_kcalloc(dev, AXG_TDM_NUM_LANES,
 				   sizeof(*be->tx_mask), GFP_KERNEL);
-	be->rx_mask = devm_kcalloc(card->dev, AXG_TDM_NUM_LANES,
+	be->rx_mask = devm_kcalloc(dev, AXG_TDM_NUM_LANES,
 				   sizeof(*be->rx_mask), GFP_KERNEL);
 	if (!be->tx_mask || !be->rx_mask)
 		return -ENOMEM;
@@ -191,7 +193,7 @@ static int axg_card_parse_cpu_tdm_slots(struct snd_soc_card *card,
 
 	/* ... but the interface should at least have one direction */
 	if (!tx && !rx) {
-		dev_err(card->dev, "tdm link has no cpu slots\n");
+		dev_err(dev, "tdm link has no cpu slots\n");
 		return -EINVAL;
 	}
 
@@ -207,7 +209,7 @@ static int axg_card_parse_cpu_tdm_slots(struct snd_soc_card *card,
 		 * Error if the slots can't accommodate the largest mask or
 		 * if it is just too big
 		 */
-		dev_err(card->dev, "bad slot number\n");
+		dev_err(dev, "bad slot number\n");
 		return -EINVAL;
 	}
 
@@ -222,8 +224,9 @@ static int axg_card_parse_codecs_masks(struct snd_soc_card *card,
 				       struct axg_dai_link_tdm_data *be)
 {
 	struct axg_dai_link_tdm_mask *codec_mask;
+	struct device *dev = card->dev;
 
-	codec_mask = devm_kcalloc(card->dev, link->num_codecs,
+	codec_mask = devm_kcalloc(dev, link->num_codecs,
 				  sizeof(*codec_mask), GFP_KERNEL);
 	if (!codec_mask)
 		return -ENOMEM;
@@ -249,10 +252,11 @@ static int axg_card_parse_tdm(struct snd_soc_card *card,
 	struct meson_card *priv = snd_soc_card_get_drvdata(card);
 	struct snd_soc_dai_link *link = &card->dai_link[*index];
 	struct axg_dai_link_tdm_data *be;
+	struct device *dev = card->dev;
 	int ret;
 
 	/* Allocate tdm link parameters */
-	be = devm_kzalloc(card->dev, sizeof(*be), GFP_KERNEL);
+	be = devm_kzalloc(dev, sizeof(*be), GFP_KERNEL);
 	if (!be)
 		return -ENOMEM;
 	priv->link_data[*index] = be;
@@ -266,7 +270,7 @@ static int axg_card_parse_tdm(struct snd_soc_card *card,
 
 	ret = axg_card_parse_cpu_tdm_slots(card, link, node, be);
 	if (ret) {
-		dev_err(card->dev, "error parsing tdm link slots\n");
+		dev_err(dev, "error parsing tdm link slots\n");
 		return ret;
 	}
 
@@ -310,9 +314,10 @@ static int axg_card_add_link(struct snd_soc_card *card, struct device_node *np,
 {
 	struct snd_soc_dai_link *dai_link = &card->dai_link[*index];
 	struct snd_soc_dai_link_component *cpu;
+	struct device *dev = card->dev;
 	int ret;
 
-	cpu = devm_kzalloc(card->dev, sizeof(*cpu), GFP_KERNEL);
+	cpu = devm_kzalloc(dev, sizeof(*cpu), GFP_KERNEL);
 	if (!cpu)
 		return -ENOMEM;
 
-- 
2.53.0

