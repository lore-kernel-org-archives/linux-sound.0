Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011055.outbound.protection.outlook.com [52.101.125.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38D7B37756A
	for <linux-sound@vger.kernel.org>; Thu, 23 Jul 2026 04:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784779943; cv=fail; b=hLN/jdROh4pD+xgga4CHrUB9jBYPKsTexwXLeV/7BomxojsUHCbfq26/dAEnGf/Bm4ZMxcPNGdvr5ZiAGxZY+W4LDIaVAVhrxzJFd2Lph/B902jCWgNKrc13ldO6R9NzhEGy5EgHwj8e1kAHLHmx2W1hWf2QLhynP951bRyDLt8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784779943; c=relaxed/simple;
	bh=fcitQWeRs4LOsBh1y75WthLk3vKpxencnXKKWAbWeXs=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=mqeSKMGlTLVman5JB9k4tFQqStrriSa4N07dC0dn/enDV9gBgeJ1EWniBzn8uDCEPXg9xWWzMYFyzgfbuuUkICWcmjMuhOhQzjI+b/oWzqup9prQrqTva9+GVG/BNrgZNU3/UHmicWpuGjXMbVDuphW7Ufls8hw4M53gLm1lb04=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=GK+7paZg; arc=fail smtp.client-ip=52.101.125.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="GK+7paZg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r68/GbF3eTfBRYVypSOE103Q4k8z1JpYTyB0FDr4TxT1GPmzlldgKZJRjsTmUh4oEJYF+iLMPYo9Z+xaGK3Cbw3hxKD28ZUyeYKvvDF0O/IUYu786toMwRAr2lODM5sxo9zbuzM64Hacx8sqQQtMEG1SJtNXKMyiL2jOZr34UeJjSLW3s6SuhKbOgGr9KU/F6htGDNNsY67f9Faf+yVlB0iD5/xcXvKLa2HMlmy8rsO2XyvO+nE8e8V7I5Nh+g69dqzjAkCnjvc81xSwIdlZb5nqsQt+i4RNOCqM516reMADb/gQgDxLDJX71PS4CrI+rojfUxtnB+8VwTGfJu2TAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xR+jn9LgVjajGTlGQs/kjHF7QmDrFNJ9rpKW1ZDeMvI=;
 b=lff4VPDVCg87UUYr4Qgau10P0Dc5kLIQkrochWG9p/RtgU1R+3mgl2N39z0S9nGWySWOANYvjTiVKBf8c3bGMbkxP/ZD6DhYk38QEX8LYNuukf0bwPHFryRqLY4Q7kIO2xTX2OACtKBWoMqyOBSz7XS1vMkI0M7hOf5s/hRT3l6WZizIjRgfGbJvkpyeYC+6N0MilfXgmZ6O3gjJhTQZ3SPVMmITIxbfRLBKNiKT9WFslOqlcOSvmGrqZw096w7Z3b0qZcztVO2dITeQkW7vlZQCx4oGivYuplQHBCw6Waq3LfT7F2ct4EOVnayP1mTnhpqrgn7BHNvjkwG1AzlECQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xR+jn9LgVjajGTlGQs/kjHF7QmDrFNJ9rpKW1ZDeMvI=;
 b=GK+7paZgJDHF8txTqOZmkCGJn0HjJVyiA15C+SWdTN0rJmo6grwY2ZRyDC/j9YYsefNhFFAPv9E33s34UIINKpwIjP24kji5F9CgfuGk6Dyg+HighkNGsPWfg1Nx9YagCL4xhcAJi7cgvXJ4f36ztKLZnZcmY1uu+2qG9+IdWK0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OSZPR01MB9329.jpnprd01.prod.outlook.com (2603:1096:604:1d7::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 04:11:55 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0245.009; Thu, 23 Jul 2026
 04:11:55 +0000
Message-ID: <878q72tkdw.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 2/3] ASoC: meson: gx-card: tidyup not to use card->dev
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
Date: Thu, 23 Jul 2026 04:11:55 +0000
X-ClientProxiedBy: TYCP286CA0342.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38e::8) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OSZPR01MB9329:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ebd62d8-68df-4a5d-d470-08dee870884d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|23010399003|376014|1800799024|366016|38350700014|56012099006|10067099003|11063799006|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	gPE7C3HwuliFxF7buHNGTpwc8VSAwoZ4Mx1HKxscg0SxkvGzsQxkjPCPl9j9AafbXMtysfx2Gbrq6cdVEYCdfyGXPB4wcWVXhYrcxjqnrxOWwQ9IeXMQdoqQAPKqkwt2t/7nHjkuEfkUCK6hvfmVEIjt2IcpGBAUrb3+PnfufseZN9aqHbxcaJjvDSx+8jA9dhsqatxgDS+tMOdbK8BM4Cq4m7XGYVnrgkwflF2UIR2nc49wXs72efAuX0hp0xjttgIneMZJ7qDANbQcmby7iT7dcW7LtQXoXmunD2rjSkcpQPsfY4IZvNOGKoFvcnqwCFxbKG0y9CRC0sFebkwpr7MDWhFcuBM8aHoM8qpIwfCsk/zQIbYISljowsey3bPKHh88MDk7Wfkiew/IJfLhyfrl7/dc0z+OpmzAGlmxESkKA+ii01agfuaMfAwCpCJ2ppqC2907no6nakvmkAxpFT999xn2h2c8pm6RPdltQhf6Jpz0L1i9eQ2bPsQCTjeF1rTRBKdf7tw4lE6Ek5HpgOb7J81SkG5agBXhxK7EaOGrv2UMAWDMnMuj+9ggHMYKrvfPTwRok4VWJa2P1vYZvzSGzdjgj94CUVkkYTj16WXhfhf8kDckQECgiN0v5NKSrQ5d+us0+bCoaIYUY2v0wGyDlR+2ee5tO2to/vpUT2m6sjCqHaECeP5mnJJTKv/kbJL3iT36asO7MdPO8PE5d4qJLijVLF8nl7XaJhtC9Ak=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(23010399003)(376014)(1800799024)(366016)(38350700014)(56012099006)(10067099003)(11063799006)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yYGfv5v+BlEMXMRFHMrScuQuoV1021ppSbmDbyJIy4sivCtyICfowJh6F96z?=
 =?us-ascii?Q?wZWm4eWlcColM6b6gedD2lyw0lBI92dJgnQwqYo4m5z2yX7MqYs4AGWXcpbq?=
 =?us-ascii?Q?IJavwr88tH1JOxSTvicLpJJ+XOsGQJ4yPfOyBjiUGLtoTgkogR3wW7R9/B09?=
 =?us-ascii?Q?drM3POJWWhM/FJtM8hgtEHr4MZnZRtxgfmXaBmKhsZTjdfuO927F9qegEBVz?=
 =?us-ascii?Q?MB2pOyni1Kg1EkpL+N1sz+AhZjc7mY5wmrNISvgsFjAVX8B6dlsuZeiZTpgD?=
 =?us-ascii?Q?W84e2vVqtTLzMm3R9/ygKbOGhVWeYMF4+bHHILzUAirwT16Yq503xNInaqkS?=
 =?us-ascii?Q?vQEraDTgf4mrtum92NIAis24tx963btXm9HnSxNyo2WvhIrlou7pXEPj2Z9g?=
 =?us-ascii?Q?g+GMXovIw7O65ZLEwc2Cj7zKovYZk2/vLYLQnO2qYBMDteaq4B7Tc7lCK6Yz?=
 =?us-ascii?Q?Czxi2eGRaI2VQcOvMcw4+M2BFmTeCEnTHRmZOb6uF75Pvcks6MjPozT5UUiD?=
 =?us-ascii?Q?m8VzYcKkbY1DjI7m3xrU2xt/l5Kj8mflN2zkpeXQLeVHzjVd79BSjO60OF9i?=
 =?us-ascii?Q?Pro06KziDAYu02DGlYlVYLlS+pJrIfhXbpvIWZClZeGjo9yT6IrvKL8GR5Dx?=
 =?us-ascii?Q?O+S1kc/T3CcV/8H+49TDeONpPFDKIcUCAKPtYpGoofMHQogP1yWPjnMJoL8J?=
 =?us-ascii?Q?brGJ11m8FAitOOeFRXc8RDxsou8albZdcQDWc2mDpp3jTP2lYQu5V2xTUjMU?=
 =?us-ascii?Q?Ov4JB/G5iRAIcHWDzAN8DR7N+64AUVfDHzPazPqvDJGxffXOZ/8RQivHPFjT?=
 =?us-ascii?Q?QCGj7V+IAHgficgk4aFIuugIgFX9iA8SUlFFEfWZvRG9IA2TL3r5wBHNH12c?=
 =?us-ascii?Q?ScH1xjXeNA76xoEDwQhNChkam4RxvlbYQyFoJew5MfozVqNpn/zIorj3PjI6?=
 =?us-ascii?Q?5jBf3t/qrx4uyVLSH1rsnkyMDo8GK3aA+ucxv/Hp6Jiloohb0WklZ8I4iXTM?=
 =?us-ascii?Q?AZ6Wz0jcvY418o+xJkhSenE5Ke26z7WETreCH2qvYhD62kfuu/tYZgJu3F1N?=
 =?us-ascii?Q?QhjOomfuTS/tO6/dOdKIp5YaYIB+DBxkN3LLU8Oj4lm4Ct7+62fZJ3Hv0MmB?=
 =?us-ascii?Q?WhZxWesuTt53Zo3PyO9Tx3Bj4LRnOG8iej8ViUkW8JQviGgyS359stbWGdqg?=
 =?us-ascii?Q?cX/EX74foBVIYTdi/aGWrp8LVRQ9zIlhyZUx48to+rJ61nSi05V643bOTUSv?=
 =?us-ascii?Q?NWcBqGf/rhZT/TCFnjT9ihg0GTv/nxkf6K1ztkYjgOwCMQn84NNnrPbvAY6p?=
 =?us-ascii?Q?DRzSxRXFUCK6EpEg3fOww2JOQqk7JZOLtNWyDJ/RWfbKYud452SYAhbeyVR+?=
 =?us-ascii?Q?MOJti1G8B1OLZB1wQoGmunTufpWTbzsLXy4PG1cqwaD9EjlRwTNBv4iJOyXB?=
 =?us-ascii?Q?D49e45w+zZ47QEijacE+mUOym84UNdOtG5NkL/iqYvVlyqjba0Zx3d2/giT7?=
 =?us-ascii?Q?4zoSraz/XV+J8/Y6qmMBLULzH17nlv4pu2nKfJqWS7aIHp3+J+l8Fkv9VCAO?=
 =?us-ascii?Q?/1VF+Cyn8wcKs6f5HDTxRVo1uFCrKBQpdYHvIB/mtxdjDoWc/6CfDK494KpX?=
 =?us-ascii?Q?6aGhSrRZkp+KjDxyfyaXrTZ5QpZ1jjr9JzqT0WqFgM9Hb/YNrt+bQ79xxH8G?=
 =?us-ascii?Q?TRaNYHJNmFw2xjrD8YWj9kjTDllY7hxHn2IS6Ti56bHHBeHRxg7KlocT4FH2?=
 =?us-ascii?Q?VSu2EaZVRpcvyYI8g+BjPBiIz04F3Dw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ebd62d8-68df-4a5d-d470-08dee870884d
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 04:11:55.5232
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fy505ImqioeghHgZKbeK9M879BvEG4FYOpNAb1ldoxqUpBstsooIzn/TjBp4JrjogR1yPUZEOtjen3btNrBFJSWNFExhr851Y6uiZJuWGJS/fQQJnGb9oidHUCjcYXqI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB9329

struct snd_soc_card will be capsuled soon, its member will not be
able to access from non soc-card.c.

To reduce the difference during conversion, replace dev.

	- card->dev, ...
	+ dev, ...

No functional change, but is preparation for Card capsuling.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/meson/gx-card.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/soc/meson/gx-card.c b/sound/soc/meson/gx-card.c
index b408cc2bbc919..932be0a093063 100644
--- a/sound/soc/meson/gx-card.c
+++ b/sound/soc/meson/gx-card.c
@@ -48,9 +48,10 @@ static int gx_card_parse_i2s(struct snd_soc_card *card,
 	struct meson_card *priv = snd_soc_card_get_drvdata(card);
 	struct snd_soc_dai_link *link = &card->dai_link[*index];
 	struct gx_dai_link_i2s_data *be;
+	struct device *dev = card->dev;
 
 	/* Allocate i2s link parameters */
-	be = devm_kzalloc(card->dev, sizeof(*be), GFP_KERNEL);
+	be = devm_kzalloc(dev, sizeof(*be), GFP_KERNEL);
 	if (!be)
 		return -ENOMEM;
 	priv->link_data[*index] = be;
@@ -81,9 +82,10 @@ static int gx_card_add_link(struct snd_soc_card *card, struct device_node *np,
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

