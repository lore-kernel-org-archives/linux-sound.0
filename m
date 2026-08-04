Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010071.outbound.protection.outlook.com [52.101.229.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4559C37F30D
	for <linux-sound@vger.kernel.org>; Tue,  4 Aug 2026 00:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785804248; cv=fail; b=P68yOP/oElW2iQ4CYZ5/L7uo9tYMNWG8TlxFsoCooExgHVOO9MN9TU6FstG5H8rajxfiwpNgNoMRJf9gj4RVBN3cCMW96xVCt5sHTXsS9fpLABwu4VhOZAPIneJWu13MOBHlx/W792q7Ix6K8lOZYZt0RyMhrtYNo3PLqK/rgB0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785804248; c=relaxed/simple;
	bh=D2lvIpzl2FDF7GqnxAAVA7AJer3b/xwlJQJOqM1bdUo=;
	h=Message-ID:To:Cc:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=n6s8JX6xxocn53FeCTyeYb9PVLJrATVQrPt/8LUSUD4NF6MYgNgIstA75RokAW0yBm05sJsE14EoLX2OgSsUaTxRRSYaNsgOdOgNghdAShL4eUIVK3w5O6J1LYPrW1xF0vN4WQE/2h3OU5WKRQgscmktIVkMqk1vKTI7DuhY56I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=UcPahqZB; arc=fail smtp.client-ip=52.101.229.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="UcPahqZB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NOBHqoLcbhTJueaD3jj+ygyMSLPXIo0qIHJD8oGD9uNkSUwS1LumFA9p32GmQhxUcKNug64W12uqVfF8/3y6lqpdjakGOQ1w1SIjDsi6G5f/m7R750ZaDtGR4EvCiA4XIG+EkQP2DgQC3cNHWnRCspr72FN+5edR8Zo7V2lG8vtEA5OcA1RK7RzousVRVfO+ZeXJAherEE6CxbB0/s87aEeFN9WSOyfIijJCGDyUAJAR/YrPFfVogZfKA/5oOhB3huI5Dal0FOntFm8PnAiGwoMmon+Gl5doi9/8ZGSkw8IM5nzQMiNomrEG2xYOIhAMgZN7noK1d8LSQiixH+zkjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ax0+PlhaSomtklhOu0OFMMtM1WxeYDUIINXdU7d7ddM=;
 b=x0Z2jSPXlI4mL2LTcEa7zWji6/v6umQMNK57Rk9Z/w753bRuSiRNAeGnqbU7PjAEMlXEj2BuWWsaVB6WdUXX2FEVq+Ochl05O6b3ZOFQupJlfiZbW7zbjP+XAdGtbai7LDJR8NMnX6aame6eXoPVEF2OMiRhH9AnqWUtAqYCswC3uccTajtB7iJkxPkzKn6tlVWSsjaknZSDPN4l1wOYyCyhY8DU1XqqM15XipN1eUnlR9IudtBH8pPWaRhIy7j1nmmr94yd7q+pp3bUpQ8zTx+We3xM1g5r/nfY/x59o3w0TBW7wdzw3Y3UtvoZj+W8iDWAIVKB1IjseR/vosq5Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ax0+PlhaSomtklhOu0OFMMtM1WxeYDUIINXdU7d7ddM=;
 b=UcPahqZBeocsFwLTp6MIKZENUKDicvVS2SHfPUVvY6fw8GKI7wF+KYPTIpThBwFnJROzfCyUdngJWfhDw5CGNGhfCTv7nqrwSl5zsX/q4+egsquIsqza+de2rNVU/PMv8MtYjay+b3k1o4xhYDAMoQ+6u8d7Lrwiffm83zO65Yc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYCPR01MB18293.jpnprd01.prod.outlook.com (2603:1096:405:3ef::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Tue, 4 Aug
 2026 00:44:05 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0270.017; Tue, 4 Aug 2026
 00:44:05 +0000
Message-ID: <87o6fivhnv.wl-kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 42/44] ASoC: codecs: uda13*: use .auto_selectable_formats
In-Reply-To: <87cxvyyazi.wl-kuninori.morimoto.gx@renesas.com>
References: <87cxvyyazi.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 4 Aug 2026 00:44:05 +0000
X-ClientProxiedBy: TYCP286CA0114.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::12) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYCPR01MB18293:EE_
X-MS-Office365-Filtering-Correlation-Id: 959e6070-d2ad-462d-9b2e-08def1c17c6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|52116014|376014|1800799024|366016|38350700014|56012099006|11063799006|6133799003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	2dzau/U8tSNLKY+7G7zz3HSIvQ62cnfw+Tir6AUMby+Qcu1u9r7VwGB6viBtTC/kJNOs5Yj+wobAQIO0j6hfEXXp/P30VvHaXlGnkr5VjQfOGKw2qpk3VGn7J58PgsozqxMG9gBmhFcIkZYSleVJUZmVaraOmJsDIh2mVSGuw4c62aIlnLqbNO5YRve4tOGyKb+IiLM+XhTm+K8eb5WYtsqBWj410/d71vFjpXB6Ng6UHQherlT3mhyuB0UQXY+1zLvI8blloYnJGBB8CKNkRrzB7Kn9TAd4RTkroH8mS6LDsJ8103hj01KGyV24Rggg+3wjEEkdl6BPXOwvUFlRYBQgX36Yp9k+UIX+k9m4qF3HGVUub6d715uS1hGTsCeFPg0x5wO2lN8c/kpyBhnub+X6bSPKAdCCj9eXPxOnrwsU78O4N1Ugv5tPCxk9zkkcYvr2pc6E+fl45zJH0QGjsfok1qZIudNGx++1gEyvdjJrcxIV3kvYPUeoFH8fdOLmx16rnIYJ7umSIsm7SUSddMKZD0ugG8tFZ1ODkt8xl8PiZbNesIvV8mBI12D/mLvogzFEuAG4m6mME8w2x/Xdq8eURyJXmR5pGM7a1si/nh7LZCXmda/xWSRP1BjJBAs+azuMvjy6EWFqka1Qr00mUd7hXcl2qPcGuQ3KYPL7TKCM3wXLrbZ7Mb1gkchNdoua3O1ee2HpwWMHYGqcFjbWzq5qLnPKQGK40v3nK4giSSg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(52116014)(376014)(1800799024)(366016)(38350700014)(56012099006)(11063799006)(6133799003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?k4riUmjCEDzFmLMSDIO9DwbRwwIVvHYjakcQ2mO3u1QzYDu/qjPpg/nBRgID?=
 =?us-ascii?Q?76r3e3QkECsj7lal1oqsGdCygWyJmoGX7R454B3SVXnpsB+bD3VRyK8aKTPl?=
 =?us-ascii?Q?lPxu0DOSRK6gffN7KfkQGuJJ/9UEjVDXN4cngMuqJ19VzvPLYOi1mOaOSyRG?=
 =?us-ascii?Q?ZuO9oE84gFl6NeyELBMLIdYI2FaJCOFGAPl9fn/GI9xEahUnzS/6mPIVz/eq?=
 =?us-ascii?Q?5WNn10WWdTQZWI3jjqVgU+CbvBQVOafdyzZhAdZw9AVkb2GI0FApnGilUzzb?=
 =?us-ascii?Q?fHmVw1EIrKoq7rMOmEQy6GA0gpoxpG2BMb/pCkkZ/TzVzfK0fPR4HcMgoOB/?=
 =?us-ascii?Q?hf8dZzo51dRuULHd+Nx1i9bQvXg+DGx028a08dVjiqK7elOw1Qq5QdPZ4DyQ?=
 =?us-ascii?Q?dZVq9pLSbRDMwHQG7sJyjqP+lyLg/tqrNC8EfkPdG5qBkSrnozQv75uoF/zx?=
 =?us-ascii?Q?YcnyaIlNfiQxSv4i3/bqzjrY7bZWL0BA3xm5w3THkZ+x+T0L0aL3gpkjE7PW?=
 =?us-ascii?Q?1Uidbw+V3y69aSr/dEamRHDGXMryd+9dKML4qcXESidtar+EEU+k4k8W+CZ7?=
 =?us-ascii?Q?x0Nj0BnYPTnIqh5Ec64GDMhEsphfa69/Z5BIt4LPqAosqNxHTouQ1AKKp5/B?=
 =?us-ascii?Q?mxK/5mva8vGXtA6I/i2C9gecOw5qFViLfe+YGzI7ZL3En9bT+Aa9YQ0byzkn?=
 =?us-ascii?Q?fhlqrmSxuuChfI4Uz1mbCvKAJ91aX68JRkiDb03hIdpyMOJRKBawimX8NIEQ?=
 =?us-ascii?Q?zyHTMsgfsTa4StPuutAZHYHuOueLBpdVdwkXVWfNzBZdo3ywofMSyZTrSaQl?=
 =?us-ascii?Q?Nv0HFMi4sWgm9fOYJ0M7o1SM02fjmqkfrnKskhUyjTs4ylWEPWTDSkXN2Hms?=
 =?us-ascii?Q?ez0t/XFTXB9of/nKASC4UFiy4NsPja0ZEzhNqOGigYO2wQBDkPNU9RC0zgYP?=
 =?us-ascii?Q?2VpnvfJhbWSXPD3nqiE1WBSloOdDY0EdQ80X6ySPM/f8dC9D8hvHV3lXgwMW?=
 =?us-ascii?Q?Zk/GpxPbDOft34au9To5sG0oLrZs1Nol5YqVcIDTiL298UwvNQlxR+kodCay?=
 =?us-ascii?Q?gaijXKEVqttUX2sN5Hkjp3QxnwmkT01Y/Z3vKnEQPnLysZ7WN4q1w9UYzf7u?=
 =?us-ascii?Q?vgqGdlZu6w2vEcq7R64JwKUzUdtxd3fM7qTr5L111l0pCzxu9nfS8/0ImBc1?=
 =?us-ascii?Q?2XkBNvXMM1unNclFmBwixTypAsm8FHxqPIlj2HS/7X7tascT4kk0Mz2gcLcZ?=
 =?us-ascii?Q?jZ8avvQ5HyTLg0GNXPfpIgkOw0Ka1lxm20lTPFSVwpycaWdODvNV4LaAdoDs?=
 =?us-ascii?Q?6V2Tf46hqqg1oWZkWxaA9NUZegXkqJtmJQ/9JeDRVEofx0cpOQCVK7nFO6V7?=
 =?us-ascii?Q?+8zaSn6VqTOrdZMzkquUIsI2aOZb/VT4f4byBuRzxqJ7i8AsV9ebHDVweNXd?=
 =?us-ascii?Q?15MQyl0BduHWLAfW0sxQt70FeCLXGDxkEPTBrmUk2AfgyBXkMWsOMGCIlsPR?=
 =?us-ascii?Q?Oorh6kN4Q1kjk049cR31Xc9A27NEIONrERlLvXQDjEMUbFVhoB9Qs1cN4ZBj?=
 =?us-ascii?Q?/swnG1uQ6nhoyyivLujUlzozDpK67LuKPHbFGgewd27np/7eDk8+5ELpNo2f?=
 =?us-ascii?Q?4LhVriTGEI1pRGDYvNug4/4egyozHuZUo6ZgFm1GHRJfrKzI7ccZaUhupu16?=
 =?us-ascii?Q?QRlefOppUUN+CX99ZjEPi8GU1pEVdVlkktE96nxYW1d45YjwMcckjeLPjDiU?=
 =?us-ascii?Q?0oppxZ63ZbpqqGF4wI/hCCCKYJD0nhTQMT379Xn0SgCCXSdNBniL?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 959e6070-d2ad-462d-9b2e-08def1c17c6c
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 00:44:05.3354
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4rUz3ndAMohVi0NqMwTjNerlHordb9Ho6NM+5rGs0zPI9QD5TGMusl77O1SWZvZoeFoP7z2wLzCN64LGDZx/qgFNa0UK3Z2NeAp/rbgqQ8BFt8w3lA1Pu3pMRfTHQ0pv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB18293

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/uda1334.c |  6 ++++++
 sound/soc/codecs/uda1342.c |  7 +++++++
 sound/soc/codecs/uda1380.c | 11 +++++++++++
 3 files changed, 24 insertions(+)

diff --git a/sound/soc/codecs/uda1334.c b/sound/soc/codecs/uda1334.c
index 54c5cb5b3d4bd..7ae6afdba38b4 100644
--- a/sound/soc/codecs/uda1334.c
+++ b/sound/soc/codecs/uda1334.c
@@ -193,12 +193,18 @@ static int uda1334_mute_stream(struct snd_soc_dai *dai, int mute, int stream)
 
 #define UDA1334_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE)
 
+static const u64 uda1334_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF;
+
 static const struct snd_soc_dai_ops uda1334_dai_ops = {
 	.startup	= uda1334_startup,
 	.shutdown	= uda1334_shutdown,
 	.set_sysclk	= uda1334_set_dai_sysclk,
 	.set_fmt	= uda1334_set_fmt,
 	.mute_stream	= uda1334_mute_stream,
+	.auto_selectable_formats	= &uda1334_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver uda1334_dai = {
diff --git a/sound/soc/codecs/uda1342.c b/sound/soc/codecs/uda1342.c
index 4e2d6240a8695..63d087590ac99 100644
--- a/sound/soc/codecs/uda1342.c
+++ b/sound/soc/codecs/uda1342.c
@@ -223,6 +223,11 @@ static const struct snd_soc_dapm_route uda1342_dapm_routes[] = {
 	{ "VOUTR", NULL, "DAC" },
 };
 
+static const u64 uda1342_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J;
+
 static const struct snd_soc_dai_ops uda1342_dai_ops = {
 	.startup	= uda1342_startup,
 	.shutdown	= uda1342_shutdown,
@@ -230,6 +235,8 @@ static const struct snd_soc_dai_ops uda1342_dai_ops = {
 	.mute_stream	= uda1342_mute,
 	.set_sysclk	= uda1342_set_dai_sysclk,
 	.set_fmt	= uda1342_set_dai_fmt,
+	.auto_selectable_formats	= &uda1342_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver uda1342_dai = {
diff --git a/sound/soc/codecs/uda1380.c b/sound/soc/codecs/uda1380.c
index 1dd09d10fc4ad..02adc534dfb06 100644
--- a/sound/soc/codecs/uda1380.c
+++ b/sound/soc/codecs/uda1380.c
@@ -653,11 +653,18 @@ static int uda1380_set_bias_level(struct snd_soc_component *component,
 		       SNDRV_PCM_RATE_16000 | SNDRV_PCM_RATE_22050 |\
 		       SNDRV_PCM_RATE_44100 | SNDRV_PCM_RATE_48000)
 
+static const u64 uda1380_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J;
+
 static const struct snd_soc_dai_ops uda1380_dai_ops = {
 	.hw_params	= uda1380_pcm_hw_params,
 	.shutdown	= uda1380_pcm_shutdown,
 	.trigger	= uda1380_trigger,
 	.set_fmt	= uda1380_set_dai_fmt_both,
+	.auto_selectable_formats	= &uda1380_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static const struct snd_soc_dai_ops uda1380_dai_ops_playback = {
@@ -665,6 +672,8 @@ static const struct snd_soc_dai_ops uda1380_dai_ops_playback = {
 	.shutdown	= uda1380_pcm_shutdown,
 	.trigger	= uda1380_trigger,
 	.set_fmt	= uda1380_set_dai_fmt_playback,
+	.auto_selectable_formats	= &uda1380_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static const struct snd_soc_dai_ops uda1380_dai_ops_capture = {
@@ -672,6 +681,8 @@ static const struct snd_soc_dai_ops uda1380_dai_ops_capture = {
 	.shutdown	= uda1380_pcm_shutdown,
 	.trigger	= uda1380_trigger,
 	.set_fmt	= uda1380_set_dai_fmt_capture,
+	.auto_selectable_formats	= &uda1380_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver uda1380_dai[] = {
-- 
2.53.0

