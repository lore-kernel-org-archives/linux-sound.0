Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011056.outbound.protection.outlook.com [40.107.74.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4374C2550D5
	for <linux-sound@vger.kernel.org>; Thu,  3 Sep 2026 01:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788398086; cv=fail; b=dAmuql99NCTZouMUYGe2iuctN+q6oH+qUbO5h7q0VyweyHIeqW3fX7LL14xVMVvaCw9P3BgntcpKh7BwqNZ0srmOPbQykzYwU0o/ytfOl9np8G66r5JUuh3yDu3yUZVkURPfqxb3RZjgVkYDGQ9fp8KmLXlrytUJtLITjTcNd8Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788398086; c=relaxed/simple;
	bh=cn4y5NW0eMZ18qwQlc2Vl2SMFj8NfpxW+icLCvjhiM4=;
	h=Message-ID:To:Cc:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=pjdU5NgcksHFlW9W652KZNvw78zVT69qRLx6TQo7JGaFYEcE+ouKxpaNiGGmHFsfkj2vTUZtLgQmSEdbMtall2vb1geP4zaBAL9QBqOm6gVguVE1+6mkLIlPasGHzAd3iEOq03T+HWB8JOaOEZRE91l/mCoUijS93GR0DTHU9nY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=HPaMWeMp; arc=fail smtp.client-ip=40.107.74.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="HPaMWeMp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZjTob286uj1dKW2oULIBA+04ZVLghcLBwyeLNjbaxQ/oq+BHG29+vzPmqmBcHb6HjOqIzwLjZ636nk4mf/PolOpR0RrcSgTzsYuMOGiKj5nk1+Fh5otxmh4hM4XofP5liDkU6KORyJV+rVwabL2ldfRAPG561aF6CteHvcRXq0awrPfkDSDzfBq5EZiPbUovFOcNglWtAEeRkhvzRKf5wMXsF5dI5U1/ymrBL8yhRt7GtUc+7R7XD0lQLSRCC6dfRsgdgtpJjhuxYCuDIVXgok2N3lNxlSE8T/YdOq3MQb2O4JSZ87qz+on+YcTVr2lCgV0fow2FyzOd2uHYkCu8Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dabtDcEB8PFYe35TQYFB/Qgsw0PPdKQAvE64K+yzSC0=;
 b=Nn1C2mak6Mu+szzNhtTfHtJ3REBTF6iwW2oPcpaUyisSItkThNS5PckxTEYCSGe6FoabSnQLPiG91UUQmJ7Hjtni8xuCKmiX5eJyb1hyi2X8wjOv+VqZkhuhYW0c10mg7fB8MQDWfKVrDcQMDnX3ejbtjdbLeH0t1jP9baPqsMk8BtqyUyvjHCCMJKT8JDfg1K8pUKG0gVksotSNeXcDhnquyub2I2FgyMTcXjHBDTMDnv7QCmZFhO2ccEcAxLmUynOPUp/d4PfWIFswW/hYFBvzK63cNfU8buW8rpAjyNxwvg+zzminCsFbAEc+1SnA+FvWBewEZ11BXIZjEjNemw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dabtDcEB8PFYe35TQYFB/Qgsw0PPdKQAvE64K+yzSC0=;
 b=HPaMWeMpcpYXIfh5OsYuI3ATxZk2QK0SSixGikjqimooWAm8nchScnBtAnFRhN4/T5Y119qEY80H77Q661J4yKCnAgEgCk5uz4O4rIWe8jkpoDSP/ZSTeArtBxRhGXtqa3Wn0ma+ZQoVwImioN/yBleOv8EeIU2l5Xm3z+YwMUg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10) by TYWPR01MB7169.jpnprd01.prod.outlook.com
 (2603:1096:400:c7::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 01:14:43 +0000
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b]) by TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b%6]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 01:14:43 +0000
Message-ID: <877bl3yw3g.wl-kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 20/21] ASoC: ux500: use .auto_selectable_formats
In-Reply-To: <87zexzyw5v.wl-kuninori.morimoto.gx@renesas.com>
References: <87zexzyw5v.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 3 Sep 2026 01:14:43 +0000
X-ClientProxiedBy: TY4P286CA0077.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:36d::6) To TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB16474:EE_|TYWPR01MB7169:EE_
X-MS-Office365-Filtering-Correlation-Id: e2840726-29b7-4e24-ea38-08df0958bc65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|23010399003|366016|38350700014|6133799003|56012099006|10067099003|18002099003|11063799006|22082099003;
X-Microsoft-Antispam-Message-Info:
	Tl2Gbrt+z/AYuZB033xjAt17CO9mv6ZmLfO39Xba7Ukv076A+eQfwYnXDIKJNVAwKGX9uO/FteiPFqtHRx4JPafxwcAYymHyzlGeKWFiMwwK88254qqDBpE9gTm9y57+ucswwCe1YFngEEmY7p/WtUdmmd09Vaze1/73DXTEyEzkm/6G3HdmSRhaMrxRsyAy/dDBwOqt4z+084hkXo/ydTIKIyGkuFLGdKFrAI57fkW9/SDcKA5eORYMQzo/3tlcNzR7YboBsq0kHfB//fPrKXaYjc4NQGnovoZflaFlyaMoOAYNLQ5n2BDJ9Uh+ahxyL5COha6fpx0uOVSq9ECpLdH0lIjrfrrbK3ImcUGAWmH7lbXsII3DT7FD5GlCR8KjmPs1GnwS/JWociRHufpH8ZTcCFdYIu95g8k5oTSBCVLwKhvuRLoKI2vVaSODGF5TssQUudRpiij7xwQd3yF/VSFVNtEQMAGkv6vG+MQSgClgVPlP2zTJ88REqhyOHzl8At/zIJdIXn3lLpWfNvoCsra6oPp4PY7l62Wd7053bGvB8UmevggC709T7lBtxwuqdJwZO/8NMKwqBxsNCF9LL13Mg2UvnmUgg7UYf4u2yeAXD3Wv2e09zPjEVqJHL7OC18tn+x3TfGnp9QiPDOsQ3oQ4lm0gvCrHPsHQi5nuDP/4eJwOhcObcWDf/JLNbYSfHO0WSW0ynqBRymw3f1icAhMcLnIHw0WAnyjvL3AO03g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB16474.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(23010399003)(366016)(38350700014)(6133799003)(56012099006)(10067099003)(18002099003)(11063799006)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hny9YGkfvURkfpgc9PSK5sO2hc/3qe7jOJa7K7kx14mrs9/CdIwVGDfg0XFK?=
 =?us-ascii?Q?VZtDeEEwc2H/N/4PctRYil+vEdnT0DmZ0dE+qynOkln6N6xjZ5TFXXtmkQ+v?=
 =?us-ascii?Q?S/EKqKSorpPZAwfZP96nc456qBgecJHhW15fV/lCd0v6NzzW1QA6yF2oG8yZ?=
 =?us-ascii?Q?IM5Omxt/85VM6fpajQz+UfOK4JXdLduL21EybYoC215gGyi1y6NHycj1yH4W?=
 =?us-ascii?Q?zHeEUi57q22AX2FaqI4ZwI2aVT/IaaLFNGaxfFM+IJMGCr0TCzZq37e2NPHF?=
 =?us-ascii?Q?CA0fdZ++zdvAyYMqzL0E6kMSeKIGr4QbJRkffc+Qs2jHwojotTPg2ITgxXl9?=
 =?us-ascii?Q?Fnv9jYh+Au+c9xtuWh2OPXXqXWM6J7mUUD7mnknDQ++F2ihSwyPH2hGM8Gtt?=
 =?us-ascii?Q?cgX+es6znXq9aT4+BeJtAWk6k1vfsqiaqb3fBAqmNX/+UXOK9VDRBU0DVPct?=
 =?us-ascii?Q?SeUQzKNcesBnElGT7rxHCpFj1pqMbPFNdlYlQaXbACHUaLnwI1D2v1mfu7JP?=
 =?us-ascii?Q?VgDIJ+t2DoDXeOIzhc5Jn706nTgejS3fnsSZroBadC1vLfyaJo96UrnpOGas?=
 =?us-ascii?Q?11YzCXm8QL/jUoq3kWd4ydL+zmjFyaRHoTaJ9XlqH6+DrfDsxgDbmkFaZqOa?=
 =?us-ascii?Q?MmLpuErdK9uPYZPROQs1+y4k+XEzL+OZuwFhCwJIJjmseWxE5wjVs12gY9xu?=
 =?us-ascii?Q?e3XLIsMShexifyObTV7XCG/+deWYzRVfDTg62p7l+VF31fZtimU9rXi9hgx+?=
 =?us-ascii?Q?/JmYcsRt6he/pWVNhiDtsozULvkHJiIlv5fWAE5dJAF+1HTFryw7Dnw+JhS4?=
 =?us-ascii?Q?3nM7ihIxsoywd0YMeB76cZ0ZEBqHHYMEKa0gBc708M8blgfBPmjDn2k2OxdV?=
 =?us-ascii?Q?w3NeXra6lGcpaOLLp3SoIOUaB6fAyuoIIce68LPXClcY470vLDSsKGU4SEKr?=
 =?us-ascii?Q?nEisDUoht8uDKAdghaEHvy8hAHYf7VBM/QGt+hZBuG5XianIkSb+EAYcNkog?=
 =?us-ascii?Q?L9jba6n+XiAlesgUoQ82ddtdeJQ83LD8d2Hdp6/0gwsUTbmHnelpngGBd+2+?=
 =?us-ascii?Q?8mne9b1biBMMIoCCtoBUYAn1zlSNFE3U7ojBfTuUQ5R5uOOoR8Q159sKEPGX?=
 =?us-ascii?Q?e10M76Vw6Z+3X55cIFhDhCDC9luDThBj2kgI+s0cfnHiBPNLyRyEHCj7qKmF?=
 =?us-ascii?Q?lGmMmx+IR1sYCM6BJdxukryrau2s1vXgq6plpOX3+5k2SIWZDNWvOzYKlgBa?=
 =?us-ascii?Q?DC/QrqrKMm6zamvJp2kchtuXoiLBwCHbGmc/B+lQbKtfFJEcgM+bgHx3J6/y?=
 =?us-ascii?Q?Bqno5xUPCiD6rgdTY5DaX5oBzhJt2np48XyFF6f0WcO8MJQZ/D8jM90UgROF?=
 =?us-ascii?Q?zHDgnDo8WV/ekh0CVXuRU25XYyGyITMKmNKpxemN/GUb6rAo7+ZB67E3H2oE?=
 =?us-ascii?Q?t2WyjWhPiZ0hvhH6Qv8zjbN3yIU2+wpdTvY9d6h3S8Ff2oaUV5n3KGABn7cV?=
 =?us-ascii?Q?s5htDcLa8t1raOqpJoFx3sajFxG4mf3tCh8AB5SJJTzRXv8Dw8dBYjJlgJin?=
 =?us-ascii?Q?BRJUhWSEdNC+46ChzJjOJB9OGH3rhIyIsCb/5HqFqdsmSvz1qyrg/G9bMrxg?=
 =?us-ascii?Q?NcRcuUezyFNpvJBrjwfgI5jUcYvL5/is39GjiGH77AbtjUPAsxPOyCP2vwnD?=
 =?us-ascii?Q?0L5/tnKUpfAUbPzz0kIXf6BbML6sNoherWLH5d0ge0TgqRpN+isYpcPUhxqY?=
 =?us-ascii?Q?edu7gLhYb1GKtatOLgp/vzTDCR2NeufzPa+CZAWfiyoWBceH598W?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2840726-29b7-4e24-ea38-08df0958bc65
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB16474.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 01:14:43.3599
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kujR+kP1zJAZQrzmrhzNJl//S5cx4Kzkon/YpwQnOmbr0pSwHDcH9yU2OgNihwGe3bAwsc/1EkPK4APJEtIW8Mq8aNdoHhKNrBZJ2Qm57vfREYwF0NJESpQQwdNLoTiF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB7169

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/ux500/ux500_msp_dai.c | 33 ++++++++++++++++++++-------------
 1 file changed, 20 insertions(+), 13 deletions(-)

diff --git a/sound/soc/ux500/ux500_msp_dai.c b/sound/soc/ux500/ux500_msp_dai.c
index 499e826d71208..3c760daf9a0dc 100644
--- a/sound/soc/ux500/ux500_msp_dai.c
+++ b/sound/soc/ux500/ux500_msp_dai.c
@@ -681,18 +681,25 @@ static int ux500_msp_dai_of_probe(struct snd_soc_dai *dai)
 	return 0;
 }
 
-static const struct snd_soc_dai_ops ux500_msp_dai_ops[] = {
-	{
-		.probe = ux500_msp_dai_of_probe,
-		.set_sysclk = ux500_msp_dai_set_dai_sysclk,
-		.set_fmt = ux500_msp_dai_set_dai_fmt,
-		.set_tdm_slot = ux500_msp_dai_set_tdm_slot,
-		.startup = ux500_msp_dai_startup,
-		.shutdown = ux500_msp_dai_shutdown,
-		.prepare = ux500_msp_dai_prepare,
-		.trigger = ux500_msp_dai_trigger,
-		.hw_params = ux500_msp_dai_hw_params,
-	}
+static const u64 ux500_msp_dai_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B;
+
+static const struct snd_soc_dai_ops ux500_msp_dai_ops = {
+	.probe		= ux500_msp_dai_of_probe,
+	.set_sysclk	= ux500_msp_dai_set_dai_sysclk,
+	.set_fmt	= ux500_msp_dai_set_dai_fmt,
+	.set_tdm_slot	= ux500_msp_dai_set_tdm_slot,
+	.startup	= ux500_msp_dai_startup,
+	.shutdown	= ux500_msp_dai_shutdown,
+	.prepare	= ux500_msp_dai_prepare,
+	.trigger	= ux500_msp_dai_trigger,
+	.hw_params	= ux500_msp_dai_hw_params,
+	.auto_selectable_formats	= &ux500_msp_dai_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver ux500_msp_dai_drv = {
@@ -704,7 +711,7 @@ static struct snd_soc_dai_driver ux500_msp_dai_drv = {
 	.capture.channels_max  = UX500_MSP_MAX_CHANNELS,
 	.capture.rates         = UX500_I2S_RATES,
 	.capture.formats       = UX500_I2S_FORMATS,
-	.ops                   = ux500_msp_dai_ops,
+	.ops                   = &ux500_msp_dai_ops,
 };
 
 static const struct snd_soc_component_driver ux500_msp_component = {
-- 
2.53.0

