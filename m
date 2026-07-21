Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010062.outbound.protection.outlook.com [52.101.228.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FABF3F7AA8
	for <linux-sound@vger.kernel.org>; Tue, 21 Jul 2026 01:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784598495; cv=fail; b=ju4uWdpOj9FgUGP6IvZj0D4KrenI13iljLjee1cZtqvDFxcPfNes1wPJKJekSNL9sNXV9ZpCFxbsFWUoxs5SmIbbjReSAxpfBkwh+B1JIrFSfUU3ORY0Ip7Hx0sdv9DpqUa2X+f/+HiNyzp6cEKavR58n30rjA7C9YDWewyqTnU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784598495; c=relaxed/simple;
	bh=u58ytDoK4hYdQ9R9dWFKGACEd0pgGG0zMXKhLnBKB68=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=bxGDAmzBlmmOkTgDEUcfj8nQiXSuwbONQVRv6Fe3dHPUnxWKBjuK0OwXYqPA0jnliU3CdBXuSyv1V6ZfgVof0ayuxmkPGpB4DJTZkQ3Jzyy1TyZlU9ft6lMSv7yqhSY/DMMrPAwSgfYLV2UG7DFJ/J8vwWwfZDl/1fFAP86qhbE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=dFKryYQl; arc=fail smtp.client-ip=52.101.228.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="dFKryYQl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yhIXN3PVyEjZKEU1xSB//k95oCPiMXw46/KS115mXaOb72X/MH8At4rQrq1V7DNmS4OSr2WqdgMQhoYJ4jp5B6y+SJlOF1l+6VCSYbHEgxzptSLHboh3oLxEiir4WiTozrql/90jjSBTbUyaP422SZ5ly8wXbK5kxNMfBrdcA8yoGfCdwnhQlEk+R842y3lEffhZ0iujS+0khjMi5tjKuoZ37cOqbsh4ceRFdIwHKD+30o//83S+vQP4uzXZy2/FqHaqbOVSQEwdck4ZLcifiLEHpxsuC/bwTVjKXoHYHxzi4o4icOW9yBf20UT6f2uUWAyZtWB02uAR7qWraFX0/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xIICkFTwM0CTGW0jexU2NzzYH9uMplMoIdKK3AKd8fs=;
 b=PiTrx6S6dz7Wt8q4MeJgTj/MBxulFl/KwCIA3T9BP/X4ff8/icQRDQrgzTgi5RMzLTQgaB3K462PEKJFVMi5j88y4/c/H0gGcK1f4t1yecpvtWDDnM0P4QFLR/cWlDkWpU19YDpSTAXb36ILd3WW57kZhOw11yG2JakKzxnbG+iUo0IvBfpZNeBvjcqYP+6edYbnGCDQ4dJOtdmz8vJVMJ7cT6RBstLqjuq8qEF+i3hOLbXNgm6J6HYCX1hssm01qjADNQFhQXYwMF9mN3zhsjGEzilPtSrUCW10ySjDUQJgGB6WafRpUn8q2pR/lqBxTCLkm2qvbX6SwfZkDRccWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xIICkFTwM0CTGW0jexU2NzzYH9uMplMoIdKK3AKd8fs=;
 b=dFKryYQlIDXN++qZesa/X2RKmQg/tFU5s1cAYB6AMMKC/utQx/P6gnuTkf7XhmqszbXhuPg847MXhl+KvsFDXqdLfTA0uvb1nWhs3ku60a4DT52P1INwNpQXJEFyU7xC6FuNkagzpe0PlNpqFso9CNRkZ8oyBeyuNpauW9VdPhY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OS3PR01MB7707.jpnprd01.prod.outlook.com (2603:1096:604:17a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Tue, 21 Jul
 2026 01:48:06 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0223.017; Tue, 21 Jul 2026
 01:48:06 +0000
Message-ID: <878q75i04q.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 2/2] ASoC: amd: acp-sdw-sof-mach: use &pdev->dev instead of card->dev
To: Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87bjc1i05a.wl-kuninori.morimoto.gx@renesas.com>
References: <87bjc1i05a.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 21 Jul 2026 01:48:05 +0000
X-ClientProxiedBy: TYCP286CA0072.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31a::20) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OS3PR01MB7707:EE_
X-MS-Office365-Filtering-Correlation-Id: 6fa48aff-3e4e-4f12-1cf3-08dee6ca1be4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|52116014|56012099006|11063799006|10067099003|38350700014|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	jGDJLWBYhN6CpXPanld6WkbJvQYNTrl0Bdv/VNS4kGk5Yyi6yO26ueFh642gch67cIp03NEVPzUqjBcPetUsPhUp1ebvIDWjMyo51IreVrwwFK07AiVXjLy2bs7gdM43sXTKNEhdM2iuKCUOGqFemTCDV2fUNa64RHz02s2YDHUxICZyxnEuxkNS3cv+JeIdCfrEafYBaMaiyVw/HBiIL25rnL27trs7WJlm2bAPTnGfxOxY9+BUPuhvi61MZimRaIVbOFYHRpKyGFMYMskbrB1Wd/upNs4JinfU/a50ePDJkAjKyOlGaX1WYs6Vo8GBiAgVj9Ke2O0vWosyV0mBxLnEM9hQoz+3YJEcSbXFB7cqknacH+6Y6KM+iv91I4HHuIfKH07Js4IvyW/4SKqI1crk6emiEcmjqUaVIRae4xw0C6zcKfa+D/oBR38/rnkMY/qekZ2qaEUH9C0LBZNwZS5/zCMJ4vlOhcKkacb3L1f+RVKLA28GeFseNrCaJz9DPCTnhZ4u7I8fCFUQ1oSX8/jEn6tze5VIzVAfPpWlk04n1tTLeshE6043IK7HeNZi5/tBJiFTbcACylc95bw0K6KAbEasEp/QsZqiRUZaWgaA7V70MgqHGwwd93SD9M1nWZcVoxEJf3uru1wC89BvI4lbvzUNFyAOcsHhBLd988fu7iYm77tpPEB4nES9SonZlhigNSokY+eeIinZYkf1MikzU/5bqvVVVBTi4CEYKFo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(52116014)(56012099006)(11063799006)(10067099003)(38350700014)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qgxBpu6Jl45Hc3k1rmpgy5pa7qLzB4gd7SnXreUalmcxz7MFzmJtXiUzurJt?=
 =?us-ascii?Q?eJlIvzB2idj8evVkEzKA1w8iV8xUHuXAk6IQEGa+L1JCY5Cby+lw7719LV89?=
 =?us-ascii?Q?pHObq+e7awdcaHMY0mwiF/LBppHxJlD1Epk611pxtL+uvk1zXNLquyYUKaeK?=
 =?us-ascii?Q?Sz/TNRR94w7YRHryGMyp8Zv1Ci1db1YAhiiwUl8EV9QbEmXs/5+dzRDvPDUN?=
 =?us-ascii?Q?ZoDiXMOblZBhLhHWPSJfBXm0D/6ykoGVfaqEKccHbeuSQsVXiGpZBBluWm9M?=
 =?us-ascii?Q?fo0VK8fC1OtIrdSB6aGao7vsQngmEuBHi6mn+mmbdgNIEYuwSBTotb4eRJIB?=
 =?us-ascii?Q?An200dzSPo/yRfy7TQN9gp8Mr7Tx7AglbR0O7OZOxyFqbwdfqHR62loXuPXf?=
 =?us-ascii?Q?cUOqOV9bl0uTBUodozfWc7VVVL7dX2f/PwAgwoTsHTgdRWPM8qoP6XIFROSQ?=
 =?us-ascii?Q?IgZZzJJ1CM9xqJuj/5+KG+1nK1cyarW4mjXLCE3sSEHExn6qpA/m9Z06+cLJ?=
 =?us-ascii?Q?tK/+hNVTnaY4ubvf2raf3kxi397ul05xMjDonGeavRRLHv6R5SwwWea0c/kC?=
 =?us-ascii?Q?e7aQSpeDpOIJBJCRE6Fncra3NRVeX0yPCN50iZFn8B0nXH1J5QPIR3+7/Fg3?=
 =?us-ascii?Q?O6UKZksEu+arTqPbix2hlAzu/kRhJL17jiNNOwBU24LJZp4txm9vK+nCxh8l?=
 =?us-ascii?Q?6lCG7htrnBhEOcVSvI7etr0DGJb2ApufcCg9GE36MH58E0VhJu6Z6Iy9iqws?=
 =?us-ascii?Q?6CA3DEEDW84dqBRft+MDe+ve3iggAZaJl/4LYxXl8ys1lFPRt9XQC23Guvq6?=
 =?us-ascii?Q?3oNU2XyfaIY4sNCJ2cmyxDEBd1FbsS7XuoMBUU2rl2yayl4RkkEPGFCgXNGx?=
 =?us-ascii?Q?F0sk7PihG7+ilw26btksljHF2nhRCHTHqAXR72hfhRdt/6cgIG363DZ9ydyT?=
 =?us-ascii?Q?UjScRIUbXGs+7UEoA4lbWh+Apgvj6vS+yTBCyVSwmeIQPeEF+XnFgOf0vi0v?=
 =?us-ascii?Q?qR0e5jZwRPJXFMWwVDX2oLgtCCqs6BPW8o008XdN5WJQEe3OvTgq8zL2YFRF?=
 =?us-ascii?Q?WJY2xgL1H9lp+maIdxuveb3b2P2mbqUvXd+PCiv4mAk1A0ajeTrPXjVZ1oRx?=
 =?us-ascii?Q?ettP0CYm5pEsL702f9ewkhuLICj5OjhZAp6XeTkg4nJQGy2Z4O3rTcI0KEIl?=
 =?us-ascii?Q?XLoimV9mkQBM2eOsNoINLZ2zditmHg4yydbwq1sqKYxlCIx1gr0GOxJ7HwqA?=
 =?us-ascii?Q?XOwKMwMdEX9a48A7m0x7XooXCMq8f9IRZZ+9Vk3sfPkmnUJVQcibX9Ck2cWF?=
 =?us-ascii?Q?IuidfHJVqFdcLBLIJuVtYmd2RCQ+DieAuh36eX55t0wIAXQFVsi0jznJemo8?=
 =?us-ascii?Q?vK3IBVIf+oxeMV8ujIhFj6YbLj9eUnQhcCB3qBKzRJxPhfSc38E3w8U4neNB?=
 =?us-ascii?Q?MPOIQRk+Q2gm2hx7kPRz3heyEF3R+RMYf8IYGo6oOh6zEy9bNNWYN/gtUu4B?=
 =?us-ascii?Q?IjK5PsnTlFpbrewhV8mkuJ4HsMnDYvdFRQh9Oj+DfL8P0Z6203RAgAuEN/dX?=
 =?us-ascii?Q?A7MvIBYM+wF2Ia1JgPHjgz5R6Zkrf+ZswBBpNxHdGGF3nw2+zwP/icV8kqmz?=
 =?us-ascii?Q?ykkdQNxmgnLDumwQQN4B/JQIfS4Fb7fyOc8stSe/pR3rV1z6alViTpox/Jz+?=
 =?us-ascii?Q?ljqiU4LQntgDRQlxN4YoSnN/dTh1MIZEDzLv2pD6B06NjQky0yXZE9b1iAmo?=
 =?us-ascii?Q?Jg3DDzp2fZygOarT1al7gxP+HGI/3bg5YNZtfkeKnN1i5/0Ij5b0?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fa48aff-3e4e-4f12-1cf3-08dee6ca1be4
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 01:48:06.0162
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RHDgmnUvm6xz+0Unk1VU7Z4A9abaenV0m7NuJFaQwAlheZNxMuI8de/SdOJycStk41hOvwaLlwBiTZes2rEhvz4GDvWoykd1riN2Ydh83U3b6zu5uGrQkr9EjiSFXFC1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB7707

acp-sdw-sof-mach.c will be updated when Card capsuling.
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
 sound/soc/amd/acp/acp-sdw-sof-mach.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/amd/acp/acp-sdw-sof-mach.c b/sound/soc/amd/acp/acp-sdw-sof-mach.c
index 963ce6fd40122..a1c5e97ad0b5b 100644
--- a/sound/soc/amd/acp/acp-sdw-sof-mach.c
+++ b/sound/soc/amd/acp/acp-sdw-sof-mach.c
@@ -388,12 +388,12 @@ static int mc_probe(struct platform_device *pdev)
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
@@ -412,15 +412,15 @@ static int mc_probe(struct platform_device *pdev)
 	for (i = 0; i < ctx->codec_info_list_count; i++)
 		amp_num += codec_info_list[i].amp_num;
 
-	card->components = devm_kasprintf(card->dev, GFP_KERNEL,
+	card->components = devm_kasprintf(&pdev->dev, GFP_KERNEL,
 					  " cfg-amp:%d", amp_num);
 	if (!card->components)
 		return -ENOMEM;
 
 	/* Register the card */
-	ret = devm_snd_soc_register_card(card->dev, card);
+	ret = devm_snd_soc_register_card(&pdev->dev, card);
 	if (ret) {
-		dev_err_probe(card->dev, ret, "snd_soc_register_card failed %d\n", ret);
+		dev_err_probe(&pdev->dev, ret, "snd_soc_register_card failed %d\n", ret);
 		asoc_sdw_mc_dailink_exit_loop(card);
 		return ret;
 	}
-- 
2.53.0

