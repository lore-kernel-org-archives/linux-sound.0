Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010025.outbound.protection.outlook.com [52.101.228.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86B803B42F1
	for <linux-sound@vger.kernel.org>; Mon, 31 Aug 2026 06:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788158290; cv=fail; b=V8V9S1tntWGvn1PGtWlpOkL4wLYmbEvs8tjvOsiuITeQh+XInlV+FYyRIJl0q0ihgkPdLt5aC9tSGGYjNzYHiiwljGB/61Hj69rjnMO671ZsQIqGXExcI9oaqbxny5OqPewLJUdlwIW7oa8W0oatiai1GF4tGIP5T3UzcZuS2aY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788158290; c=relaxed/simple;
	bh=SApLdPLL8fXHwuqESDWG50Ag9DfShjLZaRvOxpZRino=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=IscIwk0xzY/uz9WKVzKyHI2GgbBAPnwV/9/3OJQKG/XwszjzNdtUy7rZHd0Natvlqy1/a83jFhY09wF/zYAimC03ANsHvtch2l3Q4e9Ybinq26JN9xhTdhKGRMUlF0nt8uNqqrTo0zbMPjUMxjOeY02a7jvlVOhuJaWbThUEVMw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=PfQBCAV2; arc=fail smtp.client-ip=52.101.228.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="PfQBCAV2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QFrIFMVR4qMAPXih4U1wuHLgijCyFlAkGu5lLEyw+2NeDWTZYOIZKS9Ir4dZ1wz3+JI14Wrl1QpXVbxNsQKrF9oAbM8VTtYnksR0PJGbtBKluYptruG+qhD6wUgpuQTFdpECV1S4wGtBf5hfRGX+UfL7lvRgBfrr7TNPCPkcFAqYF0T/+3M8bEGPvZVfuHWRW8JiEEo7qZQQ378LJgm1n9/52Y9M5gDr9ZZtrds/gRo79R+tUQPjNx8hcBoThLevWxLClshlpychBBkvUuh4D59ZndKmWgf+KwXFm0SmcC9aBMDuDmBatN03DLFiKDS9G5h/X/JFUGi9ljmGT0afGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xtGx4AZSX+aR4C1Nq6GFfl/E7ESLiZQ6qEC1VlaQ1EQ=;
 b=i7ka0qgY71+RXtDf2L81a4DEDTuHACATUd96LPduXPCYccmGlCGFUlmQ0jNpELJ9CEfkLLajOUakRDaZd0WJOQHPk5lmlx9zmVrYfRI3sqCMS4Iu26+D7ttvRznqMe6tJzuhRPRCZ6OSExmmqsdDQDPQbuOD8Kfk1twV6xHOE9Psvbqve68akI0CbPKlp0AJKStpsAIpk25fKjqnVUCwUh/uvPiRMj3bNT0tW2kWWMs5SMsOe7GEnHv3kV+4aSEVf+C80pticICc9W4LlVAzBlvrpbcnKJmV9Rt+zTKZ/TStSZ41E3vGOyJSvEL7ndCHHZahc786MVKqDyzzBVZI7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xtGx4AZSX+aR4C1Nq6GFfl/E7ESLiZQ6qEC1VlaQ1EQ=;
 b=PfQBCAV2+3SI5ZCs0YfGJkqMYmh9cG0dB7M277BLw8KngszLIi6kKdNL8KpcmJoO2kewdwq1/JzyJ1ateIN1s/w15WOm5jmpVRd+4S19ggl9YDBsYF9VhqT6fm5botEiFr+nrlp+ezUinGtaFczb8wY3R9FhBOKvEKSt53+6CaA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10) by OS7PR01MB17278.jpnprd01.prod.outlook.com
 (2603:1096:604:424::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 06:38:06 +0000
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b]) by TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b%6]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 06:38:06 +0000
Message-ID: <871pbeu75e.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 01/14] ASoC: soc-core: make fmt_{single/multiple}_name() non static
To: Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Vinod Koul <vkoul@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <8733vuu75t.wl-kuninori.morimoto.gx@renesas.com>
References: <8733vuu75t.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 31 Aug 2026 06:38:06 +0000
X-ClientProxiedBy: TYCP286CA0008.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:26c::15) To TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB16474:EE_|OS7PR01MB17278:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d1a3162-df28-4cf2-d7a3-08df072a6a3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|23010399003|366016|38350700014|6133799003|10067099003|56012099006|22082099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	lsajGWaLfGXnntTKMnRzJR3GvsOWyomkjRUGbn6a623qpRcvZPseMdk5TQDx2Xg0L+SQYGPR+SxIi9eGWpx5CoKpaNEcM9CPOSNGl/MNQ6XURNvBWBC9eDq/uwatREPVwDSk1A6Rt+g3e5s8D5AQB9sBWZS8024gZHi5FU4JBLAN75SIz3QEykmq/uV0csANEMLFPaIbtjV9zRnLWf/l54mcVDxipdLseSKRqdMXjyis1ngLPjS92wPkXyvEmQktTYRmguIQwuBBQY0lIJ/0QjnTc7hpNoxcnW2DmE85G8SQApJbrIP5jJWN1AxspQScDjS+25x5K9fs9e2fhiLBD3MWtE4LvfZDyx5N6WTBUREgVzofM3q+MfdHDLVCZYVBNAWrokv3vaymjMZsXITl7M+rB3MLJ8hb7mEWtkGFNC3Hv4kWZad6jJR0F3OuAjc6EzMLC2wxks9/uuaE4Xyl7I+oX3fPxgaiBxDSst/hEbzuwHZV3oG6LaftkueyZg11Hr6PpDtvOLhy/mJqSbdjU+Ekkq0z8c6Pnue+nI8jM9CnMovfflrE4TOcVq6c6YOFmuW9005cUM1c20zCPnJfLhrpGZGdnjFZdiimz9adgpyYl4ce4Az26PO3Qva/+kCUEV1bKhdbryagN+LUtC25VJOGd+MPkm6RD4Qp572cP4zrAjgf9+bpMkYnkWbNRvpNamW54yuvWxzi9XIfxuOSXNlMSMnkDdG/ix5hCwqAkLM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB16474.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(23010399003)(366016)(38350700014)(6133799003)(10067099003)(56012099006)(22082099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?w5EORYjVuNzzqnmxZAK895IO+Lg8niUrNG7JitXEZ+1uNMVxh1fJyv8UF+ny?=
 =?us-ascii?Q?K5YMrL8DNeBHURxCkf6eKFVHCb/wlYQsR2KxqzFYzdZpHTGq26gFeO4goqON?=
 =?us-ascii?Q?SmbbDLom0nDN8gLjDn6KffMTgOngxvy310T1f8jP4M/FfZGAVjw9njWop1Lo?=
 =?us-ascii?Q?ukWMJ6NFGbdE3Nt7Mvl7i3FTmFdU3LCMgSJP95mIybU22JggpzZBM7UWq9Hq?=
 =?us-ascii?Q?ygaUgV1msYyYxRSsmeEzv0AZdtRzyvB9Nj7wryJwQwysIaRnjCRsLckx+vCE?=
 =?us-ascii?Q?fzJ5dw0IlyT9ua+S++ysZ4SiYX4QCbnEa/JR7CTGJQV3Ng1NIKyW3A0YvP9B?=
 =?us-ascii?Q?6hAA+tqBeEe0PScNRncL/vSpTdqsqX/RZKo4QkKRzWC/bXAoNfIpHHDL7wyy?=
 =?us-ascii?Q?dnSRkF88W8sBtihUW0wF1Z/ikTxO/UZ95v33p44FVerB6hdOUqkiTyj+ZO2v?=
 =?us-ascii?Q?EHnmXwwiIVVYTeRxHlbkHzwnfG5wVpokiUMBeKAHM5VeUGLfkxwb4BNxTY0C?=
 =?us-ascii?Q?iz8t5uZBqm8ON1hyI0Q91IppKwFO735fT+vR+5L83mdCkpw+Bm0ugtuLOV40?=
 =?us-ascii?Q?qPa0szHAVsRI+IQ9hPDSCd/V3yom1LJPZnaBTEFQ1OgfdpQ72uO1CtFzkA3l?=
 =?us-ascii?Q?2IvKj5SppI/nQq+iOlmKbYyWU1eOlDn9HQlo60cVK9Czzxb3if6zNLdIiu8L?=
 =?us-ascii?Q?WMS37lY7SLmYvUFIV4AvwXDnhn9gIEne8yTdOPr+11KA82RMPojrVRF2v+mM?=
 =?us-ascii?Q?K55alppkujpqiH9NA4N4zsHzDS5spuNl1Yg0n2+hmHPyyMVwBiEQ4REd7T8z?=
 =?us-ascii?Q?7CClX2WMDE085OVQguetijAKbVaIxmIAQiz2A/KcVsWDs0t+GO6hSEGbk5NT?=
 =?us-ascii?Q?uHIatgQhki9QFJxfXgngZs8g7wnEM9YF4agmAT6MKTAkvZOGoX3Ws4ihfxq5?=
 =?us-ascii?Q?KOhwscdj0iEvcUBQDs5nzKt9NoU1M1MyYffJQMabh3UQ62uvbEAYvvZg6S3v?=
 =?us-ascii?Q?lKCYh7aXUprHn4zXEaCeFT1IKuiU+Oe4REdZvikRRHwxq/suTqkULEg7Kr+O?=
 =?us-ascii?Q?hF2Ye++EU1P9NCjWcHZOyFIycO4fJuykrJqT3LtBFR6b+B7PjdPl/oW8RZ5Y?=
 =?us-ascii?Q?d76Lbdgmi2ooRnYfFV3FiW4K4eZAj0IYmPNau2ktjX8pVR8Pv5aHsMFc/olY?=
 =?us-ascii?Q?+R7+5IuY2k5p50Z0VIqm5+LbuxGgs7PV3xEVP3y/QIR0uqmSOrYKZ+EsdgJy?=
 =?us-ascii?Q?k1H2MXY1L8pBwEAg8qSK3zqAvZGWvsCcLQtVA2UxGOh3+jnQwmETqgIZQqgc?=
 =?us-ascii?Q?8lv7Ijarz84RfBnNE+g+OawVz+//HZ1k5VHeF9RBOO4LtiLzAP1ebnBQezLU?=
 =?us-ascii?Q?N2L74DlIqyiLkMPSYOBsTvz8baoS0ejPqIBq1Atb+QI6y+l/ZAA3OcrunbCr?=
 =?us-ascii?Q?Ce43qiX2aa2tTcBjuXnP1SjGafnOTl52kzQ2epQtfZD6R6FOTw7RGb2nVNC4?=
 =?us-ascii?Q?yHC/m6fEvIL5s7aM3TqjNiLIFgwo8wSC75JhSjv+srDk2hgpRBwi9J5K6Nho?=
 =?us-ascii?Q?JvtQjpLHh/mqQ4RLuHIlMWyEJwfKLX9t5uCUN9yVQ5byT+yYDmMF3vTrkwbq?=
 =?us-ascii?Q?EmJPDOh9sGcZKXzY+AyyKQSdOGxVTreFdYTSpsseqHmtLyaBzYZs6EdXXSCB?=
 =?us-ascii?Q?qTev42R6rnFfthlsR7ej9mTdeaNmmhwEjVNesktxVVIompiZTNYZbkAw3vMB?=
 =?us-ascii?Q?8ieKsHKwCLLpn6ep4+BLEhOMmYRfOj+OzbsDnLFle3zIqU6LJPm7?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d1a3162-df28-4cf2-d7a3-08df072a6a3d
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB16474.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 06:38:06.3880
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n+ZPXbwoxaW5C40Sl9ec5E/fA36U8VJ+/PCSThh6O6Gqb65cMFiJCIn6sFWTZebvFj56423/ntJsW19ZD13NX8bsyTekIwIJweobXuUdyi5on/bCENjULfTeLCHVRnRu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB17278

DAI/Component will be capsuled soon, but fmt_{single/multiple}_name()
will be used form soc-dai.c / soc-component.c.
Let's makes them to non static function.

ASoC functions / macros are defined at linux/include/sound/xxx.h (A).
ASoC framework and each vender drivers are including it.

Some functions / macros which are only for ASoC framework. It shouldn't
be used from vender drivers. But we can't foce it because sharing same
headers (A).

This patch adds new soc-internal.h (B) which is for ASoC framework
internal use. Since this patch, we can separate global functions (for
vender drivers) and local function (for ASoC framework internal use).

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-core.c     | 12 ++++++------
 sound/soc/soc-internal.h | 22 ++++++++++++++++++++++
 2 files changed, 28 insertions(+), 6 deletions(-)
 create mode 100644 sound/soc/soc-internal.h

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index b9c70268d49fe..d58fd8be03a97 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -41,6 +41,7 @@
 #include <sound/soc-topology.h>
 #include <sound/soc-link.h>
 #include <sound/initval.h>
+#include "soc-internal.h"
 
 #define CREATE_TRACE_POINTS
 #include <trace/events/asoc.h>
@@ -2480,7 +2481,7 @@ EXPORT_SYMBOL_GPL(snd_soc_unregister_card);
  * Simplify DAI link configuration by removing ".-1" from device names
  * and sanitizing names.
  */
-static char *fmt_single_name(struct device *dev, int *id)
+char *snd_soc_fmt_single_name(struct device *dev, int *id)
 {
 	const char *devname = dev_name(dev);
 	char *found, *name;
@@ -2529,8 +2530,7 @@ static char *fmt_single_name(struct device *dev, int *id)
  * Simplify DAI link naming for single devices with multiple DAIs by removing
  * any ".-1" and using the DAI name (instead of device name).
  */
-static inline char *fmt_multiple_name(struct device *dev,
-		struct snd_soc_dai_driver *dai_drv)
+char *snd_soc_fmt_multiple_name(struct device *dev, struct snd_soc_dai_driver *dai_drv)
 {
 	if (dai_drv->name == NULL) {
 		dev_err(dev,
@@ -2586,9 +2586,9 @@ struct snd_soc_dai *snd_soc_register_dai(struct snd_soc_component *component,
 	 */
 	if (legacy_dai_naming &&
 	    (dai_drv->id == 0 || dai_drv->name == NULL)) {
-		dai->name = fmt_single_name(dev, &dai->id);
+		dai->name = snd_soc_fmt_single_name(dev, &dai->id);
 	} else {
-		dai->name = fmt_multiple_name(dev, dai_drv);
+		dai->name = snd_soc_fmt_multiple_name(dev, dai_drv);
 		if (dai_drv->id)
 			dai->id = dai_drv->id;
 		else
@@ -2724,7 +2724,7 @@ static int soc_component_initialize(struct snd_soc_component *component,
 	mutex_init(&component->io_mutex);
 
 	if (!component->name) {
-		component->name = fmt_single_name(dev, NULL);
+		component->name = snd_soc_fmt_single_name(dev, NULL);
 		if (!component->name) {
 			dev_err(dev, "ASoC: Failed to allocate name\n");
 			return -ENOMEM;
diff --git a/sound/soc/soc-internal.h b/sound/soc/soc-internal.h
new file mode 100644
index 0000000000000..6f6a7be0487ab
--- /dev/null
+++ b/sound/soc/soc-internal.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: GPL-2.0-only
+ *
+ * soc-internal.h
+ *
+ * Copyright (c) 2026 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
+ */
+#ifndef __SOC_INTERNAL_H
+#define __SOC_INTERNAL_H
+
+/*
+ * This header is for ALSA SoC Framework internal, not for Vender drivers.
+ * The ALSA SoC functions for Vender drivers are defined in linux/include/sound/xxx.h
+ * as snd_soc_xxx();
+ */
+
+/*
+ * In soc-core
+ */
+char *snd_soc_fmt_single_name(struct device *dev, int *id);
+char *snd_soc_fmt_multiple_name(struct device *dev, struct snd_soc_dai_driver *dai_drv);
+
+#endif /* __SOC_INTERNAL_H */
-- 
2.53.0

