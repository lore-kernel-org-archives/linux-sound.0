Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010067.outbound.protection.outlook.com [52.101.229.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7997B3630B9
	for <linux-sound@vger.kernel.org>; Tue,  2 Jun 2026 02:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780368960; cv=fail; b=ZtNhbU8pMEk+Ek9LqUGpqNtCc/W2zjrPMtFUYlvNkIkL5DYDXDrFTcTX5L0bTKwxtkXlj0XLLOKpot9Yi0XB/fxWb5FSE2VWfLFXsUcCETNzOoqGBZIZnUWWT/6D6/W6tIkDeLITDk6Bd1On1MJznc7CNqv3TVJUN7u3q7LZZV8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780368960; c=relaxed/simple;
	bh=uaYxE84YS20LkX7e/D9nUqf5oLgiUrlva2bcoXcavbU=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=hl/25zzXVnh2rQmz6PFlYYjbrDs/ZsgVTWl23VpvgmXC/iLU81fP8EswyHftLXT46Ng8TJ7YU4BW1CF1xnHbfEe8mxxHjJfqORF164FZ/UjuQJ9DQj+4tCV6QxH+TwqY0PDF4Y+3b1F0nfdGFq+sr8QeojO5YWb3m312BGufcLA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=ilu2UCTd; arc=fail smtp.client-ip=52.101.229.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="ilu2UCTd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jpPlBRc4H4QFnrrwZCuEsB+zf5oAiyl1fjrsUffJLJZbA93gl1nuFIbb8pyI8q9uavmAzTH7irctvQ1imnhB3s9iF9Ezyrl1t9T/8nT4dq12WRCOwbH6x5HhvLDSN2jmypOPx8+Ej5A5grnESZShVltAPlJaXm+qxjMnaVMlWYHg/iTHvrmuHsMOHANI2PfJ32ibKz0xEH/pQfh2yOhyFVt1eY17LHcWAwQqEN7v/D1IEMPymCLVCL6CSE4UHvL24bn+nVc6ZFDWl1d9wHcU9jreSoqqKLbbkHC7u8JFeb1H2daqCBSmdMopY8yr5CLZ5lVwRhfAf7V1zHfS6+nRfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GZKPYwWQDrY7TG6LDKH04gycBH1OND4v8DeDC/2EZ8c=;
 b=p+r9XkLHXsLjnRPDoToBKtEbuauBCqR6MCdS2FwS1dO7MfeLRUlk7oyWChpaaR+26uQP/B1XIR9MS+9ZHSnoTwmYUG7qHbtC6vhWUf2xuNnlkt6umi9MTlEc5jx4phkahptuTCNS4H9yvo1dLWj8m36CGLVUPRq1IuBabenp6garAMgE57Pd5c4Rq24O7M4iCQKUTOr1Rdry5YdXD+LxXrzBC4zAbCb4WvnAzaacAPVY2x1lgEJ0r2oYYJNThy1nwUc/xEiDquxhEPKO+kOlRqHS8mhl3K6EGbM5qXofXA7LMCapEM1f2P3h62PIUN4gmGMoA0OJaD1gExNJqH1IEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GZKPYwWQDrY7TG6LDKH04gycBH1OND4v8DeDC/2EZ8c=;
 b=ilu2UCTdjFzBJvPWJSj8kmS3SzGT2KrTCsMT+/20IBoSy5ILMFiLZQyLDUoYXPewCt+EaGkYxYC5xF24a0vI5hy81ZKS/kfHTXM0d3NDfHsYRQwaeerRiPL08o81mNmCqHV9JJIB5YmX1kbmjU7qGBhL0m9J+y/eKkQvqf6DKD0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYWPR01MB8313.jpnprd01.prod.outlook.com (2603:1096:400:166::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Tue, 2 Jun 2026
 02:55:56 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0071.015; Tue, 2 Jun 2026
 02:55:56 +0000
Message-ID: <87ecipk5vo.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 5/6] ASoC: mediatek: mt8173-afe-pcm: set debugfs_prefix via Component driver
To: Mark Brown <broonie@kernel.org>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Olivier Moysan <olivier.moysan@foss.st.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Takashi Iwai <tiwai@suse.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	linux-sound@vger.kernel.org
In-Reply-To: <87ldcxk5wz.wl-kuninori.morimoto.gx@renesas.com>
References: <87ldcxk5wz.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 2 Jun 2026 02:55:56 +0000
X-ClientProxiedBy: TYCP286CA0069.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31a::17) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYWPR01MB8313:EE_
X-MS-Office365-Filtering-Correlation-Id: a6aaef11-4982-47d2-e7e1-08dec05277e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|376014|38350700014|18002099003|56012099006|11063799006|22082099003;
X-Microsoft-Antispam-Message-Info:
	5QsnrkGW4cdM6SkVMkFR9XWOY4EE/YEg8dARpVXFOq/z+Tv9NCL8kS0T79YP5KcnTViyy0YRT4vH/00PCnXiuiKXoRswgHts0bW3uw0WCguj++EHcv6q/9Dl975ichk5E54hxDmZ40lNnEBbQrD3qy43QqxYZyXGYoDI80/LwiypgHCWbOmZW7vDkkZqKMo9dysXFMb1loExuZn++yQ7gbSWMsO3KYCYAM4NpIz3kUOFGHu/PVthzDYU8Qy4MucIQVzD77zC4w3ZECbLqrA/yvhm7SkN3HflWL9tPhaY6xkBjp22rhO/6qRKZLg62jF99H7HTU1nnY7UsHfxS/rrl7rE+29nxjoF48tABn+zPK7rPf/Ua3e/p0ulb01lcIkqlfXlW2JhcjlQN/J+q15yR2ogGLr1+F3KQw0M7TtcZc9SDcCI4OfZ5hiDbHdLFfK1Dh6evatzAOH/m5o9V2Ia81AUpPJpvWi5AZEwP+5Y9isr0yCszKkYXkRG1DokwBcokn9j+l2AjD/gytwQ97N28BmNb0w3io63j9yZqUjzypaz1U3r1PzWAbZIx1dsw7U+ntxJAAZVuTRPUp6jQD9bAmArddct87Cpt52TOJtSYXemxk0jcta0RXcTvXdO1J/RFHgN4F4nJ4PZEJxRFajlNuBy/nYzbA4GWmppHK1NvEciTdYmRo9uHfDrlCErF3xXTAb5BXFqxkf49mcQVF1qaqHNjKckg/Tth4Q0tmrcn3EWdRuJUv0MHdsJ1Wfhq2Oh
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(38350700014)(18002099003)(56012099006)(11063799006)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CUH+DqZEA/alqCQt0KXL2DymlQeu8KJLxeFMD8+fSevSWhyUifyFF+8BPw/U?=
 =?us-ascii?Q?F7JNGSDYaDjwRHN/1t5iIeS0vqL24KN+fuF2fJ0GCEyiecdUFhtnzZzJRYao?=
 =?us-ascii?Q?Vrnip1a7Q1aCstsDmrvZlS+QEWQ99yCtzp8r0SJOV7qMzq8DOMaiqQg09Fof?=
 =?us-ascii?Q?42bd2BW91T1qTZwCKDZ86cZBYHpscma/u22AulIAXkCNv8U40iKF/uOm7b2S?=
 =?us-ascii?Q?hgfrwFmDpc1XDpjqDN9brD395VgAQ75t9m7Cif2OYDWU6S4OtyRWXPLKbgvN?=
 =?us-ascii?Q?zaypB8j/zCBxWUt9oNz7ixpWpV9+2wLnfTXJJBh0ELbc2AeSrl0bQsB8nR2v?=
 =?us-ascii?Q?qvX+ajX3Z0vj58+qN5AN9ARtXWOd/av0QT7Gu0X6ifKgMqZX3tqkIjnWycrP?=
 =?us-ascii?Q?WlBWfQDak17qBXXkbTzACNy1z7XU55qV7/AW/zwRi2ZU1EpdbCM/yVZlwOVE?=
 =?us-ascii?Q?a/lGw9WEJPnYSsP+TiJ5qmjK5FKXMYP04MjpiN7MKcHPnPq7yQ6ijCc2WTiX?=
 =?us-ascii?Q?pE90K4SJyxFG6DCgeLj6ws3qq3CVRpwLVTyStTgiLpatKCS851ZT+ssblono?=
 =?us-ascii?Q?mIDphyYIMnEu4MaVEy6wRtVdsel/lrQ3DIAsdVgtkPrTF82e0qtJxM6A55G2?=
 =?us-ascii?Q?8tblHKD05wPauzxNJBVQ9VkezrTiLGVM4S6f12YF6UTIP7OcShNp9OdzwHjv?=
 =?us-ascii?Q?JLIJKpWJTPuZh3I8yV0hWZNQm486tP2+LOgmbOH7b9LcT1UzdL6odChZG85N?=
 =?us-ascii?Q?R6Wc+Ii5PQwyHkdA7bTqYh5uhpV51pnHJ+/VbsU/gQPzQsS4rlY0zxUltmDh?=
 =?us-ascii?Q?iJzZu858c+lknzLfOsmwOx8yCNmW1+60YUDrG3DBRO4WXu0Z+dRRXiqWlMYl?=
 =?us-ascii?Q?oPmTzIYfHUEipzgIeEBKYf17ES/WN5HOEDmG+Nk5cqfQiDrMu9ylpqUfkcHe?=
 =?us-ascii?Q?hA2pYolLpIADGbey404505v2SP0wq7otkabgBqrCPzvaVsktDWaPY5hrylqj?=
 =?us-ascii?Q?SItLra8Pcf5qzd7CBj2F75INwBsiGOC7nlNUqGKwjoA+QMtIQKdPYJZJd9PR?=
 =?us-ascii?Q?DL+IuQh/7cqjxOQihMIB5ZWIFEuha3E4PZ2NBEQABddZPekPuYgv+WjKeqS5?=
 =?us-ascii?Q?MYURXxIlGub3ps5fjhLWD8why3eDFQ6s5GjV15kzDqx0FTmPRUQdkaAIQo0y?=
 =?us-ascii?Q?jS+V8fsgEIFWq0tv3KkBj9s+iS3Yarh4Azi+TzjhcI2lTKxiHS2BcrfWdOeE?=
 =?us-ascii?Q?j4MYWw00Fbez08YpaO/5Wxn9F4fIfeo4x72VtoiLJQBHgd0tH1lAGMjGrgMB?=
 =?us-ascii?Q?+pS+++Rw5BmCkUBfAVvpSv65bgB56XYOUtkQ988KGKyPrJ8aqAkqXSm/bRou?=
 =?us-ascii?Q?LrEy7EgiO4xuXiJcD0dJu1nZxRZVrHH0o6kFlopx419NHNUyopfjmfdAh8Zz?=
 =?us-ascii?Q?G6QuBebIYp3vYxzM1LjVY4MYue6FhouwfStmdfh7toTDeeRCF5FnlyHLv18+?=
 =?us-ascii?Q?QpOENEpeqvolsLV/IUIrQYYg52qoGVtrPIC8xW8wmhnxRJaitypcZHhGnqWq?=
 =?us-ascii?Q?y9/exls1of1VSn7lpKLEOeddUKwDgkfRDIKehJa+zo9b8oBEwLsdsnS5t1pY?=
 =?us-ascii?Q?pzA54YHu2zNLiFOKK7qq+ub+5xhIY+CtOcRvf4j66ameVtlfe3EL/uanirf0?=
 =?us-ascii?Q?dCbbJp5GwvXWU7KYIuc7Xe27Pw9uTAyrBKNqN2jH/ejbWBW88JB8xkrewPMn?=
 =?us-ascii?Q?XVJHTilg898tK5Xf2G5wTINDpRRaumdUUr1nRBfR+miu98WyqpeU?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6aaef11-4982-47d2-e7e1-08dec05277e3
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 02:55:56.5515
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gELlnidz1QpnRsb7N32BNQ457I/VHlSFcDqNfUsGYpC2303UdDIajdjQaUewayHsOT8SVX73xlUOJ09QSA8iXbyjk1pvE8bnKnUnRswFRS/Hx2zaSSSgWfgsAMtNOXKj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8313

We can set component->debugfs_prefix via component_driver->debugfs_prefix.
Use it.

Now it no longer need to use snd_soc_component_initialize() /
snd_soc_component_add(). use snd_soc_component_register() instead.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c | 39 +++-------------------
 1 file changed, 4 insertions(+), 35 deletions(-)

diff --git a/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c b/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
index c0fa623e0b173..69cadc91c97fe 100644
--- a/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
+++ b/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
@@ -676,6 +676,7 @@ static const struct snd_soc_component_driver mt8173_afe_pcm_dai_component = {
 	.num_dapm_routes = ARRAY_SIZE(mt8173_afe_pcm_routes),
 	.suspend = mtk_afe_suspend,
 	.resume = mtk_afe_resume,
+	.debugfs_prefix = "pcm",
 };
 
 static const struct snd_soc_component_driver mt8173_afe_hdmi_dai_component = {
@@ -684,6 +685,7 @@ static const struct snd_soc_component_driver mt8173_afe_hdmi_dai_component = {
 	.num_dapm_routes = ARRAY_SIZE(mt8173_afe_hdmi_routes),
 	.suspend = mtk_afe_suspend,
 	.resume = mtk_afe_resume,
+	.debugfs_prefix = "hdmi",
 };
 
 static const char *aud_clks[MT8173_CLK_NUM] = {
@@ -1053,7 +1055,6 @@ static int mt8173_afe_pcm_dev_probe(struct platform_device *pdev)
 	int irq_id;
 	struct mtk_base_afe *afe;
 	struct mt8173_afe_private *afe_priv;
-	struct snd_soc_component *comp_pcm, *comp_hdmi;
 	struct device *dev = &pdev->dev;
 
 	ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(33));
@@ -1141,45 +1142,13 @@ static int mt8173_afe_pcm_dev_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_pm_disable;
 
-	comp_pcm = devm_kzalloc(dev, sizeof(*comp_pcm), GFP_KERNEL);
-	if (!comp_pcm) {
-		ret = -ENOMEM;
-		goto err_pm_disable;
-	}
-
-	ret = snd_soc_component_initialize(comp_pcm,
-					   &mt8173_afe_pcm_dai_component,
-					   dev);
-	if (ret)
-		goto err_pm_disable;
-
-#ifdef CONFIG_DEBUG_FS
-	comp_pcm->debugfs_prefix = "pcm";
-#endif
-
-	ret = snd_soc_add_component(comp_pcm,
+	ret = snd_soc_register_component(dev, &mt8173_afe_pcm_dai_component,
 				    mt8173_afe_pcm_dais,
 				    ARRAY_SIZE(mt8173_afe_pcm_dais));
 	if (ret)
 		goto err_pm_disable;
 
-	comp_hdmi = devm_kzalloc(dev, sizeof(*comp_hdmi), GFP_KERNEL);
-	if (!comp_hdmi) {
-		ret = -ENOMEM;
-		goto err_cleanup_components;
-	}
-
-	ret = snd_soc_component_initialize(comp_hdmi,
-					   &mt8173_afe_hdmi_dai_component,
-					   dev);
-	if (ret)
-		goto err_cleanup_components;
-
-#ifdef CONFIG_DEBUG_FS
-	comp_hdmi->debugfs_prefix = "hdmi";
-#endif
-
-	ret = snd_soc_add_component(comp_hdmi,
+	ret = snd_soc_register_component(dev, &mt8173_afe_hdmi_dai_component,
 				    mt8173_afe_hdmi_dais,
 				    ARRAY_SIZE(mt8173_afe_hdmi_dais));
 	if (ret)
-- 
2.43.0

