Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010067.outbound.protection.outlook.com [52.101.228.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64D5A1B394F
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820747; cv=fail; b=I4q7quDzD65vbmyXl5UnMuoCC7woNekEX6nXMxWSgQoF8jEj6+WuzY4CA5DCpSLV3ylG0sAmiOxlEqZR2ezZ7A4K174rhaD+Y7QLxwfI6HEUSV2KvSqIcIqyiXbvpGL43bmhC/nFNBOiy/MWGOZj744fqhopEH0Zsx9yX3LiyFg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820747; c=relaxed/simple;
	bh=2d6Wu7jH9yOlKK9K84USPIhpIvJVH7g9P0Wah/nw5ZU=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=f0aP4zckDT0na7PR/rrYI6u1uvB1wvBZAEe1PXl6AQ4MtwYvW4SW1tc5DMhPOBAt0FGK/gZSaB8CMil8AFJfjZHiVU5ThsCd9tubDBUM6KMkghLgaXCZHkoVzu0yLWedPYHkQOKYWbBjyDOnJoSTFZENRb93L2nybF1/Ux0bal4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=OecG0MMm; arc=fail smtp.client-ip=52.101.228.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="OecG0MMm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jg4D0Ci+udvZ8GZxfko0gwCYl9RXzQBz6qmTrFU1w+2KpdaQohoVeWfRwxJvXoN/wXC5WJKXRfhS5ea/xHbv+7nkWU4jpgtAP2GM8RylQro8t3W3nFWHjPU1xn+SttOxlSRHiQGw4t0Jpm+64YKhr387k5Klxlyx7Wh0I6YVLp6B9cDQbJTn/Q2C2HRRI/3T1nDFc+J5Ktb/YOP/F8zoso46PedFif9Uqtxp17DvwNJBwqdHWn5JpxX5Kdsy2i2T9fQRFWKm+u30inTDcc5lj5L4WUAMnqO7OckmdzlKmmWxvK+NjciKwdcfOMNn4Qc8cpPgcl1adHtHVvd5WDM4rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=weNQqkSJ9kLiRu2e33hXkDO4aJoAzVPPVkZSmV7rboI=;
 b=AeBEbKyuB6clv68bV9dVCQwgTvSBt3SXUjSTZTUqvqa6jOe2a3R3kJNyMyhgxbj1jlXqBZVxVgj802dtZc8gCSmfRohF+BQKatSc9A59ohmAsMpzp+qWY/IgRrGdnq4O6HlvJN67k6ivHvHcPXcIGINRVnzSpl3k10OHg6c+1iUJSVMVQlz+V+3oP6jfyagRMaHhGEizV9Og/kRcmFpqu6SAdTn9WYVufzauWHu1eUlKAUgnL/zwLjOu/g9lg0yOMAmt1tKUc6hObtFG5zaMDVKHtMvAF6asz7k0uZW/J+kzrAXj3pojrxEB3EBOu0hbJ60SBG7c3IPUzJYipvjEVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=weNQqkSJ9kLiRu2e33hXkDO4aJoAzVPPVkZSmV7rboI=;
 b=OecG0MMm9l27Ddxe8GugDiLDn4gi7ObgS+5euBsqHQXldVolvU1wEq5KhLT6uaSe2EWuNAzXudZ4V5WsvUDNr5YTTyr81jSsxjL3KYBq/XkNSA6NNA/JY2Yv918wxYOERT3SvYvqjFOHyfyNIpUTJCgYzRkzcd39UJQc1E73qx8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSCPR01MB14439.jpnprd01.prod.outlook.com
 (2603:1096:604:3a6::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:25:43 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:25:43 +0000
Message-ID: <87jyzx2z5l.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 119/292] ASoC: codecs: rt700: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:25:43 +0000
X-ClientProxiedBy: TYCP286CA0325.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3b7::8) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSCPR01MB14439:EE_
X-MS-Office365-Filtering-Correlation-Id: 789f9a26-98d5-4fe8-262b-08de20b8d9bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dteHl2p+4LuOxpZdIV7c02ux8rXa6I8z7zO8OI71NH1o27Qj8RjTk4XQZIwl?=
 =?us-ascii?Q?gVAjXgqVYbbGtH6aAbZ9ut4iei/9icTfovGJi0ZudADLsBKqoNxb+BREdkED?=
 =?us-ascii?Q?vZMhI0EYk2soFIISU2Lr4TTBCLRWXb+uunf/nWJBCI9hQDAb+HoQuwRMn0Vm?=
 =?us-ascii?Q?VXVoXcIdW9G1EXD5n7JmPpzS+5mtXWeuxwK1smLr0VDyXBEFoV70+LMx3Zhb?=
 =?us-ascii?Q?txLkMmGvtoT8+uqcAdV2TFTyJLUM+dqOjWjKRCkD6y0UIo29/r/IEqkTr6n5?=
 =?us-ascii?Q?6PpH+2p4xdYTfFMLLm7gQUFhUOrPyu17U6ZciEKxH50UTMxFqkxU79iBOkXG?=
 =?us-ascii?Q?wbjUukrXUEAwSI1qEykKPQsjo6nKuSUq0ezqexkXnNWGi5L8BPhzmNeyi7ft?=
 =?us-ascii?Q?9wR4y5GJEBezpF4Rwl7zarak4+uTso+9nSFQSvKa0pd8zlY6x8V4pqIQ+Yra?=
 =?us-ascii?Q?lTqbe7phXlmvznKo8JSHkN+BrRETULlqqZR8h9xRo9fE/gG9b4B4bpqAD+Ns?=
 =?us-ascii?Q?9987KwK0rUDbnSp3tcW6FQNXjl3fSPKDkIq6ku7sw8oYhV0VUVbHGEZu4wsa?=
 =?us-ascii?Q?GArOCUVz7WpdDqeH0/lLdhIW4vCSJG7G5vsPC6lwUiUQgQMW2Nnz6YwQn97d?=
 =?us-ascii?Q?B5DbV6VfG0g4f6SNyOqjkcw6nNJkQCTFcVzdk8Hvme8S2ffccoaZ3D5P1Mur?=
 =?us-ascii?Q?TKK7MifpkgE6egubnw0kvvJbdxPBI7kfOs35OnNw4r0+DwYf/L+1HISpv2TQ?=
 =?us-ascii?Q?PA9fuKmHROgI0QPExx4NAU5Zny85hWbOBp69VBP7oemdIxVwkON8OlEgS8EI?=
 =?us-ascii?Q?DU/QwNj675yZ25VwsRhg+hG550ALPBhdVTql10L1fwXs9sRDM9XHBfvgQgAU?=
 =?us-ascii?Q?VUvHn/3cwRSBmYGIco3IVuGgpMpHUb761gQ7D/EO3UsQ+ZmC/g7nTgzlUyNT?=
 =?us-ascii?Q?KTQKMqeFeiJ9Mi33XW4DTXqswF9Bw/JiJv0mwat+02un0D3rL69DhQNL+RUQ?=
 =?us-ascii?Q?/LA4hVtlRbtS8H5bnNzVc1plJjF93tQWNSl9IfdUMO2SllEQIwvinSBGaMS4?=
 =?us-ascii?Q?1ktJOj+wiVkLwBEnyqt3+XlOhZdnNvgOgn/4WzVnZmhnV9WomKSJp+cLPSWh?=
 =?us-ascii?Q?qqoMtTiY3lXfEgC/B8VYGNR5JyhEw1c52Dxm0lXRNlXTi6KjRBmAzC1Ehbfo?=
 =?us-ascii?Q?PaCS5ZnNk8bvOCARPBaaB8YvKriSGG6XS3/EGPtHz2Vb1Y2LVmHC58d8eZOm?=
 =?us-ascii?Q?yNrG+JygcUywovjY7vzDIvZ0/VwarbOALOBThYi6Ms2Pa0j/uMscCYp8m5Vv?=
 =?us-ascii?Q?vI5JC19UUv6923ZmEyVsGdeJn5GkpdqayzP7mJozsU5e6RbEYY/vKa/5tpN3?=
 =?us-ascii?Q?u3oWynvrtSp37VWSfyy6WYJ59l4b0ZiSbce2SoRQ/eBM6cvbnQlw029aKVAs?=
 =?us-ascii?Q?1SHOauYzU/XfpFXt55hAv9SsPPpWbfs1aWoA6vbvgu5iiKUpFJxWT4rXPTbm?=
 =?us-ascii?Q?NMXp41MtRL7YTr4o8H8Z2eHfBcqreeE8gzfu?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5jfheFw35ZYnRisOsCzYYGdF72nUHVWq4C9ibQu0Hs3PyMCduzl1pBu/LrCG?=
 =?us-ascii?Q?v9i6WxyNdZ+cK1TCAwWCtu61y59THBx9JQpSFmxK0d/jsLNeGpr7OYsJusE/?=
 =?us-ascii?Q?hCDt78ewwumdPMqNlaF7fPvTudnr+gRIVl4KQT1lEP9/hCyzbkXzo9GuffzF?=
 =?us-ascii?Q?aB7bSMH/zJqw0z8m3WixKRj4xGB0/vS+MwD919bnIKb3dwAA4i+6pXtDgO7t?=
 =?us-ascii?Q?Cyoq9V6fgcaSCNHu/6dXK3egH0w72u85Hy7FqO2K0L6jBV3oNrb6ePhFp8Cs?=
 =?us-ascii?Q?SgUVIDor5usAMNRQ28+HYddA9U8XqqLdQiHc9B/mO/RaGNwy7BgOOWw9fp/h?=
 =?us-ascii?Q?LZ44MUVpPiOmfGgbfZT2KwscimSvPuXhwy8Mx/ETGk1ze+dw6UhH0LQJy5EB?=
 =?us-ascii?Q?SiN9x0TV9lUIFZeinzIiZLTtPlBn9/OIdPjR988A2p1xs/FPTUJTx4w88w2V?=
 =?us-ascii?Q?wE20RdBANUOwhHKbYNhX74hZCrlXhWbXn+J8ntPStmboZ5pckZTMkhPT5Cfn?=
 =?us-ascii?Q?NrymHBsfZ86YNBTN5j/SaWXkH1Q1A+Vyvxxp+hKCBcXj63vn3+kHMo5LE3dH?=
 =?us-ascii?Q?csUAJF/HE4ptUPRKfvLqBeS0NTZAiqjzFzraxBBiMFyEiFEUcDGQwvMJTeJ7?=
 =?us-ascii?Q?Lc+sW0avKxm4eiu0y3hDh5FLcQNnsGXiUkkDMqYEhwGA/P+V3AnfSJ3Cv5Ub?=
 =?us-ascii?Q?QcqqhhRAP/DrOnTEtMO+/pi6Wg4ody7RXbNYCicNal2vDAo1h2AqpAc0R7l4?=
 =?us-ascii?Q?t4BumLhq3Q0Bvk11OUbfSUnu1xXj6appbUdIGkvXBe8U2vBlxOmU1dJWSZ3D?=
 =?us-ascii?Q?ZZCx/L5QDbJyPEbJPTF7l/uigX5HIpsWsu1SfmAqrZnn8hCkJsAIHJv7KuRp?=
 =?us-ascii?Q?/ALnYDDg2lp7j0KKNiWjsuGtJNWo7VQYsb8YyNVajJe8k3ISNi2SoETeY3V+?=
 =?us-ascii?Q?8LJyIYb/TluXsSwQ4I23ISAvMuksY8dHThgkhcRKbsz0jMgqYEu7j31Tuy/J?=
 =?us-ascii?Q?Uj61u3qJ+tiUo5cV9KPxa6ri3A6b5FMSEBhQMzi6GoaQW4gb0eI94vAPv9Ay?=
 =?us-ascii?Q?XldLjzxpmAmlw0k9ECd8M4B3bPhbKNkebJAtZwCSLVP9+jDnVkRjGSl4ZNHe?=
 =?us-ascii?Q?J0uGwUBAJQ0RUW1vZKZdRW4rAFsEgLU0dyvzKTX3GR+ASQ4RqAxrJ8Jkb/1u?=
 =?us-ascii?Q?wvIjumUiV7no1V3Hfcostva/R3WG26B1VAP50PfQt7hYDe0g8BOHmmyAxKYq?=
 =?us-ascii?Q?kJ2hDv/ajU4LXhn4J83DddYSyQLwjkNKM2Fq+gZo113LxNH6vvZaERsB3rHs?=
 =?us-ascii?Q?zaUKPZd6E9V91FOlC2IzmBOQ+0s8thnPOh2+eSPeyZKtJJq3RuCA/8DD5blU?=
 =?us-ascii?Q?DM6jPbd1V9p9CLU5YK85if2d7GFdHHlErO1/Evijfllp7mrThgs8962Qf88C?=
 =?us-ascii?Q?9IYwgm/OwvADEEVX8o6uAb2/o0hXjCBqQZaP4x0LXVtk7W2X+tERQJrJGDmy?=
 =?us-ascii?Q?I5fnPla4lMO0SBo+xbEZC2psL5/ULL9tCWZQXmAX0zKu9zk6ECUxauKGCK1F?=
 =?us-ascii?Q?sQqe0bQhsNI4FJPB7Qeb+D/h+IvEOTnmAFrIorLt3rHZIcvdUaXrlQ10YzUv?=
 =?us-ascii?Q?FYy5jHjyszLXA4MZb6z3JB0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 789f9a26-98d5-4fe8-262b-08de20b8d9bf
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:25:43.3487
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QvRKXwMm12w3fvhxAo7oH5LmDtG87E/LIB4fSEc89FLRNxa0C1w5yH9+VpUaDc1R0qpO8fzwkxUnCoMA6BkmrkAskdHMUx/zAyVErwIRRDKr8zPmIp76qRc4HZgQCrPb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB14439

This patch converts below functions.

dapm->dev					-> snd_soc_dapm_to_dev()
dapm->card					-> snd_soc_dapm_to_card()
dapm->component					-> snd_soc_dapm_to_component()

dapm_kcontrol_get_value()			-> snd_soc_dapm_kcontrol_get_value()

snd_soc_component_enable_pin()			-> snd_soc_dapm_enable_pin()
snd_soc_component_enable_pin_unlocked()		-> snd_soc_dapm_enable_pin_unlocked()
snd_soc_component_disable_pin()			-> snd_soc_dapm_disable_pin()
snd_soc_component_disable_pin_unlocked()	-> snd_soc_dapm_disable_pin_unlocked()
snd_soc_component_nc_pin()			-> snd_soc_dapm_nc_pin()
snd_soc_component_nc_pin_unlocked()		-> snd_soc_dapm_nc_pin_unlocked()
snd_soc_component_get_pin_status()		-> snd_soc_dapm_get_pin_status()
snd_soc_component_force_enable_pin()		-> snd_soc_dapm_force_enable_pin()
snd_soc_component_force_enable_pin_unlocked()	-> snd_soc_dapm_force_enable_pin_unlocked()
snd_soc_component_force_bias_level()		-> snd_soc_dapm_force_bias_level()
snd_soc_component_get_bias_level()		-> snd_soc_dapm_get_bias_level()
snd_soc_component_init_bias_level()		-> snd_soc_dapm_init_bias_level()
snd_soc_component_get_dapm()			-> snd_soc_component_to_dapm()

snd_soc_dapm_kcontrol_component()		-> snd_soc_dapm_kcontrol_to_component()
snd_soc_dapm_kcontrol_widget()			-> snd_soc_dapm_kcontrol_to_widget()
snd_soc_dapm_kcontrol_dapm()			-> snd_soc_dapm_kcontrol_to_dapm()
snd_soc_dapm_np_pin()				-> snd_soc_dapm_disable_pin()

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/rt700.c | 28 +++++++++++-----------------
 1 file changed, 11 insertions(+), 17 deletions(-)

diff --git a/sound/soc/codecs/rt700.c b/sound/soc/codecs/rt700.c
index 816117c13aeae..21523d0a5f08f 100644
--- a/sound/soc/codecs/rt700.c
+++ b/sound/soc/codecs/rt700.c
@@ -272,11 +272,10 @@ static void rt700_btn_check_handler(struct work_struct *work)
 
 static void rt700_jack_init(struct rt700_priv *rt700)
 {
-	struct snd_soc_dapm_context *dapm =
-		snd_soc_component_get_dapm(rt700->component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(rt700->component);
 
 	/* power on */
-	if (dapm->bias_level <= SND_SOC_BIAS_STANDBY)
+	if (snd_soc_dapm_get_bias_level(dapm) <= SND_SOC_BIAS_STANDBY)
 		regmap_write(rt700->regmap,
 			RT700_SET_AUDIO_POWER_STATE, AC_PWRST_D0);
 
@@ -307,7 +306,7 @@ static void rt700_jack_init(struct rt700_priv *rt700)
 	}
 
 	/* power off */
-	if (dapm->bias_level <= SND_SOC_BIAS_STANDBY)
+	if (snd_soc_dapm_get_bias_level(dapm) <= SND_SOC_BIAS_STANDBY)
 		regmap_write(rt700->regmap,
 			RT700_SET_AUDIO_POWER_STATE, AC_PWRST_D3);
 }
@@ -362,8 +361,7 @@ static int rt700_set_amp_gain_put(struct snd_kcontrol *kcontrol,
 		struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
-	struct snd_soc_dapm_context *dapm =
-		snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct soc_mixer_control *mc =
 		(struct soc_mixer_control *)kcontrol->private_value;
 	struct rt700_priv *rt700 = snd_soc_component_get_drvdata(component);
@@ -398,7 +396,7 @@ static int rt700_set_amp_gain_put(struct snd_kcontrol *kcontrol,
 		val_ll |= read_ll;
 	}
 
-	if (dapm->bias_level <= SND_SOC_BIAS_STANDBY)
+	if (snd_soc_dapm_get_bias_level(dapm) <= SND_SOC_BIAS_STANDBY)
 		regmap_write(rt700->regmap,
 				RT700_SET_AUDIO_POWER_STATE, AC_PWRST_D0);
 
@@ -450,7 +448,7 @@ static int rt700_set_amp_gain_put(struct snd_kcontrol *kcontrol,
 			break;
 	}
 
-	if (dapm->bias_level <= SND_SOC_BIAS_STANDBY)
+	if (snd_soc_dapm_get_bias_level(dapm) <= SND_SOC_BIAS_STANDBY)
 		regmap_write(rt700->regmap,
 				RT700_SET_AUDIO_POWER_STATE, AC_PWRST_D3);
 	return 0;
@@ -524,8 +522,7 @@ static const struct snd_kcontrol_new rt700_snd_controls[] = {
 static int rt700_mux_get(struct snd_kcontrol *kcontrol,
 			struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component =
-		snd_soc_dapm_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_soc_dapm_kcontrol_to_component(kcontrol);
 	struct rt700_priv *rt700 = snd_soc_component_get_drvdata(component);
 	unsigned int reg, val = 0, nid;
 	int ret;
@@ -553,10 +550,8 @@ static int rt700_mux_get(struct snd_kcontrol *kcontrol,
 static int rt700_mux_put(struct snd_kcontrol *kcontrol,
 			struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component =
-		snd_soc_dapm_kcontrol_component(kcontrol);
-	struct snd_soc_dapm_context *dapm =
-		snd_soc_dapm_kcontrol_dapm(kcontrol);
+	struct snd_soc_component *component = snd_soc_dapm_kcontrol_to_component(kcontrol);
+	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_to_dapm(kcontrol);
 	struct rt700_priv *rt700 = snd_soc_component_get_drvdata(component);
 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
 	unsigned int *item = ucontrol->value.enumerated.item;
@@ -839,13 +834,12 @@ static int rt700_probe(struct snd_soc_component *component)
 static int rt700_set_bias_level(struct snd_soc_component *component,
 				enum snd_soc_bias_level level)
 {
-	struct snd_soc_dapm_context *dapm =
-		snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct rt700_priv *rt700 = snd_soc_component_get_drvdata(component);
 
 	switch (level) {
 	case SND_SOC_BIAS_PREPARE:
-		if (dapm->bias_level == SND_SOC_BIAS_STANDBY) {
+		if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_STANDBY) {
 			regmap_write(rt700->regmap,
 				RT700_SET_AUDIO_POWER_STATE,
 				AC_PWRST_D0);
-- 
2.43.0

