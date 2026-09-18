Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010039.outbound.protection.outlook.com [52.101.229.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AE172E62A9
	for <linux-sound@vger.kernel.org>; Fri, 18 Sep 2026 01:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789695994; cv=fail; b=N2x8fSLE72VyFijE2kv/ZcTDbEeaAEsjcFhW8L5wAh7UB4+virVNQNPgiosGM2lZiEJayr/Uj47nSEPfML8SfILuDnrQJZKcQGfyYSHFP688AMdeHfO+bgIj6UHbeN+pkfPSdSiWo8BKKc3v+0tHDyBk9Y/r9Bf6AoAHlnp67tw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789695994; c=relaxed/simple;
	bh=4ubMfNbT3sbku4+AyLWqRXyXdxxA3PQpng28PYOd2bg=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=bCLiSBDVLvsAs2dPH47AF9SqLaubo66mTdaW4apYymGYw53JFLt1ImkJnmaM5W0AoxQkdlrfVdZvndt487zPD7LZ5zuCUuG/Pd3TTcSEfMhGLN+SKZlg1wv8nENhnj/Rq05QGnEQRR45QitkVJ7jgRLTuyacZ3wjmDYwIW3pIAg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=IYKuOslx; arc=fail smtp.client-ip=52.101.229.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="IYKuOslx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EH9k9Vhx9p4ykICjcT+6sRzJYhwcnfeHOx0BTi9RPF4yL2w1/OHGB9WBc6IZuFlfFh8+wQk/J3nyrtYFRiOulvZcGKE2JP/Jq6TsRlyMKmCBKQB6Yy/v1ik1BLyzRHVFI1J2LUYQlTBseIRGqUJPj6DGzZuKi8/LqSIl+/wSYsJaDVPfbk5TTt4C/be1U8XBtUAudX+rm+34p3lSNLIumfa2oAane369g4YRADuPfM2GX1I3qmW+0uYHMnJqFgyCRL/179ngB8F5HECVn7R+K4yj7F9L5yjb9zQ22n7RYmTJ5jBUTC59zbVOjwaiWEesrBBMmDDFA7Yh4d6RN9ZEEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t7RrtxEnH9aGIq6KxkEVJl/ig6CpKN2/9cWzVZ4pDcI=;
 b=UfbTuVQ1/Erf7jEmugjPwGvLb2SgwlVVzmLbwdDeVLQmPcLUH7/ykhhtJFgJ3cRAEZklc+Gib033AA/sRXG0er1osdJxTC8vKefV+ZgE8/P6iGH8oMB1dDdRqm/Qd9i1DCWa7tM79mO2xbcViBVkRkDKCt4cer3NP4lJBwcj7b/1x5JqFe5Em0wp0SG5uuxD7y++hqXKWsRNqiLj7ugMT0nSFSV76V4vRwHJyNDMKDkF1azf3fSLfECs8tIcw+2P/fsxrCYP0UNIAp9nd+nWuJ/S0f/R4KhRxC49CzCgtIZFctNyQbP6AlQA3n7oadHHmiSnbeV8XadQKTW2UVoznQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t7RrtxEnH9aGIq6KxkEVJl/ig6CpKN2/9cWzVZ4pDcI=;
 b=IYKuOslxtTfxH7p0hfyzLb523WAlZbqVX37k6fyy+zrqc7b4wrZud/o/0ILxt4x071yUYwFQblXmE2DXc3xUZQkKbx93AqdPah0zHJJ7xoMWD9IDv0x9sYJfQKKKWcpc0KP0XDy5l0s9wwIwA83zstH51buwNaTDuqXQT7eDXXA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12) by TYCPR01MB7459.jpnprd01.prod.outlook.com
 (2603:1096:400:f6::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Fri, 18 Sep
 2026 01:46:18 +0000
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45]) by TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45%6]) with mapi id 15.21.0428.011; Fri, 18 Sep 2026
 01:46:18 +0000
Message-ID: <87cxubjpqu.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 9/9] ASoC: soc-dai: rename snd_soc_dai_action() to snd_soc_dai_active_update()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>, Alvin Sipraga <alvin.sipraga@analog.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87pkybjq02.wl-kuninori.morimoto.gx@renesas.com>
References: <87pkybjq02.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 18 Sep 2026 01:46:17 +0000
X-ClientProxiedBy: TYWP286CA0018.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:178::8) To TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB14118:EE_|TYCPR01MB7459:EE_
X-MS-Office365-Filtering-Correlation-Id: 5162f94a-0f66-404e-fddf-08df1526a1e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|52116014|376014|10067099003|11063799006|22082099003|56012099006|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	jntWE3xWuGGEK/zB1EU80E65ChT90JlfHTR0Cty0JE/La9icmtrsk36FIAd++hOlf4VCNc418VhKpteD+DbQVUvR1jPpHEm2WNxKJ3y2rbJO6lv+IqGtl3nrLW6BR+hg9e6Ywdnqad+MOCxIwihhqrYjyWt+0tJwt6XLvfORtHj7RwmKKhq+gECTfXqpiqtDY/RE07N1Ibb5uL2sY/yr3ZZFCR1BBv1lDegMUzTHFkIDDTf2vlOJEMOi2jtLmL7pvVbIE79Z8EeaPyvFFRinvgxUx2eyQt8WoH/jGqCnUfYCmFVDzJb1raKTpRFsry6KqjHvAhUbcQHbucbwWLZyoeOBcFR+hUem5dtZwwNtehI/246Lab3dLZTZ77jWdYxBuvU063thaaPkbdYLQrtgxIRdcEfLBV30KXOH2flzn8LJeTQE8HYbGyP6eSjYr8Oyh0baDPZX/Qhqvt4iRvnu49nYvipeZOxTdTvgjDfN4C0hki85oexFnwGuIaVmuDnMKYoN8lu295tXldipbIxdkIWpDZdwEFKU48ue7ooAahbM50nTxPLQsLTvKp7Cevgj1+uSq5wNKBHGbLzP2gSmYniFr1mNJkNKl0tlU3V8ig4Bi9ohgym0xuFL87r1jNJZ/i5Wv6Xlc+NxE1lTpnBUEdZ9gmvHDgRzRLE/goLu3A3tPAEREnk6L5LRQ/s2hvB9B1Ic9cEB2912G+HDqcsp22HxqTMLlGuH95VGNSuTdG0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB14118.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(52116014)(376014)(10067099003)(11063799006)(22082099003)(56012099006)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?a8JBCv/4ZIuelcp17lep2iT7SlMtXRaPHnetuXFA7efQttXhRDWqHf8xDl8S?=
 =?us-ascii?Q?OSMfGBWUYOd1ztfRmB/av2BXDxkiHE3O/bKvGn65sesISQ+cQ8bI9gx6KDhm?=
 =?us-ascii?Q?Cx6zFy3Tyh5tYzzef1j7378qvKm1BD/HIzHRGpnw4yQ/+RpFsaDkFxUsl8A3?=
 =?us-ascii?Q?VfZVDO/Zo2nOcEllSR7JN4R7CsapzGurVAwmo8Vh6mqYB4144/7VtEe4rt3w?=
 =?us-ascii?Q?OJjBWS/31RayW/fD+2qMsfdGNVNS+gOr3IAiWJN/SQr42BWmN5p9TxhQVudn?=
 =?us-ascii?Q?YxkeUsDT9Rdhm7ebvZr+Z2XN138ejAa/nrzrYEOVj2YEKNvDt2aWm7tdDDuf?=
 =?us-ascii?Q?M4lnBlg68X6E7voaywvqizd+5NcdNdwSSkGB9OruQRCEVHN2RjOuej9gMl0n?=
 =?us-ascii?Q?4vKejpgLOQYuUXjnh4i7CEQdBPoJmv0w1V75Q33IIHMX4roKkjRqjAWcCrkP?=
 =?us-ascii?Q?dp9P+5sD0ppRUFsJZMJyp53ebt8EaoL6rx4dP2t6PrJgIdW+sWXhPRm0od6Y?=
 =?us-ascii?Q?bLDv7jXrbCSBr8BtVqL4e5XHD5jrr9TasLeh9WsZg3APLQCnQ2TmiW3f+mIV?=
 =?us-ascii?Q?rFa8cVSmCidLBThWTo2GMO//dbbhfKjaE5Uix9KIi2NJVZoyr+mpZ3GMoHxd?=
 =?us-ascii?Q?apqIzl2uz3fMwT9NyRgKe8XFuZWnZzGey0xqtE6usw8xXdB3MrM/H4soBeGk?=
 =?us-ascii?Q?oBjYMszvUG+R2kaTYm44ZWYKKJ9AA+0diGReCv9ONGNSHZfhnqehZdAVtIfy?=
 =?us-ascii?Q?mPhHYGfaQUXB5r298HzPq5GPg66ROwqzrKGeZT37cxA7AV+j5bkclz2BdE3l?=
 =?us-ascii?Q?ASeXeR28jyUXXCGcVhNu4rH8dPaXHWJDKSL5mgZJ3odQxMcwdJagbpXMw1A+?=
 =?us-ascii?Q?dnp9F69roBNEeN+GwGbQT7NRZi5HlLtrncxVRm7kIDlxUftafVucDGC0hJeO?=
 =?us-ascii?Q?M1SClqn5YzHr/pXQZMpBO5G983cc7cV0MtdlSGNiynDaQHiA2kBd1LYi5H2Z?=
 =?us-ascii?Q?tZg4nwhNvb4AUbOQJBiVhv2eSXwte1vKXab48JwEWWJMdrb1w3ultevktPeY?=
 =?us-ascii?Q?7KnjauwyEijYH8DErSOfyhBcXOlmUOKVL8ErLLlxN0wT0snMJAHhnl61tE/p?=
 =?us-ascii?Q?6TY7fWDssFl1KXKHL1bvPIQscYsgBetlfdgvsl8H4oPJQZozy/dL/JYw5fWw?=
 =?us-ascii?Q?v3CYOa/X6TkheEHncnTi1DFOczA88RbVqLiQd9zRg/2L+s0zkSvmOy+axeNt?=
 =?us-ascii?Q?U+gNUFbIKIOZmta3zs8kCzYKjqjC1c+GOieKdACdsYa8jFciSW8aSGZ/NYvk?=
 =?us-ascii?Q?dYJMLOrBIiyna53K4J67Iybd/9uH73z36/zkpz4nPn3sWo2rnPFgWOkB4nTF?=
 =?us-ascii?Q?yp1o3D5FYF09RNK55OmKRkN6qnwr2sNGBbSbFDqTv5KtpiMlocyHqhd3DOeq?=
 =?us-ascii?Q?4MZBxmDe83AaLz5hyNkOaHQRMswprJUFVDyDeI9Kh3GMM2uixc7hST4lbB6r?=
 =?us-ascii?Q?wNBcQ1R0fGgoj5wSFFy/rF/rL0MQ3OJUb3SpiWMkMTKvH9yVU1Ew5H+ytgZN?=
 =?us-ascii?Q?ql1tQC3F/dEWR8kKY5W17WCiw88w28XxC/8EbhQ10BN91vbAO9l5MLF2A9jt?=
 =?us-ascii?Q?wJpg8zNisucTGYeUZJJigcQsWlNa8kRag37WXzVZNwUOfq76GF285/XMFizT?=
 =?us-ascii?Q?RkP4HMnpRZnm8LNgmwsQPrMoPyV3qWrs1mQMoheMvnC7qlm5IjRUwUv+eDaO?=
 =?us-ascii?Q?M1zl8p1G5/AqFr1nBPN2JRlKs3n6oLYhRBTLvEpTo7c3IIJse+S2?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5162f94a-0f66-404e-fddf-08df1526a1e5
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB14118.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 01:46:18.0433
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fpHFyIX9ffo9Dz2PD4yzCl3rlRWc1CrToJ/9VHRyMyvUGWrhJz/+E20duDggR8FvpE9/0sMnP3uEgP0rk9z6RNnFuEaUdRQske/fDS7HrpqZccK9x6P/PvDxZCLLojKn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB7459

We have snd_soc_dai_action() to update .active. and in the same time,
we have snd_soc_dai_active() to get    .active.
They are confusing name. Let's rename _action() to _active_update().

And in the same time, we have snd_soc_dai_action() and has its wrapper
macro _activate/deactivate(). But callers are using both original/wrapper.
Let's remove wrapper to remove confusion.

It is used only from ASoC framework, let's move it to soc-internal.h

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-dai.h  | 13 +------------
 sound/soc/soc-dai.c      |  6 ++----
 sound/soc/soc-dapm.c     |  9 +++++----
 sound/soc/soc-internal.h |  1 +
 sound/soc/soc-pcm.c      |  2 +-
 5 files changed, 10 insertions(+), 21 deletions(-)

diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index be4781b619891..c044909ef10d8 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -231,18 +231,7 @@ void snd_soc_dai_suspend(struct snd_soc_dai *dai);
 void snd_soc_dai_resume(struct snd_soc_dai *dai);
 int snd_soc_dai_compress_new(struct snd_soc_dai *dai, struct snd_soc_pcm_runtime *rtd);
 bool snd_soc_dai_stream_valid(const struct snd_soc_dai *dai, int stream);
-void snd_soc_dai_action(struct snd_soc_dai *dai,
-			int stream, int action);
-static inline void snd_soc_dai_activate(struct snd_soc_dai *dai,
-					int stream)
-{
-	snd_soc_dai_action(dai, stream,  1);
-}
-static inline void snd_soc_dai_deactivate(struct snd_soc_dai *dai,
-					  int stream)
-{
-	snd_soc_dai_action(dai, stream, -1);
-}
+
 int snd_soc_dai_active(const struct snd_soc_dai *dai);
 
 int snd_soc_pcm_dai_probe(struct snd_soc_pcm_runtime *rtd, int order);
diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
index edf7d808e46ea..d124b6afb1b8d 100644
--- a/sound/soc/soc-dai.c
+++ b/sound/soc/soc-dai.c
@@ -707,8 +707,7 @@ bool snd_soc_dai_stream_valid(const struct snd_soc_dai *dai, int dir)
 	return stream->channels_min;
 }
 
-void snd_soc_dai_action(struct snd_soc_dai *dai,
-			int stream, int action)
+void snd_soc_dai_active_update(struct snd_soc_dai *dai, int stream, int action)
 {
 	/* see snd_soc_dai_stream_active() */
 	dai->stream[stream].active	+= action;
@@ -716,7 +715,6 @@ void snd_soc_dai_action(struct snd_soc_dai *dai,
 	/* see snd_soc_component_active() */
 	dai->component->active		+= action;
 }
-EXPORT_SYMBOL_GPL(snd_soc_dai_action);
 
 int snd_soc_dai_active(const struct snd_soc_dai *dai)
 {
@@ -1161,7 +1159,7 @@ EXPORT_SYMBOL_GPL(snd_soc_dai_stream_tdm_mask_set);
 
 unsigned int snd_soc_dai_stream_active(const struct snd_soc_dai *dai, int stream)
 {
-	/* see snd_soc_dai_action() for setup */
+	/* see snd_soc_dai_active_update() for setup */
 	return dai->stream[stream].active;
 }
 EXPORT_SYMBOL_GPL(snd_soc_dai_stream_active);
diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 06b85313af126..74be5e2094933 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -37,6 +37,7 @@
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
 #include <sound/initval.h>
+#include "soc-internal.h"
 
 #include <trace/events/asoc.h>
 
@@ -4010,7 +4011,7 @@ static int dapm_dai_link_event_pre_pmu(struct snd_soc_dapm_widget *w,
 		if (ret < 0)
 			return ret;
 
-		snd_soc_dai_activate(source, substream->stream);
+		snd_soc_dai_active_update(source, substream->stream, 1);
 	}
 
 	substream->stream = SNDRV_PCM_STREAM_PLAYBACK;
@@ -4021,7 +4022,7 @@ static int dapm_dai_link_event_pre_pmu(struct snd_soc_dapm_widget *w,
 		if (ret < 0)
 			return ret;
 
-		snd_soc_dai_activate(sink, substream->stream);
+		snd_soc_dai_active_update(sink, substream->stream, 1);
 	}
 
 	substream->hw_opened = 1;
@@ -4150,14 +4151,14 @@ static int dapm_dai_link_event(struct snd_soc_dapm_widget *w,
 		substream->stream = SNDRV_PCM_STREAM_CAPTURE;
 		snd_soc_dapm_widget_for_each_source_path(w, path) {
 			source = path->source->priv;
-			snd_soc_dai_deactivate(source, substream->stream);
+			snd_soc_dai_active_update(source, substream->stream, -1);
 			snd_soc_dai_shutdown(source, substream, 0);
 		}
 
 		substream->stream = SNDRV_PCM_STREAM_PLAYBACK;
 		snd_soc_dapm_widget_for_each_sink_path(w, path) {
 			sink = path->sink->priv;
-			snd_soc_dai_deactivate(sink, substream->stream);
+			snd_soc_dai_active_update(sink, substream->stream, -1);
 			snd_soc_dai_shutdown(sink, substream, 0);
 		}
 		break;
diff --git a/sound/soc/soc-internal.h b/sound/soc/soc-internal.h
index f350fe5280e38..31559918355f8 100644
--- a/sound/soc/soc-internal.h
+++ b/sound/soc/soc-internal.h
@@ -34,5 +34,6 @@ int snd_soc_dai_symmetric_params(struct snd_pcm_substream *substream, struct snd
 void snd_soc_dai_symmetric_update(struct snd_pcm_substream *substream);
 struct clk *snd_soc_dai_get_bclk(struct snd_soc_dai *dai);
 unsigned int snd_soc_dai_get_bclk_ratio(struct snd_soc_dai *dai);
+void snd_soc_dai_active_update(struct snd_soc_dai *dai, int stream, int action);
 
 #endif /* __SOC_INTERNAL_H */
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index e63b6317f21d2..1ddf199edc93c 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -368,7 +368,7 @@ void snd_soc_runtime_action(struct snd_soc_pcm_runtime *rtd,
 	snd_soc_dpcm_mutex_assert_held(rtd);
 
 	for_each_rtd_dais(rtd, i, dai)
-		snd_soc_dai_action(dai, stream, action);
+		snd_soc_dai_active_update(dai, stream, action);
 
 	/* Increments/Decrements the active count for components without DAIs */
 	for_each_rtd_components(rtd, i, component) {
-- 
2.53.0

