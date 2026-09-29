Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010063.outbound.protection.outlook.com [52.101.228.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 756C0134CF
	for <linux-sound@vger.kernel.org>; Tue, 29 Sep 2026 05:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790659792; cv=fail; b=MNI3TfvXOOSZ6vt/V8AmpOR1w/PzULR8V9yr9Batz2pdjjlCH/F3MhvUe5r+Nzto4RgSLICA6Ei3fpHHpBc/XgBoZ//Nz1fHQwslyFkEaqH+nPXRL2KyC1k16lFkFX6B5ipBxdSEuVovVh33PEvFr9ycDH3U7z0BAd1y8e0q2SA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790659792; c=relaxed/simple;
	bh=aN3DjL3iZ0HukcV3fKcbiE1tVayH4fSIJXBoh2m0/eE=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=F/nPXgddvapWNcGKmPawMy7QJ2BpLDAXfUVEdqY/N8mpbRLrAZgpWHLXlTAqGDDo+PSEuIP65gYmWQeP2/JXDyjiSvLYyYR5SsjvX/wvTMZ9Q2fAodLUzIA8Wzj37KhR+lHWkOeEbv5XZrh5kMVY6gtoJG2KjZ3xdgyGdiBNvg4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=WyfbXmYh; arc=fail smtp.client-ip=52.101.228.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="WyfbXmYh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dAdh0jdP25lNHTK2KghjN2dgiZvvGbC8VqDdLFYVxiuv4mE7q2ujTp6zy7v3IV3mqqgG4XHK3QyHOiFcYJy7xOKF9tlb1lhmixwo0/dFg2Ioqhk5mWEmhA38yW1P4bdB6OrAfI2t8P2X4G12IvHNncIFYdRfshII5Eo2TaKDCiQflwqlp1c0F0xEovyr7kvEdjTOuxRG3k+7CFBd4PZTz9kEuiAfKUWN612+/EUJw8UQqGQncLVKM/wyDjLib5I1Zi/ZVzebtBoOHFXx5hCue8wAgcKCd0t5LZediW6f44b5NvCtaUPZWvgg438wYUXxLvRs0F/gyAyAJJUTSLJV1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YW7EqcfRBRQgbBtQUjEmSkRom+SJxt6u7CQaffk0J6Q=;
 b=yWVbQ8jMwSiNopZX5iO6X7ljsltz22vWnC1Ohl1pYHzygMAoksFOv8U5/3ICysG/aq9ELZ8sh0RRmonSJOLuOs9fz2s8VESb3eLCYy2pPSvvnaFSVk5PoD31TRGSVRW7yxcr0KvYVOZliMKP4gV+UG3Mz6QVFJHf5n91Vio77/Jhgx5LLWa4MtWsCTM7fe13j0pOcRccfybxC54PDNEVmtFcSVNCuprcieG6B0joQDMwH+GdGfdKb6j4FUiXgAvUJqYfJi3VJIkHYjLHzwdj+VcObeqZQ3AqnDzkeHYPwvbVRLYpMUFujqOrIYTq7EoiOxOAZ23BV7ImTgUMsJ7CSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YW7EqcfRBRQgbBtQUjEmSkRom+SJxt6u7CQaffk0J6Q=;
 b=WyfbXmYhca/ZIFOKcSpTGlMluCSZpJNccPCk4aFRFJ9MZULOfkUwNO8JvUBlj+vH7gbgzzE2WH95AgBFg+88JuwHMNmZlw69vXpxLngaRdtMSs0X1lzoLKPM3V72h3waxTF5O1jcEfb+2UvFoOkAkqTlycJZuX4C107AP5mD2GU=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12) by OS3PR01MB8890.jpnprd01.prod.outlook.com
 (2603:1096:604:153::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 05:29:48 +0000
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45]) by TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45%6]) with mapi id 15.21.0451.022; Tue, 29 Sep 2026
 05:29:48 +0000
Message-ID: <87ld8keib8.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 03/14] ASoC: soc-component: move snd_soc_add_component_controls()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87pkxweibu.wl-kuninori.morimoto.gx@renesas.com>
References: <87pkxweibu.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 29 Sep 2026 05:29:48 +0000
X-ClientProxiedBy: TY4P286CA0092.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:369::8) To TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB14118:EE_|OS3PR01MB8890:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f0617b6-407f-4faf-ba55-08df1deaad96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|52116014|376014|366016|38350700014|11063799006|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	rZJObg0m65WGnOe2dsg5WZ8ZvJKbRQPMqpCaGeqXf/EUT4U7Rd+J6hz83ls9Eeug6kUkbCdQfnNF/sifcQPayDk6ORy8TjCSFgqhVxEZs0nOvbdyXXMgJMzHEzAHDcYfudNdIqjPya+Gw349VWmxfqiATQWzcZpMFxtjsRbqobiTNcI84SfTNlITUu599/ntvUsx1NpuR7Bfj9+VxIEWxHs0rv2T27gcib2LbMcS1ZVJGivjH4C8zk+wFLQn35m4/mNEcGRTqve2nd1Cj9uuQ0syhXRU/krRkxDOSzf5/aJFANYUeHAZR58WwUc/wI0mtQrq25oc8v+ywxNR7JybBeCDDvvwH07PbF71ghL9VaK1IQn0UmlTVmx5Xw9HxhxFhYaPOK8GpvJa63oG/MkH2U+jkGletjLMw103w03Xyxtb1I8qoJCmfTt4Ozh1hvHZ6IBsr07EzxQZDuJdvJmwK3DT0coVO3UUo2Xc0KXG6kcIci2MMgbaQVThz0JnZJrlcDZHnPZ5NTcU6KwuogKhGO++DVhZwSCF6bMQnlybFiekFnaoFAq5EyjaSagoCCp9I+xsJEkBaTp3fczp4T+mE2ObJ51lz1OBgxqSDJNbcFfFhupmhHavBD+FOmi4bVCHF5pKtOwmNo7aVbiVZvTUW0aH7Wd36EYOVEfsa+W5m2qi28c7pyr9QX1JajFuTCJiMf5LNTAGZBdvfoYd0if1zzuVyR0uXsR6KRC9Pql7VlA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB14118.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(52116014)(376014)(366016)(38350700014)(11063799006)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UxUrzCh1YToLkJcVJ8XiGx9hFl3ER/3yaWVuYJrrydjyPuGH2NlJZ9d/MQRK?=
 =?us-ascii?Q?6KCaCqbPtWldu2YO9bAR06mQYYX+D8Qu12bhaQxE2Ow+lT0JyM90eSestsY3?=
 =?us-ascii?Q?FlOmFGYdbh0Ye+rxvzxrEFKtQjirsI9rvGawbNhb/UNvZ0ua9T6ty/oVd8qn?=
 =?us-ascii?Q?DPalFDGp37IcLxjnraIZiYSDt8suuMVblT4R32++cbp9wIJ8VDDGjGIbDdpR?=
 =?us-ascii?Q?Vigqke8j0LA5yxv2VU9k4qXZmGDVsgzdZfk+9JrUEWrhR782WIEacXAXxYPi?=
 =?us-ascii?Q?noNl5jzO+fQoecI+g03Q9bA9SXZiwqyWSjtEIjcWkVlzrc06Bd6TwGAJGQcO?=
 =?us-ascii?Q?ONOCnPxvN+H5TXjyOOECXVWRC4Uz1P5ia08jRP5Io9fF8hQKwdPrQszXLBcW?=
 =?us-ascii?Q?Gtz1MShMNfDL3SWshfouZmodFc5jyBs0W9CVUZDI1KtVcQ7JVMVieXVfgP1R?=
 =?us-ascii?Q?XAZTmOoJegdG5jxHJe2qdiIV//qyrdY9c1EGDN9eu0+18JXWNzqB4oIe5gw5?=
 =?us-ascii?Q?oRh63rSeGR+Fzd+2RZMDAQrwQvwBots7b5jt/uFMYQyUw0NTgvUnThK2ud82?=
 =?us-ascii?Q?OliFA+WrcKdrmPGSq9vZRZsfJyAMP8dSVIUwqsANcydSPDZwzKLBgOYSm7PA?=
 =?us-ascii?Q?gMMZp4RZMKuBqDaSA8Qn7oUIGxL/SqXmpDhZDhoLX5IlSVI/6G2Yai19guyM?=
 =?us-ascii?Q?2hFq8j+dlvP4EbhhngJ1eVK2S5hs4+M7lBcYc2812h9wMhGei6KSfgqGFDHo?=
 =?us-ascii?Q?0L9N+Kv21RzVZGi33kBiMdcnpCsHdv5osT2cvJVCyVH105PrPL0FPqULmCQX?=
 =?us-ascii?Q?nzu78Fe4Kb2atWDCTnCZrcpAsuvUhwRC1OqAtvKTrN/+Ie6TepF35WBGEgM7?=
 =?us-ascii?Q?YOKURCO+a/u4OyPlUm0tS2jQ25eluYIoeuLmvqKOx5RTF3K6UsAWN3FZkYDN?=
 =?us-ascii?Q?BjnxfGs/5q06FYn8q1bqNdGEreGH5bMLaW9w+/LwXnL/3XmbHqnU6p5d4kDM?=
 =?us-ascii?Q?Cu90tDN9GNCoz/anaSqefflD9tsj8MF9ip5g9gnckOclF83qKRrswBSTpyjK?=
 =?us-ascii?Q?4wIJt6NA8epNeT18xq+M3xCEytu/C6MowXaVXCSB30rUX2OvLcQQKndM/F+h?=
 =?us-ascii?Q?hXLxUW8K/XO8x1cBO0DoOZNB8ndwUH9DauukGS8kVfb7zyKza5/Me7Iuma0x?=
 =?us-ascii?Q?GZPEKwIN5PD9vFXRt/SJsTKntt5B+x2QFrzrZgGvHbFhDuwyXHjg7OcmTDUy?=
 =?us-ascii?Q?RXezohClfd8BXtwnhWgKbFSCgkXnXMH9dI6+detQAIhIIZul118P+8gmrE5x?=
 =?us-ascii?Q?4iq+pCgmmlu3HRrfxi/HjbsvBX9uPSakcSVgabnopRBRn0W9XsCh/lYP45OY?=
 =?us-ascii?Q?xVjwT5FmCyl5d/l17XY9u0PSgdVQTgoSDH6XyHfUwV8ocP1ChLA10bdh+w0A?=
 =?us-ascii?Q?DzLM6Jh872Vmn+fOh1Vt2CpRHU7thqzDa8ZM0LbcQ8X/O3aUrIX9xND31b/j?=
 =?us-ascii?Q?0WVbQPMRCClSYWBCmAficWQi2lJ4ZJx0v0lNz5ip8pFn1PDM1FQqfN3p+Tcz?=
 =?us-ascii?Q?+EpsyadfUhVCmczCPd30equICp8WtLhJ41rYcrbvHTvJoQVer72AoNQP2wSz?=
 =?us-ascii?Q?jPeKJrjygk/XWOuE44NUWRS5nqpHH42IzTkSNef34AkAKB3CuCxSfUvTGRby?=
 =?us-ascii?Q?7xsDtKn2a3VrR6omsF9BKe4L7FHYg//CoKbXjKrKS4jA9DS+BAi6ZJ12QZfm?=
 =?us-ascii?Q?f6OgUUN4okrY/5SoNEUfPkqdjMLX7xVe1EEz/0Y0iplYkG/N+7uh?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f0617b6-407f-4faf-ba55-08df1deaad96
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB14118.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 05:29:48.2850
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TFiaj0Uf+eTJ9xK/TYoovVF88IJDZ+OS0QzvXrszGer7tjyO2AmxuX+MO/C9VRelHNAMkxae3FFpk8W9Y9ao89sxFUBGxBThKqy2ldaj4aF0kPQJFHOxTFi33kfumFwr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8890

snd_soc_add_component_controls() is Component related function.
And its parameter will be capsuled soon, will be not enable to access from
soc-core.c. Move it to soc-component.c

It renames function name
-	snd_soc_add_component_controls()
+	snd_soc_component_add_controls()

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-component.h |  3 +++
 include/sound/soc.h           |  3 +--
 sound/soc/soc-component.c     | 21 +++++++++++++++++++++
 sound/soc/soc-core.c          | 19 -------------------
 4 files changed, 25 insertions(+), 21 deletions(-)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index 734dc44773e96..d83ba2996653e 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -355,6 +355,9 @@ void snd_soc_component_init_regmap(struct snd_soc_component *component,
 void snd_soc_component_exit_regmap(struct snd_soc_component *component);
 #endif
 
+int snd_soc_component_add_controls(struct snd_soc_component *component,
+				const struct snd_kcontrol_new *controls, unsigned int num_controls);
+
 #define snd_soc_component_module_get_when_probe(component)\
 	snd_soc_component_module_get(component, NULL, 0)
 #define snd_soc_component_module_get_when_open(component, substream)	\
diff --git a/include/sound/soc.h b/include/sound/soc.h
index 553bb7e2be984..09a3e737c23d9 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -551,8 +551,6 @@ static inline int snd_soc_set_ac97_ops(struct snd_ac97_bus_ops *ops)
 struct snd_kcontrol *snd_soc_cnew(const struct snd_kcontrol_new *_template,
 				  void *data, const char *long_name,
 				  const char *prefix);
-int snd_soc_add_component_controls(struct snd_soc_component *component,
-	const struct snd_kcontrol_new *controls, unsigned int num_controls);
 int snd_soc_add_card_controls(struct snd_soc_card *soc_card,
 	const struct snd_kcontrol_new *controls, int num_controls);
 int snd_soc_info_enum_double(struct snd_kcontrol *kcontrol,
@@ -1548,5 +1546,6 @@ static inline void _snd_soc_dpcm_mutex_assert_held_r(struct snd_soc_pcm_runtime
 #define snd_soc_add_dai_controls			snd_soc_dai_add_controls
 #define snd_soc_register_dai				snd_soc_dai_register
 #define snd_soc_unregister_dai				snd_soc_dai_unregister
+#define snd_soc_add_component_controls			snd_soc_component_add_controls
 
 #endif
diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index 463ea227cac81..709d78ee92fd5 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -12,6 +12,7 @@
 #include <linux/pm_runtime.h>
 #include <sound/soc.h>
 #include <linux/bitops.h>
+#include "soc-internal.h"
 
 #define soc_component_ret(dai, ret) _soc_component_ret(dai, __func__, ret)
 static inline int _soc_component_ret(struct snd_soc_component *component, const char *func, int ret)
@@ -339,6 +340,26 @@ int snd_soc_component_probe(struct snd_soc_component *component)
 	return soc_component_ret(component, ret);
 }
 
+/**
+ * snd_soc_component_add_controls - Add an array of controls to a component.
+ *
+ * @component: Component to add controls to
+ * @controls: Array of controls to add
+ * @num_controls: Number of elements in the array
+ *
+ * Return: 0 for success, else error.
+ */
+int snd_soc_component_add_controls(struct snd_soc_component *component,
+				   const struct snd_kcontrol_new *controls,
+				   unsigned int num_controls)
+{
+	struct snd_card *card = component->card->snd_card;
+
+	return snd_soc_add_controls(card, component->dev, controls,
+				    num_controls, component->name_prefix, component);
+}
+EXPORT_SYMBOL_GPL(snd_soc_component_add_controls);
+
 int snd_soc_component_fixup_controls(struct snd_soc_component *component)
 {
 	int ret = 0;
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 06167a1985912..b54706dbb527a 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -2305,25 +2305,6 @@ int snd_soc_add_controls(struct snd_card *card, struct device *dev,
 	return 0;
 }
 
-/**
- * snd_soc_add_component_controls - Add an array of controls to a component.
- *
- * @component: Component to add controls to
- * @controls: Array of controls to add
- * @num_controls: Number of elements in the array
- *
- * Return: 0 for success, else error.
- */
-int snd_soc_add_component_controls(struct snd_soc_component *component,
-	const struct snd_kcontrol_new *controls, unsigned int num_controls)
-{
-	struct snd_card *card = component->card->snd_card;
-
-	return snd_soc_add_controls(card, component->dev, controls,
-			num_controls, component->name_prefix, component);
-}
-EXPORT_SYMBOL_GPL(snd_soc_add_component_controls);
-
 /**
  * snd_soc_add_card_controls - add an array of controls to a SoC card.
  * Convenience function to add a list of controls.
-- 
2.53.0

