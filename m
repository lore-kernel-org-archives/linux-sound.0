Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011055.outbound.protection.outlook.com [40.107.74.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A21AC30ACE9
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 04:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760415920; cv=fail; b=R3jAg9lNvDBxXvgI8j9JeTfB7Vd21DvF5mnU7kQWd/2YM7XAxxEL0l5+85+V/Fflmc5j/a7q4q6MLt0Zid8LRDuAsbODsqR7XQx5LAsBPqQ7MtwpzN2A8nqpq8OGKsFWKlmP/lRLfsm4JCRNdhJ3go+Hbj0VGe+Ug+dNp6moE7s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760415920; c=relaxed/simple;
	bh=FvB6tViumNdhDiu/dOD9l4bGZFc3Baal+oqdvipujok=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=GboyhrSY2iaunZlFSwOkkYMTSWRLav90XxtwCk6zWV8Rf7WrzjKys0s1DXnx7cp65kBJOcnumahym8YIvI2SpYnCcrhth3jSoTZq308T5j4xxQKrGcNRpGOhVsBujda1pxjtaGxj8dShCUTYM3sRcuXmqr2Rmn81EYTjpFMShE0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=QH6Oq34N; arc=fail smtp.client-ip=40.107.74.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="QH6Oq34N"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q8ZnSHZwFpNmDaEZh9ah9000nUCkz0DVuKI8iNB2RaCqApFVC149VVh/KOuu+GFbAcKi6mcB74lyx2KAE+rJ10MNCJie/U8CX3yifsCftA17dTpPBegPVewObLyyP/vv9GEFh5Ta3J/cOxmiBBmgzdnNoAoLjrSK02EyhfoOn9bN+XUKsH54xtzfRGGO5gCn96YZsT3X3Aod/zyx+2vFemfO+ga+7XiD0R7xi0kU4J6I23zT7ur+B+Ob4nfgVXu3FBUS4k6lBTCjQ30+H0B7WAs9emaQG3jM6YKPwxv4Z8lOc0gWa7m1+9KhiKs/B7cwKglapQmSnhotSvCQ9mgnbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0ndgGV+6K8NlrvlaE2dM0wpkGDLY7xTMm2TBD1TrwPs=;
 b=VH2voOMxnvisoxaQhyWazgdkFtfpmUQ5iN9/RRI4MbLEz8mzT9bovMLZhIBOyYCOCpg2WNTPn9GHP6ypBcPECozgQQnMwJDX7L6hjgvpMqxv5ivQwRPM7nsLAm+lBkCgPOlhGSFTZJEVEQMRT2xaV7PfhdxOgIyikwmBj7nH1FPlQa+hHi+lRgpVoqYYwLORG7PYM+Nt/DcIGVIzXp0MfzEH3q1YC3ioCl5dpDpT58u7uTwkns5AYRSE4nU56w7KuTUMjNaoCr6juLdmebsSjmSDSHYeXQ6cjujoLOkQI2nGh6huX4Yqm85aqIx6WTjzYQaCDlyUmh/voXpqDPxGng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ndgGV+6K8NlrvlaE2dM0wpkGDLY7xTMm2TBD1TrwPs=;
 b=QH6Oq34NlFxfBiPuBmeAxFI2+CcPwIFUNonDUwW+AeXP2tuSmCVWkQfFPGZHZm8irAJUi3lHGkbu0eGe6BY/uqnz5osgpnmYtWQsGf3jZ0k3Dy3l79jfXJoi1P3fv7pB3L3tbshgeITZ1xWWMcCameDF2ooDROXima4US7zrPA0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB9449.jpnprd01.prod.outlook.com
 (2603:1096:400:199::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 04:25:16 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 04:25:16 +0000
Message-ID: <877bwyp0t0.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 092/139] ASoC: codecs: twl4030: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Oct 2025 04:25:15 +0000
X-ClientProxiedBy: TY4P301CA0059.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36a::12) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB9449:EE_
X-MS-Office365-Filtering-Correlation-Id: ef838c95-cdf9-4426-d9b9-08de0ad9acf9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?i7muOZeO7njN2JeQsMdR+DzYdenQM88jmdMVpEYrX/FHYymIg2BHkynlKXH8?=
 =?us-ascii?Q?6G50spmWYARVqHMJpkCccay4V3b6m2QLoBaVSfpqMAxfPoSfNm7CcGnJyma4?=
 =?us-ascii?Q?WCHeTryuQKNuqhZKY+mUW+oJDOt46mC6hAzczXcwhfujh4It+YAhAFkS6e/p?=
 =?us-ascii?Q?xrPfo3cV189/bjxRqBlvlWkZqGee+rO1H6wixFODumwrUExl0fdZCvBAREQy?=
 =?us-ascii?Q?YF7BjH7bKM4kk7EDNKPH9YGqcVMhqNBtf1mw72bJG0nFcVTpNEd00hQETwuS?=
 =?us-ascii?Q?hj+24cxoBxkEF+AOqvpzLyOk5qk1UfGM9GWhGSIabgFnlJTpok7IDyr84ba0?=
 =?us-ascii?Q?SY8T6n7qbzLX8MrnIndgsac9XC/SDMfdqGi2pdBcFWK522w8M/FAIq6SZ8YD?=
 =?us-ascii?Q?V0EwN6aK2tQWhgdi5sEFt+LKQbQgd8Xe614tuMPMkGFICLpO8J1v+M7mlWEZ?=
 =?us-ascii?Q?sZHRipHeX4X74s7Z2EnRT14Tyka7QHtuAQ45A3JrblwVSv5fvrgTEjXYt20H?=
 =?us-ascii?Q?SyQia0liZltWBpOz3X4yf4DxDHIhja1v/gTVTR+/sZ6bJXnEgEKdyDn7sjUo?=
 =?us-ascii?Q?R94WgUZUV5NdFFzM+YNhay/9SyWVijndrIPjfLKmikqTRBMWD/QkL9SqbgcX?=
 =?us-ascii?Q?wF/EuqwKrPYw8x8tcc2AeFV4ZWAORvLUz1At171tEKvnTvhj79Zkk6FgY9mZ?=
 =?us-ascii?Q?4wwzS6UaBVVRR4EFiFupHj6hKuvE4EJFE4ZO5Z14pOnwAcOWKMUE/Ngs3N0n?=
 =?us-ascii?Q?zvhqJ4TyJwZ/4Fg4y28iNnmF70NCHbpRa4DTg3wxdFOEVVSpcROVaVaFIaVq?=
 =?us-ascii?Q?m8vymDQiooPyygB699W1zQ4lVWAAggen0q+82kihWGZW7b86WoNodxN8VmSL?=
 =?us-ascii?Q?GbZLbqMFLX9rU/eTc7GJgPLsyNuqxA67HOvWgu1MmRUUUYLae7tiw5ofpzTD?=
 =?us-ascii?Q?1QsYukNoERmEzOpmp7HOyuo+2hhdjNq70DJZehPOODof/D3KSxKBe9WuHFMm?=
 =?us-ascii?Q?iximmdrPtRyRElKgbm1ivAtzYBZQG2taZKNBiXyHVCuZx3Q9HdcAQAhCfEb1?=
 =?us-ascii?Q?xmXfydExp256HZv5InFGUv0h95AmoototXmDMDqDg3Dt229TZT4KFa6MTeYf?=
 =?us-ascii?Q?qn4BC6wK2ibt9VMJv6IQEnZCvWp+Xax5F6lYuHOiQ26jADNoYYEBweDuhYEa?=
 =?us-ascii?Q?a7lqu8D9Mw4/JKvIoSXfJm6TnqOW7HGxjNjiqz2OaHqakDbWe0JKN6geuOBr?=
 =?us-ascii?Q?10FqadjBp1dEErubhnKhACuUnT5So5H07fzDYm3pDky7nQkvDc8WRAwYknA9?=
 =?us-ascii?Q?mHitRSHH1Omel+NcfBwiY2Y8eQYk+wUFB2gmg8EJdfHeS+dZzjxFfqEgOWzW?=
 =?us-ascii?Q?gUWrqNw9ZGZOrLglT3jy02HLA4mJ0+c0qClMYVjHvGZSwhNNnwydqZnDAI4O?=
 =?us-ascii?Q?cVGDpYFndnllgXFyHS/x0jW5YtGE4XkT6IuDeXiVWuWDcYojZwg8/8jbSVv+?=
 =?us-ascii?Q?SsZDdjHXSR4QyXqiIaJPHg/92pTBlVcV/M2Z?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9DRK8FYEFB8IhzGqWzIwH5sXvCqSLNQ0HJ+a8lZCuE4qYWoNI52Lat/ublj6?=
 =?us-ascii?Q?WSDw8D9GwH2VvMsDTRu9ckNaT7szDSKABOWcuaPOln4JkHZ9gSpXUWVFnHWi?=
 =?us-ascii?Q?dPY4qwVIVwEdZWYyVCEM+hbW3BM63ZZqy3Pbj7AkyfG0yBmPWbdCZuze2O/B?=
 =?us-ascii?Q?UFaN9qjNg16cM6G5HvUfoyIQBC1EfNldy33FwkmhEdzAVAxB4a0tNstkRx/K?=
 =?us-ascii?Q?O/sf0APZZF4zb7yxal4StzmcCNcZlLUAuXDSUiDPqDKx0LKOgqjQKn29MuNu?=
 =?us-ascii?Q?6peV8U5sm0T8ird7WM3guGz0AoEdEvvoQtGeDKq0mbYfUm2Rrkzo8l2AKs+F?=
 =?us-ascii?Q?QboLRcuZEgYyq0cEZ4yL2KTu1BYzdXmYsWurRdmAFBeqh8dBsog6W5KKRr8k?=
 =?us-ascii?Q?0h9TMG6BARQNBBA6o4GB1z+pURPV70nF8RCFjXwFS3BThEze3ZZLzIXEyhzg?=
 =?us-ascii?Q?hdbrDFBsPVASaTZGuOVoRLPabEIxTmbaRI7a+5MqLQYQlGPa3BqF1r7BfMiu?=
 =?us-ascii?Q?YAwHlUFKdH+iGJffFm+cI30FpCGkbHkDqdIgv33plvTq/6YfHw03jvxri0ef?=
 =?us-ascii?Q?AYPG5rtLuO0XrjZ41Ee9c7V+VnbggBQCcsp+nWUxn9rK0TU7GPkzqbBp0G9l?=
 =?us-ascii?Q?FU6FfFcuwjt5K9v9kTZpKuYz54K2OqsO6eYEPnz3ovc9MZwudHfW0So5E2fg?=
 =?us-ascii?Q?Tx4ZTx0oRFCwt3jKREfEmw9h3+CaIr9ii9YzqlERfMzWFoR+YPZjJgRWWifc?=
 =?us-ascii?Q?+DEW+Tj9gsRzz1Y3Jt2Grahqom3W+GcfZcEpDazyxGOdoiSeX/zD6Ec9YrH7?=
 =?us-ascii?Q?5s8cYlfk6eBNYG3dBMuBjtXcw5gnvoU5mblekEpqrCkozEFJXl2rDtHrbDM3?=
 =?us-ascii?Q?8/tuaIUMyrhuaktseX2uNeYxqDsCrjK8UxZvTjIBuMUtwkTXVqUEEXvav1Lu?=
 =?us-ascii?Q?Nh4xn4x3pDZ85eMvQaM+PmJtjobvC7zoUOAfYl8YWzF2wqgBxLnpSuhkFtqv?=
 =?us-ascii?Q?cMJoGGDDRTK+YLAhc5bXI1uQiBsKTRaMfUZvjQHnhDmlNUA5r9z5avX8vxJq?=
 =?us-ascii?Q?pTT/qA7QMkW2dpQGjRc4jfC0Pc6jEBdBSKql2OFC0AuhRYsZD7h47jbC3lDE?=
 =?us-ascii?Q?Ykl51B5OgHdMLKQTHTKQqcvKHPjoe/vzVSC9eVO7BKwBZT97iLN87iUAuGJe?=
 =?us-ascii?Q?1YRjnymV9Cjqhz6EZZ+vN+ZbhZ/RLIfyk6OhdAnEAiL6dC5xBGVdxvCTAIAV?=
 =?us-ascii?Q?mtNl4WdaOG4JxxgCkl7vEA0ztg+tU0hSOyVvUVYUzgnM7UYgmPl67EIhNzTQ?=
 =?us-ascii?Q?wpyLdsyYAXyiGGgPQ6xTRD9uDr3TnikaMBpHWaPWIXk146nKoRTH5lc51177?=
 =?us-ascii?Q?/SJf0mNjwKW16HuvbNRBCcW8aTDEngI0z/sQOObIt/AQOWbySWG+yChG8qYe?=
 =?us-ascii?Q?hh0USORHS1OKGRJCYJDtjy5goHGtxuM2rIMWx4GwtTjgfMXdPehnPZ0G89jy?=
 =?us-ascii?Q?gRaepakU8LSXQSSg1PGB1PJwayXnTfwUPjGskMX/0SX5uVpyDvqYgw/aespT?=
 =?us-ascii?Q?3MSfJOCGHC2GkjR+bsBFzl4toj1DP5yrG6u7ZF976IUnR+Mtt4NeDoE2x1pU?=
 =?us-ascii?Q?6MD7s01yy8grh/RBhVvLMeM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef838c95-cdf9-4426-d9b9-08de0ad9acf9
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 04:25:16.0545
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gHGK0d+XbqAvvkuxacFISwMn4fEPYv4u4Gy0WKYBboaaJ6Vw4n/VokZmaHZuaz9joXwLyml7D4SFSzAXXNtOlkiwir93gUuUciVPKFgB/RKnUuL7YAUn6Y7KjAM786jj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9449

We have very similar name functions (A)(B). Both gets component from
snd_kcontrol, but (A) is used in callback functions which is registered
through snd_soc_add_component_controls(), (B) is used through
snd_soc_dapm_new_widgets().

	(A) snd_soc_kcontrol_component()
	(B) snd_soc_dapm_kcontrol_component()

(B) is using very picky way to get component but using it is necessary in
ASoC. But (A) is just wrapper function to snd_kcontrol_chip(), and directly
using it without wrapper is very common way on ALSA.
To reduce confusions of similar function, let's use common way on (A).

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/twl4030.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/twl4030.c b/sound/soc/codecs/twl4030.c
index 92194579e15be..afffb0af55085 100644
--- a/sound/soc/codecs/twl4030.c
+++ b/sound/soc/codecs/twl4030.c
@@ -830,7 +830,7 @@ static int snd_soc_get_volsw_twl4030(struct snd_kcontrol *kcontrol,
 {
 	struct soc_mixer_control *mc =
 		(struct soc_mixer_control *)kcontrol->private_value;
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	unsigned int reg = mc->reg;
 	unsigned int shift = mc->shift;
 	unsigned int rshift = mc->rshift;
@@ -859,7 +859,7 @@ static int snd_soc_put_volsw_twl4030(struct snd_kcontrol *kcontrol,
 {
 	struct soc_mixer_control *mc =
 		(struct soc_mixer_control *)kcontrol->private_value;
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	unsigned int reg = mc->reg;
 	unsigned int shift = mc->shift;
 	unsigned int rshift = mc->rshift;
@@ -888,7 +888,7 @@ static int snd_soc_get_volsw_r2_twl4030(struct snd_kcontrol *kcontrol,
 {
 	struct soc_mixer_control *mc =
 		(struct soc_mixer_control *)kcontrol->private_value;
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	unsigned int reg = mc->reg;
 	unsigned int reg2 = mc->rreg;
 	unsigned int shift = mc->shift;
@@ -915,7 +915,7 @@ static int snd_soc_put_volsw_r2_twl4030(struct snd_kcontrol *kcontrol,
 {
 	struct soc_mixer_control *mc =
 		(struct soc_mixer_control *)kcontrol->private_value;
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	unsigned int reg = mc->reg;
 	unsigned int reg2 = mc->rreg;
 	unsigned int shift = mc->shift;
@@ -956,7 +956,7 @@ static SOC_ENUM_SINGLE_DECL(twl4030_op_modes_enum,
 static int snd_soc_put_twl4030_opmode_enum_double(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct twl4030_priv *twl4030 = snd_soc_component_get_drvdata(component);
 
 	if (twl4030->configured) {
-- 
2.43.0

