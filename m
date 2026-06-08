Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010011.outbound.protection.outlook.com [52.101.228.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CF912F362B
	for <linux-sound@vger.kernel.org>; Mon,  8 Jun 2026 01:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780881902; cv=fail; b=Yeo++7DI7JF/TzZzr+mrchDem1u6KCfiEpFMMzaHjVHo68bg4wF8DV16QM5WbmKCsLgewNLiFnKVHB0TMzzBTu5RObvtobjsp/fQk7zQ4vByBWbDummg7iOwCXApHI/MTs3R49bImNQ7iDsj09qpVzBGHuoGLUaJ3g+bSSvG0fw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780881902; c=relaxed/simple;
	bh=iX188jvuzQkqiPwxyf/4+tskoP3JUxwa7dZJMLoIZeE=;
	h=Message-ID:From:Subject:To:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Pp4laeLQQVWsSLyWwtgKxlaElexQIsYQ+qEX5D/v5U3ZWn2c86WxxCbKYIWpcJ2xBBEQXJrC/qwdgeC7NzkcQXU0phSyaxy7etjIY6VHtjdn/rl/WtieOrs0h9pEL68n7iiIkcm43h6q9ZdxBVC41jOw2lzjwNYFCz4K7LK7Tpk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Eyzv6XSd; arc=fail smtp.client-ip=52.101.228.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Eyzv6XSd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DmUx7fW+JWfp5jrlSFESRkJSNzueDrVu1bKTcbRLdVc7Fl5uIR2RdcEd0jfS7adJwQmZ7sNbAvs835Qh5FebnfMJcqDCfoMb/lx1BojfZFKk/LyHAIbh5GfPxrSR7+9OgxTXafNOuGtL2SgDbux0gNVYuSePBAcr6Ez0UiNG+f8lRMqsDkcbE/8oaEk96N8pshhXeis81izsozffEeL8J2AmLyB0BXDLR7wmejg4SQpKwQrX68QAWXE81OlPL5W6tmjt3ZM2++8arKtLnIfHciNaZoUe05boIs+blWTP1/dzV9lsf0CxAIEbj7SzFfeWzuMrOpRwYK/a2yN6sMmOvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YrC97YLWKYLoNLvyktyVEtby232qbxATEYZkfU+OKks=;
 b=zC6M2mVK/JgstBPbywMtT33nWIz8fR+8O6in5rldi8mwVQ9fwJZFyPHDYXCvF8KJ6G/6tLI7mK3tDw1VHgm4qvME19YYXdISv6ixM7a1rCl3xREis0kDbU0oEgypYlWIcTxd/L2dPAhqGIADJSxMGTD80yaYbQvOD0XM7nMEgyjY+2FyDt6MR33zUTVmcIDQ+rrfPWn2aXhof9ZRlreRvSb+Z8EgcLStCTmhIM5u1i8R9ptdq12ipRzOpymcIAcq2/ILTc8WEyUK5xHfrv6P1AYRdI4M2L8VzLz2xcmEHgQ/6sjA7qmQs3+Idf7xrhpbNGaWQfjLOQif66cOlIcMtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YrC97YLWKYLoNLvyktyVEtby232qbxATEYZkfU+OKks=;
 b=Eyzv6XSdlo3LvlykeKanen5zryDqX7Or0/Z8ih7f4QaAT9xWyuvTGqK/EBjv03TRu8LdNNKOXeGU3j9xOwdg9lYi8CWJTEm8U15UXuJY3abslk7GaKj3nev5XE4x3r/zk56bgZakdNmMS66nKvchV9PLZYhlgLBPkcLzaemI3q4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OS7PR01MB16954.jpnprd01.prod.outlook.com (2603:1096:604:41e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Mon, 8 Jun 2026
 01:24:59 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0092.011; Mon, 8 Jun 2026
 01:24:59 +0000
Message-ID: <87bjdlesd0.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 5/6] ASoC: mediatek: mt8186-mt6366: use *dev in mt8186_mt6366_soc_card_probe()
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Takashi Iwai <tiwai@suse.com>
In-Reply-To: <87ik7tesdw.wl-kuninori.morimoto.gx@renesas.com>
References: <87ik7tesdw.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 8 Jun 2026 01:24:59 +0000
X-ClientProxiedBy: TYCP286CA0185.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:382::20) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OS7PR01MB16954:EE_
X-MS-Office365-Filtering-Correlation-Id: cb124c01-6d7c-4228-1911-08dec4fcc1e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|52116014|1800799024|38350700014|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	9Xb7ZvDWvjR/9EaUvfXhLbjlNUiGoCCYKA5KX8I9hpcKn21ntq6DMYdwFM6xnoNpjNOikSnA0dzTfI0U9BY7HvRKyzJAaxHwErPOjslMI7hJTYxYjaTLnQq7wbF0DPamUGz5CbIkP6GUTPqH8brgFwaeokXmtUckUrVkjXaZ+q/TJ23KhSNXEGKc3qCcnt2CiAvlSe1w0gqUMR7tQIT/GM3UBe9eje9qm4Q+O+K900ZO6h5uEC9cQDI8m1mb1xpSPoxkC6bxrnnfN7aybz3gwuXVvnS9hppyuYfTFl9tx8dMVtXNn2iY/n6C0MeYHjDCln9J1+ppkFWc6Ezdj/tXSWY5QrG/MAVv9XD0ChPBZVpWSHYxKKAF4n8P1CoTaf6OI2CffbMzi270dTHJaE49Gjel7ebNl9WLxjN9opU423MANNep2NgnRlVcwFGaw7Fwks92eCbUi8TPh7jcDfiJexprjnKNRTz6amE67sN+5fbDEZzwRF3G7asuxSqPx1bzWMuEZMD0ycZwOnFoCdaesNGjOG+OCKUKddy8f4mF9XU5SOBkKkhBDEJvLf/jUSpNM4WAAS6O5BPivv6/A4jKxRDektMeYvHeZ5Y6E/2GLoVHNGT/ajCZKOjYUwZ9T4wT94/SbNHt2Wwier5YL+FmBxe7NQaGaFuugAsFajdAkYN2gaLr5M8KY0F75xDaicQzqHlJInETYKfcOQo1Y8vdg6w1v8vfnNDY0hvUwdbH7DQ7iDzsYb9sD4LTxhHHFveb
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(52116014)(1800799024)(38350700014)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QsckaLRGKT3/ha+wIIKRMUUsgtKktKYEc2HjAlm29BGQFjOnJ46wJsm0aWG5?=
 =?us-ascii?Q?RiE9KTObnnacXDwosrgRbC56g0ALrdY44QidwxUSQ2edC9saAexB+BTgV43+?=
 =?us-ascii?Q?k8wsvrFEWJod0MMJwKSmHeOruIhWjwi60/6hG5V3CdWzcVPqRQBg7GVDU2X8?=
 =?us-ascii?Q?7w7htamJ4IEqF0tQhmI93XoiKsk83lhFZ5XGAzrcY3t5u6aMzdHj2sCipSpw?=
 =?us-ascii?Q?cCm8xRKm8fwvakQe9QKE6DrFAI49vAw5jw1Omb/P7kYdYiSCuHkrIDedAayh?=
 =?us-ascii?Q?2NFniTeUGD+MA6lQTIAp6bq7Ve3kNYNlaaR14cWU7c/DL7+4ZraPNiSuxYZO?=
 =?us-ascii?Q?cjk2sBfQ3myrekvymHIskPnPZDSV1lgqdf3eGXWO4a5wLtv7PjLMXdUauIqD?=
 =?us-ascii?Q?DKwuuJHAPFqCFxhfkHgNmcSuCAieXYn/T4RJ+Fu0IO3kVgHtyeIrKPxrp/JM?=
 =?us-ascii?Q?bvlRjPtMr+L0878X4Shk2448rEHOoOBlrEHRgQbeq1o7y2Sqhv00pIZeok4O?=
 =?us-ascii?Q?NcrdXxfl4+4YgRKcvND3XkWZEe1hQqwGn1uvoe39WuMYguQMC4kirmA5l8IW?=
 =?us-ascii?Q?679cqnsWrAvoRD+bh3b02SkE8QpUKnEqhEbwiFYjsurus/xyr6rRAjPyWN6/?=
 =?us-ascii?Q?632FmCDZYWoZ8JurTdrmjdXYHMK9bsXJGjuUQvgZpI35Xw5RX40nzOE3uqep?=
 =?us-ascii?Q?L6fhhyA3zkM4SgrqdxnzqaWeFIQte5ipmkVv3nTcyWrEa+keO1SZcM4K4sPc?=
 =?us-ascii?Q?lLBasmI5mUY7W3brqSo1cXP9GwYMX34Bvtzvwwa/aEEKGTLZKCMpU4Boz8Ge?=
 =?us-ascii?Q?XOI2CxzbtdX/83CHXBOBZau54svItbP5T5Cmc3joOUVte9vHnSWLZINzp6Wh?=
 =?us-ascii?Q?CseZIvsJB4EKXVUH/yHX/iFjT03Tr0HWqgrSvHsHfjpK7bSyhEfSg/J517ed?=
 =?us-ascii?Q?eKdwLAOT9cA6+LMTYSby7cdHegcvF3lwI5e2StUIiwyUrh+PzAyA/NdiHCfU?=
 =?us-ascii?Q?IW19NUC8jlbGd0gzhOR0acGcelknGvtgP+Idq+uvH6cdRIarjCM2GprA+ZbR?=
 =?us-ascii?Q?4R6KxUaNqS8xy3136nRmuNcCpN+7RHGQs/G1XdOdG0vekLqZibL1mMSorSQQ?=
 =?us-ascii?Q?fM5esQV2NQmTBXLroEpE3JjfXHkfXKZAMiSIgEsAHYTda17Lj6XJFVCmnK7u?=
 =?us-ascii?Q?HW2xY2KDAoCoLxwqlxtLjTohfrmQ1Pe15yW3DV4RNpBtzzQ5RBv9eTuRMFXW?=
 =?us-ascii?Q?bo7f5TEjtL2yMRuCsdF14tIRWiuPmlRWJl8CMlqKQxgZ0JvPhkgnJ3Q7Ix53?=
 =?us-ascii?Q?K76KBTmeEIdfsuoeYY9+RD9/vOT+qsyB0HJT7S9bwXQoNBXdluZKQwMEQ4dT?=
 =?us-ascii?Q?DiXadItD9Ww+27OfSTDlealK3QokP/EDxGnvHKkhgrVwFkBpMQiL4sKLqDL3?=
 =?us-ascii?Q?hBIcy2Thr6Qn1HJxOqPsA2J0lG9j2JY25t9eWf/IXzaiXkFtgdv2liaiT0Uj?=
 =?us-ascii?Q?G5CIIeXEIOVMzJ0AWs9JIk0l+gZsalGsEumrKo8Z5GvtJzuPe8Pf5HIcpPM0?=
 =?us-ascii?Q?Hu1XMyAo0HEwOwFxdq5Bdc0jxSjNkXWrIe4PJLmBA6wRuwB4wRE7G7zeahs7?=
 =?us-ascii?Q?0sv07b7Mh6U+9Ion/dxneWJUrWD8CHoGMg37ZGc5mKIXRwz6sJgLW0XTSvbq?=
 =?us-ascii?Q?lMV93TWrVSTCSYNxL32bxj+ODIiwwFmaqHSLx60WMjAHz6e3jelMkJF2xfPX?=
 =?us-ascii?Q?HmBuR7O96BqSvqDnQJFMa3fDe4bkKO791N9XiO2mozaKk1d209HJ?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb124c01-6d7c-4228-1911-08dec4fcc1e9
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 01:24:59.8326
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ELTZa9TpTInEmYVcXmbh1O4yhqlyAVKvJ2nR8KED/8V2AJj4XR2H1dzsba9dw7Kdh2aGHF6apK0tBCi005Kz60Y1uEUTM/J6HFV0KZeqfjcdYoOClRX7eogIOwzRD77I
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB16954

use *dev, instead of card->dev.
No functional change, but is preparation for cleanup driver.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/mediatek/mt8186/mt8186-mt6366.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-mt6366.c b/sound/soc/mediatek/mt8186/mt8186-mt6366.c
index 3fc93a8ad408e..22123b087c3ca 100644
--- a/sound/soc/mediatek/mt8186/mt8186-mt6366.c
+++ b/sound/soc/mediatek/mt8186/mt8186-mt6366.c
@@ -1211,18 +1211,18 @@ static int mt8186_mt6366_soc_card_probe(struct mtk_soc_card_data *soc_card_data,
 	struct snd_soc_card *card = card_data->card;
 	struct snd_soc_dai_link *dai_link;
 	struct mt8186_mt6366_rt1019_rt5682s_priv *mach_priv;
+	struct device *dev = card->dev;
 	int i, ret;
 
-	mach_priv = devm_kzalloc(card->dev, sizeof(*mach_priv), GFP_KERNEL);
+	mach_priv = devm_kzalloc(dev, sizeof(*mach_priv), GFP_KERNEL);
 	if (!mach_priv)
 		return -ENOMEM;
 
 	soc_card_data->mach_priv = mach_priv;
 
-	mach_priv->dmic_sel = devm_gpiod_get_optional(card->dev,
-						      "dmic", GPIOD_OUT_LOW);
+	mach_priv->dmic_sel = devm_gpiod_get_optional(dev, "dmic", GPIOD_OUT_LOW);
 	if (IS_ERR(mach_priv->dmic_sel))
-		return dev_err_probe(card->dev, PTR_ERR(mach_priv->dmic_sel),
+		return dev_err_probe(dev, PTR_ERR(mach_priv->dmic_sel),
 				     "DMIC gpio failed\n");
 
 	for_each_card_prelinks(card, i, dai_link) {
@@ -1250,9 +1250,9 @@ static int mt8186_mt6366_soc_card_probe(struct mtk_soc_card_data *soc_card_data,
 			return ret;
 	}
 
-	ret = mt8186_afe_gpio_init(card->dev);
+	ret = mt8186_afe_gpio_init(dev);
 	if (ret)
-		return dev_err_probe(card->dev, ret, "init AFE gpio error\n");
+		return dev_err_probe(dev, ret, "init AFE gpio error\n");
 
 	return 0;
 }
-- 
2.53.0

