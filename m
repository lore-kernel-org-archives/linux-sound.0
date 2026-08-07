Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010022.outbound.protection.outlook.com [52.101.229.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 043D0248F7C
	for <linux-sound@vger.kernel.org>; Fri,  7 Aug 2026 00:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786064199; cv=fail; b=Snpe8epjvlOkguPdE2gK+k9BFGpI4l5V+iB9CvHKFxueAs50pMNk+RKsBd0kgFwt5lWwYq5bRf0AYf+UABJXCYVTwrFSBBh+f/y9xKrhr6Pkn5zf4ZaQp/cqT+1i1marAnMcLqQNI7SWOqPUWDIS2ZQFNFIbF6Asdq7I/nqpSVE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786064199; c=relaxed/simple;
	bh=bsOoXr3KNp0ZLDzdrepgbxGvRLFs37JdrXQwOIdEfTU=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Gg9BUjUJHsDe0V/cA053dnUUsVmodFX/6FkUB874V12G5lkvXIR3THbkhoDsRMYhLB3LyTFN4MtIyK8Pt3BZ6OVyTQEWGRhTCigAyfsX9+cI8tS4Co4uhHGxpDl/Yw7cdCDz1F3Xz3wxY7F6ZIOhDTpMX1bU2FT89lYwkakEnZg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=HLQFa7c4; arc=fail smtp.client-ip=52.101.229.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="HLQFa7c4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OZQW/wOc3S+8SXJ1WvavSCqUMsyR75Owtht1Ae1YFYHPhV9+cgrBbJvMg3oXVEfUa4eadeOqkrBX4HVozxuhkQwRwPsJvcR3+GpTcOlydkT3i3kOyfwMrSgF7GlrtzmEWDLXaC9CROe6Arxzb7FqO7rujs2sYivo06Nq4oAoGrfNaHGcVKHtcgjBaKHetj+5/Vh5ePkBdqUQhzovHYS1EYdfh8OdaVJlYRsyLTRHU8nhb4YR21rljhayP7szGoIOZsNzDF/VfbQXLMiqLsPs1MwlY7piW87PtkkSS6+1HKvEol5OJkTlxMw0xTJeN0Ylj1YSQFSyJBTQLWe+xVtWHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+KTXAdik7W1QAWuEJJOwnCZW4vsZMBkUHQRG6iKiN00=;
 b=BeyxQzUzjAW6E5EAqxybF9FV16OyLHT7bH6SbvyLs9RA/MQIuTb4Yk/GDSEX8zi9oKscnOaMO3rKjpBPO4XnDi8ceeT+LphkjtTqeKDSG9BdxBbUKzP7rrIKwjA39zBNoxWMdym9Qhk1LYzBa9s05DLqruLEzPy2HECR2j6ZFx1ZwPIDkpx9iJw4gPS31D7uwCy/hvkCwwZEQmfqlOW7R1Dlk0mt2wrdzYsS5lNpW8DgXGQpNJ9qpJjm9Bc9cKVVU0vcELj2BFJIMN11Yz0yOhstXJymQgUks1WftH/WH8qugje3pvy1aerIYEg6I9Db0h4SnYunKa4MuGSDVV+KTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+KTXAdik7W1QAWuEJJOwnCZW4vsZMBkUHQRG6iKiN00=;
 b=HLQFa7c4viRxsKvd9hyCiQ+5pATVmwngYnvFxhQrVeKSAIV1JaVfBNaFP/0UnjdX5Xv59bObzUY7FZjExlRBGOWCqOAIT88zv8rbvF48t15TojBIeqFxUkNFRwbusK5i43N/p8Ysr+tO10qG3e7bcGXuyXhM1XZAShvr2/fHrw0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYCPR01MB6638.jpnprd01.prod.outlook.com (2603:1096:400:9b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.23; Fri, 7 Aug
 2026 00:56:36 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0292.022; Fri, 7 Aug 2026
 00:56:36 +0000
Message-ID: <87se4qsq7w.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Lars-Peter Clausen <lars@metafoo.de>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 =?ISO-8859-1?Q?=22Martin_Povi=C5=A1er=22?= <povik+lin@cutebit.org>,
 =?ISO-8859-1?Q?=22Nuno_S=C3=A1=22?= <nuno.sa@analog.com>, Takashi Iwai
 <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH v2 35/44] ASoC: codecs: ssm*: use .auto_selectable_formats
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
In-Reply-To: <877bm2vjjn.wl-kuninori.morimoto.gx@renesas.com>
References: <877bm2vjjn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 7 Aug 2026 00:56:35 +0000
X-ClientProxiedBy: TY4P286CA0123.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:37c::13) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYCPR01MB6638:EE_
X-MS-Office365-Filtering-Correlation-Id: e97e3343-15fd-4a08-8b65-08def41ebb05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|23010399003|366016|1800799024|38350700014|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	p4TI5TdJ+8WpYzj1LrPP+EdXPMKWz8ILjpM0bHPzeeCm8pQ6dWIRyJHiVr4lO3+rkPmKgXsr4BmBEN7F0duykG53MsOnlwfIrs9rH859yxQwI0hpcBT1+FjUkRJE8NLAyyAuM/3YZBO5SOxc4fpUoLfx4B9GZTQTi0LI1PRS2tEiXrgIDrY1lbL9UZowNgGjFP35Zyx2LeSDV2jXO6EMujyEy2VcGLODT8EdcuSwrDe+qeUCDk9D4C+LrWwz1B7K6J9NusTyMGG3VjpcNgw8Wd1Xtv3WjKc63GcL1Ya1VIhoNrJVFG9Ig5Ri66j2G+U4jVmazMjfOZ9n2AX9qP4V33EEW7RfjWX6Riom1b+WE7GrYzGWoh5t5QOb8/blA5CtFLRaV1GgzaomUVIyedZR2ex/6/sQq4C/f0wofW8CfmLtitrh76Aag8DbLcRuBtYKFx06VVbllTZZ9kOfHwLuAoj5dPcz09s2uTEsBXF4DhGFQpGPFBRvcGy7PQ+wxtTTyqYz6HS/YmPljx+/X/dP8MBvf0D6TuQxHNboDerkCvLY8/H9KZneHoFNp1xI21FM+xV9hNhWpZms88ftkaQbR1avM4cXRL1xQN2J7rkblQvgTtJgCXCNK95Dtkux9KXpJAfiU8php8Ln9faKn1jH+3CTAMNY/TLv5gBp7JIhNwa1gX6baqzUf+TkFcv1Y3CAF8EjjkNmucnJIQWX+fVWbFpzWTL2PEJOSOH0GyVTZbo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(23010399003)(366016)(1800799024)(38350700014)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?F7ccEVIRCRiI5KeoYbKmYG4Oph1sM6KEbgirnP4DbGlH/Fruuf7yqXeq4Qw9?=
 =?us-ascii?Q?7ziVlgHmk2hPsS4Ht5o5X3TdAlCx7fwKThziKGb4r4lkNKy0GehWXl9a0J20?=
 =?us-ascii?Q?vr2aWB4sbQXtoOkOaleNMraX2T0P8Ot2GUsIXkIRKN4Ych43bjy9XXYVF/QS?=
 =?us-ascii?Q?7B83G9iK8+bSv0tzqWlzxbEYXJRElwW9j2rWyusggU4iMkqypFHVDRdsax1p?=
 =?us-ascii?Q?UfI2Sx3WhlgQFDas2weNe8cBZtVKW2TyvGiVB27hf7XUjnBHMrAr3eHBiQCS?=
 =?us-ascii?Q?AEY8HKXtBLcjX/Qyk78cfmrlZPwwgZoPt6LwDtYGohY+Vy2bxjKeiLkiRwU7?=
 =?us-ascii?Q?MFiIk30X4WghqLRQqOiGnx8Cs1A1iLrrt3kNSI7+t2crK4wPpVAowmt4ObbE?=
 =?us-ascii?Q?cAbKiECosU6dszN8/uwn3izOVfMboXqelxlYsxhydo2bpGIxSqqwwBmsc98H?=
 =?us-ascii?Q?i5vRrrrQ7OGq+Tg/7Reet9DnEuQOFbbJjA8lPo/Yu40k32iyHqCjS30JZspe?=
 =?us-ascii?Q?NSVtDzaNQgkTlvStYZs0vhFRY/EIJB7gADOcTc1fHWjWpzEoUcdO37yiJq9A?=
 =?us-ascii?Q?s+7/7UCiZ7dviQArdakqoRwXy2GbpXI1tg7E1xAt+Jm5MHOLL5fPRzCWZlNz?=
 =?us-ascii?Q?tDNf9atpK1OjPixpAnSwhoNuOYacabs6l0+v9bkTo8I6GbKQAwbZpmPH+AfP?=
 =?us-ascii?Q?Qcqyv1uS9AoLKXJv5h1TmNyieXY2QJMmJT4gt4rhXTqMueNYGdPXVKhp7z50?=
 =?us-ascii?Q?ngrXtGK/mQK8HCuhoZV8cV5ochRaFAgIlWkivnjDsq3ADRUOsTmJenZId9/y?=
 =?us-ascii?Q?S0Mt1hAH+cVBS6NQoVMvixWWA7PprELoXUukxs+RaS7zIHT1mE6UVvrjp/7G?=
 =?us-ascii?Q?NRIbeESMkVGT3XLedkYqQJS7hhCJOThie0+fTdAtxya9TVmNajwPIS56JDQ5?=
 =?us-ascii?Q?0u69vh4ZdXLaMl+CMEux/fFc+A7D3Ngqdf0AiaUzl2hgtFmfnzVfoBOEFNl0?=
 =?us-ascii?Q?Pck/CIvPCoLKRx2WNGMRRvc3SIevNu+a927xMhZ+vuLPtQJmuXMY6VEhjJSM?=
 =?us-ascii?Q?b4pOBJUh48mqiHOFRrTLJT4gRv5qwlbWgBGGufZrR7oV3xmNpmAIsPVZ1ba3?=
 =?us-ascii?Q?gnpbwxHUwoJytgUpw8J6pOf+SPhVhUhpXWBILx8WH3ObU3aKyrbXPMddYKzC?=
 =?us-ascii?Q?Krpvx9hmbaCsnfjD49ylOJInzbwJDScieOlq7YQnyFvGEeexd9x70pEuHDRK?=
 =?us-ascii?Q?wptFgz14am9t52S6eS7r/rcG/sVVPt6jsYm4bK0dZ4tSnNNCCAqRulypz2Wt?=
 =?us-ascii?Q?W0fcqdAYxglOG0cPfCjOzMv1B+/+EGJseJL40DVPhdaf+lkxZNFDlbEOuPd3?=
 =?us-ascii?Q?C1KG1YiRTlnvboFStaD/4N2gnaOfTMFW51OHymYTdhQwLvShRoTmSuJMs6gp?=
 =?us-ascii?Q?LgQEb3WQ7yT60s2PGvpfv22SOPWZv+QLytnZ/QsHUSZH1sxs1VwOepEThzyX?=
 =?us-ascii?Q?sDTf2TawuvYOmxEsdrQ5mvXDth5k1cc3pi3R7WcIx5k5oH+w34+zA+tFv3kt?=
 =?us-ascii?Q?OzS6MWiurRAnWxxObZVJ6T4F9sJAknc8H+tvAIEqbY5suSLiH0miSQsbtmOB?=
 =?us-ascii?Q?WTwoWhF0BYTFEzpYffBJaeqz6A5a77/4yPvHZnicc5hsAYXeACwsjBarQrQY?=
 =?us-ascii?Q?jkG5STtqYNmN1AejoMBqOXx6OKcYv+QWzfyWIHlgeybb6QXnaHU6n3jVNd5Q?=
 =?us-ascii?Q?h9/TKwXDIh5E+VbvETySKeXLkFX3myw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e97e3343-15fd-4a08-8b65-08def41ebb05
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 00:56:35.8755
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ffxXP6TFcGaWXC0E1jAvu3NNZnOJ6kHPAC26fl0IzSAPDDty7VpEpPf1AwBbtNFhk1LSiFehS4NvHUp2d0pZJESCWnjNbFnA2laY7YL93BwYG/bRv7iAl3Lx0zat09K+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6638

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/ssm2518.c | 13 +++++++++++++
 sound/soc/codecs/ssm2602.c | 13 +++++++++++++
 sound/soc/codecs/ssm3515.c | 10 ++++++++++
 sound/soc/codecs/ssm4567.c | 13 +++++++++++++
 4 files changed, 49 insertions(+)

diff --git a/sound/soc/codecs/ssm2518.c b/sound/soc/codecs/ssm2518.c
index 5192569ba6a89..32e81b31479d1 100644
--- a/sound/soc/codecs/ssm2518.c
+++ b/sound/soc/codecs/ssm2518.c
@@ -620,12 +620,25 @@ static int ssm2518_startup(struct snd_pcm_substream *substream,
 #define SSM2518_FORMATS (SNDRV_PCM_FMTBIT_S8 | SNDRV_PCM_FMTBIT_S16_LE | \
 			SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S32)
 
+static const u64 ssm2518_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops ssm2518_dai_ops = {
 	.startup = ssm2518_startup,
 	.hw_params	= ssm2518_hw_params,
 	.mute_stream	= ssm2518_mute,
 	.set_fmt	= ssm2518_set_dai_fmt,
 	.set_tdm_slot	= ssm2518_set_tdm_slot,
+	.auto_selectable_formats	= &ssm2518_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
diff --git a/sound/soc/codecs/ssm2602.c b/sound/soc/codecs/ssm2602.c
index fccd2eacd7a6a..92df44f869155 100644
--- a/sound/soc/codecs/ssm2602.c
+++ b/sound/soc/codecs/ssm2602.c
@@ -523,12 +523,25 @@ static int ssm2602_set_bias_level(struct snd_soc_component *component,
 #define SSM2602_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE |\
 		SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S32_LE)
 
+static const u64 ssm2602_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops ssm2602_dai_ops = {
 	.startup	= ssm2602_startup,
 	.hw_params	= ssm2602_hw_params,
 	.mute_stream	= ssm2602_mute,
 	.set_sysclk	= ssm2602_set_dai_sysclk,
 	.set_fmt	= ssm2602_set_dai_fmt,
+	.auto_selectable_formats	= &ssm2602_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
diff --git a/sound/soc/codecs/ssm3515.c b/sound/soc/codecs/ssm3515.c
index 8c6665677a175..f71509237fca4 100644
--- a/sound/soc/codecs/ssm3515.c
+++ b/sound/soc/codecs/ssm3515.c
@@ -356,12 +356,22 @@ static int ssm3515_hw_free(struct snd_pcm_substream *substream,
 	return 0;
 }
 
+static const u64 ssm3515_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops ssm3515_dai_ops = {
 	.mute_stream	= ssm3515_mute,
 	.hw_params	= ssm3515_hw_params,
 	.set_fmt	= ssm3515_set_fmt,
 	.set_tdm_slot	= ssm3515_set_tdm_slot,
 	.hw_free	= ssm3515_hw_free,
+	.auto_selectable_formats	= &ssm3515_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver ssm3515_dai_driver = {
diff --git a/sound/soc/codecs/ssm4567.c b/sound/soc/codecs/ssm4567.c
index 8415dd163edd6..181047b38d3df 100644
--- a/sound/soc/codecs/ssm4567.c
+++ b/sound/soc/codecs/ssm4567.c
@@ -389,11 +389,24 @@ static int ssm4567_set_bias_level(struct snd_soc_component *component,
 	return ret;
 }
 
+static const u64 ssm4567_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_PDM	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops ssm4567_dai_ops = {
 	.hw_params	= ssm4567_hw_params,
 	.mute_stream	= ssm4567_mute,
 	.set_fmt	= ssm4567_set_dai_fmt,
 	.set_tdm_slot	= ssm4567_set_tdm_slot,
+	.auto_selectable_formats	= &ssm4567_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
-- 
2.53.0

