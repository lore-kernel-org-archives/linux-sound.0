Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013062.outbound.protection.outlook.com [52.101.72.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D9A2242D89;
	Mon, 29 Dec 2025 11:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767007410; cv=fail; b=MpzDOhy7f8XtgY86FKSM7FjXceJ6pXAGMMJ+IV48titQySaF6437Zmn+jLTF1b71gO3XWgQxmvrT1pW3iot/7Mhi+9hNyRRj1g7QNMLQ6oc0eYHvp5GihuK0W1mJ73q6lzZuz1ePhIE0nlLxYTNXZsSmszxktFBJPnExq251kkY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767007410; c=relaxed/simple;
	bh=G5tU8kQCOOTXaTrE9mUwcF4PXlDOoTUnxkSOs42lrdA=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ojmZCKsTzw4OhBUc7fF3+0Vb3BSL15J/goNomIZIrk/wmscdHnkPmsxSMRggnq7IxN95rBQv9IUVvilHcgFZXzmzldXvQ//ih75o4CxSKD78wjqzjJDmatQACRsWXSMj/N/ZdqjT+xAPhHbFZBahOPDPPHrdIIZC1zvwtp4zAD4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=jL2dfKuA; arc=fail smtp.client-ip=52.101.72.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="jL2dfKuA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KlEmDwfx/r/sNePVWJnzPgyCZoXuBBkzLqtG/bgT2pk0imLmjAIWOHmUTNNZNAyL35gEbNkkoNJhDmhbPY1JL7wDSuCyA1i+jSAgVP3dhb6oZ9398LBak3mmXyoU36qkidT96FFKTB0m87E4pZMSKj7eFq7ojT5RGMZYXlp9S/1WEhO8ntuJuIvkFiD+xWDncQGBRSSRBSBUmu53ThnDP0IUWSTqlQItzryoDTL9GgUmaA4bMiC2/Gh4NeOR0lgRskhyqiDwd9SEgTKX7xfMphHKcmOqo8T5LtzBmiCF8+Vit8B30/kpIZouBsNcQ0SSV1469LuyQXcFUjQmI0rsdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x0G9niwkyouZyYIavWRQ8T8uQGPESqPYIXEEjumASGI=;
 b=JZQ+wMPkH/DTQEnRPPFTEmrkkz4+xxnsbJofNNKAxwOW3ZBWEPGG6zReAM+y+dfVxY6hb60DLHVnO545xJLWNkeYLqwdkmf8e/iO87FVhTEINC+w3Au/d51NSwn9KuaSDzEwzL/pwkB/LhR1RVgGJgVCpy2H4Vfu2xqassESauzDGqLxUVBCXBld0pdJKWDXAbhcSdCYdR8loJXv5LntadzMuo+36sBPHfUQIFfFULeJ4ahloSwbxluIU+MEPPyvHqVdpyH2aJ7T4rmPAfC0cG4hpmj3kL8jBzMN6GNI+GxC2eE8xVGaTzy+L6pQ6Z/BiUk1wi0oJyp50GC7EoOkLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x0G9niwkyouZyYIavWRQ8T8uQGPESqPYIXEEjumASGI=;
 b=jL2dfKuALZkEbw2Dc3HVKS++HsqAIBv94AqnU0my7HmrQCMZCrcSaVpuWK0vtBji2NwseU4kCrSPEDDfaR3GxNTlXOtd/jvQtmE15fh+7L/d/z3neO/Lgpql7Jp+9J56Z8jy4TKh33N6atX0cQkSaInPY4rFBKLrhOzRr6bmgO3Vp9H+Xgk3txXtgoBQBfh6Vjk7J9Z+uLyrFTHvxttk0sOvbkC6E3NxVJdsH/Eu0153gKja2g6SloW8ew328HBzYe1h4oxrQoEZwn9xpmU9abl81Kypev8h5m6xS8KmeEq+OjXOiW0PXNGPyYiKAnOmVdrj3cX9q9S1daiL5Ndagg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by DU0PR04MB9694.eurprd04.prod.outlook.com (2603:10a6:10:312::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Mon, 29 Dec
 2025 11:23:21 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b%7]) with mapi id 15.20.9456.013; Mon, 29 Dec 2025
 11:23:21 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: broonie@kernel.org,
	kuninori.morimoto.gx@renesas.com,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 2/2] ASoC: simple-card-utils: Add support of "hp-pin-name-headphone" property
Date: Mon, 29 Dec 2025 19:18:39 +0800
Message-Id: <20251229111839.4009517-3-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20251229111839.4009517-1-shengjiu.wang@nxp.com>
References: <20251229111839.4009517-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0039.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::16) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|DU0PR04MB9694:EE_
X-MS-Office365-Filtering-Correlation-Id: fe4a5461-20de-4d1a-bb3f-08de46ccac06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|19092799006|366016|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gsaNf1dwVaPBWxvBDFOw6+U3Q9WVsiJXnubAMqyuog/marfA397c+jN0zVLM?=
 =?us-ascii?Q?sMA3qxQcR9g0DpNplCawR/LNISVrbx4jXO7y4u/rgATAzRrWSDgWqFppAGmh?=
 =?us-ascii?Q?rt7vwr4pVT+W+Uo/9+pwYW1ir8x0gUF6FtTL7MJ+5H6pDBeLB+c6tJCo5MKP?=
 =?us-ascii?Q?TcEfBnYN6yVe8IXA2QYeuGxMnIWatXdIQ6oCshS34I0tI0pYusERWwN6WvSB?=
 =?us-ascii?Q?j/YiUzk+rpvMVHfmIwbXAXyfpFdkTRY1a3wQERVe3J6R4pCcBW7gMcrfdO8Z?=
 =?us-ascii?Q?NLHp7NzQIu9k4IZYLgM+BVyQlshwO9M4DfiThNaT7Giv3pXmsiaur3VEuJph?=
 =?us-ascii?Q?mY0bvNwC7fXyMc1BRJNfzUsY7igt9kmk+reiqZX7F3TVprzMOFRpGVP3oPRI?=
 =?us-ascii?Q?wr+CqupIkcRgnmj75wVMOseEGoqt3c7XUkTPEKT/x00rWa+kJF7g+YTvlWw1?=
 =?us-ascii?Q?fipR3BmoXNMg8jvTRZH/UybNeGe1nwVf5tCUL2d4WeYh4COvg2aTCuLDOukO?=
 =?us-ascii?Q?dD5c8zkdbDbxX+m2ES2TBQohpePqpuJqaUZpFB8yv7QNNBQdp+gFyc7BGIj6?=
 =?us-ascii?Q?EsCeoaE0TO8S5YeFs+wSM44FwgtH+YQ7St62c1sJ3k3IhBuI57V7uXo5848B?=
 =?us-ascii?Q?zAfGivV1VJF7/WY0dR1966elLXfB7gyT6nUfhmyQmjCbQw+9s8z0wzUTebHd?=
 =?us-ascii?Q?DZw/gMmdf9SKU7PH00yuS7XarGIPgwtA8e8F4x33UPwWPOieqxXxxPEdMcke?=
 =?us-ascii?Q?u7ZyxjmR1hQ8FbH78S00C4UDW53d00cZpdwvTTZYIhzKep07JvNRiMwqAtrV?=
 =?us-ascii?Q?IKk/+iHmwET/1DhpfvlJOZRSYCL871czmd4M3arjml7/tlTSFgJDnPyHIwtS?=
 =?us-ascii?Q?cHYK7L6i2Sgx3aZX/fGHY4r1EiTRh9o/2v+HyqOA/C+RS0JBGzUHioClExmC?=
 =?us-ascii?Q?OhGMGxmpG2Izmgjz5S/xxhEylE/PY0OONKtO3lKFI0KilD7TsnUPWdRcdLBU?=
 =?us-ascii?Q?73JRY4f+JOvamr7DG5VV3DJsh8qx9haqd5cjaBod6tNz2UQbLW5Sz5kXrztR?=
 =?us-ascii?Q?OP+xZAWWUFt6IVxzxxV8hbcXEsxwkqoP/QRKZQAI25aAIyIZjmS/cADSUFZ7?=
 =?us-ascii?Q?jfdDw9liUZtGvjC3WzJD/ZogNugXcSO2WPGFQNLhH2KpKXDQ1E3ALo52iiEG?=
 =?us-ascii?Q?QHqUQORMUZo462wX1wwkND/EX28TCss5iXKnS4FihhWwvCj1boMUq0zDaWpn?=
 =?us-ascii?Q?gdS3JJ+EMVxsHWvoYYquNdz8OhiCxf2yzhB9BUepYgr/3tKOWNk1oZUhQmPT?=
 =?us-ascii?Q?PS+QeM4yIadOHBsFFMwj26L6baybeIIjzT+AeqgOba8s5yLuH2HsWo5sbkh7?=
 =?us-ascii?Q?dTir1sT0NuN04fkpvUmTPVeDX5UYejE8sHUi/mEygAwDP/U5hrSapWwIfMtt?=
 =?us-ascii?Q?0YW0YDrDIXEoI4mWCZUzy8oZ0HQbonmNByLD6i96PhEZtP1cLjt9geVIajMu?=
 =?us-ascii?Q?UG/kn1/fPSz2uNQEoO1XIlyNgtZUMfyT/hS5A/YoTYTB1PIAW50rxbB4dA?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(19092799006)(366016)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hxLP0xQPCgnvbr2ZFwTrU+rEH65A+WfiiPPfLALQC9BWJB4COXO06ASfbpCS?=
 =?us-ascii?Q?w96sJdNINR81BOd6gH9zuL8CijJvKYMqCfozEXqSw9YgI/H1S4vwuWJmPPyq?=
 =?us-ascii?Q?+7u9gWspz3Phc/vX+K1vPjZEWojL1X/gJwgT8jgVJ8Cjg1wFqDsMOh0V6/rn?=
 =?us-ascii?Q?kh4bxxDkzAKtk7S8XojhPgPgv+eMhqs09NAZRw8nlMq07f+psFIfMpXjg9H6?=
 =?us-ascii?Q?+YmwMZb9g+Tq1SAWUuGfzSZxofkSixJ6bZDzM8zbNuupNMox9z/MuG1zdnxW?=
 =?us-ascii?Q?VNGcfCLSnkNI1UgNMk3UtWegembs3kzzN99htQ0m8z2h+LE8W2RrYPEvIT20?=
 =?us-ascii?Q?El0E8ZmSCwh2gD6HGPknkwl9EaLFNHuwIvYskRwH8U87WYt3CF1PLtX+I+bc?=
 =?us-ascii?Q?OWvjNMrJcYc6tGKeiIRTgU20sOjI2mKGWU8Os0kFFZ0aF2B5dbcF27BcPWut?=
 =?us-ascii?Q?JIgqEUfdNHsuCseg8PyVMNaMbVqk5Qw9dNdTRC6I/faY4dmwoa8sRlWzG1/+?=
 =?us-ascii?Q?2PWWQf5OsnQRWfGxqSvyg172i+gGQNpBULAgp0Tf+0L18OeFPFcRYeNMMbOf?=
 =?us-ascii?Q?DII29HWCZqFSZfr+ohucDld7LNPEoc3t2RKoMtiY8QDMzXw4/eTUK/nhj3hO?=
 =?us-ascii?Q?guLivK8YfB1J+dK6gfurhMdkD0DtAAeuXL+pq7pC13+5jMY6QNclVmFEWkoj?=
 =?us-ascii?Q?IwciuJivqbsgbthpvqmjgX83FZcNdphaAt1lF5nMpL8kUN28W3tT1kYrt2gS?=
 =?us-ascii?Q?hUQbCbcVGA7xP9WUduhNq8ao10J4s0sJXoTXW8HGZtk1wtfdCMGLyl9K+66J?=
 =?us-ascii?Q?+XO1Rk05FSYFMlnOIqyGgEPGV9OVMK+fSC5Vl8tKNI8KHwtiRC+g/6/s7ZGB?=
 =?us-ascii?Q?Ql97eDev41b9JWH26f92+BmwHlNsXo6VR5/qH38TkdYifmJpBk2JhgF/vDP7?=
 =?us-ascii?Q?cDOy+3G/8WylrpMIPUEnpIufa45AM2CqtzeU/9kapzQDTnvuLCe9XlI7E5bE?=
 =?us-ascii?Q?WN51Z+55zkA7xwm5w1FvbjK91nYLPWUaRVLxm8Z+9w5mrZ2ZI2qhCl+N94NE?=
 =?us-ascii?Q?Dg9hpIH7q7I8S7m3XmeYiVoAOCdslSUqdLVVMqbuuvJ3pmQIB9gyyhF6bynb?=
 =?us-ascii?Q?1Z9l0UDDU85agbSj4Nw0lVdCfmp5o8Y640eEpD6omeXvA9WJ/KirtbI2ng9r?=
 =?us-ascii?Q?4zIew+6+THJgYT43SmY77Ytd+NjETovQr/ipbo+MHcJYZfHnYcng41k7AcSz?=
 =?us-ascii?Q?N3X/LuZcI44uWntL718VgrbpfErNCNBZecKx9hvpfTAcApz6wM4Nwqg6/Loo?=
 =?us-ascii?Q?X0yAiV3Rsn5323VUencLx5U4/lI6xEt7BD084XNjmzxTkKtQn6ce+LnI06Ak?=
 =?us-ascii?Q?zefm0aqcTp0hMoDeLeHg9LMvAapX3p2Yv8uaOq8ez8urKVAocNInH5Yybu1M?=
 =?us-ascii?Q?zMLs+hB16D899kGA8GL7UCM38YJA1o3G9aYfcy5xdZ7aWEy60MrwEYymjxDI?=
 =?us-ascii?Q?n2bKYRlrWtEs1FA3Ctn5IHd+g2kiC76Hj+3mDX+v/zb+EjYvNAWFxnyuI7Z9?=
 =?us-ascii?Q?qXNEsMBI2NiRsoWEe1+cZgMY7Va0Bxgqd25+iy1aXLiY+eKt66tPnYUIWED4?=
 =?us-ascii?Q?Xp8R15Oo9fVdDAYdD/pP81MUPKmEIiLTDFZHPwDpTwVFV9ReT9x3jnvXbu+e?=
 =?us-ascii?Q?BCRW670kYl6RGCnDpx7c7dbf1IOm/ObbwTJkzL6os2ND5TOQBn1b5W2eA19V?=
 =?us-ascii?Q?8X3YMhpcfg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe4a5461-20de-4d1a-bb3f-08de46ccac06
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2025 11:23:20.9263
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tMU6gdVimC2JEbgfSlFOqjkYOxj3nsLDw1PYepU0PgzV0FIFCdYJajTothrfSBIr8irCBGtJNf+6pO2VxETuCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9694

The 'Headphones Jack' name used in current simple-card and audio-graph
card driver can't be recognized by user space service daemon like
pulseaudio and pipewire, which only recognize the 'Headphone Jack',
so add 'hp-pin-name-headphone' property for this case and it won't block
original use cases for 'Headphones Jack'

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/generic/simple-card-utils.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
index bdc02e85b089..3d2194e23373 100644
--- a/sound/soc/generic/simple-card-utils.c
+++ b/sound/soc/generic/simple-card-utils.c
@@ -779,6 +779,24 @@ int simple_util_parse_pin_switches(struct snd_soc_card *card,
 }
 EXPORT_SYMBOL_GPL(simple_util_parse_pin_switches);
 
+static const char *simple_util_parse_hp_pin_name(struct snd_soc_card *card,
+						 char *prefix, char *pin)
+{
+	struct device_node *node = card->dev->of_node;
+	const char *str = NULL;
+	char prop[128];
+
+	if (!prefix)
+		prefix = "";
+
+	snprintf(prop, sizeof(prop), "%s%s", prefix, "hp-pin-name-headphone");
+
+	if (of_property_present(node, prop))
+		str = "Headphone";
+
+	return pin ? pin : (str ? str : "Headphones");
+}
+
 int simple_util_init_jack(struct snd_soc_card *card,
 			  struct simple_util_jack *sjack,
 			  int is_hp, char *prefix,
@@ -787,7 +805,7 @@ int simple_util_init_jack(struct snd_soc_card *card,
 	struct device *dev = card->dev;
 	struct gpio_desc *desc;
 	char prop[128];
-	char *pin_name;
+	const char *pin_name;
 	char *gpio_name;
 	int mask;
 	int error;
@@ -797,7 +815,7 @@ int simple_util_init_jack(struct snd_soc_card *card,
 
 	if (is_hp) {
 		snprintf(prop, sizeof(prop), "%shp-det", prefix);
-		pin_name	= pin ? pin : "Headphones";
+		pin_name = simple_util_parse_hp_pin_name(card, prefix, pin);
 		gpio_name	= "Headphone detection";
 		mask		= SND_JACK_HEADPHONE;
 	} else {
-- 
2.34.1

