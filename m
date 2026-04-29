Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011039.outbound.protection.outlook.com [40.107.130.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F4953C7E07;
	Wed, 29 Apr 2026 09:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777456731; cv=fail; b=UOjoYLqhASL0BEQtveMCV3OiC1mVjWmgZklsYc1HBj4E2nTHfmGnUBbSgN4xDPylG/FRF8ZxKRULGdwVe3vnYgk/gnK0nj0hrzU0ssq3Yx3qw9v8yJoRgwFvD0CocmskFmDfFIg2kveN9lsIyLSFv6s2HG1/DIgaxT+ZyQVdJPc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777456731; c=relaxed/simple;
	bh=uFWET0sTGiZFwRKraeYddGqlP0bul2LLr/Fl1IApWVg=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=h1hwUhkILFhtwuTYpa8FtTOjDUT6zgImlL5EtmnahhBo9HLlsJwyorQ2RFT21DmVC1rY5CwbPUJXEfAaQVvM1CzjJ/cftNrf0/KK3XZW9PiZxAzLeImeAkssGB9map5oBKrtfxywkOHETE0F8DpJngjEyrXcxT1yOOYa1dV/CbM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=LrzNwX6x; arc=fail smtp.client-ip=40.107.130.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="LrzNwX6x"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IX5y32InrgKSTHEMxQuLPwT/u0vGRDfwH0kDPukXVrnhrAn8FfNNEnPu+mChg/1DxWDRiGNWrfti8mWuOBMiOFZhz3d07jJJcSBaSueHoYyL2xV98cGB2emmmGaOAP7pL2SDiEYjcK0bxioZLw6SNUcX6l6Ugqkrep0yNxbzo9wiXuQtsKB441K/xNOYvR1RJhMx6cycPQgyScbSMMVGl0W1xxChqRBSIRnuXTTWciMrEzzWMr55DwHlajzv3SpK3HQLfPc1zg/G1sRLJllqfzIOpACuNmGD7NxVHEc9tIAwAb6NbzKskC7aL09vgdd9F2zdeX9XGhvZcYHuWMIx7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4yRV3QOXiwUiIQTUCWPCNwvI+GZ0ZPve3PWmJ9M9mSg=;
 b=ugl2KIxn/PCDQknRPXEGl3d4SbdIgpVz/IMkcvqMpSYIKo0vL4G7Y1LRsEuou7HF5YKOMzQXcxQ2WqHmJ1Vx0ENzMKnmfSitDlbhv4uOqJONKxyXkZ1MKwczG+/oa19/lc/sNtSvACiSJSJOx5Dq/JnYoOdgGLHkBnbtv/0QXtyMKa+gyrUeo1o6VF0//dab83sFa0Lqv0249GgzWUALU5yN7xrl1tY2zSwIW4YGAd7nZF1TGN2SO7oU5gwhp7SXhjA1QT1LlYneJJUfTaUQrU/pLY1wQ1+AO/rSwOACR1ErszLQ5IssiiAvn2+JQCQ4Ng+UVhV8F7ibJDD2kbVv1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4yRV3QOXiwUiIQTUCWPCNwvI+GZ0ZPve3PWmJ9M9mSg=;
 b=LrzNwX6xTvOjLxwsKFnv7cOU8RYMeBrwGxRoonFWFTcRFesXruMA3PmOohalbI+Q5maAuV7kIi1SaL7LG9WXgj3r1YHSTfbQZaJUkXcJ2OuGjiPvF0MXVxiDvZra0lkHhZuSdAm+1ZKD+HijgkYPTq09zNB3IszCCXsB3do2MG9xVrTA0tzZewR/0uNqhNlNn5fcD/j7X/pkgVlC1pOmL1hRBvap/rlhnCzG8t8IQNiyiYm6E3CoeBXNYDQ8kxSUOGTfKI6Ni31cPD6DeW6u8arKCHHG34FUD+e1gyTpiU4JqDHQKNwD+pb3phvYg2Axy8ARfJgkNQF3I6C4tfZI9A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by PAXPR04MB8269.eurprd04.prod.outlook.com (2603:10a6:102:1c4::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.19; Wed, 29 Apr
 2026 09:58:45 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b%4]) with mapi id 15.20.9846.025; Wed, 29 Apr 2026
 09:58:45 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/5] ASoC: fsl-asoc-card: exclude S20_3LE format for WM8960/WM8962 + SAI
Date: Wed, 29 Apr 2026 18:00:26 +0800
Message-Id: <20260429100028.2739711-5-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260429100028.2739711-1-shengjiu.wang@nxp.com>
References: <20260429100028.2739711-1-shengjiu.wang@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2P153CA0005.APCP153.PROD.OUTLOOK.COM (2603:1096::15) To
 AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|PAXPR04MB8269:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c7c35a3-405d-4c24-a50e-08dea5d5e6c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|376014|52116014|7416014|1800799024|56012099003|22082099003|18002099003|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	OHaaGdpJGlhjcjNSwCCU/h+Olsnw5fMKDuWKfR0zGd7pj9d+t8a9l9ogvslnwVP13ldANCBsalyYpys/Ns9TGFYJ9ZULisaiJO6N+7SPDDtqJdWEKyxfzi57z9dnRz5CqPs9H7NP5yJcLT/jLh50xTPqeG74BWtzKBnTq+771ASpw7fG9MAH6rttoXM+By4UdW6kaLIXhcllNzmQgSLsJSsaTzRszGr+0FIGoIpmrFvnmMpfr3O4KUJnmkN/CwKGDeUN1HihZgrot5f/csCmruYMEpNptVS2cFxTyA6Dy9zMOg7EfAGEwy75lT945titgMJI/B0MohXG8g+f5QtDSK+n/mY217d+Va984D3N1GKcjgJWwVR8qDmNeCeC85YdSkY/biP5q2j0aMHJBSmkpIVmZTW9KCXVBjNUqCCI01DhiI9YaXJ6wwCovBy7kt7Ct3yM2ulecpyc8Fe+mEBo8/g527jdDUDJvWgxes4YXxLLdQ1GwH8i7NtOA4LAYJ4XYPto3A7Bs+OFFOiT5LWtkXg5IVtOctRHtroUJwYs7w9qtZkvkVEBA66+u7RZFp0gvml7xqVxBm2VdDVOpwFy1tUu0F4UyWN8hwasffmVf5c+moe7moahAT6PhzBYLignSksoTUWn3/XA60jsK1YbaigmvGn5DVnuEAxOXGc3G9fhE5qDVu/cNulJRSjWfIU/nUDLOJOnRMHnW1mNoEdFJOg4LheM3RjK9RF9sg1TUOUUPD7/r81pL/ncoTOQIsiTbfasSULfS/+8ADaRpFQqNcXcI0OI+/I6jFNVKlD72vTU1UmKBODpYspz4BXVLLEN
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(52116014)(7416014)(1800799024)(56012099003)(22082099003)(18002099003)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VWM4ZWFsaUlGTWRYbzdFUC92Uk0rejdmWU5rNS9nNWU3TEN3VktQMEpDMjlK?=
 =?utf-8?B?L2xmZHF5WGRKajZVVEI0VFIxQVlJMzV1clVZTEdIelQ5RVRKdGN2TFNjdXRw?=
 =?utf-8?B?QkE1N3pEYVNESktoN0U4NUt3SVdoSjNPenlRRVM3cjhMSlY0RzdTTmt6c0JB?=
 =?utf-8?B?RXRuZW41RGMrTGlLUmFxMDcycDRBbXA5Ri9GaGdOYjc2eVQxMDl2S0JPNDFW?=
 =?utf-8?B?Q044ZE1nNEJVVmlCUzV6Y2o3bXJCZHk3R3plcjd0QWRXeDVNaUFvdUNhcGNQ?=
 =?utf-8?B?ZFViRTFvajFaWE5NMm1Ua0NCTms5S3VocHgyd3BFNkZFbnFtY3FRWjVzTFBV?=
 =?utf-8?B?a2FKRW9yUk03YktVQVRtL20waXhuTDZxbWxiZm9ORjV4emx3TStJUjlENkh0?=
 =?utf-8?B?b2RIdmtiUVpSeG1HK2Fidld2NHNLM05wbkNFWjluNUdQbFlzMllTM08zY3hp?=
 =?utf-8?B?Wk5oSjVTZTMwaW81REdwajJQT3ZITVN1cFQ0YnN5NGFmNVV3VHpES3VZejVD?=
 =?utf-8?B?V1M3WG1vQ0ZsUDBEUFdCTkswZlc0NW5jUlJiSlk5M3loeDlyVG04NjdibmlX?=
 =?utf-8?B?T1lQem4wZ1NqSmVKUDFpcUhJL3R2bThnaFd3NDd6WXdTbFV1S0xxY3Vhc2Ny?=
 =?utf-8?B?ZlF1MHNFSWtueExEd3BOR0pZb2I3dExiUStXdUxUNi9qM3JwL1BHMHEvbkpy?=
 =?utf-8?B?NU1Hbk5udkJKcmhnczhnK21HVGlqaTNweG54N2FJYlkyQXMwZUYxZExJQjAw?=
 =?utf-8?B?WUJlM3NTL1NYTWlLeUszTUtKcDZJbU5yWmJzSVBmNXFWY2JQYktrLzVtd2p4?=
 =?utf-8?B?aTVaYXRLRVQ3UVkwdEJFVmVCUlVtblMrZHQrSGhoTUhiRnhnVzcwWjhqZmRt?=
 =?utf-8?B?QUl6ME1waGM4Z0xENnh2S3hsdjI4bXdMWVVFb2FPdE9vSC9kQmttd1A0M2pX?=
 =?utf-8?B?bkcwdW8xK2t5cU5TZi93R21NZ2JEVTBxclJnUWx1MTlRcFZObHRKdC9rSkI5?=
 =?utf-8?B?THdqclhQQmN3ZnpDWWplUUJVWE9DTlBJdTRSdnlvYkgvS0NZK0xPVjFYL0pz?=
 =?utf-8?B?dGRTdVFNRmpQakZKNFZsY3VrZnRTQ3htaE1NQ3FIWnpDWXRlZEUzclpNc1E4?=
 =?utf-8?B?YXBHMUJlZ1JFS1kxRjR1Z1Z5OFgveWlxV3VBTzl3WnVKdGlwZWFyUWtsQzJM?=
 =?utf-8?B?MGdCaFRpOVQrbXd4QWhVbGRyOEFDeVNsVmhuTFJPQ1RNTDhpMFJmTTNXWUFq?=
 =?utf-8?B?RStrUTZLTFhrMVNLWUJ1Q3p3TCtLcE5nQkEybWIyQ3VOOEJ5UzZIZnkwNmkr?=
 =?utf-8?B?dVoya3ZNUWd5M0VCMUlMMldFRUpTaXFzUUxOQ04wejljVE1lOVhGUlZWN0wz?=
 =?utf-8?B?YVg0OTNEamFkZEdRMEZabk5QR1dIanZXWFNlcERIU1FqUk5VOHl5aDNOOGFH?=
 =?utf-8?B?c05BR1prNUE0YlE5YUhRaFZ6Q1RJVmt3dy9UcXo2YWNtNmx4Q1FnTVlsR2g0?=
 =?utf-8?B?Q1RNamEzOW1MRGNYRitqM1NkbmtEdUFyYWNVVkVRUHBscmhCRk1uOWVKVkgv?=
 =?utf-8?B?YVR1bjZ0eEFIZk5ZK2M2V3E5WlRyV3NDNEhkcUhlT1RSQklvdmRPRUZ6OE1F?=
 =?utf-8?B?RVYvWDlLeEJNeWkwQjhEU2tTZ1lPNXFBclpRYUVsKzVUSkRpVDkzT29nTjlW?=
 =?utf-8?B?RkJjQXA3V1crQlg2Q2NNY1Jqa3hsVHA0TUs3V0EwS1VoajJKMGh2ZDRFNU1J?=
 =?utf-8?B?K2JmT3M5NzZnNGtLa2dreHlOMVB2RnI2QVVTQXNJNXZ6MVovQWhtNW5WMy9R?=
 =?utf-8?B?SFV2WnhUaC9VaXBnTWh2QjdwQWdxbjlVYWNtQm92YWdyVzdZY1ZrSXRkV1dF?=
 =?utf-8?B?WWFLQXBzQ2w1RVhqQ0ZFbXVwalRGOE1NSVI4NHUzVTJ2dDZ2UjRrSXEyOTVD?=
 =?utf-8?B?aXJ1b29UOGhqdFZySklWUmlQZEJKUGs4Wkh6RkxUVEdnb2hkN2RleitHeVZJ?=
 =?utf-8?B?ejA1ZXd2ZUtjellhazF1Q1lrTGU3NVRBLzhuVkFTNTBpeDZrQUVNanUzQ05R?=
 =?utf-8?B?RGlJMEdMczNhaVovTkpleEFGYjVaaVpUbkN4dktQSDdjQUVYc1dHeWRudUt0?=
 =?utf-8?B?aFh2WEdHQ2tBV0tjcWw2UDNaajJUdjEvN2xvMmJJT0lwUi9rdjMxQVhseVZh?=
 =?utf-8?B?VW1PanZKY2NySktmZlRTRCt0UlNIbWQrMUJXQm9qNjNhWkJzNUdKbk5leEU3?=
 =?utf-8?B?NDNkU1BEQnMydmRQdzdqcldlWEhsZUNNSG85MEE2SGRrdTNtNllLeUM1S214?=
 =?utf-8?B?QklidWErdkRxMFIyNGR0MktxblMrZm9uYzFZY3ZYem8xZ3RibDJLQT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c7c35a3-405d-4c24-a50e-08dea5d5e6c6
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 09:58:45.3218
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DTVweAUtr+BG+eMqL5n2M5wj8ZEwplSo1UHbMKbEFIJTsSxShg+2erWKLoyA5G/PdQUbp42MJn4K/FRXvqzs9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8269

S20_3LE format cannot be used with WM8960/WM8962 codecs when paired
with SAI, due to two distinct BCLK generation limitations:

1. Codec Master Mode:
   When WM8960/WM8962 generates BCLK, it cannot produce the exact
   1.92 MHz required for S20_3LE at 48kHz stereo (48000 × 2 × 20).
   The codec uses fixed dividers from SYSCLK (12.288 MHz), and the
   required divider (6.4) is not available. The closest divider is 6,
   producing 2.048 MHz, which causes right channel corruption.

2. SAI Master Mode:
   SAI derive BCLK from MCLK using integer dividers only. S20_3LE
   requires non-integer divider ratios with standard MCLK frequencies.
   For example, 48kHz stereo needs 1.920 MHz BCLK, which requires a
   divider of 6.4 from 12.288 MHz MCLK (not an integer).

Exclude S20_3LE format for WM8960/WM8962 when used with SAI to prevent
these issues. Users should use S16_LE, S24_LE, or S32_LE instead.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl-asoc-card.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.c
index 90414ac10032..44083d15f6e5 100644
--- a/sound/soc/fsl/fsl-asoc-card.c
+++ b/sound/soc/fsl/fsl-asoc-card.c
@@ -122,6 +122,7 @@ struct cpu_priv {
  * @asrc_rate: ASRC sample rate used by Back-Ends
  * @asrc_format: ASRC sample format used by Back-Ends
  * @dai_fmt: DAI format between CPU and CODEC
+ * @exclude_format: excluded format;
  * @name: Card name
  */
 
@@ -141,6 +142,7 @@ struct fsl_asoc_card_priv {
 	u32 asrc_rate;
 	snd_pcm_format_t asrc_format;
 	u32 dai_fmt;
+	u64 exclude_format;
 	char name[32];
 };
 
@@ -329,6 +331,14 @@ static int fsl_asoc_card_startup(struct snd_pcm_substream *substream)
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	int ret;
 
+	if (priv->exclude_format && !rtd->dai_link->no_pcm) {
+		ret = snd_pcm_hw_constraint_mask64(runtime,
+						   SNDRV_PCM_HW_PARAM_FORMAT,
+						   ~priv->exclude_format);
+		if (ret)
+			return ret;
+	}
+
 	if (priv->constraint_channels) {
 		ret = snd_pcm_hw_constraint_list(runtime, 0,
 						 SNDRV_PCM_HW_PARAM_CHANNELS,
@@ -850,11 +860,30 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
 		priv->codec_priv[0].fll_id = WM8962_SYSCLK_FLL;
 		priv->codec_priv[0].pll_id = WM8962_FLL;
 		priv->dai_fmt |= SND_SOC_DAIFMT_CBP_CFP;
+		/*
+		 * WM8962 has same BCLK generation limitations as WM8960.
+		 * See WM8960 section for detailed explanation.
+		 */
+		if (of_node_name_eq(cpu_np, "sai"))
+			priv->exclude_format = SNDRV_PCM_FMTBIT_S20_3LE;
 	} else if (of_device_is_compatible(np, "fsl,imx-audio-wm8960")) {
 		codec_dai_name[0] = "wm8960-hifi";
 		priv->codec_priv[0].fll_id = WM8960_SYSCLK_AUTO;
 		priv->codec_priv[0].pll_id = WM8960_SYSCLK_AUTO;
 		priv->dai_fmt |= SND_SOC_DAIFMT_CBP_CFP;
+		/*
+		 * WM8960 in master mode cannot generate exact 1.92 MHz BCLK
+		 * required for S20_3LE (48kHz × 2ch × 20bit). Closest available
+		 * is 2.048 MHz (SYSCLK/6), which causes right channel corruption.
+		 *
+		 * In SAI master mode, SAI derive BCLK from MCLK using integer
+		 * dividers only. S20_3LE requires non-integer divider ratios
+		 * with standard MCLK frequencies. For example, 48kHz stereo
+		 * needs 1.920 MHz BCLK, which requires a divider of 6.4 from
+		 * 12.288 MHz MCLK (not an integer).
+		 */
+		if (of_node_name_eq(cpu_np, "sai"))
+			priv->exclude_format = SNDRV_PCM_FMTBIT_S20_3LE;
 	} else if (of_device_is_compatible(np, "fsl,imx-audio-ac97")) {
 		codec_dai_name[0] = "ac97-hifi";
 		priv->dai_fmt = SND_SOC_DAIFMT_AC97;
-- 
2.34.1

