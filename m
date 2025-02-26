Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011041.outbound.protection.outlook.com [52.101.125.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA7D419C575
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533984; cv=fail; b=LvUaCwR7BSViiUYqpZrpUm/AwKytWvK5hefJuLj1lsypsCPQ42Fnx2ZDOuukZ+P2UhMvVDF+ikGj0F+dCLPYmu4KutpCcnLHd0HKJbcKhnR6Rv/JtA1VV7850yENOX9YlZEV054z8qzBlUSVN3LqdI20utmxG6ydmtpFzAUIX5k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533984; c=relaxed/simple;
	bh=yRF0k5gVxSyzLU88kcolcOItR2pCAXkbdAJBB/2PNto=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=XcRiHbN0xeYmLPbCp01OQ6SZmxNPVe5edQUR8R1oyCMLgWDuF48HB+wsdqSCsdbItvO9enAjKqNh2QeTibZOw9arlHbvoMBh8iQl/7z3usLNY1yo7pNqqyiOw09zK7f88GlqP7nKCuEHdKvPfIXbjGwMpjW5VkOFxwVl+voioIM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=EpF6IWOx; arc=fail smtp.client-ip=52.101.125.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="EpF6IWOx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tprFLRLcVYUlXowrSLzpJmGW9jb+WNWTESpt31qLw1IAwAmdj19ZJAIldbRkolGtYGwi0qD6GCJ01Cr62oo2X8iIuKS17O3L9Vu6fFL2Olb05vcgheRgrY+tlvR+vQ1VwmklkoHDD+75//m+Nhd6Y4zWsTYGFiN7IATZLIO3XddckOOq7dx5cytZmnlTUH++mH9VHb1XDopkzLbRiNeol00UDGtMgvT7C1M+RKCjNVura8kDHpv9HizQybTDoyUXhRfB/hYV5ADxvyT/nGgrVKD1QizN5J8yoClBUtj/A4OZ4gEpKKj3qx/BBgYYjy3tkAoWU8NiP0OGdgR05pqXjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B2KhaZWZwEGhAqKmIR8MUNl6N4z3Qtu37D5lW0Bcj3g=;
 b=H/0Uvg7nRf+Ix6VLZc8UFLw8KpAEoId/3WJ6dEE92l0dk6F/TEZgNvSVYX84jVOjfAWGEiT9X8PQmFSU7cLs60GemU6m116Sow9NCRmJH6MM9FTanTOGsH/PhQr/wfi0IDMkWpkDexAxXET1Ubh/WBTSLZ+WCfjyK4OjZJ3t8+2GFzRDO+V4cqVcF2COqmuhJjMrUCQEtAGDqLCBJVTyI5ANZGDKPD3LfhsXUsD2sUsTPClKR6igUJXprg8XYomswrqi4MeIuULCOr+StCdg6/OC+hgNo1ULtFAqVB6moJfDbsxBKIu+oIY+3CLvkPJOgaKuiU8ayQ0WRpia/rGceg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B2KhaZWZwEGhAqKmIR8MUNl6N4z3Qtu37D5lW0Bcj3g=;
 b=EpF6IWOxzy/tDEkQPv012wAbJH7FHRtVqDfU3Sly9mjeHnTj3vOrxaqVDDBuKrVOquT8umOTZnrCIPrGVDSag3Ll2tG9wgjnWvYbTwvnGwX1LO1UygKMTReVAoOf7NAcZzqFe0/sSEiwiMj0v8ftJabuAKGqmjrKzj6MJQ33CCE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB8140.jpnprd01.prod.outlook.com
 (2603:1096:604:1a5::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Wed, 26 Feb
 2025 01:39:40 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:39:40 +0000
Message-ID: <87a5a98owz.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 154/157] ASoC: rockchip: rk3399_gru_sound: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:39:40 +0000
X-ClientProxiedBy: TYCP286CA0221.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c5::7) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB8140:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b0a2c23-9078-4eae-f63a-08dd5606701e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qWxrb5FwbDHzxmlcecyHg92H5x6ysbJe0GnoghoWRXGGd83I0lbyzII0kRcf?=
 =?us-ascii?Q?U6DW8OxnCTZEKyWgRm9BRlqT+jBiMveXTgpMIOFx4HfQM18DorS20vcmL3AW?=
 =?us-ascii?Q?pOqRLtwdE+1DSrGet9glIEihuO2g7iQ5h7hw9raJJ1kHJfd11iNDSjfu285T?=
 =?us-ascii?Q?SJrEUlmoFsVz3eaPwJkKGpoGwTibVjq4DpDk1b2CWtzQ4XqAHbLrHayDNzuF?=
 =?us-ascii?Q?FIanFDUQimKsH7srVYJN7oCVsYLelGbKJm5s2HbILCPfNvT8/U6dGneWkhB+?=
 =?us-ascii?Q?CpJ4F1nUYqtc14/wL5nhTnVyhWVfPCv2is6RUuB5jSN4vtZ13fR2AgtD1HRW?=
 =?us-ascii?Q?rEDQvtLK1mKawGDj1KXujnuUQRBDPjpKVcc2pU0MQZaZtIj/f/sXeipQDXwu?=
 =?us-ascii?Q?hNqwAIqGTzZstIWfA+IEZxGgWk2+qBatpsdS1Q/lM+q8VBQT3ILF+z4YQEBE?=
 =?us-ascii?Q?uF5aFz+rK1yWuGqn3Cf2ydSqReyr5m46NNstTbWGs4EWpWXidJPb5m6XuVM5?=
 =?us-ascii?Q?aNwPgXtt0Re85McrlyyN3G3S3eCTAKIciS9fJh0ULHhYm4i6XUu67BLQhGQ5?=
 =?us-ascii?Q?tPYfxcm/OhR2XKcwJ45R6m5UbpugJ3P0oyAdnPgh2/c9VtGry/G0bLGU9cMu?=
 =?us-ascii?Q?dp6YadS1y4owELQ8yBnok+EhU3yXnv/H4os4RAeV+oWDWwnzxHK4ulAeWVIE?=
 =?us-ascii?Q?t+CZOFR9TjoyDqZC6FI2pWQ/AmgocuoECOY5DlOBDnHeM4s5T/avjVJMYGiN?=
 =?us-ascii?Q?LrBfiz4sU9CNj/OFtJYmnudJn2hgIhu/MmX9zYYdw3OuH6c9U9uGjN02W0/P?=
 =?us-ascii?Q?+OdgWoqs8XipkZmrjzsIw91IMgtyOmVZfS1yKz5bbUf3oLEgkP1YZ6S2fz7u?=
 =?us-ascii?Q?YFbyi81l0R6opa4knm5f797+WI6ZIAFWxEvIwEQamAwpvJuLx8meeUb5FyGG?=
 =?us-ascii?Q?FGUE7r6GTDrE0eRm+0OObeuYHUTA6RXEs/PhXqEIcM/ZRQp7/KS6Dm5R5mxW?=
 =?us-ascii?Q?QgIhB/8khWmT1aQwTSvNY5zv1tfbjVQFWpLHhz9YwWLpDXyMSaVHn6S3P9A5?=
 =?us-ascii?Q?IErakNPLqjomFybWiF9mE+mqhECRXFPgStXqbsFOohriJgehvuy6e1IIIiwx?=
 =?us-ascii?Q?Xyy6sGkP/xuKgyqxBkM7flbuuon7jAKpJcN484ei5Vx8mQ0tgzeFBEa2Uso4?=
 =?us-ascii?Q?WnPb26sXt+d1O4v+E89i4E+kKDL4KL3StBoeCnO00UfKCeqhaNyiMug0WxMH?=
 =?us-ascii?Q?Z+Ac1Q5rX0KCLpCsOvga+iDYDUnzdB24z9XRLhzoQuqFlSxKqGBKy/LO5kZj?=
 =?us-ascii?Q?I7nnu+dGCudNrnVw3tyVZrmU/SywC7vz9zSNTkNAJ56duDuDKkprc61w0yN5?=
 =?us-ascii?Q?BegZq0FjfP85ccBv5kP90rdFOkoBljjdPYoPy4sRkzkKwRsSfqObROJcmbug?=
 =?us-ascii?Q?l4MbeZ6R6Ata5RN3YwEpDfAPn94rw0TF?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VAYuue8cRDixq+2C755dZmI1B1A6IdqLu3U8em3qzFkVI5Ta/1oXXAuXEGRh?=
 =?us-ascii?Q?h7/I0EE10MAAHIZHJfo7+o/XXF2SYi8l8ZribYWRaZP7K02ANfrnLySRX9hU?=
 =?us-ascii?Q?uQLfGFNEmamr/P/UTS8qJZsriHMhce/F20tReajudaPWcVmpjVYGktUHPnOp?=
 =?us-ascii?Q?vSaYhRCCvObezEQO+BHGYnq41BARxse4XPtXwQhfTy2VU33KLEZ9tfsXlBZp?=
 =?us-ascii?Q?9qLqNQ9ZN+xdJOJ12QA0Iwq4SH3EI81KetYxZD/ld06EiVn8fNc/GpY0h/S9?=
 =?us-ascii?Q?dyd4BfjjcWOyZml3wmZB/F2xuC0+sgYguvq490Hr/70fIAcP68Ov2pL6TczJ?=
 =?us-ascii?Q?i2GoKm2akYFZVr9crB5wn7Vo77KAlPoToVL48dmX8zZHKu/mx9dhe+2qSebU?=
 =?us-ascii?Q?3kURewNRyzkJJ6linxrDgCJGhXlP2XcpaZeITYSvv5WVlYJjxR6EvlNjmJjN?=
 =?us-ascii?Q?DkDmTfaL9DzFBFhr8r4VAyvOHE2t6xzQEIT7+sAv2DXpbUQ7fjFUIiVbKhkV?=
 =?us-ascii?Q?/3wsbMpxtlCrULzsdCWc0lqC51VCTgpSKwHRqK/cCRkgWyKXr1R7S4KZyAY9?=
 =?us-ascii?Q?RE/S1/suYuvYdL/B5QtCxbfxwRdVxi5njbqCboUiUpXnSLvdzo9AzNp3fQd0?=
 =?us-ascii?Q?UY8lkw5p8zUdt+bwOKjYkuQsStyADk96dy6iEvmc2oWXIrC5ke1q3QABfzy4?=
 =?us-ascii?Q?EBYEaWU2mghw0uXR5XzrcLfetu9tjF2yMwRK1mN5pv+DLjDRP8WMrbQYSIfE?=
 =?us-ascii?Q?TiTky8OQNuHIGkUiYIanxjk5DJwV/fK4ZoE3rO5FzZodNAFQOMkqn/alE9fd?=
 =?us-ascii?Q?4I5j3QztVjrExHOemtmxQI1ZoY+k8bvYMATRGV/pfZeOcrsKjugWFk6l2w7C?=
 =?us-ascii?Q?+aRKrOjBf94NmIzqol4Kf0sS9/9vIO2dP69vQfIzOV75ISL9RmUCRGxBoQ4K?=
 =?us-ascii?Q?v3qMvWmiRLeCDPwiepeYfyrEzij3KodHWaqqCHa9XpY9I3QKI7XPQ3uOoDam?=
 =?us-ascii?Q?8iAw0gFZZPsadcCNSn8yX/1hbI9UWGA8IDcrCpuY/ekpKI/Bd/PdioVJjy9T?=
 =?us-ascii?Q?KAzGNERBK0o0QpGB9bl3WV00iZxFeGJ6JxedcgFnMyCheBTdligUkW+RGXeU?=
 =?us-ascii?Q?3xIi3cdmVg+/NIIyJGDk6aplemWogQP+1L02PTpY0gxhh6tjNZs6Sh2qXfiN?=
 =?us-ascii?Q?E9Sn54/6Z/YhzheXGd/d/M3NavzuI0a2MWrnsthgbK3sGT/2FNZTHLm5yurV?=
 =?us-ascii?Q?+GtG7A1Y/2yV/rD2RnHRC9jflyO5VGpiwF7joZ9Ipz2JcnVX8gGFgXcMnbgD?=
 =?us-ascii?Q?ptFMqgKabDQ1sJL/u4TWgaBLP2CfXRKiSRi5enZJU68nkq7Mzp/9ZyQQeGs6?=
 =?us-ascii?Q?jxgFNlutPOu6uezS9FU/2vNcf3sq0zy086yuffOQ9i/B4yCyhHNlru8l8QFn?=
 =?us-ascii?Q?JLwl0vVZe6TwUFHkbRMk/aFAGU+cORa+371DZy1IcaR+EjWcNeF0uCn9HEOI?=
 =?us-ascii?Q?exk/FuGOlJzaF0Xp02QG75CM09N9GBHGwzgtnA4W7p24ee379cSwEN2mO39T?=
 =?us-ascii?Q?XMPTJUz4omHBsIld+yKoqQtfWyo8g4YQq72L64e6JKfz8ocGduPytAO/b5Um?=
 =?us-ascii?Q?jYYYSCPjsGDWMjhkIXdEQr8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b0a2c23-9078-4eae-f63a-08dd5606701e
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:39:40.8377
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bqdAoRr0oLqgO7EvfOo8PIl1SpBGG+r01KvJoKrAnERPcuB9YAsld7v8yqgaEcVK/BLVfRtPSp5K/XRCvJSR2Xg9mOz8Tca7OyH7xQnSuMDA/7JcOqltzCQmrX6Zu2tm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8140

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/rockchip/rk3399_gru_sound.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/rockchip/rk3399_gru_sound.c b/sound/soc/rockchip/rk3399_gru_sound.c
index 6c89c7331229..c8137e8883c4 100644
--- a/sound/soc/rockchip/rk3399_gru_sound.c
+++ b/sound/soc/rockchip/rk3399_gru_sound.c
@@ -338,7 +338,7 @@ static const struct snd_soc_dai_link rockchip_dais[] = {
 		.stream_name = "DP PCM",
 		.init = rockchip_sound_cdndp_init,
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
-			SND_SOC_DAIFMT_CBS_CFS,
+			SND_SOC_DAIFMT_CBC_CFC,
 		SND_SOC_DAILINK_REG(cdndp),
 	},
 	[DAILINK_DA7219] = {
@@ -348,7 +348,7 @@ static const struct snd_soc_dai_link rockchip_dais[] = {
 		.ops = &rockchip_sound_da7219_ops,
 		/* set da7219 as slave */
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
-			SND_SOC_DAIFMT_CBS_CFS,
+			SND_SOC_DAIFMT_CBC_CFC,
 		SND_SOC_DAILINK_REG(da7219),
 	},
 	[DAILINK_DMIC] = {
@@ -356,7 +356,7 @@ static const struct snd_soc_dai_link rockchip_dais[] = {
 		.stream_name = "DMIC PCM",
 		.ops = &rockchip_sound_dmic_ops,
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
-			SND_SOC_DAIFMT_CBS_CFS,
+			SND_SOC_DAIFMT_CBC_CFC,
 		SND_SOC_DAILINK_REG(dmic),
 	},
 	[DAILINK_MAX98357A] = {
@@ -365,7 +365,7 @@ static const struct snd_soc_dai_link rockchip_dais[] = {
 		.ops = &rockchip_sound_max98357a_ops,
 		/* set max98357a as slave */
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
-			SND_SOC_DAIFMT_CBS_CFS,
+			SND_SOC_DAIFMT_CBC_CFC,
 		SND_SOC_DAILINK_REG(max98357a),
 	},
 	[DAILINK_RT5514] = {
@@ -374,7 +374,7 @@ static const struct snd_soc_dai_link rockchip_dais[] = {
 		.ops = &rockchip_sound_rt5514_ops,
 		/* set rt5514 as slave */
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
-			SND_SOC_DAIFMT_CBS_CFS,
+			SND_SOC_DAIFMT_CBC_CFC,
 		SND_SOC_DAILINK_REG(rt5514),
 	},
 	/* RT5514 DSP for voice wakeup via spi bus */
-- 
2.43.0

