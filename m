Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011013.outbound.protection.outlook.com [40.107.74.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FAA310957
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820841; cv=fail; b=geHxScX2f3kf9BrnHqv5RIJpWdlFs12AkZrEXjvtRQ1ShH0iJbyAt/9sIvERgsJH7fVtSX5Tr1SX0pbhz1W2+AsKvWZvuj2xgQLoEPzXJpqa0Q81y8US+GcrShoYSyFKfDDaTXH529HV8ohKNy7xmrx/kmRfe6Hu5UabfdDPC4o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820841; c=relaxed/simple;
	bh=b+YP6HhytgoMBP8jq/e3/j7BOvAM39BczHnhEYyCUpU=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=t7S4J2d88drUx/lTWL4rHIDAg503StqbSemUGvQmCh7/AkbSGQwPHSKrle31VSgC0IiJ427y3Hf70vAQpwpk4xXi9PHW7AUfZ0PUUpGaA/MbdNfpojLEXW/eXQoCsqxT1JvBLWwLlyY46uTc5/N4zBEwUnI70frY8BM0Nm8yszM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=oSJPNJcm; arc=fail smtp.client-ip=40.107.74.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="oSJPNJcm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GjYEJR3ijgHGBUZWD9ih2s3tN+tVL+IO309f5kQr1hUAiEn0FHTVYk9ppIgI4YfT6FdYQc9zHJ4jdCu767yzfRrb4VnUTEEnhzWPbnkmb3Hvk3V0iaaCbqZx1hG6VtJAskhdqM7dFLyerRxRG5hHaOCDKVBXoYFD2+6M772CTxK5x/kqa/bbDLLiTv7VNEC/QJO5RqXm4GYfSCqLCIyTvjsNC0ZucwNomucyzENwYjeAkyJsys1RO2vOw7iP9kL2tT8+cJCYNSKELVPZXn0hmSfZIazuPyBrHA6agbn4zZplfYvK4zlMonXFqJMbwlHyZLHhFYHt5Oax1HLSE+QqtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=88IyW6LbcdIIfH8rcNGrKMZK9QmbcSiIsT2NxiqPCRc=;
 b=SP6OdzZuEWqnmTn1mmASrHrz94YIDa1xc5fV48SRlhlTcZxQjDWFyWgdDnVv+G68YATA79oHyjVHSM6fDvLmG1q20Hpdyl1LaV3hCiQQVeRPxLhvUustq4F0q37Kgb9xjAkejFbjqOJGWrQzyubBh1HF4s9pZxyyQ0xg+PKrkNXnsYcHJ9wG6hoFpBLWE6EMGRmejB2ZDhNzt0DknnfOdiNqmpHLDhnXBTM7w82tfeZ1ZwFoiquFy20/bv3Dm2+sZzsdtfASIWqEsllv4hs+u7NNLSBxSjIyyNiZoiZgxTKMSlOXpx8nueHnL1HMScddvFtOknpqWYwOMIU9GRt1Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=88IyW6LbcdIIfH8rcNGrKMZK9QmbcSiIsT2NxiqPCRc=;
 b=oSJPNJcm4VUOVHehk2JBvEy0FyB9cnIotF9rTXWK0NisYu29Q9hwqlqGxX+A917oNMSB943Cws45UHun5beenRTMzfBym7Ugkx8SGdfiohNOIcbrO2vi/ZQNvcZf2oSX/RYB8q/5e1fOaUu01bUbTNwdV7JSApXDd0XQ54XhZ+c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB13460.jpnprd01.prod.outlook.com
 (2603:1096:405:1d7::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:27:17 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:27:17 +0000
Message-ID: <87ldkd1kij.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 143/292] ASoC: codecs: twl4030: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:27:17 +0000
X-ClientProxiedBy: TYCPR01CA0179.jpnprd01.prod.outlook.com
 (2603:1096:400:2b2::14) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB13460:EE_
X-MS-Office365-Filtering-Correlation-Id: 094791cf-8f5f-4d3b-cf2f-08de20b911ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QbCt4n8t/27cNHctw2HYkTLQKTl2Gi1TtYqCk6+0Vm6FnVpj9zeFf3VF4Qar?=
 =?us-ascii?Q?1azQe6XEz2bW2REYIVwq4Cmupr0SXm48zc2xrxqfJ+c53vYI7I5duOLcqVF0?=
 =?us-ascii?Q?PZuoiIsA0R0gKYgziNaX/r8sz7r8APzPUSsXfZAhHnbKN22c5Lgj5S9k9GHB?=
 =?us-ascii?Q?GSODZGafZgTd6JR8WWzykkB6RrDu5ACN3zK1gGglL4IfIFPG+LqsXjzTRIbM?=
 =?us-ascii?Q?gkO18wo0S+BhayxYT/1e6m+CZyoULuQLeqoBrrRtOeqSSrlBTR54K13gSL16?=
 =?us-ascii?Q?IgdwoUHriK7/kf5fjh6pOLd9Wyiy9tByiik7LSNeb1/eR2jarmdD15aIQrke?=
 =?us-ascii?Q?5wKpm+6p7sHYqsNdkkxkffp4YuRNxj5FxoSkuqnPqYbfXcbjO+iXukQrTzUY?=
 =?us-ascii?Q?FxgRk4wiWZEBb5uJic8O4O5TTfSis0YM6UswS9+WCeSAL0JtOnveK3Oxbbx4?=
 =?us-ascii?Q?H3iUEHes15UExq4uMnkamjB2S5Bs9SEq22alh82ws0BznyD+1Ukl66F4telY?=
 =?us-ascii?Q?MBpqgnKdWbo3O2upbwYvh1BIJ1+3WnN0S6JUD6xRQsJaqOuWcM3Nn9ki2fub?=
 =?us-ascii?Q?vzFxmur1X3RltjpfdsNyNzuhOKt+2WMxvRtHJjnnobWOGkO6YY6nGs3VonaX?=
 =?us-ascii?Q?F4iPyN5Orc7Gu5OCf2a/+Gaj6JP+iMlITg879VBGZ+Kd4inyvVR4krRnIudk?=
 =?us-ascii?Q?P+utxBnDJ/NXDLaLXqaDjFalQzw7CWEhxBuGeTGxkTuC5IWgu1FskZIkrGYG?=
 =?us-ascii?Q?qmfxGsMxT9IKTwlFqhmwCkxXYjQpJyIRiIz4M1GvE9M4v1RxgBMhzGd61PVa?=
 =?us-ascii?Q?Ig3uiYjDGZgaqpLBJT/7B6RuMHfRdcjCSGfd8BTgZZfdTxfPml0EdWfbpntI?=
 =?us-ascii?Q?op/KGxRSSPrdhtjEUOpEHSmdWb4K6nA4ccStszsSOO5RCRiuXdfZMth13K7O?=
 =?us-ascii?Q?APu6sKLu1WsH95K1yOiq4C8JRAh+39IYupmPwyLhOUX6NviC0RNQPX4eTQF0?=
 =?us-ascii?Q?gfd0nOI+V9fr2qRiLN42TPTIl4yFwEVDUFZU6pt5FIQFyz9MSWt1660K7j3+?=
 =?us-ascii?Q?Vo9MO65PkAvNqPJQ3mHReVl1Lt6v2OS/F/2hVe5uVL5nFZskyr4uCsre0PrE?=
 =?us-ascii?Q?W1VqD2FYEWZIttmznQDsIF5u73OTe4CLkaAQtx3p4L9XeBp6G1MdZvWt9IA5?=
 =?us-ascii?Q?f2mrmUeu05BWvMiva54YR915QudFlJZlUlZ2ipi2wi2KYvjNpE3XB19Oydf0?=
 =?us-ascii?Q?BVVtjQLQydi186Dr8FgLQpKNzBHf50rh7ngnKS+anMXTloBvO5nPHipbRtUF?=
 =?us-ascii?Q?nPOSTpiQMSIeW4ZNlLoe6Iho8l3uMcr0tn/heJyyD7alz0WeMZVsz1i1wu/q?=
 =?us-ascii?Q?X8y6pepumfeWhgO2JA7iIK3W9fmGBB74h3fFHRFmr6KOx/TpvVyZnjBP2Uzg?=
 =?us-ascii?Q?dLlde9BUvcl2OVxlzIW8nZlTaeUndCzkDXNR0PduUA5xEzzp8lcWP8iqDagL?=
 =?us-ascii?Q?VphE6m9NKHTihWmEsgAWXk3MMRLG4wAWtvUS?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WF9kgplxmE91lmVDK/h9zVLBDGqkGBBtX1NT5zdLcSDZ4iQe+sX5AgK07Vs8?=
 =?us-ascii?Q?hfAHYaVVmB5Wtvs081ezOWIgwuhLKE4IgyeChRpyGmNbK4MBMHGd9XzRfofd?=
 =?us-ascii?Q?mEiI74dLo7L0GeaEsX/GRdnIfuP349EijjyA83Dov0gacxWtk34QrWQQAwfT?=
 =?us-ascii?Q?Lf7AHrg5IVSyY31XacX2gve/oV79a7WzyK1Fjx5GXdmeAoRJBzO7CZvLyIgd?=
 =?us-ascii?Q?6boT5CA+rp6EsXo0AebZCJlo6wMIFZOqy9jdevPuUHHJ5M/6Ixf5PbzzpZp7?=
 =?us-ascii?Q?GU9KcUk7p01UvwBL8AXuqtvL7Kkr3jr0kgQzjC3E33cKPy+f70HrtA40u5BO?=
 =?us-ascii?Q?qKhsfh12gZcGzvDAZAounnd1JzmKlQA5jp9ZbXvPVOHoY1fi26zGxOjpacbc?=
 =?us-ascii?Q?ubZRK2cf+sUJtKjNKKl/U3/RPIaaFdaTQAGcusDhLl9M5qAWbJoVj3CZ81QD?=
 =?us-ascii?Q?FATp+reVBzPWYUGoyOzu0LRu29f+hQIef/uTlrPl09Y6sdtLPjmLKIstG/GN?=
 =?us-ascii?Q?gQCeb4h8y8QYlP9yLplO0DWgobepwCRaTli+2u/ZIQp+sh/0CZc0sv9k56vX?=
 =?us-ascii?Q?r7mnEI3lgroFK1yS0q9CP5/yTEYmASpE7ejvhdKvbjNyXW/1byAQzYeAkcBl?=
 =?us-ascii?Q?Hf9UwbZStkO3TzUHlJH1/jfvsNQafm3ildDuVFotmsfdtgpbHIcvJrDyfkXA?=
 =?us-ascii?Q?j/Q5GDfyKvHuSKhC2aT3l/9Tr6HmPqnaazX+IbDh7FI5q8O4fWzT642Cu2t6?=
 =?us-ascii?Q?Xfx2rrg/JhlZXtCR+Y+Qql2wBKy+X6G0P13VxXuWz4CYUUCfFUogR3Bspakn?=
 =?us-ascii?Q?LKXZh8qIUdJn5Y0XJBkKEk6VDX5S3t/UWCyOxKxuRGKnSmD5OzpLZrpkHh40?=
 =?us-ascii?Q?5VK0EpRS23aJ1XW0vCmDPsiPLLzozCQslJGeDlRQPuXujoJrHw3wIBtGOCww?=
 =?us-ascii?Q?PfJOEcEMednpz3Ni3uPV/fGSqL7yu0kXjI/D5ablQIN+7O8FeT0hmtVoZTjo?=
 =?us-ascii?Q?zfMTDVPOKFJlepoIj5GLynCPmmIF5NVpGaL4+d7jBFZGwsWa5Mqnsq/d2uwL?=
 =?us-ascii?Q?z+rv1I+nKaLVzY+u2R1Qwv3ZRm4XKMu99rQpCKhr5HiDLmoPxbjATlp5Y9JU?=
 =?us-ascii?Q?f126oaiwY8iVlBorwE7yEPAXBOKEheQjoZn0VxfIqHkXnoJO1yl8PMyYjBl2?=
 =?us-ascii?Q?XCCgArzFWAgsKk4Mgp4Nu/PR5BWvNvi8E9NIY+ZngIXzNYLlhb9qAyJaxwoZ?=
 =?us-ascii?Q?deYyKdEfecQ/MYJXWf/dZRX+ecCCgATxUrYOPCBJCLrKJlo1CQrYH5wDxvLS?=
 =?us-ascii?Q?fX/ix2yXzGFwxfoKc0xHvCBbdyMDq4c6hCCyqxh3rFre0/j/yHxkfXii0oWT?=
 =?us-ascii?Q?lSem2SGzTjRRgZt4OzUnjrqTWDKnvbc8o2MTZCNkli3xz5OW4lgdLjRfmzOF?=
 =?us-ascii?Q?uatBhoAjNfg8r7lGDteU1DvfYvQFL1pUpgEnWILV2LYTpwOCjb49TZoUw0f6?=
 =?us-ascii?Q?oBSwV/YtSIyCIKgITlue5IRh4Y5XdU3bg4j8ih/s7tI0aQjc33VKU6yQDR63?=
 =?us-ascii?Q?yRvannI5HzuOK39tL2SIb5NM0BmwCEV/mxRqUG4WRMzwy3YrF4gQ9r9GO9/3?=
 =?us-ascii?Q?ubVh8r/GTQ+BcSB0IX8DIwk=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 094791cf-8f5f-4d3b-cf2f-08de20b911ac
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:27:17.1890
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6KhI44JKxn45oEL+nbfn+Bo2UAL3OpQz0ELTqzsmFMSvluaSoHnc1fgo54cK5dmVEb1kzaNqlEowgsBecUOetEv2XwtutpfYKlXC0evit4m80Myi66I7d1BQtw8M9SiJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB13460

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
 sound/soc/codecs/twl4030.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/twl4030.c b/sound/soc/codecs/twl4030.c
index afffb0af55085..9476cdfd4dde9 100644
--- a/sound/soc/codecs/twl4030.c
+++ b/sound/soc/codecs/twl4030.c
@@ -1570,13 +1570,15 @@ static const struct snd_soc_dapm_route intercon[] = {
 static int twl4030_set_bias_level(struct snd_soc_component *component,
 				  enum snd_soc_bias_level level)
 {
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
+
 	switch (level) {
 	case SND_SOC_BIAS_ON:
 		break;
 	case SND_SOC_BIAS_PREPARE:
 		break;
 	case SND_SOC_BIAS_STANDBY:
-		if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_OFF)
+		if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_OFF)
 			twl4030_codec_enable(component, 1);
 		break;
 	case SND_SOC_BIAS_OFF:
-- 
2.43.0

