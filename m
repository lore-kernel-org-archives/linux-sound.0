Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010017.outbound.protection.outlook.com [52.101.229.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFB933A7F40
	for <linux-sound@vger.kernel.org>; Mon, 31 Aug 2026 06:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788158315; cv=fail; b=eGen5cW/dS5ttVUHJz//s3d74+jeQEGZx0xj+h/bMhKLlAubcKk8PAzJ1AFbSotC8kYPoAnDLQz3JBpxgO/9M45grDcrS7uoCSBew+kueCsF0sJvzmJ3gWc+7u7fbL3ZwM2IjGzIXhV2ruF7xugZGXVMpyN+nlPAkvzGH5z3yS4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788158315; c=relaxed/simple;
	bh=Q/Oj9qTak2MEWNQs29Z1LxKT0dw8zftuAVVc5qXxQWs=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=XbEbmyyRkC3S72HTq6EZvpqTSCzdsUkEzoTmbTy6q/gcqKYYv3BXP2JEGWnhrcVMga2TzKpOoN7VrJz4c18agTcr6MZfeo3ilWZNKM1o1mEjDSkU3Wp3TBTy1MMzpvqRrLXVW8//BMYJjX8v3UbXKy3vZ2KD0FWHZrV9wwNtr/0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=JtHgufdk; arc=fail smtp.client-ip=52.101.229.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="JtHgufdk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f70cv2XFd925Iz/5wCrLZ+2xbeOAF6O2zqM3detYqgBNOxmZx6YMwcUacDpysyFAYOL0EgceWWu6wgRkPE1UCzIB4Uni6QgP919dcj7FP5CwhoPjVz5CSPjsibnrqjW5cK4il3cYwMqiAqf0BXe6u9ZlCEF1I0j8GO/fBZDcph/KQNMVh4nuS2WGGiSvIEgqCjUSECM7OB1mk3WwYdXx4HeCOIGCSnxGYKOjML69MWYK5NVjiUOs4hRGgji+km8UJMEAjWMcBfhnoRqWRJid/cZh985ayWdlMWLwjk6jObi9CNh8BBn4a+JPGIEfhyla+L0525YrrjztMPyv2fh0Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5ULGp5HAOCjWDa2vJhEPbUYoThjzCqcMF92qp7wvSkE=;
 b=g2m6oSIkEhwoZ/WEBDfp7P4dFxN178EpV9zPyO8BE1SORwQrky2JzA6kPQjCX6BcaBjydkREnLNXgN1zbfTKvFXie/xB+OyOZw+oGIfc7sJj0a8QHCLNFgou21k0xZiqZRCvCB54jWudaBh5PbKpT4xcQXjs+EDm/JFETVl7k0wRsl2LovMiimfwEjE4Y8eYfkJZxFd5jwTAWYj7kbBKYi6JGT5b8coKAEUw0SttGCoBDVpWnvnFVZEfyT7XlLtE8aKlhw4oa2xep3Z81kZ5RxfTz3QTpmHMDXsFxIsAx9QPPqCuBcJ2UkxtZgcnvg+02k5GXLRt5YRCqxixIt9Iug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5ULGp5HAOCjWDa2vJhEPbUYoThjzCqcMF92qp7wvSkE=;
 b=JtHgufdk+Lu4L4eYhKi+FUWEOeB9N2STIE2rMBLx+GZFaPwshamlyjvgc7XbCAJ+fFKT7YWVE6Oa35VT181wy7332sqHeL8P75o/tO3p6NmxYLmRE5KXV4G1XKHsvSnvCZM/1XC8+0gMQGLWjpSYLuWPWjuDj4bXqKjadTNU//A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10) by TY3PR01MB11005.jpnprd01.prod.outlook.com
 (2603:1096:400:3ad::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 06:38:29 +0000
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b]) by TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b%6]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 06:38:29 +0000
Message-ID: <87se3usska.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 07/14] ASoC: soc-dai: move soc_pcm_set_dai_params()
To: Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Vinod Koul <vkoul@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <8733vuu75t.wl-kuninori.morimoto.gx@renesas.com>
References: <8733vuu75t.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 31 Aug 2026 06:38:29 +0000
X-ClientProxiedBy: TY6P301CA0015.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:3bf::14) To TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB16474:EE_|TY3PR01MB11005:EE_
X-MS-Office365-Filtering-Correlation-Id: 00d431d1-2148-4665-d7c6-08df072a7809
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|52116014|376014|22082099003|18002099003|56012099006|3023799007|10067099003|6133799003|11063799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	IQ6gTDwjbbtz2fssPHfGaJyd5IwhI3+8VWs+k9o2RyxJbNrW7YBH5inAZ66mXnBT6Udyc4cEhmoIQkpzXE9o1tBe03fIlUHx6U3D/3kPFyjmu16COlwaBxtH+XB+AkxMLBGZ4RyWMW/bDQdlqw1+HGhAoyo/H+Kg4K5HtRbXfsQgPoQwnoHtDT4VBHulfnybSmj1/XSFOdmlEH/KDait29wEAEgTxc3FGNkdG0AAMOk9iQnpgmaaQw2M9HTsa2HSVHZf3qGHELJoqR0P57Fh4ga4zwUTtmM5bnptwVLleUF9YH+GCjRzB22c6orKUy+GDnf4DvE8axkyKd1+pJR6oFCmdaHObhZu2ArfpBLLAEqhjTRzuBEFxHRFzY8g6/Rf4XeGyioX5gEocW3MbRAWd6i7FFcAoSEAKSngF9pqqkIRLDFd6Yl68yURVism22RG2jhcmw6jjDDJsfAosm0qVgR8pIVSuUcrFQqKSN8Fgz+PPxXh61bwLN/pBtDE2Iqh6uL46hlaTG9EuLaYtERkgJgvb1aJ4ZI3iNSbEptPSca993zE5KusPBy8/+2zPsI+CvKkL4bhvCb5BdHb0XMdUUpIEHq2tF+YzzuvDhzI5G0XmQuhrLa4rLcP98fBxptNRUsdmN6plFMD2ZmNBgnFErDF9rlzJOLH6C6/woRGxvNTfR2/83Ls+C4oIMdULOiTT6R2iGc3nn+AiDGEV9WDWjW1ZM+9Z0aDl39+Cc7BB5Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB16474.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(52116014)(376014)(22082099003)(18002099003)(56012099006)(3023799007)(10067099003)(6133799003)(11063799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1Q8fBC0IM0yUrgQ0ugWHY1P2s1M10WgOOOSM067e8X41hf0LkIKCbggTQ4+9?=
 =?us-ascii?Q?b/Q/Fx0LbE+Di26WDUphIGka46B1KxuS4gIXrhlAbWzUIg5he2cbX2hZnNTP?=
 =?us-ascii?Q?88l/WMK8oOjR1LjvT7lu6S4NqFpgGkUknIKzUC8w65f4J/FAOmlqC8Lbi5RU?=
 =?us-ascii?Q?s5LmI6GKPx5SWtvBocCzlD/QegOvQ3PG+08e/5xawiEI2ttsR04+hRZ99Csi?=
 =?us-ascii?Q?RrsKQLzklaXP7aIPdn+xbXRckf+qmPsNOQ//2vH/jOzoNTcKt6ttD880V2U5?=
 =?us-ascii?Q?A1mza+fm+nM0+UHt93NVi0pmelJaeAH4OXgY+hrQDH31YvZTjv7wM35yN+Jp?=
 =?us-ascii?Q?yaLXgMHrr+qDt4fVRQB6t95KKHJrzj2Q35aZdFuKo9pL7glJd0hPdT1GGyHk?=
 =?us-ascii?Q?8s2GJIIyEVDghVZctZ4EpyrVbvWgCbt/cQRoMfxrho166XALPWGANv4eqfKF?=
 =?us-ascii?Q?aBENa2cSDNlW3ko602+WsZwnGqQBPepVa3WwIoCY+Qs9bw71NmaYuNnXoFYV?=
 =?us-ascii?Q?Af/3FBai4g5UTKACGcW/D05VC2wVB+Pw2Xq+LO4Yo87Z3BxE3X2AdE61AmAD?=
 =?us-ascii?Q?UKMR3bBHGWefSS4DWkleUb5QDpjSwbmd2QdRq2pVLGruw8smsN8AQ4ayTrXQ?=
 =?us-ascii?Q?4FQ5BOqkU9m8XiTkpXd8ZjM+LrJqG5rmDEsrfjX91KDACkHkDuo2WL9bncsp?=
 =?us-ascii?Q?PtdnGuoUsyex1EVi2FYg2+5OprkJZ6C7JuIMFZbMLJlbMc6Mz1/M8CZBFHNU?=
 =?us-ascii?Q?w+Y2a7ym6tK20r7ZlbwRvlxtN/p1WBeOPYhAz7qpzH7HCuptq6r/IkqENtyw?=
 =?us-ascii?Q?zOaYgRDU16CkPknLphcZHUCq0tyw6n+muIkYcWTd8kght+YDvLiC4gmmlD37?=
 =?us-ascii?Q?EhUQk7Pid1QLYTuXJ7M0vRhTCsIK3hkQnyyoTKrJf2IdEHDe8fp9LnWdehmy?=
 =?us-ascii?Q?QAuvc4xKDVKsdp+uyPzw2zpLsdZZVxLCFy+OBr/t/iskkdWC/nWryq5DIu4O?=
 =?us-ascii?Q?Qgk5JvYK4Sn62i3Y97pSvhCX3sBahCVJpW/mYSZhmDJ4wCmZGQEkdUlJL9zN?=
 =?us-ascii?Q?QH8sI+UBC8atcbAtg1NzS8PA/TKfwmJ9KmRb3C4pthqc/iqgdVuKhhDWrk0r?=
 =?us-ascii?Q?C0Itp7Fkh2nOqYvs6E2XW43VUGU//8StsikDg1/ogcRy3kvflj9zgkv9T5ue?=
 =?us-ascii?Q?bkXXHFtR5oAuaICgNOXPcKDmEoWb0SW+Fl5fIEOQjlE2I1r06DznaxbXtX+W?=
 =?us-ascii?Q?NgGkovUFMdK/QjLACwxkRm5jeKTG+mA0lGy03ndAiVQrL+eB5QUCsfkO3Aao?=
 =?us-ascii?Q?dtwnDD1+aIVr123SQwiGC+wOAhrPMtRjkvms6Ik2t1hbXtv9I77K12/6Z3L8?=
 =?us-ascii?Q?VKk497fxUueadrvgILe8eaU7QjU2020YbhmMBLziDVm2sBKdVvNR5del9ECR?=
 =?us-ascii?Q?qbgEcvgtO/KSzvUOIaalRQR4o8XIofAMC39mWCe/KCNPP13jvkOxj5SzUyab?=
 =?us-ascii?Q?UEskMRY3hVEKkL6SomLOc1x/hwKqJdwHk1+Jcg1Bxogw3iwtkmYn3lcX98Fu?=
 =?us-ascii?Q?Ro6QJjF/bPDBFabPdLBd44fHiWufV3m1CZHMB46WChZ/U9uGnCrFpmj8RTKs?=
 =?us-ascii?Q?KQUYCdpjGmgy5JP6noLQNt1LrNtDut5ba6Gb9Iw69xxZw6yjKTVLpilQ0Ro5?=
 =?us-ascii?Q?RnyP2jW+0lINwiKg0IrVqpFDRQ3sEQC11y2vfLIzWD8juVbfwqSL+b+V8yjK?=
 =?us-ascii?Q?Vn4XYw+XUjT81TmWo+k0qppY/NgKWCoRr/o4b+xXRx8rp6xl9eFm?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00d431d1-2148-4665-d7c6-08df072a7809
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB16474.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 06:38:29.4778
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pK5WmcEVUt42+PKi1TJb9zfVRQ78NZ4AfBX6yZqREIdk57Vi8ByJDB6LhnmGcA6W0sT9Y5jU+Yy43HgQbE7j5YOHjHicPR2jFGe6p+0D6FnjI7UC7kc2RgEsg+btykXo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11005

soc_pcm_set_dai_params() is DAI related function.
And its parameter will be capsuled soon, will be not enable to access from
soc-pcm.c. Move it to soc-dai.c

It renames function name
-	soc_pcm_set_dai_params()
+	snd_soc_dai_symmetric_set_params()

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc.h      |  3 ---
 sound/soc/soc-compress.c |  5 +++--
 sound/soc/soc-dai.c      | 15 +++++++++++++++
 sound/soc/soc-internal.h |  6 ++++++
 sound/soc/soc-pcm.c      | 25 ++++++-------------------
 5 files changed, 30 insertions(+), 24 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index e49d1573ace55..25fecbe50d99a 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -1392,9 +1392,6 @@ struct snd_soc_dai *snd_soc_find_dai(
 struct snd_soc_dai *snd_soc_find_dai_with_mutex(
 	const struct snd_soc_dai_link_component *dlc);
 
-void soc_pcm_set_dai_params(struct snd_soc_dai *dai,
-			    struct snd_pcm_hw_params *params);
-
 #include <sound/soc-dai.h>
 
 static inline
diff --git a/sound/soc/soc-compress.c b/sound/soc/soc-compress.c
index b8402802ae784..093a70a93d2b1 100644
--- a/sound/soc/soc-compress.c
+++ b/sound/soc/soc-compress.c
@@ -20,6 +20,7 @@
 #include <sound/initval.h>
 #include <sound/soc-dpcm.h>
 #include <sound/soc-link.h>
+#include "soc-internal.h"
 
 static int snd_soc_compr_components_open(struct snd_compr_stream *cstream)
 {
@@ -69,10 +70,10 @@ static int soc_compr_clean(struct snd_compr_stream *cstream, int rollback)
 	snd_soc_dai_digital_mute(codec_dai, 1, stream);
 
 	if (!snd_soc_dai_active(cpu_dai))
-		soc_pcm_set_dai_params(cpu_dai, NULL);
+		snd_soc_dai_symmetric_set_params(cpu_dai, NULL);
 
 	if (!snd_soc_dai_active(codec_dai))
-		soc_pcm_set_dai_params(codec_dai, NULL);
+		snd_soc_dai_symmetric_set_params(codec_dai, NULL);
 
 	snd_soc_link_compr_shutdown(cstream, rollback);
 
diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
index f9bb4fa356d74..b8b70c5330708 100644
--- a/sound/soc/soc-dai.c
+++ b/sound/soc/soc-dai.c
@@ -6,6 +6,7 @@
 // Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
 //
 
+#include <sound/pcm_params.h>
 #include <sound/soc.h>
 #include <sound/soc-dai.h>
 #include <sound/soc-link.h>
@@ -1139,3 +1140,17 @@ struct snd_soc_dai *snd_soc_dai_register(struct snd_soc_component *component,
 	return dai;
 }
 EXPORT_SYMBOL_GPL(snd_soc_dai_register);
+
+void snd_soc_dai_symmetric_set_params(struct snd_soc_dai *dai,
+				      struct snd_pcm_hw_params *params)
+{
+	if (params) {
+		dai->symmetric_rate	   = params_rate(params);
+		dai->symmetric_channels	   = params_channels(params);
+		dai->symmetric_sample_bits = snd_pcm_format_physical_width(params_format(params));
+	} else {
+		dai->symmetric_rate	   = 0;
+		dai->symmetric_channels	   = 0;
+		dai->symmetric_sample_bits = 0;
+	}
+}
diff --git a/sound/soc/soc-internal.h b/sound/soc/soc-internal.h
index 1c43a06332c25..ce68402bde52d 100644
--- a/sound/soc/soc-internal.h
+++ b/sound/soc/soc-internal.h
@@ -24,4 +24,10 @@ int snd_soc_add_controls(struct snd_card *card, struct device *dev,
 			 const struct snd_kcontrol_new *controls, int num_controls,
 			 const char *prefix, void *data);
 
+/*
+ * In soc-dai
+ */
+void snd_soc_dai_symmetric_set_params(struct snd_soc_dai *dai,
+				      struct snd_pcm_hw_params *params);
+
 #endif /* __SOC_INTERNAL_H */
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 0e49290a8c903..04d7079c338fb 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -26,6 +26,7 @@
 #include <sound/soc-dpcm.h>
 #include <sound/soc-link.h>
 #include <sound/initval.h>
+#include "soc-internal.h"
 
 
 DEFINE_GUARD(snd_soc_card_mutex, struct snd_soc_card *,
@@ -427,20 +428,6 @@ void dpcm_dapm_stream_event(struct snd_soc_pcm_runtime *fe, int dir, int event)
 	snd_soc_dapm_stream_event(fe, dir, event);
 }
 
-void soc_pcm_set_dai_params(struct snd_soc_dai *dai,
-			    struct snd_pcm_hw_params *params)
-{
-	if (params) {
-		dai->symmetric_rate	   = params_rate(params);
-		dai->symmetric_channels	   = params_channels(params);
-		dai->symmetric_sample_bits = snd_pcm_format_physical_width(params_format(params));
-	} else {
-		dai->symmetric_rate	   = 0;
-		dai->symmetric_channels	   = 0;
-		dai->symmetric_sample_bits = 0;
-	}
-}
-
 static int soc_pcm_apply_symmetry(struct snd_pcm_substream *substream,
 					struct snd_soc_dai *soc_dai)
 {
@@ -589,7 +576,7 @@ static int soc_pcm_params_symmetry(struct snd_pcm_substream *substream,
 	unsigned int symmetry, i;
 
 	d.name = __func__;
-	soc_pcm_set_dai_params(&d, params);
+	snd_soc_dai_symmetric_set_params(&d, params);
 
 #define __soc_pcm_params_symmetry(xxx)					\
 	symmetry = rtd->dai_link->symmetric_##xxx;			\
@@ -879,7 +866,7 @@ static int soc_pcm_clean(struct snd_soc_pcm_runtime *rtd,
 		/* Make sure DAI parameters cleared if the DAI becomes inactive */
 		for_each_rtd_dais(rtd, i, dai) {
 			if (snd_soc_dai_active(dai) == 0)
-				soc_pcm_set_dai_params(dai, NULL);
+				snd_soc_dai_symmetric_set_params(dai, NULL);
 		}
 	}
 
@@ -1135,7 +1122,7 @@ static int soc_pcm_hw_clean(struct snd_soc_pcm_runtime *rtd,
 	/* clear the corresponding DAIs parameters when going to be inactive */
 	for_each_rtd_dais(rtd, i, dai) {
 		if (snd_soc_dai_active(dai) == 1)
-			soc_pcm_set_dai_params(dai, NULL);
+			snd_soc_dai_symmetric_set_params(dai, NULL);
 
 		if (snd_soc_dai_stream_active(dai, substream->stream) == 1) {
 			if (!snd_soc_dai_mute_is_ctrled_at_trigger(dai))
@@ -1237,7 +1224,7 @@ static int __soc_pcm_hw_params(struct snd_pcm_substream *substream,
 		if(ret < 0)
 			goto out;
 
-		soc_pcm_set_dai_params(codec_dai, &tmp_params);
+		snd_soc_dai_symmetric_set_params(codec_dai, &tmp_params);
 		snd_soc_dapm_update_dai(substream, &tmp_params, codec_dai);
 	}
 
@@ -1275,7 +1262,7 @@ static int __soc_pcm_hw_params(struct snd_pcm_substream *substream,
 			goto out;
 
 		/* store the parameters for each DAI */
-		soc_pcm_set_dai_params(cpu_dai, &tmp_params);
+		snd_soc_dai_symmetric_set_params(cpu_dai, &tmp_params);
 		snd_soc_dapm_update_dai(substream, &tmp_params, cpu_dai);
 	}
 
-- 
2.53.0

