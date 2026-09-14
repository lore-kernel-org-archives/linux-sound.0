Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010040.outbound.protection.outlook.com [52.101.229.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD383282F21
	for <linux-sound@vger.kernel.org>; Mon, 14 Sep 2026 01:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789350415; cv=fail; b=ed8egYLpv7SBF7wdzY3m8oea21nJNzL8u/eN34CD7pHDc5sX1vtFrujWk8+JEy1eu/ATh8VE7fKkh0j8TMAv/C3qiRNRrz18lru4bqAd4Zo99LoHqLoL5isLYWnEHzSP7tHG1tEQi1cU2eeaOzlJ9vx2AMvENfhYt5EEt0sQuFk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789350415; c=relaxed/simple;
	bh=a2cYIJvilv/LLIm68lzB+W7wt5XQvSTx1LeHCZaY+6w=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=q6cEKUsbp+12qcv+49qOUy+RZiALJvYkD/R4wObpCYszK3792MJXzWrAHHB6+k7TavQZNiiGYkGeMchSBdKZYSfEBYJxHg9nZDLVqPD0jx/clcbL5KALs5mA93/sTkp5x9StoTkRnlC6WeB3HqxALNZAg7/bW2tJBuajOW5iIDc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Svv5IpcI; arc=fail smtp.client-ip=52.101.229.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Svv5IpcI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hS8n4AAOOH2FMv4902J5TvTn3NTLxoo/TkSSWub7ZUmRhvQ2GiGHrRdj62LrJOou/7DCMjqIlZOkioRyoQzPXXNXytKUKg8S4iU9AEJUviKPJWUuUaj+C/KYkg+y3/Tp28Gix5UgoFiHww2lSPnxYNikgrICrL9xIhR+3Ql8HlV/2K9C6Ko5a2O+DL2icBp8fLHj6A5WMX+tOnfXmPP/ik1X2K56nYJ9E1AGbh8QMwmr93dcnn5A3Dr9sax/C+t7ndJPzuiJEib0HLJGp7DEVQLpRdQePz/r5SN6OD/5zsl/PK9PmQF3cPuZbtVJhk9naw/4QId70ZNtz3wXRvNiHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qk3DorwhcKTaX8q3+kPOM65rpbrDP4nnchGqD90pp5A=;
 b=a6E/KkonpOY8+YIQiszU34k3jd5pdTNXQuinUV4dQpqCTHRyYDGg30kFNbqvaS4VGeQZFKsb9gnJz7qqL6vUqricc0dQJTq3YddJGgYVi2w1w1duI230Ka6QkCUTF7el928suzNhwAG4aFPj1l6VpMYaxM4CJf/OpNycNoViNoT55tPRG3mmXIVFVMvjBXYsvhBZxyov5WDlbKwkh9uIO2m6/wKFxyWLAMibcg6e3ReAy17zAH5X83Djn91QABmrVShem6O9sFsGPBlvMECCGj+nRPMGIVb1hdzHjeu5D2Gc+7/shQ8/O+NusZrvTo/Bfc3JZYFUaP7SbVoo9u1UXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qk3DorwhcKTaX8q3+kPOM65rpbrDP4nnchGqD90pp5A=;
 b=Svv5IpcIDeDjgID+PvN0klq8XYO1EJk0VWxbmG4w18cxl5sQrca164VKMw4O6ZMRAcd18NjGdwvkT2jdchSJ5nO0gOV404F5f8i2EmCAmPoDfpAhIptH+53WdxaDEsW9N8eZapbIb14Aeg64UN7gdq1qj6yJ9cLow6NRH+nNmCA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12) by TYWPR01MB7202.jpnprd01.prod.outlook.com
 (2603:1096:400:ec::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 01:46:51 +0000
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45]) by TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45%6]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 01:46:51 +0000
Message-ID: <87ecewli44.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 09/10] ASoC: soc-dai: move snd_soc_dai_active_action() to soc-internal.h
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87qziwliaj.wl-kuninori.morimoto.gx@renesas.com>
References: <87qziwliaj.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 14 Sep 2026 01:46:51 +0000
X-ClientProxiedBy: TY4P286CA0026.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:2b0::11) To TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB14118:EE_|TYWPR01MB7202:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ba3aff6-1486-48fd-b7e6-08df12020c4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|52116014|10067099003|22082099003|18002099003|56012099006|11063799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	Bo8bS2yf9O+XuPdtDbCajvhIlW0zlbBHPGE4dP9P1W1fhHg/RVeAQ2DDFcp4yOJrEQ+p2vc1yzvDQjrced7HRa08XUbrZkqVG3Qieqvb5c6KCMUAZIgoZBQXy5BzIu7kVVzXs0+HkayipywOQoqQGrQi1Xe22aAZXAlMHyoXa0xoK/vfASgDJs2s5ohsWR+YtidlIFc5sapHWpFFApPgYKhhl8RIunapEv99PDKblP7tWxGzJQW1T5SY1APSZ6pcQ32skjbDcvHHhVHMxwzAWxk/PhbuDGpifiNfnzMnA7GDki6XiFmZloSWOn110T+gQtzItiAgyxBGSK5C2yMsInAtYyLTZImJ+GxOq+8Onwk0GhT0/3PpmMQIYun/8ydu7bCWr0GcmQKc2epNKxX+q5fKtVuS/P1sCnV5nN7SjvEAQZynZcmHGIZhA7TsPIh+ZXJjHxKgspezrRn78FSPKM+Hhl09k36hxddk1z32IBoh5bHARdxng8qOKKWZvNbVmBpQcliqzDnJpNTrf2g3skE2h6OMZ9jDsDsr+YqYTdGOgs4B9J/lHxlZn6+YzsVKQqxtvW4ZGjA7ce2XpbJVL3AqBOvEf0DRixgnA4WKi2OQct35g/n82PMQo3v4BxpVIjOM2FwneMPkl09jveKPQHMQDhIo998882PTcQjM/RCgbdr0HdTuoC++z9iHd5OKLVqByUPvfs2rxbnSf+oJNGZ4pgWfizhMIYjE8ejwlVk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB14118.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(52116014)(10067099003)(22082099003)(18002099003)(56012099006)(11063799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?l10j82Za09GvASiEwqaPEqQ1xmGig9hE0PNVXcbouMr4MA4R97j0AXFIdFjQ?=
 =?us-ascii?Q?/EBs/Z10cOoK7AjEX4K03y2445xzNTvKLQ5vq/GKz2bGriNYj/VV5+KeMLIs?=
 =?us-ascii?Q?lO5bbpOvkoN4yCbRDOQmNJFVhY7vbGs3NVP89dUHQQ6Ch+6YeXFCY4LhFbVR?=
 =?us-ascii?Q?TOFn+BkKCbstjQE4/ZCpnRZsK7zHeCiffrFB4hMFB99QazoNcSdS/vXK/Rub?=
 =?us-ascii?Q?HfjXmFgCP5InpLZXpoBpo81QwQ4iXCePHPSpD6BWUE0Xr7zVjM3DDuvRovBk?=
 =?us-ascii?Q?+xSVC9vG2s5vkDFk+cmAi1QgTaTrkFYOJSFAJ5DlzRm7Fu2p8mOd5Gkr3ps6?=
 =?us-ascii?Q?C79f/So7XiuZPWAa+OZ5X8E6UgJKnjI+TFDp8omHoxoKrHJ5IISo+oSgCIEh?=
 =?us-ascii?Q?6QLdBiXg+QnATWKgd7v8FH+2LIlryOQAsLgTZcPPfGgTTHhjPVhEVykAKa+V?=
 =?us-ascii?Q?51OUFbJZ6p/QXO6iuQl9fM3Tz5ZWrXwTznVCmDttHLDHzJmrv59zOwQpM4lb?=
 =?us-ascii?Q?43MyrY/4i6gJrmQK1IZCwiEqoDwGgY1NR1oBA4GNQFtsjwm6ZsXRr3jQXDHR?=
 =?us-ascii?Q?xUME3REx9kskycQ+oZvGy7jRaDFofS7bJoB6YnGxOEVcplMtv0B7tdyOSFmm?=
 =?us-ascii?Q?KQBVPdychbt/yGvpGoYUOyMUkLT3IsVgGuIYXy0FsVo+8N5KpBnQbtKctD8W?=
 =?us-ascii?Q?epHTejSEuIY/z/VB6UbRrEGH14+kAQfWJiCNunhgBZsJc2u8H76SRKcjy4RY?=
 =?us-ascii?Q?MH+Ck5VFJe0L4V1P1BTT6u8PnYIWBYA912LGDAj/XyZJ9TW1FNjpc2LHFevK?=
 =?us-ascii?Q?pHfDJ3wIoICsi2WHloRYZwOS12Gul3Nscp9gPV0J0A4/fM6NVSqJnkck1I26?=
 =?us-ascii?Q?oTRyt41GFTMRUECA/ZWQqi0hUrAgCUi5C+0ljXRqWG6DiIecUh1yQPgiwR2o?=
 =?us-ascii?Q?c6P6mpDtr177jvVZ1EPMEs7O5+9X/nxAasZaMOR5R6HuuoxWTz7tbOPwoWR9?=
 =?us-ascii?Q?OJitV/l3VHh4/P1AWp/xe+JhvGAZ9CnOWToO3TgoTevNNJGwhaNE9Z0/YpZZ?=
 =?us-ascii?Q?6JCfEsZ7LiddkfGQwgUljsdWa3II2TJtYNZP2CFcVZG/R4BRPms6UYVZFXFk?=
 =?us-ascii?Q?Zxnk1cO7KzwcbdKThgbzkb7KPDO+HeH0h7Ru4phWfLsOEJywx/H8kCXZmNfU?=
 =?us-ascii?Q?70sARb9u3cOnwfUIzKqF8C/VhLXvE9ZuYPl/06qz59niGHZKb/r+3OpfQsrU?=
 =?us-ascii?Q?b3Re2nMK9ExEDTHApr0stgJuhx8bVAqfLNIap8I5MQ0vLt7e8dsNHdaFGMZl?=
 =?us-ascii?Q?Eybd4JTk5NhlainFoCvsdck6wZcH7m6xQMn8XRRAl2kUIjzDd335GOpDCM+3?=
 =?us-ascii?Q?I8rk3zaEws4j9NUiyrvIOJv5IFiWoNByva2GW+0V0T1lWBi183KH3/NqWZS7?=
 =?us-ascii?Q?fe0cNUWDACthdRuVtE0811LxwnLCZyuBqLfAdotWevwFffbdvVa0oQqjMGUh?=
 =?us-ascii?Q?SBnb4o5ok1DhHgE/ZSPJg1KSug9/+7ttyXgd1UVqOs1+CrCcjPE/GLsGBvvn?=
 =?us-ascii?Q?XH9vOsRwcgiAonMHC0HODJriJgVDYbIwNZmb+FQjOK4QjFgB0GkBMfKqVNgN?=
 =?us-ascii?Q?3G9gYp/Qsf7YvjzHSztQBkzSVoyGS/iHl9Wc/V/O/m96MNCwSPUwD862GVrL?=
 =?us-ascii?Q?d1IpNBZNmWmqPQp/gtkj5DqxbwzJTVijphT+MCIb1MwYLRAE7r00v8Ai7qwW?=
 =?us-ascii?Q?bD4YrZwbsg9Rs+TkHkyS71eFY8iORNOTs+YuqTXz7IUq2TxgNaB/?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ba3aff6-1486-48fd-b7e6-08df12020c4b
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB14118.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 01:46:51.6575
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gBq3Gfevw4X7k9Hn3suVqzSmi3HhTbwB2LLNpbjKt4xmjO8VTgh0qJ76KhJXuAaIyKv3nUn/WZjrZ+cfLH+mSDnZvzqaPQplx061nQwK1Q6rledAHH0xI28s78qiKii+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB7202

snd_soc_dai_active_action() is used only for ASoC framework. Let's move
it to soc-internal.h.
Now, we have activate/deactivate() macro (A), but it makes grep difficult.
Let's standardize to soc_dai_active_action()

(A)	#define snd_soc_dai_active_activate(...)   snd_soc_dai_active_action(...,  1)
	#define snd_soc_dai_active_deactivate(..)  snd_soc_dai_active_action(..., -1)

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-dai.h  | 3 ---
 sound/soc/soc-dai.c      | 1 -
 sound/soc/soc-dapm.c     | 9 +++++----
 sound/soc/soc-internal.h | 1 +
 4 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index 27a85abcab51f..699c0a2674904 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -232,9 +232,6 @@ void snd_soc_dai_resume(struct snd_soc_dai *dai);
 int snd_soc_dai_compress_new(struct snd_soc_dai *dai, struct snd_soc_pcm_runtime *rtd);
 bool snd_soc_dai_stream_valid(const struct snd_soc_dai *dai, int stream);
 
-#define snd_soc_dai_active_activate(dai, stream)	snd_soc_dai_active_action(dai, stream,  1)
-#define snd_soc_dai_active_deactivate(dai, stream)	snd_soc_dai_active_action(dai, stream, -1)
-void snd_soc_dai_active_action(struct snd_soc_dai *dai, int stream, int action);
 int snd_soc_dai_active(const struct snd_soc_dai *dai);
 unsigned int snd_soc_dai_active_stream(const struct snd_soc_dai *dai, int stream);
 
diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
index b8bdbaf200b05..28827523e3622 100644
--- a/sound/soc/soc-dai.c
+++ b/sound/soc/soc-dai.c
@@ -715,7 +715,6 @@ void snd_soc_dai_active_action(struct snd_soc_dai *dai, int stream, int action)
 	/* see snd_soc_component_active() */
 	dai->component->active		+= action;
 }
-EXPORT_SYMBOL_GPL(snd_soc_dai_active_action);
 
 unsigned int snd_soc_dai_active_stream(const struct snd_soc_dai *dai, int stream)
 {
diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index dff23127de429..17e761c911492 100644
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
 
-		snd_soc_dai_active_activate(source, substream->stream);
+		snd_soc_dai_active_action(source, substream->stream, 1);
 	}
 
 	substream->stream = SNDRV_PCM_STREAM_PLAYBACK;
@@ -4021,7 +4022,7 @@ static int dapm_dai_link_event_pre_pmu(struct snd_soc_dapm_widget *w,
 		if (ret < 0)
 			return ret;
 
-		snd_soc_dai_active_activate(sink, substream->stream);
+		snd_soc_dai_active_action(sink, substream->stream, 1);
 	}
 
 	substream->hw_opened = 1;
@@ -4150,14 +4151,14 @@ static int dapm_dai_link_event(struct snd_soc_dapm_widget *w,
 		substream->stream = SNDRV_PCM_STREAM_CAPTURE;
 		snd_soc_dapm_widget_for_each_source_path(w, path) {
 			source = path->source->priv;
-			snd_soc_dai_active_deactivate(source, substream->stream);
+			snd_soc_dai_active_action(source, substream->stream, -1);
 			snd_soc_dai_shutdown(source, substream, 0);
 		}
 
 		substream->stream = SNDRV_PCM_STREAM_PLAYBACK;
 		snd_soc_dapm_widget_for_each_sink_path(w, path) {
 			sink = path->sink->priv;
-			snd_soc_dai_active_deactivate(sink, substream->stream);
+			snd_soc_dai_active_action(sink, substream->stream, -1);
 			snd_soc_dai_shutdown(sink, substream, 0);
 		}
 		break;
diff --git a/sound/soc/soc-internal.h b/sound/soc/soc-internal.h
index 3afc50d5760eb..3f3406a006354 100644
--- a/sound/soc/soc-internal.h
+++ b/sound/soc/soc-internal.h
@@ -32,5 +32,6 @@ void snd_soc_dai_symmetric_set_params(struct snd_soc_dai *dai,
 int snd_soc_dai_symmetric_apply(struct snd_pcm_substream *substream, struct snd_soc_dai *dai);
 int snd_soc_dai_symmetric_params(struct snd_pcm_substream *substream, struct snd_pcm_hw_params *params);
 void snd_soc_dai_symmetric_update(struct snd_pcm_substream *substream);
+void snd_soc_dai_active_action(struct snd_soc_dai *dai, int stream, int action);
 
 #endif /* __SOC_INTERNAL_H */
-- 
2.53.0

