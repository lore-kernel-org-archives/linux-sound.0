Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011039.outbound.protection.outlook.com [52.101.125.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AC04381E9D
	for <linux-sound@vger.kernel.org>; Tue,  4 Aug 2026 00:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785804195; cv=fail; b=uhCYPFg+KH3DQ8hLDQFLVBDxm2D9MzXRqmAsPxxLnv0gBHAaWR5U7LuTEhwS74inTG7mE+SRoc6w5Ez6NvkNe0b/pV7TuQClcd4PdC5Sk0BcULyGvppj+FvPGi8An0waLttSyg7cSgeC81Z1x7F7uuGujn+THMN4SkrPZWvj5uQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785804195; c=relaxed/simple;
	bh=1YdKWJxWExjNYuTAzjUYEsQfW+IDB3gAK1nd0xr156k=;
	h=Message-ID:To:Cc:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=cnurFSriCOSXOW6ZcTA55lZFAN3UOZLo4kiHu+pdmCIJb438/x0IoS2iK6Cu8Kcngj9szgGqCeSV1agWAlyGktIWxBRCPFYSnDVmz0YhDKNdceTB64Y6TE1s5QpC7MK076U0rXYB0GgABDYdehDB3qq/GtDmF6NSQvO06MDqMQM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=hJyoU4ws; arc=fail smtp.client-ip=52.101.125.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="hJyoU4ws"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sxbg+1GrG5H/0bQnPSkJbSCYvD1pD3GbnXFPj5nBuY41uNqLoGznaCc4nyPDoT2ES9obC/+3HKMrHA1L2lNiymOj5ofPGri3j2yGyRnEUy+leyGG9zMLrQcOgaKrHOhSxA0QN0snsHop8TqKu2lMSlb/h7lQwn0X9wAdhJ6lfJtE1269sRPt7ULGvrYxas3ayJdDCrPuoXWg2VnGafnf6zxwR2Oe8DM/s6E2ncMa+P1MRzRrU/tiF9ShqTMP0lrrI7/C9rrPrC7B9YgCtu944mm9Sm7gyThTVtryZYC9G1mFyi+61qMmZcsvsT9zQrqguHOZX27fKO/zCS/wiHejaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F7DwjHHLzTy+LGfEXkAi+Ew3iSJgUVYq5KPUN17cczU=;
 b=BeKsYngTOOh1DD52sUPhfUFyS+9IxF+5iLHjsznvy1e9H6qG2NOmVlQ5v9FC6jKtYMNCME79bWdKQUvdh0qbbIkfJWBJXUYQ0oE/2vXtk9nPOKJBDzFc4AgJePTrTAeho0xvm6/7ljCo3DAV5JpUfU9R/JpMtqDsj5Wj1dJQfu1dl6ceIvjsd6jKlnJDyUtmIksjww2DEw/6TR2z3W48mZRI9CPu/JSOvU5B1g0z5RVgmaNpPi8l/nEZM+Ix5oOnEQFaRusWRcjFwOwdXNwciWncQbTXCQzDO4WmfAgwrhXXhaBCmN5noJT6hcIrRoZlAV4obuf69CKc+fvLXjCNPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F7DwjHHLzTy+LGfEXkAi+Ew3iSJgUVYq5KPUN17cczU=;
 b=hJyoU4wsfDkJYbj2X/x7Bgb8Dy75IsN9cTtRP7rT0xFKklev9NnCTR2ZZ3ejpKmkLeMONNaDYsio4KLoNIh+09zSp1aSQFxB7QmM7pjLUbaNygrl4M+PYZIPrzMa9+hh+7jES8pwPRB/DFZfmklubjZGKL1nC2/5V0RIbW3PdT0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYCPR01MB18168.jpnprd01.prod.outlook.com (2603:1096:405:3ee::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Tue, 4 Aug
 2026 00:43:12 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0270.017; Tue, 4 Aug 2026
 00:43:12 +0000
Message-ID: <874ihaww9r.wl-kuninori.morimoto.gx@renesas.com>
To: Fabio Estevam <festevam@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 31/44] ASoC: codecs: sgtl5000: use .auto_selectable_formats
In-Reply-To: <87cxvyyazi.wl-kuninori.morimoto.gx@renesas.com>
References: <87cxvyyazi.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 4 Aug 2026 00:43:12 +0000
X-ClientProxiedBy: TYCP301CA0006.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:386::15) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYCPR01MB18168:EE_
X-MS-Office365-Filtering-Correlation-Id: f5ba20ef-b2e5-4664-d6d1-08def1c15d02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|23010399003|11063799006|56012099006|22082099003|18002099003|10067099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	Fx400uBjg0WFQudiSnGGhaiI3b8QWT7Gyi2q09nZx/tXSWmCmZIJ81UXCzESC36ugB7f6X00IEvf++vUgSiHlXDUP5XnuZbukFAWsAkfu7r+rnrNLFHFO8InTNvTeTqBmLzKV3HtpcSV4L+MgnBx245X8zJlJ9wTq4z5H1wDJno7FYWGcpnXZcXufiDYgx9z36hmKbw0Ntj0AkqDdMmagT56zjfnNr3SfXqpwD1Ce0Gks3J04ar9AhZQgBzVOUJAFRfohaK0gL4wv1sow1n3i3u1lZcnApQz7KVKLcmjrIj06Yn3+n3ZajMZxs98VcLg67VQoOyf4cCEFalJVH5H6HiOOVgMnhAk8f1ftdpjcmo9OqBiKY/Bh/1druyBpJ/XUEVcHP9goOiHKO4naFvT7Of22hwJ386drAX1ZSFe3zEStiyN9o4WDMwwzvF4dNauBt8d6SHN0aUaGKXUZrSLaMYvg2AKUyxrvymW2kDsKgcInH/oqQuDQk966goNNjV/54DiQDX954w57KQ/wWsaX6raTln09rpO4gEqKK11Vpd7C8G4cV0Asmp20RIPzRg23+lgtYorQyHA6lx2G6XKWc2C9UhRHLpShHAo65oyTQ9aGfrSFYHgL1KShferBWtdFeJ2x7jJkRS+c6/AVOMU9SXYRhOlUmS41O12cMkmYNQ4dWyMlbzv6YSVIuMZEmwao3vj2MYUaK3G8QprDGTMYryo6yV3F7CPevmYqIzIzO8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(23010399003)(11063799006)(56012099006)(22082099003)(18002099003)(10067099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+BzOMkkWN+IsoPZ6r61dYLUcOYty4fxQA/BWoUPY31qdlK2rSsfFIzZypKGD?=
 =?us-ascii?Q?tHGHRaPEUzrukR81Y1SN4VjGpMH2D+HTDAXRtIpMpmLVF+JV0jbsvgF7TQ6y?=
 =?us-ascii?Q?FGJ5Wnpo/z0Sp1tzMjGPRXG9tJ7FKicU8lRIuhTHE2CvzMtNqJFv9Pf687nz?=
 =?us-ascii?Q?NGLckp6IG8ZZH4hts66Ydnsq9vbxjfW6+PG/W5wuvKiu9eWQKubxLvoBkr3X?=
 =?us-ascii?Q?cXyKbQq2hbB+m05k/i109/+0Z6xb60cQwX7bYAESJqMCVsFT7rpxfqL4yZM/?=
 =?us-ascii?Q?S8B66H3/la/34xJ7HEeqm7mCP72AoRycDIWKlZHR/uBtzGXfttCrCdOYSugB?=
 =?us-ascii?Q?gX9aJ0L/tVlYBEDSjHcRkYkDup8s6ajbHitNnLLdC8Aprl6sicWgvMA5v9cx?=
 =?us-ascii?Q?imOPhWF3yvx9U0eUvui8NJsjgKkS2QOJI5CsiSc8umcUZuWZXTvrvEdJsv4H?=
 =?us-ascii?Q?eIAHmjpVuWEBJEH3TBmiP7vIOaa6gBWyVkugFDMgJPfDrY9Au2gqlNT2sQbT?=
 =?us-ascii?Q?Br34dHed27+01nJgoNsT6dvsivM1Gj2SMUBN5Dbl8az1vPDPPp8YEjt9a8Pw?=
 =?us-ascii?Q?ErQxcuzRndP6sTP3ST/hJMAbT7aAtDKU8hMhYNfp1hoN9Nbn0SL1HsdPKT0q?=
 =?us-ascii?Q?RDwC6F08dF1kLb+3Dc2p2QSeijauaLfBLNbnPpam9Pip+S4MmQRCsvuE9cSx?=
 =?us-ascii?Q?c+4tyInyQKVemSV17OyJ4KmFN4UjeNndK2xRn6IjvLg4ZDpp5KXpdQO0Iz59?=
 =?us-ascii?Q?IrytGm5QXsheAjoCSiEGFHNxnOxQ6HHwL0xJcnAEW67n0F7N+QNNdcZJSFT7?=
 =?us-ascii?Q?apdopUAii4Nob4yOrkrgz2Ou4W0YPet/LrrU5LgsammQH0fgdA7AaCNFY+kf?=
 =?us-ascii?Q?muFOcid1mLIc4WhldBJTZ+XkBDn5CLdFaeMegl8GNQ2FkSByDPIrWbL8Qs4t?=
 =?us-ascii?Q?GUxbiElACIxwgGgs8Q0FghIlmt7E736WbarMS+n27vNSkMG5M6ikh/ioobmf?=
 =?us-ascii?Q?2LZYh7Owb9QlHLlQQrqP5DvDITiUu4Cv+TrAYZwK6enj9VaPDjSgi5YMVEKA?=
 =?us-ascii?Q?Mkg0f07FjV/dyYTbuZrkykjkOG270ZF5ci6ttBQ4NcHi3GnAphc2PpvM80y1?=
 =?us-ascii?Q?gQOoJfEPIznK16cSKiBQr3IY/l36/5EnclNAOuxgJ1RF9KXqDJGGw/VDOY//?=
 =?us-ascii?Q?s2UgUNzx31LqHrpmqaRbdvVroFG1sfSMVthKxlqDaJOT9RMt8NvuPdGf8AhO?=
 =?us-ascii?Q?y3UukBAQP3G0aXk+XEttETMPQMkUsg3u2o1SOYx8+++BNS1mD5XRn9f2e38F?=
 =?us-ascii?Q?dOpJ+Ybh7KyEXpqCqCz1d989RuFTyBY12sXUeaIMiL5HdxcNA33pwVIwr57H?=
 =?us-ascii?Q?Ve6wjaA1NNHdt/2+Ipz69sxDX06Hi1kGb/g6k3zxsnYUostRK6dAfw0dVgcJ?=
 =?us-ascii?Q?U1LHerdxsaQO7n49Ru4k5SqBHdWjEnlTGWGngsU9gPXwuFrcwu5joj/4m+tL?=
 =?us-ascii?Q?EGTlqYylmncFJRSiBTuXhM13N15O1I6Bv/0SCqXJDdjvLICdyrwOQZtPQ9nj?=
 =?us-ascii?Q?ghfgs/jPNFWh/NUYTuW97PJm+P5Gwbp1bxTmRy9Hbp8yYIAzPK3DFmAQTD8t?=
 =?us-ascii?Q?Of2qYcnTcY9VYJszdIiZzrndP3dJ3Z40mzOLEpNOvM2g20H/iOwp6Rce4yq2?=
 =?us-ascii?Q?Jv0iRCFuhT2/qVA2C+XdzrukL5GHl+ZbeRKrrMpbl2aPKCNJfapC66JRYm3Q?=
 =?us-ascii?Q?+lvc2w0JVddJcOdxs0oFu29ViW7SlnI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5ba20ef-b2e5-4664-d6d1-08def1c15d02
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 00:43:12.6208
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1puAt64ZncVY7oXaj1C93d1+hGw/2UH+0gcQnA8vD+6HYs9QK9S9hfCbWxtTdbvreh5UZYxYDu8AzkvEAhRAU94ZR+ImnMP4NcsXAtSTcNlfgxbNVWbfXFUqlEEVmRqn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB18168

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/sgtl5000.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/sound/soc/codecs/sgtl5000.c b/sound/soc/codecs/sgtl5000.c
index 59642673b4cbe..70ebbac34e061 100644
--- a/sound/soc/codecs/sgtl5000.c
+++ b/sound/soc/codecs/sgtl5000.c
@@ -1158,12 +1158,23 @@ static int sgtl5000_set_bias_level(struct snd_soc_component *component,
 			SNDRV_PCM_FMTBIT_S24_LE |\
 			SNDRV_PCM_FMTBIT_S32_LE)
 
+static const u64 sgtl5000_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF;
+
 static const struct snd_soc_dai_ops sgtl5000_ops = {
 	.hw_params = sgtl5000_pcm_hw_params,
 	.mute_stream = sgtl5000_mute_stream,
 	.set_fmt = sgtl5000_set_dai_fmt,
 	.set_sysclk = sgtl5000_set_dai_sysclk,
 	.no_capture_mute = 1,
+	.auto_selectable_formats	= &sgtl5000_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver sgtl5000_dai = {
-- 
2.53.0

