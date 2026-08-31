Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010026.outbound.protection.outlook.com [52.101.228.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 271D634AB00
	for <linux-sound@vger.kernel.org>; Mon, 31 Aug 2026 06:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788158326; cv=fail; b=KVGu0agvkkCpUeOsQZdA2wBgoHQMCdjDBC1FZFGmXYeINqOGmwkdJ5gh5/ddfTwGCISOS9GKpaRc1rlVT8I1ErRdYBauEuheMpjGREISB72FhFXO+UlEJOAJTIc7AxKvzyNDvTlwFX+cXSgm+7IJ01wFsQs7tyK2eGsiTIpnfjE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788158326; c=relaxed/simple;
	bh=ziKaMz4ihBQL2W5UCb8+J8g5dSOwVDvkcZKbq8TZ2lI=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=tLNM2/1vUuoFkDF57Xjx1rjBO2RBQoPBEUVcmJMhXeCpSVpw4MyGnCRzjAXqKDRMPrDpuJeJgJEn8l731p6S0k62jFwHgsFoWnTF1j6KG9rZVVsjMb2pZ4o2LlGuhT3oc6fBHz1TMbEKq8nIZ5rdwg+KZaXrGfKsENuagKAWiDo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=CcTGEVp9; arc=fail smtp.client-ip=52.101.228.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="CcTGEVp9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mn05WfHzl02KuHFLOeRdsJd1okU4D8c4tzI8G4lC6w01r3lTVvxav1x+Ip2Oo5hK8EnjzA0GcZcOctIUkPfiVR9Lh9hmmJ0OgOO3edlXgGhHfJsS6eGcKX5wpB+RRQmoG+LHu0wT/pYwZomjpLNT9VdGfeScln/KG5yTbiKWpMtMdme7o02T1yiGCOVKf0JeYKsHrIcxfodMg6Hqa0i/ptdb7rkbYQXc91rm8zfLr3cbWYuHQciw2f5cZg/B8LTL3oiGIVPg5iB6AFOS9cmOpAKDCuG4+CAPP/bxqW+wVQTKsyCEBqjdJ6fMciOuw6/bJWWSujPZO0CYtl3z40A7VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fm7NJSsad/Fy9NRvC/hTSKtHYJdZAJ6+1OsGbpzcqOU=;
 b=GJa4PxDtrRoM3mLVfWYqHSu3Gp87RrrL8WzPl4+TwSV7Xi9LmgGiVDUOo8eVhHTIrOsHJ9qBygveyONc9ZqOkMwxMWEy4fABgUfd8gVkM+AXDpz5fRyEooAYjU6TXz5MocV0FMizm7o8rXqRHXtZfYw1PxWKhEAxkx59eBhzmviwrIP9Yu86gbiLKOUsQBMwwsg8JApRymHYX1u3YuzFHoRSRqIMwAusVozHsStd1+lVMiLMjNmVQMPdBLJpUWvB2kTpbUGUvSoQR+VCnqjTJiNch5/4EoMksKftHq2QJdxk2FcCWAJWiO+KiXyrpBJeBEl7lHhhxJs2OZTrrXXAcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fm7NJSsad/Fy9NRvC/hTSKtHYJdZAJ6+1OsGbpzcqOU=;
 b=CcTGEVp9sHxLs5gji3HovN6b7e0oKocp0WUtx5/vlvnGL+/T9ISKbYqGKMyqRjEd+zC3EukC8At2xCfCbQ3x8bPusGbt0hStjcgg6UxYljnM9rrS0ceWJ3omxHj92flFAeaYPE3xJsALELEqSpb/mwmYu2q8iGV3LD4ZWtG0qkE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10) by TY3PR01MB11005.jpnprd01.prod.outlook.com
 (2603:1096:400:3ad::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 06:38:43 +0000
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b]) by TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b%6]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 06:38:43 +0000
Message-ID: <87mru2ssjx.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 11/14] ASoC: soc-dai: move snd_soc_dai_dma_data_{get/set}() to soc-dai.c
To: Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Vinod Koul <vkoul@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <8733vuu75t.wl-kuninori.morimoto.gx@renesas.com>
References: <8733vuu75t.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 31 Aug 2026 06:38:42 +0000
X-ClientProxiedBy: TYCPR01CA0160.jpnprd01.prod.outlook.com
 (2603:1096:400:2b1::13) To TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB16474:EE_|TY3PR01MB11005:EE_
X-MS-Office365-Filtering-Correlation-Id: 27c61bf3-b188-441a-f820-08df072a8011
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|52116014|376014|22082099003|18002099003|56012099006|10067099003|11063799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	T1HebWILcFXRnfNc5DXr5TMjvqIfS0PrrzZN58CnTwpZiLyU/EONXKLdlxIoMKrinSWMT/CzA7UEA8LI99RnVMMjUSetWDOBDp7inzBRqs5MJsH37++tBFW6PMV3qyu1kOSxepsAe95b1L037Vw0DxR9UbeJOxN8Y1+CDmS+07AR6wR5HIFDGcIvZMZx4l+q1+VobL+bdvENuOkN7aYmqM0jul3GYuKnsNX7hjzOMKCnZgu9c2lsidOj1ai4wuiQr/OjM8F7Ekmjm/oNJkX8WEsCEX2YjRibUfp/TH0mHESDv9Gw1Kgd+knl0jac57Vhcm0wL4Hk+ianFt+KgtIOGmczeml7OVwZVEf746YyVTtaf84W3BsLS2CgPVn7IZsNr8g4jfqLUYDfzt3mWcOt5WcHPPFNT7EsrS1CT3n1afcpamwMQbkScfI+vryX81W1fAJnuV8Y1+WNVmwfH22UM/F0mIC8Jh6cDsvogX/ocbifxuV6Vx+U74r85iW7nYRidDOZy+Z3HD/58P6ezxBOpZJJApzeldHxnwRW8956Ovzdvb2XLcE8qWMklgFy0FWFArBhx7+VfLdTe8H1M0atE3esuWUHffSnBBVlWz/BhY60l7+PkesCn+/on9CPTnwC+OF9HPs1SBklnplm0R1mxlu9gIjxLKnMD4RMvK1y0aIXD+c9h/pwzyO/2DtHv9gJGEqx7v+OelGLGsFPob7yP1L5lqWv4H4NEKPjbHDZSyI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB16474.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(52116014)(376014)(22082099003)(18002099003)(56012099006)(10067099003)(11063799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?i2W42MfolvgpaJ0DvRLSjMlWO2gUDBDYLAWvjCByiZeklanHf2olZ6+l0cHC?=
 =?us-ascii?Q?f9ShJClOTf9culz2JBKFl6A1DKEUcVD12cONm2OBI/RVi3sspKua3q/+/sB6?=
 =?us-ascii?Q?R/TOO1qYHlYzk0BHvcvLnUmULZuJdofE8lv5r61pU2LD7EdwmiWeBc7qln3e?=
 =?us-ascii?Q?tn/GxM1pSVLcj9P9Ogr7YuRrPnqTAYwBUjcBuLBBRbcNnbggy7yvt7wjbDSg?=
 =?us-ascii?Q?bTf91Ps0u4TwslkBM58KQv2e4Fp6inXg78McCOWrrR4mqBayxySrrzD1rAa8?=
 =?us-ascii?Q?GjaWg+pCMJig3Pk0ZnK4cOMjOKyc5k8eN5BO25DJbCV5R0Cy1tLsxTSN3Fte?=
 =?us-ascii?Q?nO+x+F8+KOMGWUWtWb9E5cOg07WWsJ8jlbSE/sx7EWNoQ1RAqmU3BJPg84iV?=
 =?us-ascii?Q?x+OEXDo0foYdoSx7QJ1ZAu59qmnhCm3CY9dtgfPO9CXbN/vBOBlM6iWzWn+e?=
 =?us-ascii?Q?S2inQahVgHL4dRgzqJmDHFI2YEIMpF+hmU8agkkXw9H6DEIBmBpABmpwKxzX?=
 =?us-ascii?Q?baRfW0Mg7mVyrebkQ+GjtBjLSmsXvIbhxwvNqJoMJEvMzLPjHgg1UFpSyN28?=
 =?us-ascii?Q?dvfhDtn5ROhys+fgVD/X21meL6KsjtWQEQ6YEG9FPeLrP68sBDGF17F//coe?=
 =?us-ascii?Q?x4Tqi/V7dpsaQviZ1OVEX6rjXVbk6KWD3yFQlMK6AtqyfCIhTy1I/LKuwEky?=
 =?us-ascii?Q?VboXBk9cvtBygc8vZg3Oto0VJL5rsScQmmlC+JZ+YBayVVNxeaWw6xp52xOs?=
 =?us-ascii?Q?w6JmDts1rpPeofr3YPl6cL8SFPF4aRF3D9oWx+JEPJnqbBGBb/8mCOTIM8JO?=
 =?us-ascii?Q?wbPsqE7RR+2V3B+9rnBchaYk/i1vo9/5NCghw3r2ppnnOTA7KQSGpJaZ9eti?=
 =?us-ascii?Q?nnT/iiJIh1OV4v2Rm3JDuS16KkNw7CD3P60tC48i12azmVLqwp9Re8AlHaHJ?=
 =?us-ascii?Q?+PjBFCMZSySMc9E5UKRARVPWcddUCymKxzndk02mmAK0A3OW3JUe4AHCkhIb?=
 =?us-ascii?Q?KbFfauWRlk2Y6QK6KJ67xEy8OZkZTTktHuglq7e2oWVxnClLJtUUQNqfepkf?=
 =?us-ascii?Q?DkzBKGwbrjHG+7BMbQ8v22Pi/kK671NISBgc9wnVGEy9aSQJjWDZ9nH/ls35?=
 =?us-ascii?Q?2gu1gh77/BBBZQa7a6bfg85TK5dIH18UFNWPBY6+7gpZZL9gLopJxNQ72DNl?=
 =?us-ascii?Q?fZPJHSeu+Vd3GFUN7MTnM07KI49K7D2T/RMQSGg/GgKnTekGt7Cbhn00c3Fn?=
 =?us-ascii?Q?KouA8Hdr5TlAJvW2PNoFyGq3DLqqEvqNR57zszXPOSQI71zutKf7widFOcvx?=
 =?us-ascii?Q?90CXqL3GEXU93v2AdF0Z45iMcHRa1dw/rNJRp44ze0KVtB0lZoBHxN7wRCxb?=
 =?us-ascii?Q?yWt5WXg9kkl77U9iz0RbfbYrlfOao0p33Z0zChncaFdELHIt4ZtUSWWOqy6j?=
 =?us-ascii?Q?CB4l4lSxrlw0sBzHnRQvyUNvNc9lRQiCQUZQ/QlVu9C/XVhojsLTRQw2H/qa?=
 =?us-ascii?Q?O9BtBwgkq/dimtbNs42hcXxCC5WJK6DIiIEHyYWZNwdtEHaVgfpaTDgnFJF2?=
 =?us-ascii?Q?D88coO5+odPmfLokHbfPQ01UqjyAxU6prFcQS+vkVT7fH3XcP2Vkll6WgqJp?=
 =?us-ascii?Q?4zQTUuemr0Rxxw4PyWN6M1atsvWVm3RMqClU8IHuC1FurUIXBXC4udqFZgms?=
 =?us-ascii?Q?XCmcQq+QB+V7a78+rNy6OrN4WoF/nPCKbIVfk8nhFtbMsP/I5K3Lqcl0tJZt?=
 =?us-ascii?Q?olSSBuLSffgcNV6EfWZ/y4E05TH04wVS8LvOCdJm35FoEFUzzK28?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27c61bf3-b188-441a-f820-08df072a8011
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB16474.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 06:38:42.9884
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: acAv/HxeLe774wGDA72X6LhtjPgPvAxAKaW+fcPwlktFS02o0L6O2/rNorbEcXvF9UUSZQTcbH64pGtHmaavfXdgCay6k5S/ESvKWK1jg/39nfN2s+sPGweQDzocbSFs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11005

DAI parameter will be capsuled soon, will be not enable to access from
soc-dai.h. Move it to soc-dai.c

These macros are very similar. Will be handled by same macro
	snd_soc_dai_dma_data_get() -> snd_soc_dai_stream_dma_data_get()
	snd_soc_dai_dma_data_set() -> snd_soc_dai_stream_dma_data_set()
	snd_soc_dai_get_dma_data() -> snd_soc_dai_stream_dma_data_get()
	snd_soc_dai_set_dma_data() -> snd_soc_dai_stream_dma_data_set()

This macro is not much helps code, will be removed
	snd_soc_dai_init_dma_data()

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-dai.h | 47 ++++++++++++++++++++++++++---------------
 sound/soc/soc-dai.c     | 12 +++++++++++
 2 files changed, 42 insertions(+), 17 deletions(-)

diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index 232f43ff71f04..c75b41b773ba0 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -513,27 +513,27 @@ struct snd_soc_dapm_widget *snd_soc_dai_stream_widget_get(struct snd_soc_dai *da
 #define snd_soc_dai_stream_widget_set_capture(dai,  widget)	snd_soc_dai_stream_widget_set(dai, SNDRV_PCM_STREAM_CAPTURE,  widget)
 void snd_soc_dai_stream_widget_set(struct snd_soc_dai *dai, int stream, struct snd_soc_dapm_widget *widget);
 
-#define snd_soc_dai_dma_data_get_playback(dai)	snd_soc_dai_dma_data_get(dai, SNDRV_PCM_STREAM_PLAYBACK)
-#define snd_soc_dai_dma_data_get_capture(dai)	snd_soc_dai_dma_data_get(dai, SNDRV_PCM_STREAM_CAPTURE)
-#define snd_soc_dai_get_dma_data(dai, ss)	snd_soc_dai_dma_data_get(dai, ss->stream)
-static inline void *snd_soc_dai_dma_data_get(const struct snd_soc_dai *dai, int stream)
+#define snd_soc_dai_stream_dma_data_get_playback(dai)	snd_soc_dai_stream_dma_data_get(dai, SNDRV_PCM_STREAM_PLAYBACK)
+#define snd_soc_dai_stream_dma_data_get_capture(dai)	snd_soc_dai_stream_dma_data_get(dai, SNDRV_PCM_STREAM_CAPTURE)
+void *snd_soc_dai_stream_dma_data_get_i(const struct snd_soc_dai *dai, int stream);
+static inline void *snd_soc_dai_stream_dma_data_get_s(const struct snd_soc_dai *dai, struct snd_pcm_substream *substream)
 {
-	return dai->stream[stream].dma_data;
+	return snd_soc_dai_stream_dma_data_get_i(dai, substream->stream);
 }
-
-#define snd_soc_dai_dma_data_set_playback(dai, data)	snd_soc_dai_dma_data_set(dai, SNDRV_PCM_STREAM_PLAYBACK, data)
-#define snd_soc_dai_dma_data_set_capture(dai,  data)	snd_soc_dai_dma_data_set(dai, SNDRV_PCM_STREAM_CAPTURE,  data)
-#define snd_soc_dai_set_dma_data(dai, ss, data)		snd_soc_dai_dma_data_set(dai, ss->stream, data)
-static inline void snd_soc_dai_dma_data_set(struct snd_soc_dai *dai, int stream, void *data)
-{
-	dai->stream[stream].dma_data = data;
-}
-
-static inline void snd_soc_dai_init_dma_data(struct snd_soc_dai *dai, void *playback, void *capture)
+#define snd_soc_dai_stream_dma_data_get(dai, x) _Generic((x),			\
+	int :				snd_soc_dai_stream_dma_data_get_i,	\
+	struct snd_pcm_substream * :	snd_soc_dai_stream_dma_data_get_s)(dai, x)
+
+#define snd_soc_dai_stream_dma_data_set_playback(dai, data)	snd_soc_dai_stream_dma_data_set(dai, SNDRV_PCM_STREAM_PLAYBACK, data)
+#define snd_soc_dai_stream_dma_data_set_capture(dai,  data)	snd_soc_dai_stream_dma_data_set(dai, SNDRV_PCM_STREAM_CAPTURE,  data)
+void snd_soc_dai_stream_dma_data_set_i(struct snd_soc_dai *dai, int stream, void *data);
+static inline void snd_soc_dai_stream_dma_data_set_s(struct snd_soc_dai *dai, struct snd_pcm_substream *substream, void *data)
 {
-	snd_soc_dai_dma_data_set_playback(dai, playback);
-	snd_soc_dai_dma_data_set_capture(dai,  capture);
+	snd_soc_dai_stream_dma_data_set_i(dai, substream->stream, data);
 }
+#define snd_soc_dai_stream_dma_data_set(dai, x, data) _Generic((x),		\
+	int :				snd_soc_dai_stream_dma_data_set_i,	\
+	struct snd_pcm_substream * :	snd_soc_dai_stream_dma_data_set_s)(dai, x, data)
 
 static inline unsigned int snd_soc_dai_tdm_mask_get(const struct snd_soc_dai *dai,
 						    int stream)
@@ -619,5 +619,18 @@ void snd_soc_dai_unregister(struct snd_soc_dai *dai);
 #define snd_soc_dai_set_widget_playback(dai, widget)	snd_soc_dai_stream_widget_set(dai, SNDRV_PCM_STREAM_PLAYBACK, widget)
 #define snd_soc_dai_set_widget_capture(dai,  widget)	snd_soc_dai_stream_widget_set(dai, SNDRV_PCM_STREAM_CAPTURE,  widget)
 #define snd_soc_dai_set_widget				snd_soc_dai_stream_widget_set
+#define snd_soc_dai_dma_data_get_playback(dai)		snd_soc_dai_stream_dma_data_get(dai, SNDRV_PCM_STREAM_PLAYBACK)
+#define snd_soc_dai_dma_data_get_capture(dai)		snd_soc_dai_stream_dma_data_get(dai, SNDRV_PCM_STREAM_CAPTURE)
+#define snd_soc_dai_get_dma_data			snd_soc_dai_stream_dma_data_get
+#define snd_soc_dai_dma_data_get			snd_soc_dai_stream_dma_data_get
+#define snd_soc_dai_dma_data_set_playback(dai, data)	snd_soc_dai_stream_dma_data_set(dai, SNDRV_PCM_STREAM_PLAYBACK, data)
+#define snd_soc_dai_dma_data_set_capture(dai,  data)	snd_soc_dai_stream_dma_data_set(dai, SNDRV_PCM_STREAM_CAPTURE,  data)
+#define snd_soc_dai_set_dma_data			snd_soc_dai_stream_dma_data_set
+#define snd_soc_dai_dma_data_set			snd_soc_dai_stream_dma_data_set
+static inline void snd_soc_dai_init_dma_data(struct snd_soc_dai *dai, void *playback, void *capture)
+{
+	snd_soc_dai_stream_dma_data_set_playback(dai, playback);
+	snd_soc_dai_stream_dma_data_set_capture(dai,  capture);
+}
 
 #endif
diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
index 54d8e0eea7a18..8e3d8e056a771 100644
--- a/sound/soc/soc-dai.c
+++ b/sound/soc/soc-dai.c
@@ -1093,6 +1093,18 @@ void snd_soc_dai_stream_widget_set(struct snd_soc_dai *dai, int stream, struct s
 }
 EXPORT_SYMBOL_GPL(snd_soc_dai_stream_widget_set);
 
+void *snd_soc_dai_stream_dma_data_get_i(const struct snd_soc_dai *dai, int stream)
+{
+	return dai->stream[stream].dma_data;
+}
+EXPORT_SYMBOL_GPL(snd_soc_dai_stream_dma_data_get_i);
+
+void snd_soc_dai_stream_dma_data_set_i(struct snd_soc_dai *dai, int stream, void *data)
+{
+	dai->stream[stream].dma_data = data;
+}
+EXPORT_SYMBOL_GPL(snd_soc_dai_stream_dma_data_set_i);
+
 void snd_soc_dai_unregister(struct snd_soc_dai *dai)
 {
 	lockdep_assert_held(&client_mutex);
-- 
2.53.0

