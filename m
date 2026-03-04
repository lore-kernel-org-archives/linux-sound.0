Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011043.outbound.protection.outlook.com [40.107.74.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CC6C37F8CD
	for <linux-sound@vger.kernel.org>; Wed,  4 Mar 2026 06:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772605424; cv=fail; b=KGY7c+z8GRk81zBJN5wq64I4nFbrKi6cEJdHA+GdlpUwY8UtwKjNikTEu6i9JlJIPJbYquIwmWaAEsIGLw39Xl2pfyg3L6A5D0khBxwJTyCX6JPB6QkUCOQhS4AEjsb7ilZqlQGfHnfDAHbfzr0YuoKPf9f7CA0/akqzl+iWUSs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772605424; c=relaxed/simple;
	bh=Odht/XXe60QGhtwWkxsLC3iVOm0JBIOBXyKW5SkP1C8=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=ZdVzPjWr65IsdFpUywWAI/Dd8NXZQVdtKojhrclL2/2b5KLJJyB0jkyJ2kQJjhl2yq0xIZxHRX9+K57Qq7Y36r7RgEPsepsyeARgWv9bhQQchcSefOra1kkW7T+04Yt8HhUanvsZF6k4RJPpGiQXW0GPWbpPG/H23dkSjQe9jWQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=YkgosvTT; arc=fail smtp.client-ip=40.107.74.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="YkgosvTT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G8YxLsTh2/J2gkaVzUxW6sVWb6KsE4jZU6mbYs2NLNQdDi8QYoL7txHVmoYZrguou8u3SzatZ+oUCnVOzo4O9tU9TeRyIOsDRM8E67VZxYVFRGD+laNGcB6MMA42uIME5p7/dgWojkkKcSNoBLBwjn9A3zkYkD3fCXjhG1V8h4qC/n+Q38+onAeU7AP5tPauGtrdAIp7iCUf71yhteUjOgxryuFFl/nMU4a1afyWbQRvYAqIsupZdsnQKv04pQZ/OInWN0DXScbc+BXj6Wu7dMIH1Gh8FJpL7fFYMn2XUuf22zo4fgsfHEomokpHYZqS1U54g1YztAeLx/Oj9/v+pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0/aHVDaD/JWk7Fy3MLGdvPWwtaCfYnuPyf1tET5R3SI=;
 b=fr6S1r4J35u54+g0S3syE5JLS1CIOJOA7YXtQEemBgWthLMAw/NfE25QaSvipU+fbVNsO0CUTxlARSdcRgCN+pVip5t4A0qAtqIzPrfMyRvTTXDUri1R9uCLDWylI1WouSIfHz8L4auskGId5ZQa9a3JhWgPJgw1vIRuHeDqbd32OD7UG2c94POvFiiKXH+Dbm2ymMxbe7GvKtTKXdDjQ9iqqef+kN2XfzsUkIZ9vNY4yRJpF+T/8aruvBvjVH8i0/4mvyMRMnO1jWNX1X/EaMZ6YCmKAyKrfvVPBuAjk5ehyyVACuU3KKOjFv7Fis18sdwqTHL0Lm/VlujAjwcgmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0/aHVDaD/JWk7Fy3MLGdvPWwtaCfYnuPyf1tET5R3SI=;
 b=YkgosvTTnoylcYvai5KpiUnV2XwyALI+YIxNyT2KegxDJEpESojYGWzHVS31nwIj836tdjGmiigmYicbBzbDgCem0WsENBoHBBzcDrW6scvmafFT0Dbr6JUTLXnNSr9WBvpA1LDhNXQjORw49qEqnUh0fnftH+HP1ofODxbRbAA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com (2603:1096:400:ff::13)
 by OS3PR01MB9755.jpnprd01.prod.outlook.com (2603:1096:604:1ed::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Wed, 4 Mar
 2026 06:23:41 +0000
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9]) by TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9%7]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 06:23:41 +0000
Message-ID: <875x7cp0yb.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 18/29] ASoC: qcom: name back to pcm_new()/pcm_free()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7fcp10x.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7fcp10x.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 4 Mar 2026 06:23:41 +0000
X-ClientProxiedBy: TYCP301CA0075.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7d::13) To TYYPR01MB7976.jpnprd01.prod.outlook.com
 (2603:1096:400:ff::13)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB7976:EE_|OS3PR01MB9755:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ad3b4ee-3130-4875-782d-08de79b69431
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	1BtLhmaVixGO5FprowF6Z2U5rxZwAAJzi4PqRgIkqi1edJl9ErRNwVC1oglTD1rpMQe8GPWK/cnEavgm+t9KHxweYD95Py3H/g+MSuSo6WgWYdeTsUDrZ17n21egrtC2rf/VZX50R909/vrFW2NmAtvWiKJcjnoQXVWeWESpaPTaAZone+MJQmSOz7DuJbBUxRM5VoI+GLecnp+MQ67hylZGw1plEgVchbk/pFxroJeFlHiMFjfWDRF3w7kDaKoZT70+8JXmJkChqkt+zuxIcWrkWJwkcLj4bd+lNpbVa60XLUlwQIQlNTemFdrMfm6g3NWMIC7Un4NE8BxIpg1lG9UJ1mDsrPADPdnnvxUqQUhYeykC2EnwmP3d4WpSOPnUzDTT5f0kz65pwTmSNX2oMaeVYA/X/3ZUX7uHnwPqAJbjICFaYKx1Ekgp3whRMO7CSuJhwrOB00Q6zIRgJxf6SovHe9dNeN7L8Yi3URl5+d1oRAxWBR8WaLPhX426IinYhZOlNArcIaB60PderkONY1AYkBhw1aF5UNglkL2oEmoZITRz/5wjCB1+RZY3heFxKa24+PrcYREfYVAE3neJMMhaK4g1chq7VQPlmrBo6M+VZ9e+y2ctb3cjE2sXaytWLlU2xdnE5lCcS+pHDWdTW65W4EJakn4nPooijMocP7dflGzdUt+O0GmqdR9mxqKJCBRAeYkZd3mJkuTicSoVbVi7FkfSQCssK/XCflL3oI86AxWBTHgw9QvQ5+4te4310JRi2mdmSIbCTj73Ykf0JD1K54OaKK+tRVLrVfV2tQM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7976.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fYkxbeKNZlgF0wX3+xReb1InL72/Gs0twlJ7IQZFKzzKG1r67BgU5XroyScH?=
 =?us-ascii?Q?Sa8FkxpGztBX3p9KYz5zEoE/lWk3ygZM31JwPW4f7C7n/WmEaTPfOR166jUb?=
 =?us-ascii?Q?A6RAr8nP4X3bXjROpEHhAXxkwzpGHZWZPxqPTuQ/0nZNVQICue+hqiWBEVjw?=
 =?us-ascii?Q?hCq9a4xMNFeuT61jfOcLtb8O+tRpz8BY2JvmRp/6GN+fpm6wAv1subKM7n18?=
 =?us-ascii?Q?Y+CX6jlXsMUd9UWj2RhnmGAJvZvahW/KKrn7GrFHg2YEQTocoD+eBI72XvcT?=
 =?us-ascii?Q?88tpfzvJY+J+KZ0WrKk3Gmlj7n+yRCmGrAH57OmUNRuQbasLTJzfh1oS5C16?=
 =?us-ascii?Q?UHg6xfhySup63hOKiRcT6UIRnOJ6jY/hjDnkOx0zggtZju2i1b6toLnuWCwO?=
 =?us-ascii?Q?ZgGy/FM5aPnUo1RCsazI8rPzOUZldjHSO+YUfqLrJRVFOIkBYhcEe0VLcRFS?=
 =?us-ascii?Q?fHJaoX3+CYOcF++nKGjefCBRbffqszcD4CHxzm2oN+l7drRlKLAArAtMUiVf?=
 =?us-ascii?Q?1zACDVLE0Kpdp9eMavz9qaZBfyOiMLT3T9rR+cDtUhUWoRHHpRYuo2NkhSqr?=
 =?us-ascii?Q?GBk6o9OenX6oI9G9RThXFhjhk22Axql0S7fTSr+Hb3wc4vI6m4IaYujFNpye?=
 =?us-ascii?Q?bli8MdMW1tmjK+twMDMuwDjy8rvwFsLEwtDvNlDStLlLH7aRbfkUENVsTMpP?=
 =?us-ascii?Q?5SZfT/F0t544whi4SdNEf2ET6K/2nPGLiiMCYBZ1vl9CQxmjyN9Gb1yZ6rlI?=
 =?us-ascii?Q?qgwI2JURYMy6DGnt5LaySJGLUfg2LEbCqEVPlYlGCOB6EnvLopbISbzZ1D98?=
 =?us-ascii?Q?w8+Fyr67ASncCgAakcl4tmw7WFOV7Ng6Gzqhm2BwYA2hr79bnY00fQcafqF9?=
 =?us-ascii?Q?jL1tHfplX/SHMuImS2jSVaUGAxLn5MfdjjWgmfvPKi24Iys0RjEJDWq5of/g?=
 =?us-ascii?Q?uIND1KFZZEfEdYxpRaIuxy8SB0JJE2+TnqAArGti5nYyuP7u3Kaos/N2455g?=
 =?us-ascii?Q?sxf4c878FCLtDKfdKdV3Q9MFrEtvnmN0ZI61cE3djdoGrs0xLNw8whQ6cK0f?=
 =?us-ascii?Q?/ykyKPL/NNxe8mMLVkv1WA/Jz5XSj/sAUIO+BY3G5DI6dQRKGM0IXooP9SQD?=
 =?us-ascii?Q?evam1kMSqLGropbQd76zArOQT+3eoAJTL3Mv/IMq3HA3Qwk+R0u18UkwK6rI?=
 =?us-ascii?Q?tr7qMduxY6HGAQ91fwvJIIo3/+3y5qKKwjlo0zlW1sb13lRSyDyeXaO/DBnf?=
 =?us-ascii?Q?BSuFsm6gzOc7farfjOx/iegiKz281koQWH8UCxZ5LWTpPmUdpfNhWAROCG5x?=
 =?us-ascii?Q?jKAG35Zu+diMJcDF0MBcKQHVDFykm6Qv3WOuhN/vAzxHbanftFX0SLE8qFaU?=
 =?us-ascii?Q?eFFVQAqKR2UKmB+BecYUSWI20kiPtnYmoea966oZviZ0fVwxGqns5XX02yTJ?=
 =?us-ascii?Q?sF9O87KFy/2n9yxGS0SVUmGrgUhbhMFK1GHATDV+x1WmjlbEN91o2GnrVC7/?=
 =?us-ascii?Q?+HW+5/DGdQ77UP+Oqly/YzQVHONA5V4XKMJOy++MannNMFX+qmaBom0tpkIc?=
 =?us-ascii?Q?SkmBXH6QbcwfkLUjVkLuHYSPoJ0ZKxoWbh5+fiwRXgOxqwExsL9zv+DYqcUO?=
 =?us-ascii?Q?UkBRPskcY76fnaKLV5gf/JlmFAUOdv+6L5Q59WSweJq/D59c6iz9vKcaFGUC?=
 =?us-ascii?Q?zz3Y/oKmbNKj3xI/Ez9NG9TsvYXoq0VzQmW3BKVENEjFBdu9TIPJowJ/89Kg?=
 =?us-ascii?Q?HYyyX/VUwJRMdr4oVseTWCS4kNLTsZURQiQ5L7QODI7R6deWrf5S?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ad3b4ee-3130-4875-782d-08de79b69431
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7976.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 06:23:41.1342
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J4U85VhmPXMlMwcC7sW9s5Q7LJ6po8oX4JtycWhXgsQ5L9vd/6a0n76l5xPPoQK1ZhzeyosoAYvFTd8AMrBNB/mA6zNeJfRrtz4mkuHDhhfpTH40kodj/evtr4++n5Qh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9755

We have been used pcm_new()/pcm_free(), but switched to
pcm_construct()/pcm_destruct() to use extra parameters [1].

pcm_new()/free() had been removed [2], but each drivers are still
using such function naming. Let's name back to pcm_new()/pcm_free()
again.

[1] commit c64bfc906600 ("ASoC: soc-core: add new pcm_construct/pcmdestruct")
[2] commit e9067bb50278 ("ASoC: soc-component: remove snd_pcm_ops from component driver")

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/qcom/lpass-platform.c  | 2 +-
 sound/soc/qcom/qdsp6/q6apm-dai.c | 2 +-
 sound/soc/qcom/qdsp6/q6asm-dai.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/qcom/lpass-platform.c b/sound/soc/qcom/lpass-platform.c
index ce6896cc015dd..e162627d6f86e 100644
--- a/sound/soc/qcom/lpass-platform.c
+++ b/sound/soc/qcom/lpass-platform.c
@@ -1268,7 +1268,7 @@ static const struct snd_soc_component_driver lpass_component_driver = {
 	.trigger	= lpass_platform_pcmops_trigger,
 	.pointer	= lpass_platform_pcmops_pointer,
 	.mmap		= lpass_platform_pcmops_mmap,
-	.pcm_construct	= lpass_platform_pcm_new,
+	.pcm_new	= lpass_platform_pcm_new,
 	.suspend		= lpass_platform_pcmops_suspend,
 	.resume			= lpass_platform_pcmops_resume,
 	.copy		= lpass_platform_copy,
diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
index de3bdac3e791c..7a6a1d673e875 100644
--- a/sound/soc/qcom/qdsp6/q6apm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
@@ -831,7 +831,7 @@ static const struct snd_soc_component_driver q6apm_fe_dai_component = {
 	.open		= q6apm_dai_open,
 	.close		= q6apm_dai_close,
 	.prepare	= q6apm_dai_prepare,
-	.pcm_construct	= q6apm_dai_pcm_new,
+	.pcm_new	= q6apm_dai_pcm_new,
 	.hw_params	= q6apm_dai_hw_params,
 	.pointer	= q6apm_dai_pointer,
 	.trigger	= q6apm_dai_trigger,
diff --git a/sound/soc/qcom/qdsp6/q6asm-dai.c b/sound/soc/qcom/qdsp6/q6asm-dai.c
index 9e3d176f50c24..4f8f7db6c3d39 100644
--- a/sound/soc/qcom/qdsp6/q6asm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6asm-dai.c
@@ -1224,7 +1224,7 @@ static const struct snd_soc_component_driver q6asm_fe_dai_component = {
 	.trigger		= q6asm_dai_trigger,
 	.ack			= q6asm_dai_ack,
 	.pointer		= q6asm_dai_pointer,
-	.pcm_construct		= q6asm_dai_pcm_new,
+	.pcm_new		= q6asm_dai_pcm_new,
 	.compress_ops		= &q6asm_dai_compress_ops,
 	.dapm_widgets		= q6asm_dapm_widgets,
 	.num_dapm_widgets	= ARRAY_SIZE(q6asm_dapm_widgets),
-- 
2.43.0

