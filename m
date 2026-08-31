Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010059.outbound.protection.outlook.com [52.101.229.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90B713B42F1
	for <linux-sound@vger.kernel.org>; Mon, 31 Aug 2026 06:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788158322; cv=fail; b=J0ImYMES4nov9GGkq/RozxTWXe2Vtgu5BhP4O4iedzdQQgEcCe0C3LKd3BSg7zrx7C6mcQhVCOYOjaglJ1FIYFthvf6PSosrIQ6riYvu670SdYfcuW8JYlGtB17LvydRGbEJR77OxskPqX6L7eB2TzWz0yVAojhm0cqFMe/Gg3A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788158322; c=relaxed/simple;
	bh=//VGudjJIzNewrgZ8CdqqMtavYGIXBg50hpJRJF12mo=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=oqvhBBX8ZzqVpY2eRq7UEuaRBSdTMnjoB4sWtFHj9DbQNnAhDbxgk9Zuosslf8pGdc0a9w0ZcF6908ba3MrsFujHSSF4qGFOorBJLEQGhCI+3D8/D44118KhzmBPk+QiWB7eCIBsU1nzGwhaoQCTrUn1n6w3GpLKl0wMKChG90Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=mgp/hTvW; arc=fail smtp.client-ip=52.101.229.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="mgp/hTvW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gKYQTwx14/wo8X2ahoDDw5/9BcIM+syf3uHq6yeAzBAZ3YyebljmaLE/zshdAMA+V+HiJ3d5/hCDgnHI/ApNDs7ybmHdYteR7qvcq+Qp8pWngrOjFpCp7Oy4E1/FsHqDrjl8L1SiqmM6fE04ULp0klDJmV66MbweIwEIaHJgjsb3Y1gyYqsODkoSm14YIt+0gD9aVczjhokleQRlJak30lgbkipw3XvoOqYJqawa/3nlyOLJWEYJIoji45ENpIHEnUwpEx1xi43NVnDgYrPsElS13vQz7+ZV5xltuhNQCaNI9hb0HouqQ7gVxhcWty2lwsB0Wk4ghCx5xMq0KVLDnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bEcG3RJ0aczWJeZCheHY4YrO22oo7t+pCtxza0COfIk=;
 b=lbjSLDna5IE+pQJjq2obkmamV+OM0q+tK7iZXULRSk+BPVNiZ4s/dkKA6IvaTPYvdhjA79mujLgzUn+SQRh/Mc5Ax397FuivTkLu97e7X7M2hS0vy1jgNM/9Kyzj84hbmL5h8RrayfMiWZNrMW0QlCesJBcLk7S/dbJgBCxtwNBD4AnNazyXKvmnzNZcVKrpI3d/9xN97TTqTh1yZCFsXAOKQrkhAG/hS71vENrclrhn0RqM6GoK1Y05H9rFw87ksNM9fw9Ur80WR8g7vgTvsWK0GT0ZfkGr3jUQ2dLYdgLyrGtShlGh4pfmzw2d/2zof1OQb10eE4Rn+e7UIWY/Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bEcG3RJ0aczWJeZCheHY4YrO22oo7t+pCtxza0COfIk=;
 b=mgp/hTvWPUzHR6LqvSp5QNNjt3MgDY3wjA+sYgTrwphery78PGumoVrWoJBbbS0d51gLCzqhNRo1Ux/KJUZhy+E5RtWqatMNlX6CnVkBIZzepERvr1L2CgGnJpJvgipMNBJplJMUjF/QrKyydCpl/K/ywgS+TWGfdXwUGMqcr2s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10) by TY3PR01MB11005.jpnprd01.prod.outlook.com
 (2603:1096:400:3ad::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 06:38:39 +0000
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b]) by TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b%6]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 06:38:39 +0000
Message-ID: <87o6eissk1.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 10/14] ASoC: soc-dai: move snd_soc_dai_{get/set}_widget() to soc-dai.c
To: Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Vinod Koul <vkoul@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <8733vuu75t.wl-kuninori.morimoto.gx@renesas.com>
References: <8733vuu75t.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 31 Aug 2026 06:38:39 +0000
X-ClientProxiedBy: TYWP286CA0029.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:262::17) To TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB16474:EE_|TY3PR01MB11005:EE_
X-MS-Office365-Filtering-Correlation-Id: 89a7d5c7-706d-4d84-668c-08df072a7de7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|52116014|376014|22082099003|18002099003|56012099006|10067099003|11063799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	ONPup8thfeqxMBwwMknPw7QOq/7tpE6OR+q7Eg3QgQi/8j64XjEPav/VT9FsvDj2A9uNrZ//EXKwd6f03w/dcjZFshOZJ8lz/8PAGXuyArvpZvUmnlEHPhd/m2li4VDGgBDUaT+6FJzoH6gVWKGqEj9mlxsyDaUBfs2WNsmZLg5WxHew4G+36IVlvFnFiuFAavt5MWlu/tdj0FR6/3UIlGgoGhxbUdwjiGfjeZm9GVyLtmZkz73lAtxauiuRGGpctLbvLotWf56uRFNr0u75LiCHprwfTLoRcQohs77naGDiY8jUEsx8rwW07OzQtL3CF+Vy2xz7RFNy7S7IhBMF5ydqyO95//t+4UL1R9ZX/LoFR/eqzXDOL+j+kU3wpzthGc9AOeWoZn1Y+5siwXpDlIAS02HTMlWKT+sazEDVjQ1Mv5VZ/UWTUMucm7pYBktpMdupSztMf/vzyB07jybkCUlrbL4p5qhocMV7Y+BD3cm5QLMUvHfAWAN/rj1xebddX77gbU9tpDR+YeJIrs4Sz3E1wfcm0YmBL1GwGBti9CtI2Sj7OkdMo1y1rlFNLXzfqtgtffCe/gOlXlFD29rft+QAXWt40MVV9tFF4r1TXlvpKSeBBxyJFaf+5DNb8fzwLPhb/lXfI4MZaJK44z7J/exBCPQ9qY1kus/q9LNE5zHC//upLDnyE6UaS99YfOazARELlE/pa9SkVqWblvuWKyj8oVpsDc0BDFqIIMifH3g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB16474.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(52116014)(376014)(22082099003)(18002099003)(56012099006)(10067099003)(11063799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?beGHWjXS6KNTTKZkmkpSruSK/3A3YsIip/1FM0XPomJ1FGNXB4724VmzrS6t?=
 =?us-ascii?Q?MhL+dLYSgjxGAkm3ctq/bvkKCAvzfcPQs8S7TmbJ25Lp+fsNoydhpRf8+SwS?=
 =?us-ascii?Q?R0+KjUPdM7+ZKnTpocijoOlxcwRsoeYMFtKxbMcmVah3aq2ydyzeBJKoi8Oz?=
 =?us-ascii?Q?dWdiNbvOjlI55UobKoipSDwaAWjgZ2QmGWhI0R4jyVL2xOzU2q8ZxBVg7XJz?=
 =?us-ascii?Q?YAQdgdi6JHHXH2Gr3RJmK5LJvYxNHn9rOh9tQH5IX2btY8TDjKmsfGcJ2+3z?=
 =?us-ascii?Q?DRSqMExi1roof3P/UBQxTK9DnaRVjIjcV0js1ArATlhvgofiLT1TRSD/JFBK?=
 =?us-ascii?Q?o6xVSrQct/h64TFv835JUIubaaAh9CKWOqit+I86qmqrtToqW2R714yWUjpM?=
 =?us-ascii?Q?Zzkl8IBYL4hmg2rq62uGeoBvYPtaf8g5834F0qENOt8AzmgYiNTul020Juf4?=
 =?us-ascii?Q?qVcmDowphcjMmAFcbIeAUHZL4ygTaBBAMaRojFPr1JzT7ipM8gojWCLE3aml?=
 =?us-ascii?Q?9DS6XdBkz15og3VEuUE+K6dYm7utt0nKKSCygen7W1s+VgMSCjiCKDBLGanu?=
 =?us-ascii?Q?eGn0TpPFW336rgOETfNSjyWDNfCB8+LU9TVFr2xM/oZxmMaxOPn72IJ8WMFK?=
 =?us-ascii?Q?ab17oIBmfICy2Cz/sQYwbBwPhAg/Ch6qLU/ZAqacTRLM3U72gCgs/iLpkJG5?=
 =?us-ascii?Q?4+vqlvzDu3u1k7WE+qUtY2NZnrkFwg4jwGDZfeu1eVNdDqJjN85vqqKeGjAg?=
 =?us-ascii?Q?49/sG3ZDUVdaFmKJLWmDLRmZML1BM+jRVzulsgDdbAyOpQ/8b4/eHJ7pY29f?=
 =?us-ascii?Q?XvBCsHs0th+VrdsWTKHKS5N6mcSzM6RQbOEv2YSAaTeHNVgaPi81jUz7rtef?=
 =?us-ascii?Q?L/GkR+/mlskK1e1PyVzXKroEOQ0ERagzv6p+xsdzSa0B69qrMp9ZE3iEM6rn?=
 =?us-ascii?Q?7aiJiqa4Oi40mgg+XwgAn8bEBIAVN1Pub+SZorMBOKy1+FPsNU8vE7T7svT9?=
 =?us-ascii?Q?XLNiLc7VJ8N3NlLtM3RtXhVKHwzrGlPeP3RulsgUZu98eE5o7z1tq20VoyCq?=
 =?us-ascii?Q?jpESRoOxr1fmx2ojDF9k4KPpc7z2dSM4ZMbb9fPr1mCZVZHaRRtYVNNgQGwE?=
 =?us-ascii?Q?LCfsvyZnADVoc4YGhxbVYm1/reh+PB6aHlPn6rtBjZ7OD4R7PBP8Ju9nYG7D?=
 =?us-ascii?Q?PZaUU1ffNnUuBUPUOs5e6mw8XjVGz3L0YCuw0TZAvt4EGNXy490/6NaXRNso?=
 =?us-ascii?Q?sXsRaJP3zuMIQ8U7Qd8UTC+0F4Yr7dwMp4pBKF50TyqISWaviYxP+3Hs6w0c?=
 =?us-ascii?Q?6DvIFilIVkfA6YVjM2SOn72Q/r7FFz4eOJ48mii/EJ+3GC+Yuk/IETBTR6uH?=
 =?us-ascii?Q?xWJT2l3rtwCJ3OmUo1Lc16DYkqKs0aEzCHpCAj8d3kvqxsHjyt3Gyf+cJXwW?=
 =?us-ascii?Q?9MQy2GtnkzdozKJgBvYvMaPl5bWK3fHZOiR4SQhEtZ8KZGANnkDCO1CVn1ZF?=
 =?us-ascii?Q?DEE9DAQ3I+WUEVHqFzRgxP/ICiPvO9QIT06uXEIHWgnx1cNlWOC3NoGUZMrd?=
 =?us-ascii?Q?K9XHy77VJwvDvAW+oLULlWmuLMcIDYUOyyRZpp6702mtD+TgogLW0GENqMy6?=
 =?us-ascii?Q?GfBok/Ev6MhYXtWH2JXbZF/SoHQ6e2NIsehLkYOuapwyyoTq6EdEwguNCn4a?=
 =?us-ascii?Q?hHl//mclxY1UMvHykwYQ2FKYMbetdmLIIysiMVjafLzHoQEEDPSANx0TAk+d?=
 =?us-ascii?Q?ZihOUITqOPSTHxuVZMkYZyZgdJeVjd4i8Ul6o4H3r8ETKp1w3BcK?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89a7d5c7-706d-4d84-668c-08df072a7de7
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB16474.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 06:38:39.3382
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4IQvtwvNhx5kf8tvbCjJscISG5u5yJi0oOAlMaPF6R9uQTrldLRpUHxtSMS9z0xak8dyDi6JWcvSMwaKYHvnuwFnaJ7YNZxC16tl1SnMYqp7E+8q/19zxCU8dU6SErf4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11005

DAI parameter will be capsuled soon, will be not enable to access from
soc-dai.h. Move it to soc-dai.c

It renames function name
	snd_soc_dai_get_widget() -> snd_soc_dai_stream_widget_get()
	snd_soc_dai_set_widget() -> snd_soc_dai_stream_widget_set()

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-dai.h | 26 ++++++++++++--------------
 sound/soc/soc-dai.c     | 12 ++++++++++++
 2 files changed, 24 insertions(+), 14 deletions(-)

diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index e52ca6e289cb8..232f43ff71f04 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -505,21 +505,13 @@ snd_soc_dai_pcm_stream_get_s(const struct snd_soc_dai *dai, struct snd_pcm_subst
 	int :				snd_soc_dai_pcm_stream_get_i,	\
 	struct snd_pcm_substream * :	snd_soc_dai_pcm_stream_get_s)(dai, x)
 
-#define snd_soc_dai_get_widget_playback(dai)	snd_soc_dai_get_widget(dai, SNDRV_PCM_STREAM_PLAYBACK)
-#define snd_soc_dai_get_widget_capture(dai)	snd_soc_dai_get_widget(dai, SNDRV_PCM_STREAM_CAPTURE)
-static inline
-struct snd_soc_dapm_widget *snd_soc_dai_get_widget(struct snd_soc_dai *dai, int stream)
-{
-	return dai->stream[stream].widget;
-}
+#define snd_soc_dai_stream_widget_get_playback(dai)	snd_soc_dai_stream_widget_get(dai, SNDRV_PCM_STREAM_PLAYBACK)
+#define snd_soc_dai_stream_widget_get_capture(dai)	snd_soc_dai_stream_widget_get(dai, SNDRV_PCM_STREAM_CAPTURE)
+struct snd_soc_dapm_widget *snd_soc_dai_stream_widget_get(struct snd_soc_dai *dai, int stream);
 
-#define snd_soc_dai_set_widget_playback(dai, widget)	snd_soc_dai_set_widget(dai, SNDRV_PCM_STREAM_PLAYBACK, widget)
-#define snd_soc_dai_set_widget_capture(dai,  widget)	snd_soc_dai_set_widget(dai, SNDRV_PCM_STREAM_CAPTURE,  widget)
-static inline
-void snd_soc_dai_set_widget(struct snd_soc_dai *dai, int stream, struct snd_soc_dapm_widget *widget)
-{
-	dai->stream[stream].widget = widget;
-}
+#define snd_soc_dai_stream_widget_set_playback(dai, widget)	snd_soc_dai_stream_widget_set(dai, SNDRV_PCM_STREAM_PLAYBACK, widget)
+#define snd_soc_dai_stream_widget_set_capture(dai,  widget)	snd_soc_dai_stream_widget_set(dai, SNDRV_PCM_STREAM_CAPTURE,  widget)
+void snd_soc_dai_stream_widget_set(struct snd_soc_dai *dai, int stream, struct snd_soc_dapm_widget *widget);
 
 #define snd_soc_dai_dma_data_get_playback(dai)	snd_soc_dai_dma_data_get(dai, SNDRV_PCM_STREAM_PLAYBACK)
 #define snd_soc_dai_dma_data_get_capture(dai)	snd_soc_dai_dma_data_get(dai, SNDRV_PCM_STREAM_CAPTURE)
@@ -621,5 +613,11 @@ void snd_soc_dai_unregister(struct snd_soc_dai *dai);
 
 /* REMOVE ME */
 #define snd_soc_dai_get_pcm_stream			snd_soc_dai_pcm_stream_get
+#define snd_soc_dai_get_widget_playback(dai)		snd_soc_dai_stream_widget_get(dai, SNDRV_PCM_STREAM_PLAYBACK)
+#define snd_soc_dai_get_widget_capture(dai)		snd_soc_dai_stream_widget_get(dai, SNDRV_PCM_STREAM_CAPTURE)
+#define snd_soc_dai_get_widget				snd_soc_dai_stream_widget_get
+#define snd_soc_dai_set_widget_playback(dai, widget)	snd_soc_dai_stream_widget_set(dai, SNDRV_PCM_STREAM_PLAYBACK, widget)
+#define snd_soc_dai_set_widget_capture(dai,  widget)	snd_soc_dai_stream_widget_set(dai, SNDRV_PCM_STREAM_CAPTURE,  widget)
+#define snd_soc_dai_set_widget				snd_soc_dai_stream_widget_set
 
 #endif
diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
index de3cfdcf2c84e..54d8e0eea7a18 100644
--- a/sound/soc/soc-dai.c
+++ b/sound/soc/soc-dai.c
@@ -1081,6 +1081,18 @@ snd_soc_dai_pcm_stream_get_i(const struct snd_soc_dai *dai, int stream)
 }
 EXPORT_SYMBOL_GPL(snd_soc_dai_pcm_stream_get_i);
 
+struct snd_soc_dapm_widget *snd_soc_dai_stream_widget_get(struct snd_soc_dai *dai, int stream)
+{
+	return dai->stream[stream].widget;
+}
+EXPORT_SYMBOL_GPL(snd_soc_dai_stream_widget_get);
+
+void snd_soc_dai_stream_widget_set(struct snd_soc_dai *dai, int stream, struct snd_soc_dapm_widget *widget)
+{
+	dai->stream[stream].widget = widget;
+}
+EXPORT_SYMBOL_GPL(snd_soc_dai_stream_widget_set);
+
 void snd_soc_dai_unregister(struct snd_soc_dai *dai)
 {
 	lockdep_assert_held(&client_mutex);
-- 
2.53.0

