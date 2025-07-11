Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011066.outbound.protection.outlook.com [52.101.125.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90E833FC7
	for <linux-sound@vger.kernel.org>; Fri, 11 Jul 2025 02:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752200803; cv=fail; b=sVpaBUy7vhdhhiuhrOViuQX2I1jUWtzzlVIO+2yF61GLw7MmcP4nD3P8wiGsZ4kBYu8LWhIqyFeIgNY0fiCq3ehMlyGOPsHLBz9t7l1VRWAGKVeZ8Bbr/DwsWlhvp9yl3fvB8xPiLiY4Eo8gI+SRWwFr5/nngAc4d90VCtIkoEU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752200803; c=relaxed/simple;
	bh=NV4C1oWnz2ew/SNguANId74Bp+7NschTQcTMNmzUOJo=;
	h=Message-ID:To:From:In-Reply-To:References:Subject:Content-Type:
	 Date:MIME-Version; b=HLDvFHEghVcaseulJ4XfgnUaEX4qBHFJ9tJowDSoeV6aIi4nl8Rr5g2EKd+uJYFvHK0S7UAhNDrtPA7zV4weB4ZhsflMS5xWlR2P6y9NIGyeaDhsqLYpb38oV1G4P3jBygWbh6HXXUf8z7WkXt723ktITADPcpdQmQ5b2obagJ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=BQiaQeNZ; arc=fail smtp.client-ip=52.101.125.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="BQiaQeNZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=boszyA0cyf9L1OQ7TcqbnCQAb0fXpULOAKKgM9kHEnLx65vghLFHeojomjDiU15lvoaqCo6xO809u4C2XDLk42/wBxaXmfEfMw+DIAwmtJ8tpW17HB+OnAyvhKdiWI4E/6lSjTexdQo6A/aKuApueBDiRL0tKyoO6v3J8MYXH8mgrpdb4rtzHyP8AL3o8asAGJ795/xewhsyIKWxTx1vn0QTYIDvFKgo1Aw7vTT36Vg7kiNTYYK374p5U4Nha7UYPBs1phgOUMt8wm8PHZC/nSKJ3cI+ENAprAqpBDOtry0bH7vLfW65J/BxUhGvejJb9ZJagyZFMzH1gTdEXeVAQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Aypw6pgbBFjwcuFETWHVcDqCActmC4elB0vacbM3mw=;
 b=AIUFk6dg0/ZMVtGmr5Q6bctvmAjBtsKNaB0OlV9jO2v5odSGIDFCjSrVnnfk0xOcsgc8lYdACPJY4tUdBs0x+8QDut+UAU8Uhg7TdX8TnzoX9w4TQuzAS4fD7lGFGNs2QSwh1+KvjmNyOFoJWJeZDpijgDMCvkMV2mQD0VCupJVnkVRa5/wZnOMwQW5p9mZdEU5LCJ4DTe0BpvErnpxpRuUlGVYL4KhBv/8ocXHwjhKDI2UVTOGWoaK3k5tiXs49kYN0b6yuAlNHyvuauVFP+w812sIzniUV1kbq+VgW/2TSnPeXYHeqhK9WbHFegl+fpIwEegD0SqiZdwTmjurhdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Aypw6pgbBFjwcuFETWHVcDqCActmC4elB0vacbM3mw=;
 b=BQiaQeNZSaYf0Z7qMTBELFVBT4R+VR3MKthBiMNF6SnErDFjR3Der71V0ileqrsKW+Xz4IKrq/gMy2h3EJDYJB7+GVQK1tEgi9CHYTo4RCIf1FZyu7x64pE4vMUGZYo1iz/MbyhWO1pVFweS3kXhTinxqU8mjbsdCyih6PUrZCs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS7PR01MB13586.jpnprd01.prod.outlook.com
 (2603:1096:604:359::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.29; Fri, 11 Jul
 2025 02:26:39 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8922.023; Fri, 11 Jul 2025
 02:26:39 +0000
Message-ID: <87qzyn4g4h.wl-kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87sej34g5d.wl-kuninori.morimoto.gx@renesas.com>
References: <87sej34g5d.wl-kuninori.morimoto.gx@renesas.com>
Subject: [RFC][PATCH 1/5] ASoC: soc-dapm: set bias_level if snd_soc_dapm_set_bias_level() was successed
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 11 Jul 2025 02:26:39 +0000
X-ClientProxiedBy: TYCP286CA0214.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c5::10) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS7PR01MB13586:EE_
X-MS-Office365-Filtering-Correlation-Id: 03bc3fee-1178-47a5-4d21-08ddc0225dfa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0k6GW3NqlDRD7GnTcCjcpT1l1ZpFdBdq7QR5vld+AT+P6D4SIdDAsDEClckZ?=
 =?us-ascii?Q?wNt2qiJkM4ru4E9X+NaPkbkhad9GFgTloWuBc/sKfzEQSNFX2NlqVwWwPt+H?=
 =?us-ascii?Q?VvML9SVZwVLEW1P0IxqC4waz8bGlrXp1Y50SP50BaPclGtiBypNSxDQihTzi?=
 =?us-ascii?Q?3wBqfu1cO64BsesIr/ixZSZikyUSRUiGoQocA+L3tT4vPDdlqz4qWvr6Duev?=
 =?us-ascii?Q?OAM2FVA2w1gDnOM3GFIvZyP+BAH2+5cUr6k/Bn65HhUM1LIPPY0xvk4C+3ka?=
 =?us-ascii?Q?/m/qH6Tj1AXdfU79UFMOO8hYRNA47aRqp5qIVIamu/IqQ5YC9oJMMJDEpGHo?=
 =?us-ascii?Q?yPGUa7FCq3OCxlEroTNq4GoK30eWyAi+crRKO/tEne9yQYsOB1e+sLM8KF5+?=
 =?us-ascii?Q?PPJOTfz72TWdeBTiNkydc28qo/ETwp5bTgaNJb5270iZNWbAmnwT78toSky1?=
 =?us-ascii?Q?+uEQXHUsGE2NjSat5QBWCS40YJ9jvkTYQvuYON0YZcQMrgre7/KeY9INHb7y?=
 =?us-ascii?Q?Q0WZ6I2WfnfhMhiR+bZD6aCiGMmCEYtatEq67I9IkA8fcsGoY4Jn9kXM/wX5?=
 =?us-ascii?Q?qFoQiu5cKWZf7js5p/fTg1AC81M6OFcfBhwDOpeAQujJqRgYqvtKuBh11uWI?=
 =?us-ascii?Q?XQDuUC/wSBVRGx+Q+JixBif//jptSEnmUDEbs6oDvH4RgGU0vbts16mQj7JO?=
 =?us-ascii?Q?gl/QDFX+Ssyt7Xwxnj7A/XC37tVMz23MOlQgr8yz5jX9InT0oVQan49S7AhQ?=
 =?us-ascii?Q?9dNvuJ7COLrPqULfozoch/yONd+9vT6aFldo1Xh48zc6R5wju2SfyXQlBU5B?=
 =?us-ascii?Q?ECAhtUbXPrpZ0HTDKY0irDPYKNMsRF9WRxodfrTb0qbDRZQ0GKGuoQkCBr2n?=
 =?us-ascii?Q?1NWQU2v3jkB95s3h+1cJ3mHH/SSeukf5x+R/L3khLbVRFl6WF48tEvvqsJ0t?=
 =?us-ascii?Q?KWKswn3PZE3t0XRkGwvtRC4OPLErNupkvZOsda2Jquzt5wr1eAJiWUW+NZzH?=
 =?us-ascii?Q?uLN6OhlY+mMS2j2fkNZhOsxM608s8MOXkNZX0Q2eXCoigDn4A+N0nYtRok3+?=
 =?us-ascii?Q?6pyeFwvxMypDnnChYHoOkMlWp3GWOh2Y2LQ/8/dEp4LXFNfyy4JWSjxM7Qa8?=
 =?us-ascii?Q?W91lfxHDiY/SA09P57A4hNR8s0FMOm8euD640f4TxYAONsQCigyDRfp0BTBO?=
 =?us-ascii?Q?h1bdWo9Pno3hLuvOonj4/H79VCqUKZ50R2RIr76UEd7iLP1jicr0E1wmepe7?=
 =?us-ascii?Q?pFPfoGRpeCLPd1wVMlLgYNCPIaRCjtDtSa6qH7iO4DWlFLiUwEWQN83ttNyG?=
 =?us-ascii?Q?iwsW9PcC+BFB4a4Q44iSLBN3i3pavNwbm+vTw6L78eQiIfpZQjSa1wuBDIbV?=
 =?us-ascii?Q?C/IpPM2VD5H6vMwtSEqglwIzs2z2hL2CSoEAmw4d/g2jniu/0q5rUFnzqULs?=
 =?us-ascii?Q?hi2/ZIMQ4MYDLXvWhnbQHrUzQkR3pgqEhCpHYBifTFxabNwsSks4Nw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?njvE73DQVfF6mBjf27cjpoEbUZK3oMbbDMAKZShDAS4kIXfLL9ki37+Rags9?=
 =?us-ascii?Q?53zf+MAepeR2+cvVQ87rKKolT1KdTLqIKoQGUq9w5/HCkKNcz5L0mHl6cdfX?=
 =?us-ascii?Q?74Faf2bSVcT3ygd3mVEBK6eiL2PxWc53wZNyf/NSJicyX1f7UXe0XwoNBo0f?=
 =?us-ascii?Q?aV0iT9D/QRGmQfBhUmpMO5E+M+Ile/kyHhE7B02eI12KhJwt3SrauLt6+RHk?=
 =?us-ascii?Q?UzvbeICyTQEAXDI8SzXQ1pH7VtrO0NTOIrECI4xtnychfRh4EQh5UqIhAkMd?=
 =?us-ascii?Q?yS9XsBBel1HRkTsSv+dm9ZGnznIvqBJytRmXzDWVC5fO/Es3nGZRk27hGMAq?=
 =?us-ascii?Q?SmG9U9ooa54zpSpky0/ODtBO73wjMTOFS7F4lMR+1oBM6KowiObZZWE3eq7G?=
 =?us-ascii?Q?EOPI2YcbXJ8FfNFdGzJyTBZEze9Ui0flaguekqZR8+0jO2CTt7OFHYGX/gLh?=
 =?us-ascii?Q?QAvTVPEm4KFoCZ5CmFZGGpVn42aHdtc6UooNUfchxmDmi1DLV6pSeaXrUSB+?=
 =?us-ascii?Q?IzcFDavWEY+9djdz5GkRSHv0bBVTI5cdgmmPM/IXEOMwfTJqXrbxhamJb0bA?=
 =?us-ascii?Q?Ed3/wUPyDlYxJAHdATtl48GBW2yJ1ZT9x9HqD3B5hPjRaCFdTBm122veW5Oq?=
 =?us-ascii?Q?HuW5B9S2v1LjGImrnFS7A+owDxWNi0UqoKeA43U8K4jVpp1naX31mgO6+DZR?=
 =?us-ascii?Q?avO8hMxoah+5zVWFO4FcaFRyCsaGwKoMwdgSJo4OO0ILF0jJkdI5cUPNFO+V?=
 =?us-ascii?Q?cD/WS/y5fOsGRi9yHFIScBzmYiWNZwARwq9W6GWe8SpPKnypgdGGBJKk5T0P?=
 =?us-ascii?Q?rGXX50g27QmuTPRiFzcAyrPum0SiEaNV8hkoRq+UcznvM+16v3YiTuCZLuG2?=
 =?us-ascii?Q?olPx55H6gLi+gdOUDIrYhwmuVmEpKVp94JuVe8TJGrGSpcTopS4m9gRgciN0?=
 =?us-ascii?Q?iJdKyxhaxGbdLKwniy1d3D/T7Avh7SvzxyCxPoB5j6ois8O51HxJtNsXoHwy?=
 =?us-ascii?Q?Hz9z46jdKd1LvYuSMQOl2btPAtoFoJLp76ki9gny4aZoh9PTb8bSJCOHTBEs?=
 =?us-ascii?Q?Cq3+IYfaNbrTuuH2kepncNvR/u3NGi2akSrvYAETRNruKQQSpMpagz6YF0Ny?=
 =?us-ascii?Q?tcJsezmhmaN8OzRd45gJgz7nzMA1cKv9eZrwq72Gh368gNfzxiO7fTV6nDqZ?=
 =?us-ascii?Q?5z43MRKTsZzdmt7QdpTZMBESO+TNlVnoFwhCDv7p2vcfVu7tGwIPNGuU6Nke?=
 =?us-ascii?Q?HwoVvN8oE8Dvi3miPG+6rKq9cbxKAm0lkMKZd3K8i1+YAs4aupJScChUyt63?=
 =?us-ascii?Q?LbenAawiNbSBwLiGZ+1yAqPKpUPSdtDU4ufLIIu5DhE8C5yRM7fKqhW/0Sp9?=
 =?us-ascii?Q?Mv4AacMBIIloWVsVIh0cBcAk07MFnjRlMv6ytlPiNq0FLEa+wo5dIjIR3G/8?=
 =?us-ascii?Q?ZpOXdXK7OFInALtmssnorwx2v+K5Kb5UASyoAUOm3I0gwzx/gos5DoPB70q7?=
 =?us-ascii?Q?CDnPNHJqY/jYIk05V8qQd+gTBPI41dwpCbXWSTaXRVQfeAsdHOe6THIzjTep?=
 =?us-ascii?Q?ta1Sa0arv3/kl8Dmhso/tA+Mh5uekVKdDlvQeOMPGAQHD7vF1ObzMNmoDcaE?=
 =?us-ascii?Q?IIBGHmtWCHhuWHDl9nVBP5U=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03bc3fee-1178-47a5-4d21-08ddc0225dfa
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2025 02:26:39.5509
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: phTJTR3KCtvyALqdEu/JyRhyX3GcvR74590mFEAyzooBFdr5soAxLL+i5wRLWWxCJmKO4yYoWNcdW0FVZjWlsos6tfzluZPl/LdbCErWJpGCfmpAL/O6aWBRhFjhXCMl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB13586

ASoC has 2 functions to set bias level.
	(A) snd_soc_dapm_force_bias_level()
	(B) snd_soc_dapm_set_bias_level()

snd_soc_dapm_force_bias_level() (A) will set dapm->bias_level (a) if
successed.

(A)	int snd_soc_dapm_force_bias_level(...)
	{
		...
		if (ret == 0)
(a)			dapm->bias_level = level;
		...
	}

snd_soc_dapm_set_bias_level() (B) is also a function that sets bias_level.
It will call snd_soc_dapm_force_bias_level() (A) inside, but doesn't
set dapm->bias_level by itself. One note is that (A) might not be called.

(B)	static int snd_soc_dapm_set_bias_level(...)
	{
		...
		ret = snd_soc_card_set_bias_level(...);
		...
		if (dapm != &card->dapm)
(A)			ret = snd_soc_dapm_force_bias_level(...);
		...
		ret = snd_soc_card_set_bias_level_post(...);
		...
	}

dapm->bias_level will be set if (A) was called, but might not be set
if (B) was called, even though it calles set_bias_level() function.

We should set dapm->bias_level if we calls
snd_soc_dapm_set_bias_level() (B), too.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-dapm.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index b8a5875378c8..a37d44cd04c6 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -1030,6 +1030,10 @@ static int snd_soc_dapm_set_bias_level(struct snd_soc_dapm_context *dapm,
 out:
 	trace_snd_soc_bias_level_done(dapm, level);
 
+	/* success */
+	if (ret == 0)
+		snd_soc_dapm_init_bias_level(dapm, level);
+
 	return ret;
 }
 
-- 
2.43.0

