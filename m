Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011070.outbound.protection.outlook.com [40.107.74.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3902237F8B6
	for <linux-sound@vger.kernel.org>; Tue,  4 Aug 2026 00:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785804079; cv=fail; b=MNebdV3CfB5gK5+ZRi7iJ3uyrdAnxP3SgazIUk8SPdzre64YSQA6OcLIiOYF5zBzrUAa9I2rC47vI/X9MS7h6ZOuPG3G9rdCPbSnoHYJDpduyGsOIGG/ff1AIOD2SZb+n7kdA6S9uIM0uVzba9tXyxTfzqI8ZP5GBBgFE93+wXs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785804079; c=relaxed/simple;
	bh=LAZhXE4mYEfHlJj20TIaE1hXyQHb+VH/yoF9NEIG5dI=;
	h=Message-ID:To:Cc:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=aXF+K0Ni5fygMwaBE3TQPycPMyAF9N9Qu14vzhZFPpg2wqxwUrMGEgY34xE5B3qKBKxXY+NEoEuv6MUhckAOlSJq4+fYJ2KuMMihKN6KnI8gxzkjReR/DyTABjmwLY5oLjKjX7g+AKggKZ1/pulxrkz6rYgXSMVq0/pX2kMhEeQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Pwtnv8hy; arc=fail smtp.client-ip=40.107.74.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Pwtnv8hy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BABsris+jbDvPiBzCMX605EZyie8TDSL+F1Dn4KeEAYPvr7kCa1OEJaC98ZJ5lfEVEcfD+qsuq2xVJaPiOH9pqWMLvPnQe3l6vH2GR1W1K/p9kW8WXN5fJhYa6Py2TFP6vGZ4n+zQbifKFNL+FBgs0a9ezYhD9mjzUZwFVE2odnShmvpQmz0eimXdJnvrcINTAg2vX9qHqWsON4Opg6hJHggutTR165FqnWS8qyrQhrhC/PWNVY5t06rYb7jHk1x4wEKWdNdK9UoK0naacCYx6G2EsFONMRbr94KDCjIHbWNYzgmbozSFMkj9/CmrN6dDkzur39/GOBB8HeX1N2+pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FjTJGNhEtRo3+zGQfkWLuTcBg1lD27Suql9M9mXZvVQ=;
 b=g92N32EEICTUP1/+ETVYAtti5j9660uIMywPghpWsOpQGyhhtia/oo3VoBy4q8jKFjDzJiPINmnGxTqh+m321Kelk3r2Zt86+DMUSLF1IED/4F/x+1zIM7AM5YikjIygzY2H7Uu5toDwXMwrkerDsUSwH+ibNACpbra4jm9SmQg0yG2ZuJsi4v27aNzDzLbk9s/QJttaQRXVUnD5i/OT8rfYVMOXci6gYKgoZYahtYLtk2IL8OlnuxVeubbNPxL28uZcYWefCZcUlMQEkkOLFveQphNdw8uTuYUyq3xlHioqiH8AzSlpk0rq1q1x2gqG8VIyRP9vLZ6EkUNmWqhQgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FjTJGNhEtRo3+zGQfkWLuTcBg1lD27Suql9M9mXZvVQ=;
 b=Pwtnv8hyFO5mHb3T+BPfcYAQJAC2B5thH5CIepPWVAn6vyoHbhBsdtjtHumSAo2gdAUUiLv7YPvR7eVxuGPQvrctLcxf4ukhyWrMG+nzWbQN/rYilpa66rIxpgmWQ9A4+WCk4JZpk38rMZ24B1BY2RPUdrc99qh9+rNZUiE4C6o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OSOPR01MB12264.jpnprd01.prod.outlook.com (2603:1096:604:2d9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Tue, 4 Aug
 2026 00:41:09 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0270.017; Tue, 4 Aug 2026
 00:41:09 +0000
Message-ID: <871pceyaxm.wl-kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 =?ISO-8859-1?Q?=22Uwe_Kleine-K=F6nig_=28The_Capable_Hub=29=22?=
 <u.kleine-koenig@baylibre.com>
Cc: linux-sound@vger.kernel.org,
 "Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= (The Capable Hub)" <u.kleine-koenig@baylibre.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 08/44] ASoC: codecs: alc56*: use .auto_selectable_formats
In-Reply-To: <87cxvyyazi.wl-kuninori.morimoto.gx@renesas.com>
References: <87cxvyyazi.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 4 Aug 2026 00:41:09 +0000
X-ClientProxiedBy: TYCP286CA0189.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:382::15) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OSOPR01MB12264:EE_
X-MS-Office365-Filtering-Correlation-Id: 335fb2e4-cd3f-4ffd-8f78-08def1c1139b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|52116014|366016|1800799024|38350700014|11063799006|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	8ZbeHT+aOYs11t6rn0vyb81pxgRNmb4hjDE4OY4kyEtFeplMn+5R/mOWnYUyBcXBtssedWDPHgnkt9acseF8Q4CE4JFmLvWPqRXbgb05Wherc2lZTstpdWB2o1aMxPAQwFHe/lMMIMeNJquaJaRfXUaWtvNKhL1N7y7ymdOd0tobLoOquu+GEvWHD2wNOKtSd+rIJsPxX5E5os5BoDPWz7RFvn5ray5EktvXyA0Hgwp4q9c55vX5zxFDbi/NE45B3gOneZfPqLPQ98inLahJ3WaDKord8WUSXqe7rXv9gV97z+dBRzHGjJY/ukMEnq2kj8ZYm1pncgW7G7DYf1n3NkzmSrZZYGsbxA/dCleZI0zZADvm108UlRIFtBjDgfsNuCRGznYqovum3WQIjcH5lDjZjbk/ilPssngNkKHGefTd3C8XRjP2P1qf3iUAXdQZKTCCJlF2+XWXMHjPXCxklDN+lvlhNaq4v8rbsvguqjhcZDVE3cWGTiG9IGmTDV57q1dYoZsHkTPNdH5VNFfhwy40gQs9p2Kmw0dRgahzKqAXJwR/r2xPWl/bdjvpAp/GWnu67Ta3Km1J/k4RxDYgMApBKVHsk2zah35OumOaiHB0O8x/spAAUmtEZv3cfxiVz2PtGlEzb+UNCxSnYBFRQEn4Zm6xOdBQyXwJOU2+9eFCjFSRS17Wn0doaJzE2DVe5XrvlqGpeSZm+QrxhQvrxbmQoPa3OAufF82Ofv0fm2Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(52116014)(366016)(1800799024)(38350700014)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JRKxqfHPLDa0GD10e4UG6iMMAm9oL6xQ/tAbmFofm6DP4BnZZKWPO1VNy56t?=
 =?us-ascii?Q?3Bpp45r5g8LtfMQwrdJK9eJz7nw4gtavGZgg6iAnC31K0GrdEA79ANOZDoms?=
 =?us-ascii?Q?FDUBZE7aHx4YclIk3omFzCE9r6ecNE5RcUCYex83paLAqsOwiE+zgZ5FIvKt?=
 =?us-ascii?Q?yDGizxssQHjPEDL60IKVjA80F7fXNDLDKYuW7FLHzi/pOns+xgESCfFmsqND?=
 =?us-ascii?Q?tlkpFMTnwItAjw5ApGDBLSpo7KKs5p5K0ycPW6NdP4ARz/exuV6fDchJiQQm?=
 =?us-ascii?Q?GPESgan1XernaddxyGYIvjPms9zpgazjuGW660PDIBhvX9eRoSgXZu6c/owG?=
 =?us-ascii?Q?MBJmc2TG9QoRrARimk37xF1EKhwUGO41Bd/4WUvREAKw5xFnwRIQMyNkxm7P?=
 =?us-ascii?Q?cwU5n6BEOP9hMxKON9/SM6ipGrTum8YlealXzfN8+5twirrTFbUN/8X1pNO8?=
 =?us-ascii?Q?o+Ia1961Lv+JWwE1XX5yzj3trQbgx2MEg33Ow+YZ1sqaxgoeig3Md2vJCzON?=
 =?us-ascii?Q?tRyNQcz7PpLygmBZSirzO9ic0eej8j430XBxEkUTogMP1lhfM3JFVDT4rv5S?=
 =?us-ascii?Q?5iuUMzVGbhIsTMfa0G14iXd5hXezwndH+7wPA5UFgarLTOZPNFAzNqcWiaqh?=
 =?us-ascii?Q?ILrVGxSz/q/xd2p0x08xsWz1GFZhxScvCk1z4a9khYRFJgKMNAd5ZKDgNlDW?=
 =?us-ascii?Q?d3CiwFC/PhzVRFqWI5ujb7qGb7Z5LpN62qLrfnX7znIyMfi2kmv7suGleQLk?=
 =?us-ascii?Q?mCWfNeCkqi+4/gkWUbJRt/Q7aaKuMbXVwDXGiATwOqzlJvzAk6xgl6prftPL?=
 =?us-ascii?Q?wzkK15diotg4Wsg+mIdKUp8WIYE4F+jgP8ubPoa92ptnOMaOtKwE9Ruua8qw?=
 =?us-ascii?Q?hxUAd/U941d7JempTu+IpB8rphOrP+kQnsKV31L28UrxzuRz9RlYEhkwgusN?=
 =?us-ascii?Q?wfcUKnKBR87+dZDoT2JtYPQD6JVmy7udA+R51M79+Ji6K8txQyInCUUh8Pig?=
 =?us-ascii?Q?WdlzyDVtEdBHh6mFBj365jjKRb0g5AX4HjaXC1Ey6NtLCne8lpevLbBVCGSh?=
 =?us-ascii?Q?LunrEGsevpxHZBc+xZJFjPVXLFP26qMhWky0T3S80QM3LaFFFxiuGWqqgPPd?=
 =?us-ascii?Q?ewFNuJjLRGH73BzHFCtZkVZ/Wp9REM5BgAJNolQVAeoCNCoAOrYKOShLoR1+?=
 =?us-ascii?Q?mNfxRlmFoHddwgaGMgv1j3j/G0OhspBn3UxT4R3AjbH7KxfTBTXZ3fkJDspX?=
 =?us-ascii?Q?wlQ2xI+kybb1eX7ZkmAnWcDVQ5JJRDib9JUJNFQ0rMgFJlKKq5HaN40slWvJ?=
 =?us-ascii?Q?QihkQ8CMCNv/ta+VLbpCNMs9iuNANWQy+/SAthRWLoBRRWFuMDpxl8ZxCrVe?=
 =?us-ascii?Q?DYFVR+BYwOCTv5uThMxZvPPzxdLrzDAFNyBQAjEL8INlDBQyUfRdYYf7m41W?=
 =?us-ascii?Q?yA/Rt09k3Sf24bqABbvIi3GdXLdWTnv/WDNmTCU6zcITQuIeWa8f8mKjCofx?=
 =?us-ascii?Q?QXawV4NJgHgV0TIUeX1EGZfcMQtdPUARxa9brPVaJE/rAg74EIFR3fRe+zQk?=
 =?us-ascii?Q?AYUABU5Tf0hr7xZWzX36FTE0Fc4YpL4IrYFMcJG5lGUTIwF8PFFa/zx8A72j?=
 =?us-ascii?Q?3nGyfsZqegCRCNoGe9N82B39RRiSc+TAhVWKmjB42DVV2qpoyR44wApWKJZ8?=
 =?us-ascii?Q?h+aMpflFnapm0QOKEJ1H2hCvMj0rGKCLO24OuiOeZEuA5xZc/KuYknGoQGR/?=
 =?us-ascii?Q?3xDKtE9jYh7YABezIHyemscNzBflX4JaF34JwZJWKzZVcEjPWES8?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 335fb2e4-cd3f-4ffd-8f78-08def1c1139b
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 00:41:09.4625
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: taw5pVeV+LkChdhrzk9SixrXB1WhCp6UccmGBXdv6BLE2UxGzPpd6fS3k85McPkzwS41h06m0/+t1TFxURdNXZb7k9O740srcINmSfyXYUa9sF838tkT7Pz/78tbBuGQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSOPR01MB12264

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/alc5623.c | 11 +++++++++++
 sound/soc/codecs/alc5632.c | 13 +++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/sound/soc/codecs/alc5623.c b/sound/soc/codecs/alc5623.c
index f5a666c493615..96bb1d5927729 100644
--- a/sound/soc/codecs/alc5623.c
+++ b/sound/soc/codecs/alc5623.c
@@ -822,12 +822,23 @@ static int alc5623_set_bias_level(struct snd_soc_component *component,
 			| SNDRV_PCM_FMTBIT_S24_LE \
 			| SNDRV_PCM_FMTBIT_S32_LE)
 
+static const u64 alc5623_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF;
+
 static const struct snd_soc_dai_ops alc5623_dai_ops = {
 		.hw_params = alc5623_pcm_hw_params,
 		.mute_stream = alc5623_mute,
 		.set_fmt = alc5623_set_dai_fmt,
 		.set_sysclk = alc5623_set_dai_sysclk,
 		.set_pll = alc5623_set_dai_pll,
+		.auto_selectable_formats = &alc5623_selectable_formats,
+		.num_auto_selectable_formats = 1,
 		.no_capture_mute = 1,
 };
 
diff --git a/sound/soc/codecs/alc5632.c b/sound/soc/codecs/alc5632.c
index 2fd3dd7ef8b34..a5e95f3fc2474 100644
--- a/sound/soc/codecs/alc5632.c
+++ b/sound/soc/codecs/alc5632.c
@@ -1003,12 +1003,25 @@ static int alc5632_set_bias_level(struct snd_soc_component *component,
 			| SNDRV_PCM_FMTBIT_S24_LE \
 			| SNDRV_PCM_FMTBIT_S32_LE)
 
+
+static const u64 alc5632_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops alc5632_dai_ops = {
 		.hw_params = alc5632_pcm_hw_params,
 		.mute_stream = alc5632_mute,
 		.set_fmt = alc5632_set_dai_fmt,
 		.set_sysclk = alc5632_set_dai_sysclk,
 		.set_pll = alc5632_set_dai_pll,
+		.auto_selectable_formats = &alc5632_selectable_formats,
+		.num_auto_selectable_formats = 1,
 		.no_capture_mute = 1,
 };
 
-- 
2.53.0

