Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010036.outbound.protection.outlook.com [52.101.228.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 700C5368D65
	for <linux-sound@vger.kernel.org>; Tue, 21 Jul 2026 01:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784598562; cv=fail; b=HGU9VL6EYyX5AS70XdvpAjxX/tsw6U1QgkI9pKDujw4MviePQstu4JhrJzPKShkelCB5tsF7JsMx0Tc+7fKI/zbFyzRerLlzP+fbMXljr4fP9b68pIMKyRp2/SnZ2Y6XkxB1ABF0Sr4HxvWCDpKZArlhSHW/4Eo9d7eibNAhCr0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784598562; c=relaxed/simple;
	bh=D1VhXBJjc8kvWDqPNJW/6QjUp0DHfFQFB1ZlG7dnu8M=;
	h=Message-ID:To:Cc:From:Subject:Content-Type:Date:MIME-Version; b=rbv44bdwQCD4tSlT4zwMf0wlcyndlHc5ewt7xsGx2dH0rzOwbwm6llIAEt5MRv/vNJqBqoISxGFaQIWTgxBs5ngx4dRMMQSX894yHIK8HCF/vGY0dx+OCglDJiFjjysHyJEVKdZaW7NpatNSH8EtT/Qr8MiVdrwwtTnQmeTGWEM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=KKHxSPB5; arc=fail smtp.client-ip=52.101.228.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="KKHxSPB5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MsnlW7+gwAGVM405wTHj2+EMWVaBkRVQsR7X+XUrmv9eXwcdqDlbWJR3V3Zn1cu4cPLexPXwtAUKJ0fb9aq8S29FxCpSccHGwZnEl/Dyx+b4BhOVqeMHHfqW2Io/dN/gNTo4y4Mp3oSfJ/qTQ6iiaSMU4nMsJ30/1LyJZ7cwF2FTFqAVlAm79D2mtP7JuT4ZxVotxIKm4/8Htb9MLJ26hNZwp4zan4ariOAc/plb/MOKk/JXNPlVzFjG2kQ6BDuj1B7DVGb7V/OfZplvRo9xlCf/hjB0HUjoslKREzJms0u9a7MGe1Y1UlenI+TA7/IuL6DGqEtByUSDjvRb1Kkbbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9cd4lStGOFklRqqf6bGfem+1eI85voEXzLvPJaT+sfo=;
 b=dAs0wS2kNvOYtNgAG6YMORHtGJZwGIPUTOqcoZCYT1yMn06VE5TdHSbkLHSdK49x7sky8uw2NoxOH2e+6szKFlMLT7L4gI2XxpwTEnYVI5eMmOUlS/NCx/caVfpAJCqMXhiTprBTMA/ikn4dxmaQK+dipPyK1N8eZGBLk24AvTCN3nEdKM8n68JPNQifdwt2uWl8C6kUBEspX+4Bz7VSeJ1CvHgUW4NxfNK9/TCoIl7P5QBSTakEhkvOAeliRPi/DkayKnGCaKQwLPobD4vlWyd3CzgkPy92dI+rqy/KqCg72CKu+shRkGYWvWXeMqIVQBTxZjc7uG7i1naLL88YJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9cd4lStGOFklRqqf6bGfem+1eI85voEXzLvPJaT+sfo=;
 b=KKHxSPB5+41yLhxPd+qPvknZ7+++v0ZZK51tIszbFHmvqa/vG3o8P1UF2kA3PFK3zEUmctuVjjgz5my+z7cilzvdi059Q0D5jKWYzpXznF/x2A9dOaOanh+L4HlTKvD6ZLwo81eabKJyh/lNrlnKXZJwVW9xh3J00Q/Lox79S1o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TY5PR01MB18189.jpnprd01.prod.outlook.com (2603:1096:405:3e5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 01:49:17 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0223.017; Tue, 21 Jul 2026
 01:49:17 +0000
Message-ID: <877bmpi02q.wl-kuninori.morimoto.gx@renesas.com>
To: Bard Liao <yung-chuan.liao@linux.intel.com>, Cezary Rojewski <cezary.rojewski@intel.com>, Jaroslav Kysela <perex@perex.cz>, Kai Vehmanen <kai.vehmanen@linux.intel.com>, Liam Girdwood <liam.r.girdwood@linux.intel.com>, Mark Brown <broonie@kernel.org>, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] ASoC: intel: sof_sdw: use &pdev->dev instead of card->dev
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 21 Jul 2026 01:49:17 +0000
X-ClientProxiedBy: TY4P286CA0136.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:37f::13) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TY5PR01MB18189:EE_
X-MS-Office365-Filtering-Correlation-Id: a22c247b-f704-4869-2f07-08dee6ca46a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|52116014|7416014|376014|3023799007|10067099003|56012099006|11063799006|38350700014|18002099003;
X-Microsoft-Antispam-Message-Info:
	4T+NQvw4XLQ3S0o+AaQk67iq3bUTor8UUAuG9i2/EI+Rg5jAe11w8s3JqeqQ3Qq1hKaCPbOD1DIR6ih/xPJs1hM0Wt+3ZTDOuh3C9xdJ9UNuFpuzaQV/6TXkwcz7l9ntD0t5/SAoR80L/aSUzrcPRxga2WFRF5AtGhypuqO+O5OgerJEBptpyicwneuvQ6buRxCaK1vhmpdrfveRyRG1F+IZmUG6kG7zq4LG2zV5hX1MckgzEH/j52otO828LAQ++lUaWCTWsBBRjK9BiaA6Who7dteo+MxycOEYhCmSDOctFXje65sxKMVpHQ/Z0RiA6HfRiknPzPGfgwidValXCn1wWY/HC7tx82xvB3lzUokjbzvkGpM0pqZLnoBvN90tWyvyj8jlLEek0MQ0ltmtstukt2ZIeVw+Oq82IUS8tUhzaB8DxjMknFfbS6HvbhIGmFO6fnf3pWoMnv4AhmzVXT2ovl6L/IkgatSDhRpiQNzT84a9wizp9N3xYgtZQdIVkndfCkHAh1sgHcnBfPM66unBcEQtfwXZKBHslYF4u9GNggCAwMjnTWatSN3X2pPWNmKA6FbANw9N/ycFAkjrMYm5I/03ZKz/O1/dMjJJzuMEpzLwEOh8pvlHej6pxRNdlhU/XmEdQgrgb8o6o6UctKNKDUFTpR1vXY/H6TgE41s9IRiGSyIpY0+fbHHP+KMb3HN3KfLElqcWknRMeonzEcPnvEqJTqFm3mpF8maoi0U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(52116014)(7416014)(376014)(3023799007)(10067099003)(56012099006)(11063799006)(38350700014)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?G8CMzA1tQ9Mvxu3YHSC0TDvJQtAtuLmJuOD3EfwE0+sVjCz+oKVT0tMQ96s9?=
 =?us-ascii?Q?FmUPyp+GQEST98pRT4Ozc+MKmPMQu92YM2kUBrCGhsEG0+0nvjK9uf+uKyti?=
 =?us-ascii?Q?KXV3e2uJqfioBBH2db3lH5+13T5w8aqeECDmLcWUgwLOzzCQylXcFYnyxE/R?=
 =?us-ascii?Q?VmsXMTr/4+Nj4dWOM1F3RCJVEggQG7vYPlTepeQDur7C9ga8WjhUfhP/IoUU?=
 =?us-ascii?Q?vSd7El9J42H+Y+VJvyDkH91DivDxy2/yPrrChpuLTxLE8V7GDvgsEYZZ4Yfm?=
 =?us-ascii?Q?+wH/fYIvDNy1lbKaV0/9LMi9npRUDvelKrloh+4iWGtnTJ5MXm2c8Q/TF0/e?=
 =?us-ascii?Q?V4DTAp/dJyxHFwykaG+h1leyLAqF9+zOYebmmBAnSRGWW5AWG9oCMgJcALWa?=
 =?us-ascii?Q?3xUNutUBu/s1g+r9hBVXmuAWgMrgMn+eAcX9gM16wFhmXBJpolZebHPbAkWz?=
 =?us-ascii?Q?7p7PBEAL060i0TiI9A0wOVWhcMOisZihdahFBVh9CNt7xqBgqOvAgYi3E91Z?=
 =?us-ascii?Q?RdyzQf4vlxMxxSFDJyY3lC78zAKC4vMNIREnx7su2RP6lJL09jAPMDLV4OGS?=
 =?us-ascii?Q?bv1MeIZKaAv4AzzaH1Z+4loMpRXwDyOUtvxphPpDxvYkUjT8uXdRDlYuBaFD?=
 =?us-ascii?Q?zFv5OvAMQ+XDf8yG+MCaqrhXYPPBDuWEqxk/hWxcMFnHvLT3KhJ/aUDe4ZWl?=
 =?us-ascii?Q?7ot01PqiFxTMOLRSmgZpWz2URHc6yToC6IlFo226TkkF3F4GWpBXVlYCTnTs?=
 =?us-ascii?Q?IgJA8XcDSNki+0r0nMUtR8H5D4SEn8JZPUgiWwiY7pb788jDoHYWE63QvkIJ?=
 =?us-ascii?Q?6FEZrOz0yLGw0h3ufqVraQegomwL6WK0MUs9MxnNYNwKtdgAtiJMYwMunuRf?=
 =?us-ascii?Q?+xFQCOF1teY/or2FfJjHObi+oZfZxmbR7RhfP0t1z/puqb+P6TyxPSL64A9t?=
 =?us-ascii?Q?2LcvpuSK+YpzwSC0pyTg4jKmHSac+3kqaSfg/UyNypzhB3r1ElAqonvDuOoN?=
 =?us-ascii?Q?hlcYnudVdZ63WthjuOyeWdpest7CQYoSz7m8tH1XE6ZVivvb9xxtFzCkDGlj?=
 =?us-ascii?Q?Eq/ViH6tbjUvZSmHk1qUgXj16ocImi/5715k7fchBFEZYdUCtoHpE5JlKonR?=
 =?us-ascii?Q?SBN3sdQUfKd3nGXUcHFh6LU9SpvAgKhPBl2D65Ec8Gs7/B1eaGwfvGtsnx8i?=
 =?us-ascii?Q?OnJFIgn2d2bvOkYcQ2S69bt0VzuXOy3XgDcEt0T9vp5PfLmHJh6F4pq3UAUf?=
 =?us-ascii?Q?U2iKzndjalyGEI3nPohdTadMVihRNklUnkT7B0KpewvK+EeiwNWeKUT70sJG?=
 =?us-ascii?Q?lNdoHXg+UbApzQbYzrUtY1+H+bIAMUEHf0+HIx8X0UksorMOJG4W30oFU0sf?=
 =?us-ascii?Q?BpNC0jbp3S2DMxN0tnPBe3vDVVZv2eux4IMgxMygqiMcKnVji7PXsBKyebM6?=
 =?us-ascii?Q?pl44hAbfc6uPSFZ8W3la4gpCNqqHt+Egz7SKnoL8kvb+lJK/+/gudfFTBiJy?=
 =?us-ascii?Q?QMvmCi5roFjTpp4xYRNHUNtBCJPPJpz2Cu5MVOFqLnIaw7Aobn8LJje33ok3?=
 =?us-ascii?Q?toQN5tBPWyKaT4nsCuhZdeDqFdXl2lAG/Wl0DXeqniYj4Uq2QcTVGaHunskG?=
 =?us-ascii?Q?NSZxx4dP7IaaDFWyNyqc4IIoXhufuoJxzMxtUNBnhUya8fezaLEA7onnk6Ki?=
 =?us-ascii?Q?MYDn5tybMBK8hPk7VntjQSFayxMwH7GaSl3sYssD672D8KR0akILpSYivR3p?=
 =?us-ascii?Q?G5EEvKAg+VCxETPUHXaYtXA9sPrMv6lgYkNHCzimGmhu0+UTsUWT?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a22c247b-f704-4869-2f07-08dee6ca46a8
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 01:49:17.7916
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8FDpsvy/SUIxXJE5kk78Jh1mVXirGCxPkKqhBpNIc2iG7d0KzIs7uF1rbRerR6MlB9di0/rVllQe9UNDPIrtsbGJwtT1jlk97aQz6tobYHZo70IDzAFgGykfT61dcTk0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY5PR01MB18189

sof_sdw.c will be updated when Card capsuling.
To makes its review easy, use &pdev->dev instead of card->dev in mc_probe().
There is no diff, because

	static int mc_probe(...)
	{
		...
		card->dev = &pdev->dev;
		...
	}

No functional change, but is preparation for cleanup driver.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/intel/boards/sof_sdw.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index acfa34aea2428..3386beebf39dc 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -1481,12 +1481,12 @@ static int mc_probe(struct platform_device *pdev)
 	dmi_check_system(sof_sdw_quirk_table);
 
 	if (quirk_override != -1) {
-		dev_info(card->dev, "Overriding quirk 0x%lx => 0x%x\n",
+		dev_info(&pdev->dev, "Overriding quirk 0x%lx => 0x%x\n",
 			 sof_sdw_quirk, quirk_override);
 		sof_sdw_quirk = quirk_override;
 	}
 
-	log_quirks(card->dev);
+	log_quirks(&pdev->dev);
 
 	ctx->mc_quirk = sof_sdw_quirk;
 	/* reset amp_num to ensure amp_num++ starts from 0 in each probe */
@@ -1505,13 +1505,13 @@ static int mc_probe(struct platform_device *pdev)
 	for (i = 0; i < ctx->codec_info_list_count; i++)
 		amp_num += codec_info_list[i].amp_num;
 
-	card->components = devm_kasprintf(card->dev, GFP_KERNEL,
+	card->components = devm_kasprintf(&pdev->dev, GFP_KERNEL,
 					  " cfg-amp:%d", amp_num);
 	if (!card->components)
 		return -ENOMEM;
 
 	if (mach->mach_params.dmic_num) {
-		card->components = devm_kasprintf(card->dev, GFP_KERNEL,
+		card->components = devm_kasprintf(&pdev->dev, GFP_KERNEL,
 						  "%s mic:dmic cfg-mics:%d",
 						  card->components,
 						  mach->mach_params.dmic_num);
@@ -1522,7 +1522,7 @@ static int mc_probe(struct platform_device *pdev)
 	/* Register the card */
 	ret = devm_snd_soc_register_card(card->dev, card);
 	if (ret) {
-		dev_err_probe(card->dev, ret, "snd_soc_register_card failed %d\n", ret);
+		dev_err_probe(&pdev->dev, ret, "snd_soc_register_card failed %d\n", ret);
 		asoc_sdw_mc_dailink_exit_loop(card);
 		return ret;
 	}
-- 
2.53.0

