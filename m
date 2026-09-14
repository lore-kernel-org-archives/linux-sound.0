Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010048.outbound.protection.outlook.com [52.101.228.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 364E62F8EBB
	for <linux-sound@vger.kernel.org>; Mon, 14 Sep 2026 01:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789350322; cv=fail; b=tpTNZwFS8d1ndMd/CjBb+8lxizOWirxTDDI0JqYHxWQUO8awL06To2X/VNVvg8DoffZeXqorvxfFPAWTQ1yr3JMjv9fowrGIhRi8e4RD0/Rj15RAf/lQwclDLffCbqrv8Li7yq1pgKePqhKUdFPiWbLsiNcHFdxOJhjFIK1PHYo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789350322; c=relaxed/simple;
	bh=Ts1xrasb7dEaLRAXnzggFM2YemHK8CBzqqCKanWqJp0=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=IF4anfYBt/JjkRrhizkpzD1JKl5/yMSs9yW/XNe8nh5QsurnT+LIHEnU8Zt1J9sXqvN9xqtFpdK/idq/kU+LycQ5bKlkBdHqW7l9cvRQgJ0YqCSe5pIfbE92QaZw1aTTy7796hBrCIR1/YOvn1lRvjiCD1y6dDrhnc/yyC/4vu0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=KECRGc0y; arc=fail smtp.client-ip=52.101.228.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="KECRGc0y"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wh42BYL4c3AedfVDmNaWvhzCd/b83poS9bfO2I4pCe62kCKbK76nK6834563As4wOCf3+e0991XlWiuWQ2cnQ5l2vn7dWesFg3esPaN9F9GrCpbAG7phII6qapMNrvmvlBx7uz1YYPyzEUEFFtQqFI1jR/AKlc1a7GFORQ4f/w3gJ70tjkwa3zSZ0dv0jD46Ql3yprimHBJdtd5YxQ5JUYIYZ1wUfo7uqxamFI5g/Vnp6ILHt+FoakNSe9RyaYYHWHg27jLyMBUO3wJesbNWThpRtC2Pp6BuZFpg9RMITO/xNBVXBeoPiDbD/MjWNI91rb6dBGAcmv3MxKtM9IQgGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z+trx2stZ8igtbUuA5oJMvEH37Mx+eBQbTHMAO+f4b0=;
 b=d8l+oQJQ6dItSZIrP3e+1ZxbkFG4KMgNTVpsM1U0V8mbdoNKCHOpGpMuQbrVWfDHIFZkysg9BjPZZGfBv/pkR4ZZ9sqxrfcWeOGagth+M59OQJelNnKp0PUQQ/0Xb6sC5j58ket8SNugNvUNQikxhRiGF4iIy6gXkuGyH6R6cx6rgNoH/iTLvKz1F+kH2xDjDar3RN8GxBUAog6I9GtYW3E5mi3YxOXiY50yCVeDqsK7hJD1sjnJZskK8CnFwm4oBLqrLL2RGfQENfdxJoFPN4+/ns9ZnUEXPOsLt4lVWGadDWOJ/stE1f5EQ1tSo4AsvvOst2qRXbCWZM47pIYNdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z+trx2stZ8igtbUuA5oJMvEH37Mx+eBQbTHMAO+f4b0=;
 b=KECRGc0y3x5qtSsDt++3IKHLIHi11GSyon6CdFxLt43mptf6DzrC7Szp1T9kpUSPFKbxdReQpv19H7O0fWWNWElOw60l0za5Sgz6VoRc22N/YfR+H8HYvlcR3deMaGZedkNfWHIBjn1ZOVSyieGaMji7KUuYpvaQ61FwRd0CqJw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12) by TYWPR01MB7202.jpnprd01.prod.outlook.com
 (2603:1096:400:ec::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 01:45:14 +0000
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45]) by TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45%6]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 01:45:14 +0000
Message-ID: <87jyooli6u.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 05/10] ASoC: soc-dai: add snd_soc_dai_symmetric_get_params()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87qziwliaj.wl-kuninori.morimoto.gx@renesas.com>
References: <87qziwliaj.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 14 Sep 2026 01:45:14 +0000
X-ClientProxiedBy: TY6P286CA0017.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:3b9::15) To TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB14118:EE_|TYWPR01MB7202:EE_
X-MS-Office365-Filtering-Correlation-Id: bc526070-4e4c-4d59-003a-08df1201d23c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|52116014|10067099003|6133799003|22082099003|18002099003|56012099006|11063799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	KPfftRhc9ORC9EKZe3I01lGHMjr9M3eVm543WTX/bomxUDRnGtW8eF6i5R6IWwDJnaPAjeSk4+g5GyPTtrVbx/t/fjvUmhYrUUURHq0J7yR5K6ywKF9f0N2Ai9uSRiwcC8ByTv2S1GVSeogxG1H62CZAQlYCkrjqcb+kPJlVA34xFM08q0DC7Opn9n09fW+zUM/Fx3QyVDy78hsrtZbBzm5YrgsEUqOQRabvbuKVLWyUNwBYodIO8bOITFMV5ePfQ7qAetcVZivD/BOJQSbxYVvYTUY5aDocxYvo/r2ALKE6DXI2DhdI/Lak7YDbkAz0oFHeMvGfH45936y2BRSGgvRujcL2RwXQnC9t7faHpZ3EST4tviT2MhsMM6BT4dAbGRBIhMYnF2HIc7wgxOVYH51tiAq/f7J3L1IIIqGAHB3euUOn1VPFKCqjNnFtrQypLPdSKiFVsKLDesGKzc5XoPSZZDVz1Gj5yvCVX3N7rDu9yx1DtWG2xvDoiZbqglENpq6SMjkuOtmqMM4qp4eSOEdQP0nYBIoEguvSZIpYW7i1Z2bQlz7T79ppuJTi8OL1HHPuOo942aYp05H8PSUr7hqSNX3jVcJ0T6gc6jOxSxSfczgMxZ4hibGMNw9kzIb5ZPE9UuVe2HJeNUHh/hr39nRtQq/bp9idi7kMv1RxYzN5U3HRyUXQUuI/GPMKMFT4N+wvgTV+y51Z5qKoiLQvVAEkb/rWK3uxc1d3D7YS7T4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB14118.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(52116014)(10067099003)(6133799003)(22082099003)(18002099003)(56012099006)(11063799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9F9XOPTc5Ktx482dwujgxgNhJIubTgx2KVxwH86acdFw2AvqpQArW1qjnI9d?=
 =?us-ascii?Q?EQmpAN56IkhD+DkCbS15H2IDASChMJls/PjXJ9EjnqDmLWAE8FPG0M0mLkhI?=
 =?us-ascii?Q?m2QBtn65CXN1H9MulqbDdxuuQUgpO2lPp6C+cGo3AO4sFOrMBRVIVuf5wmlQ?=
 =?us-ascii?Q?S0kLQtW3HxsFm9DsfKuRjPyZPg/6Aox6i3hW0r+IhHyMZMEE9XnC3P48dFYW?=
 =?us-ascii?Q?x2Eko/ieDyK9jVVEZJtjkZfQB7uDN6mwyCg7RvNDAoknbPGFU1nZKmEOb1Vh?=
 =?us-ascii?Q?XxUms47LITAyrRI9aN6wmL6Ucszu/UUB79A6iGlDQ2JTyayNRHyGLVDKb7Dt?=
 =?us-ascii?Q?uo5Kp3BmglU3efXIsUIL01NTGMVR9x/fAuQat7KLrVr8Ap17vC6apwKfyTeG?=
 =?us-ascii?Q?8b3kkkKaDtQdb1+2QMue65QePpoiPH532GgMIxLiWmtsluVEOoP5HIyeDMbB?=
 =?us-ascii?Q?tR/WycQ1uqQcwmEaGbo6PFzwqq3DYWf2gN6DL65Jh+iszICbiUIU9ebOUwBY?=
 =?us-ascii?Q?lc5pCvl1WYMkaz9x0x80kb96fZDCWaAX1IA7P1zddKfhAgU8c1RajmtihPaV?=
 =?us-ascii?Q?/ml2NQ7YMXzknwFZqZU+z59FR9ZYl1ss0sNI0WXK8N/kxbg68fDy5gWXveln?=
 =?us-ascii?Q?byn3QblOT6YXn7J8RIuVFlnyo738s+FggZKA3QoXSUPX4tLeVWpbKV0Z1nbD?=
 =?us-ascii?Q?PvY0GadwYho8gSF/EnhlAPKpSbvHB/wCXzAVbnSQVpn2O7y3SHip+IPsH+aJ?=
 =?us-ascii?Q?87x9YOM+ZoG3oXdy218wzZJbjxzjeieyRSjrgpHngBuL40tbJhB29intse8i?=
 =?us-ascii?Q?56pBNRGZxQjfyvUqUBJJ0S0piweZdnqxqnfFHqqeatvFJ/BEG5qJ3ob+p3l3?=
 =?us-ascii?Q?NdGpZU0S3SqapKvmqXlI+OsRVW5qkMmPFg6eFToNnGMBruJL0GeKKpaNCxFV?=
 =?us-ascii?Q?R6bZPLbgMKKcjOk+VvTds94f03pKVhEZ5VyvynpINuYUBVacER3utESuQmNA?=
 =?us-ascii?Q?Y+T9vOvRX87N0hRfAxv/D3Cg4ZozhQM027PNUtlObdy99d8jj1+E+JttZ5YR?=
 =?us-ascii?Q?jqPkYNiaOIj73drVcLWzngfl+17l76b+U8WtDhEYpmPuBAYAeuNBeSFUw+qi?=
 =?us-ascii?Q?XKxaw1CIIeDxvgv3y6aXycGXdg+h/tSC/Ff56xyps9rvPhx5VkJunWd2czqt?=
 =?us-ascii?Q?8B0gbHn7uVkLxeM6qQN6oNIbS2q9t1fPV0JDrAJtsfrRya0znqZ/nmozQcdN?=
 =?us-ascii?Q?cgCJi0kjcwxJhO87p6Ol6v9YM5MUQOMIESRZ1pccoPKhuw6fx8V45lbvrq0A?=
 =?us-ascii?Q?ZDnwm6viQO2B3ijZvPjobnqJYqJTqCZ1eIcawDnC5mtJ8rgr4xUwFsCoLh9S?=
 =?us-ascii?Q?k1H4LnG+1FDCHfHaic7LdGfTSsg06BKqWWV5ss7mMAvTdhLQ0wepMpH36xKL?=
 =?us-ascii?Q?hN6Pml2fj42/UwK1EtPFszHEPNDhQr5e11Ce3L0OlTGRRkJPpribwccT7tNM?=
 =?us-ascii?Q?acBtbt5i0+yHJjI/XfpJtZ26ydT1OVprCWFElyZQ8PVYtq+LRsXUAda1nEUn?=
 =?us-ascii?Q?TtrAJ5Ux9lJ53WOBAVfI2sWU1FIjp8IWtW5178OmVEDJyhLt46d9Wg9f6g82?=
 =?us-ascii?Q?sla1197gvAE69LGnkPFyloC6c/pFZoFHyJB5SdX9KXzWUVS5wwaccqdhqbYC?=
 =?us-ascii?Q?du6BJGsVo5NI9rQMkdWBjirrxHyXJHJTbAPAyRSNU8xTOzRuBkUD5KBRQPJX?=
 =?us-ascii?Q?pus4QKsQJeOggq+9HK93juq4AQsWFC5NFO4TuQfc51c8G5egR7ZP?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc526070-4e4c-4d59-003a-08df1201d23c
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB14118.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 01:45:14.2569
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: POLdo2fjnVpmaz8tbRbgLyTiz3XYwtfkpUo6yOFVmE//yF3MMx5RbecFjdUJPEsnodhhw8iPiVrhTSqrW6DlAl0E3Fqme+l1+9u+CvxuMmbEt7Rx14yYDokg5E7JxnNF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB7202

DAI parameter will be capsuled soon, will be not enable to access from
each drivers. DAI symmetric_xxx has been mainly referred from Mediatek
drivers. Let's add snd_soc_dai_symmetric_get_params() for it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-dai.h                     |  4 ++++
 sound/soc/mediatek/mt8188/mt8188-dai-pcm.c  |  5 ++++-
 sound/soc/mediatek/mt8195/mt8195-dai-pcm.c  |  5 ++++-
 sound/soc/mediatek/mt8365/mt8365-dai-dmic.c | 10 +++++++---
 sound/soc/mediatek/mt8365/mt8365-dai-pcm.c  |  4 +++-
 sound/soc/soc-dai.c                         | 14 ++++++++++++++
 sound/soc/soc-pcm.c                         |  5 ++++-
 7 files changed, 40 insertions(+), 7 deletions(-)

diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index bd714c3bbf3df..c5544f1789425 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -563,6 +563,10 @@ struct snd_soc_dai *snd_soc_dai_register(struct snd_soc_component *component,
 void snd_soc_dai_unregister(struct snd_soc_dai *dai);
 struct snd_soc_dai *snd_soc_dai_from_list(struct list_head *list);
 struct list_head *snd_soc_dai_to_list(struct snd_soc_dai *dai);
+void snd_soc_dai_symmetric_get_params(struct snd_soc_dai *dai,
+				      unsigned int *symmetric_rate,
+				      unsigned int *symmetric_channels,
+				      unsigned int *symmetric_sample_bits);
 
 /* REMOVE ME */
 #define snd_soc_dai_get_pcm_stream			snd_soc_dai_pcm_stream_get
diff --git a/sound/soc/mediatek/mt8188/mt8188-dai-pcm.c b/sound/soc/mediatek/mt8188/mt8188-dai-pcm.c
index 8ca7cc75e21dc..766893ca56d45 100644
--- a/sound/soc/mediatek/mt8188/mt8188-dai-pcm.c
+++ b/sound/soc/mediatek/mt8188/mt8188-dai-pcm.c
@@ -128,7 +128,7 @@ static int mtk_dai_pcm_configure(struct snd_pcm_substream *substream,
 	unsigned int lrck_inv;
 	unsigned int bck_inv;
 	unsigned int fmt;
-	unsigned int bit_width = dai->symmetric_sample_bits;
+	unsigned int bit_width;
 	unsigned int val = 0;
 	unsigned int mask = 0;
 	int fs = 0;
@@ -137,7 +137,10 @@ static int mtk_dai_pcm_configure(struct snd_pcm_substream *substream,
 	if (dai->id < 0)
 		return -EINVAL;
 
+	snd_soc_dai_symmetric_get_params(dai, NULL, NULL, &bit_width);
+
 	pcmif_priv = afe_priv->dai_priv[dai->id];
+
 	slave_mode = pcmif_priv->slave_mode;
 	lrck_inv = pcmif_priv->lrck_inv;
 	bck_inv = pcmif_priv->bck_inv;
diff --git a/sound/soc/mediatek/mt8195/mt8195-dai-pcm.c b/sound/soc/mediatek/mt8195/mt8195-dai-pcm.c
index cdc16057d50e2..a090995ac9a7f 100644
--- a/sound/soc/mediatek/mt8195/mt8195-dai-pcm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-dai-pcm.c
@@ -127,7 +127,7 @@ static int mtk_dai_pcm_configure(struct snd_pcm_substream *substream,
 	unsigned int lrck_inv;
 	unsigned int bck_inv;
 	unsigned int fmt;
-	unsigned int bit_width = dai->symmetric_sample_bits;
+	unsigned int bit_width;
 	unsigned int val = 0;
 	unsigned int mask = 0;
 	int fs = 0;
@@ -136,7 +136,10 @@ static int mtk_dai_pcm_configure(struct snd_pcm_substream *substream,
 	if (dai->id != MT8195_AFE_IO_PCM)
 		return -EINVAL;
 
+	snd_soc_dai_symmetric_get_params(dai, NULL, NULL, &bit_width);
+
 	pcmif_priv = afe_priv->dai_priv[dai->id];
+
 	slave_mode = pcmif_priv->slave_mode;
 	lrck_inv = pcmif_priv->lrck_inv;
 	bck_inv = pcmif_priv->bck_inv;
diff --git a/sound/soc/mediatek/mt8365/mt8365-dai-dmic.c b/sound/soc/mediatek/mt8365/mt8365-dai-dmic.c
index 0bac143b48bfb..6e1d48f757d22 100644
--- a/sound/soc/mediatek/mt8365/mt8365-dai-dmic.c
+++ b/sound/soc/mediatek/mt8365/mt8365-dai-dmic.c
@@ -118,13 +118,17 @@ static int mt8365_dai_configure_dmic(struct mtk_base_afe *afe,
 	unsigned int clk_phase_sel_ch1 = dmic_data->clk_phase_sel_ch1;
 	unsigned int clk_phase_sel_ch2 = dmic_data->clk_phase_sel_ch2;
 	unsigned int val = 0;
-	unsigned int rate = dai->symmetric_rate;
-	int reg = get_chan_reg(dai->symmetric_channels);
+	unsigned int rate;
+	unsigned int channel;
+	int reg;
 
+	snd_soc_dai_symmetric_get_params(dai, &rate, &channel, NULL);
+
+	reg = get_chan_reg(channel);
 	if (reg < 0)
 		return -EINVAL;
 
-	dmic_data->dmic_channel = dai->symmetric_channels;
+	dmic_data->dmic_channel = channel;
 
 	val |= DMIC_TOP_CON_SDM3_LEVEL_MODE;
 
diff --git a/sound/soc/mediatek/mt8365/mt8365-dai-pcm.c b/sound/soc/mediatek/mt8365/mt8365-dai-pcm.c
index 0ec114a566ad1..62bac8f387963 100644
--- a/sound/soc/mediatek/mt8365/mt8365-dai-pcm.c
+++ b/sound/soc/mediatek/mt8365/mt8365-dai-pcm.c
@@ -44,9 +44,11 @@ static int mt8365_dai_configure_pcm1(struct snd_pcm_substream *substream,
 	bool lrck_inv = pcm_priv->lrck_inv;
 	bool bck_inv = pcm_priv->bck_inv;
 	unsigned int fmt = pcm_priv->format;
-	unsigned int bit_width = dai->symmetric_sample_bits;
+	unsigned int bit_width;
 	unsigned int val = 0;
 
+	snd_soc_dai_symmetric_get_params(dai, NULL, NULL, &bit_width);
+
 	if (!slave_mode) {
 		val |= PCM_INTF_CON1_MASTER_MODE |
 		       PCM_INTF_CON1_BYPASS_ASRC;
diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
index dba8a5a63aad6..b9a3d29d60914 100644
--- a/sound/soc/soc-dai.c
+++ b/sound/soc/soc-dai.c
@@ -1263,6 +1263,20 @@ struct snd_soc_dai *snd_soc_dai_register(struct snd_soc_component *component,
 }
 EXPORT_SYMBOL_GPL(snd_soc_dai_register);
 
+void snd_soc_dai_symmetric_get_params(struct snd_soc_dai *dai,
+				      unsigned int *symmetric_rate,
+				      unsigned int *symmetric_channels,
+				      unsigned int *symmetric_sample_bits)
+{
+	if (symmetric_rate)
+		*symmetric_rate		= dai->symmetric_rate;
+	if (symmetric_channels)
+		*symmetric_channels	= dai->symmetric_channels;
+	if (symmetric_sample_bits)
+		*symmetric_sample_bits	= dai->symmetric_sample_bits;
+}
+EXPORT_SYMBOL_GPL(snd_soc_dai_symmetric_get_params);
+
 void snd_soc_dai_symmetric_set_params(struct snd_soc_dai *dai,
 				      struct snd_pcm_hw_params *params)
 {
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index a446e9c1c9887..aaba9ca724e61 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -453,6 +453,8 @@ static int soc_pcm_shared_bclk_rule_rate(struct snd_pcm_hw_params *params,
 	/* Scan all DAIs on the card for an active peer sharing the same BCLK */
 	for_each_card_rtds(card, rtd) {
 		for_each_rtd_cpu_dais(rtd, i, other_dai) {
+			unsigned int symmetric_rate;
+
 			if (other_dai == dai)
 				continue;
 			if (!other_dai->bclk)
@@ -465,7 +467,8 @@ static int soc_pcm_shared_bclk_rule_rate(struct snd_pcm_hw_params *params,
 			 * after snd_soc_dai_hw_params(), so non-zero means
 			 * the DAI's clk_set_rate() has already executed.
 			 */
-			if (!other_dai->symmetric_rate)
+			snd_soc_dai_symmetric_get_params(other_dai, &symmetric_rate, NULL, NULL);
+			if (!symmetric_rate)
 				continue;
 			if (!clk_is_match(dai->bclk, other_dai->bclk))
 				continue;
-- 
2.53.0

