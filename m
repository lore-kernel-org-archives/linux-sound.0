Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010018.outbound.protection.outlook.com [52.101.228.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB7A7258CE5
	for <linux-sound@vger.kernel.org>; Fri,  7 Aug 2026 00:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786064219; cv=fail; b=hLwRN9I7wJgEw3B6j1PfWM4TdbzUJW/yoKwZSkP10+prFgp8JXgHu3g9W9Y71dnlxVmZTbsB3RQbGWjJEK+bRUObOyxsBkx2cupK6pbhiVgPWGgUMrc1XdT1aPrbSmj+aYQ2Xlw7yLg/rouLCMC/SY0ibnT6WwKMFLhEdRsPhwc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786064219; c=relaxed/simple;
	bh=IKjshXzhuQYk2HenkX5TBX7jPStWvIeSRCQ+3zfDlH8=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=J+sOq6PQSaVKnIzvj2hBG9z+mhLzvXSAUNU8UGBies5+4yibRGVvBENNxouVOOvckT0wRI4qp84pYZa/zxdVX+5VkRnDQTOXNawdhCaQeZjwCiWV4KI2am7sW8fVQAvOUTW/M0zXVzUje3ZXHXjnLwnt/vghARCm9ZQJ6DC+UgQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=EEqtV23Q; arc=fail smtp.client-ip=52.101.228.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="EEqtV23Q"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qqif43s0ESwrrQydyE1QLgCv56ockW6BuEM4glFaH5lgjp8BHzg28aJKtmh2ITBeKQG77r0Fu6wfCHZxqhvJA6/KbWZNcSRvYFv3XIG7zUC55zqFhuEJS1A8cTD/SgcPQq7URspdWOGBr+YJy3BRxrkQ/bCwqJighAJnrgRvDejTN68S2/pTdP/HDkTB/pJ+TUHPb8ac0RJgvoXTxqnd6TCkwi/zSZ7IOGGIqY5LoNgibaoeT720lXi60niiLd3MIfLF+d52onLtNAVkYSTc+wCUtyg04t2gC8XRKXzykIWFGDtD20rpDnKTLn0+ZGawRHTjbTVLmDBqfB6UfzqDMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iQu+9SiWDgk31zCLYLyRx00uBeCx2VTNN0uqD6xtQQ4=;
 b=v3FwgqGwuajQ7FAbKsuQG44UyCe6k0HIzygJ3T8+XRukk3bLvzur7EO9rSEG15r7AvXR38XHAWdwzzgLncsrj7XMKWMZ84E96HwEEDlUJR4nXZAxq7ykQhkaLMw4S3d6isdKxUjj7cTJxpA78gpOy77PCp4olI/LW30zaLNwYwB/mA1l6GOIXL8s/D1wEgU6HzeWsxEJE9o58pFxBv4ezzWHPvFKEQzw3Sslf19D2+GMuk/4SHOQT2mDMN/XtDJkk9D6bq5ATUhiTQ57X49pGVuKiNqCsqmTBpaRjoOuuVnTvuVzvhvsbHID85WKY9DW/3cu0l23VrhJiZb2Es9x1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iQu+9SiWDgk31zCLYLyRx00uBeCx2VTNN0uqD6xtQQ4=;
 b=EEqtV23Qgmrj8z2hGE84DpqZ05EHVjhxng3HYZOXBkpSO6OyA5YcvkN/WTpDsJ1Q07M5tKyRSOAv2meESXve2Wx0y1Jd3DxWLR9GA9dJanf4mCk73Ny68E5LzsoPZxWnMz7njw8JyQKz7hDjUhIZ/OYIPwkVysMgsF3GBfm4W+M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYCPR01MB6638.jpnprd01.prod.outlook.com (2603:1096:400:9b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.23; Fri, 7 Aug
 2026 00:56:55 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0292.022; Fri, 7 Aug 2026
 00:56:55 +0000
Message-ID: <87mruysq7c.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Baojun Xu <baojun.xu@ti.com>, Jaroslav Kysela <perex@perex.cz>, Kevin Lu <kevin-lu@ti.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Sen Wang <sen@ti.com>, Shenghao Ding <shenghao-ding@ti.com>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH v2 39/44] ASoC: codecs: tlv320*: use .auto_selectable_formats
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
In-Reply-To: <877bm2vjjn.wl-kuninori.morimoto.gx@renesas.com>
References: <877bm2vjjn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 7 Aug 2026 00:56:55 +0000
X-ClientProxiedBy: TYCP286CA0317.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3b7::7) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYCPR01MB6638:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f111854-6dc4-4051-b5fe-08def41ec6db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|23010399003|366016|1800799024|38350700014|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	NDMKUS1Uu/8EOKx+dRbMFsWnt1FBff0cgcJkSMM9rTe+3AluVWWliZpq9K8azVsu2HtInOcPZYFHnLb6l4IhC03WZ5Ey2OQdR5B6Qcg9LTPF2ahgTBeEWesoLJoXVTUGocDFW3f4dpIJDPbEonfKlqvGcLKwaMcUJKLgPmJVdhMw4IMc2lc0fKN1p3KCRWFMQf1m9RUhY3NHJmU0W02xO7eT+CP8uvEbmEPOnw+A1veZF7Cp4CA4HQNOg3lYtaiEkVrr7LvbTCO4OiqkcU5pqSyOiAq6MPgyey/Yzaw8Pfo1hBHmRbnCbODYSQ2B2DO/iBS9snaYzGYrtnTz7/RICJ/afMTzyk1feIbcVIHCwd9WJg1rHbevVW6O17DVgE7w5rpXQUVLFLoBX3+6ByXwcLei/zVtRYbrZaozfgad6KiPiUEcm0F3A7+NwQcJPRYJtRmValWOe4Q/AlPTTOAb7cL8khsJxflTl0QQNfYFGOPq3MBwlKE7C2eUuvzeMRj0LHlqOerBDdSl3oG55oUFsIZ2Mh4AYeCkaHhUr6rIzubx9BAhc7DjZr1R9kinIrEIyvx8DBBOzmWctQ1p2BmyiOO9cPaZy+lSxVIFAMMfNaogX7jy5sH1FGnHg5yzJOtqv2EyzirCQ/USjmoDZLp3b465/1Eu0eCx8sBqQgUU6kBnTRDIsSUwiDqUTyYmA39klP4T2L1bW9rYDEJOvulU5g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(23010399003)(366016)(1800799024)(38350700014)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Fy1D4DCih9Ja76W/+Ikc9CfHblVOthANiyCWySscLRYqfVsdR/NJQxkPeQaZ?=
 =?us-ascii?Q?J5zjEFSg5VIqzUYWSYbhyY74CoVXltRYIONnkrMQCciinFj3fiTYI3r4Svzt?=
 =?us-ascii?Q?+rirBqsamGRBOZ96eErTLb6L1VEXwAfbz2sR8GAkBB4Y2TyU4z102K6LYWib?=
 =?us-ascii?Q?1/d0JdUp21YznxC7/lDGav86tU5tmoi/pdo/6w/JieA9gW5Vb4InRSLCHdwu?=
 =?us-ascii?Q?kZECnhmqlN9RXzmGDmezm3BfUpottld2qW/ZAwl3yeHHOYpIkZzXSsJomRxj?=
 =?us-ascii?Q?biq3t6L4u7xZMXHei/uN7UqhMAvaBt19+3fbwY3l0tSjuWcvi/pk3/bulcyE?=
 =?us-ascii?Q?WUzZziSGgzAqvSRonNQa3pSzlWbG0vvYFx3LexGojzSJbEf2BYbj8h0QFwgm?=
 =?us-ascii?Q?5CyOiJxIrJfiUvv8jQ5nNyaQVHGnF8Lm0IHtJj476YEZPOnUVDAEmTDM6IAb?=
 =?us-ascii?Q?XNfL4DW/BDpAs4Fo/87g0TPGuAi7+yopYL+mSf/Q9hkOf0T4rCi0WL5QpXZM?=
 =?us-ascii?Q?JkXo8eBwfXt5l2nSZQob8mAfMCx4cpJvrD2jtRVERkxvavfS1MPbt5O1xUym?=
 =?us-ascii?Q?VDpQzmW32QYRfU8z9mIyDTDb6tccZvl/J7GoLsur2EPV43gc0Ta9SqG+DJrb?=
 =?us-ascii?Q?rU+ZdxwZVtkJTBiaoUL7aRNb/csjUKQ8QpofD8sxBgmerbUPNAnlIRiWwRah?=
 =?us-ascii?Q?ImMhxyCa6Xp4vKnR64Ku9LZ1E9YGOFyED1dpM0BoSUWwxt5V26CKgns4kIaV?=
 =?us-ascii?Q?NnfcmULGd+jfzEdijZcqFjYsjKlqcL0thxvwNlAriEB1G3QUO4uDtYkoWXEV?=
 =?us-ascii?Q?w6zGrFnAEyqTg0bAmGqklWxXbDYtO1reAkYEOYH4ffjrH/QC/mWFdSnQvxAQ?=
 =?us-ascii?Q?1KUE8zm1Z/lwqvV1NJXI7ydfXoNOP+BCM3ylNe0g0osVxQojhTzgMklATwv1?=
 =?us-ascii?Q?mW+g7XcBJP5Yuuhe4bmFAqbKoeVD3MgI7X5KB9MntN2WCaT2aYghj3f9BWXi?=
 =?us-ascii?Q?h1cigVStuUjrWtnGWVOC60XgiXusF5MA58kjw+CUWBPDm5mhi6YgH3dgPipC?=
 =?us-ascii?Q?MtaVkXh+2g2nLyri6NFD0c0CKVA8NRjrMn9viV8r0aafY+c4m73Nitr9vqb+?=
 =?us-ascii?Q?tkeQhwBzJRvxosNkmfeO3HM74vsE6q6JKonSLhbnGD/NvWhZM8X4RFAy05hm?=
 =?us-ascii?Q?4iat5/Qa+gv2suaYR54A2yEXzuMB1NOk+TnRuVXr0JvS03Ars8+PbFhk+TbE?=
 =?us-ascii?Q?qvDsf/JjZYBtLdhLNOgD+V19D3G+kEwz9lGqeF4byrg8SVVItrAGjtn1tC1J?=
 =?us-ascii?Q?y+var/nDU8xFG7IqATBQfbT/RVRJ4ogk2YaWXf2qAYMSjKu7hkHS9C2rFieV?=
 =?us-ascii?Q?gXVuWtbQnC8eDJ+lzFTCl4UPsEh+gIUmsHbgYkLUjw8Uro1KeajNbGujoos3?=
 =?us-ascii?Q?KAD1MIp9zUTyJXBG1X3wqYiDkH/ApXA4+V/vXthX1hXMy/j7EdQBy+ptd6eA?=
 =?us-ascii?Q?oyXAz+SmKYkN+ccLyVoEBvDJfHXbhFyyiR2nC3TSW3JD4xB/W5C2V284Ty3S?=
 =?us-ascii?Q?O7QevxvEo1OWeJAyDcKL8LmPN7gE54rKJdXwLBOOW6F7rj8yelgjXWGga/86?=
 =?us-ascii?Q?w/jLq0JAr+JaP7Yf33TDdlxLIFk+fpuVEgxPudFDfr5TId7TcoK0JWg2wORY?=
 =?us-ascii?Q?B4+6nTnmDg0iCFC5jgRg9c19IwtUn1acLPoCg39UliYuaEbPv4ws6cLvDT1L?=
 =?us-ascii?Q?S+C39BoZUECoHE3+iC+I9XZVdMv69QA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f111854-6dc4-4051-b5fe-08def41ec6db
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 00:56:55.6940
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LZTleAzesM9qQSAGFdKFb6myPeu0mt1Vx3PL9FNPS3NIniY1L6cgzZiEKK5k/YtO8/RFVbxKvCfL1I1evdN1ndzppTG9g1SkTkAl/lRtsZX2ZRrQgwRYgA3JthTgn9Wj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6638

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/tlv320adc3xxx.c | 14 ++++++++++++++
 sound/soc/codecs/tlv320adcx140.c | 12 ++++++++++++
 sound/soc/codecs/tlv320aic23.c   |  9 +++++++++
 sound/soc/codecs/tlv320aic26.c   |  8 ++++++++
 sound/soc/codecs/tlv320aic31xx.c | 11 +++++++++++
 sound/soc/codecs/tlv320aic32x4.c |  8 ++++++++
 sound/soc/codecs/tlv320aic3x.c   | 14 ++++++++++++++
 sound/soc/codecs/tlv320dac33.c   |  8 ++++++++
 8 files changed, 84 insertions(+)

diff --git a/sound/soc/codecs/tlv320adc3xxx.c b/sound/soc/codecs/tlv320adc3xxx.c
index d7d958ecd8db5..528c444464824 100644
--- a/sound/soc/codecs/tlv320adc3xxx.c
+++ b/sound/soc/codecs/tlv320adc3xxx.c
@@ -1362,10 +1362,24 @@ static int adc3xxx_set_dai_fmt(struct snd_soc_dai *codec_dai, unsigned int fmt)
 	return 0;
 }
 
+static const u64 adc3xxx_selectable_formats[] = {
+	/* Hi Priority */
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF,
+	/* Low Priority */
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF,
+};
+
 static const struct snd_soc_dai_ops adc3xxx_dai_ops = {
 	.hw_params	= adc3xxx_hw_params,
 	.set_sysclk	= adc3xxx_set_dai_sysclk,
 	.set_fmt	= adc3xxx_set_dai_fmt,
+	.auto_selectable_formats	= adc3xxx_selectable_formats,
+	.num_auto_selectable_formats	= ARRAY_SIZE(adc3xxx_selectable_formats),
 };
 
 static struct snd_soc_dai_driver adc3xxx_dai = {
diff --git a/sound/soc/codecs/tlv320adcx140.c b/sound/soc/codecs/tlv320adcx140.c
index 4eb9cea272760..c29584d77649b 100644
--- a/sound/soc/codecs/tlv320adcx140.c
+++ b/sound/soc/codecs/tlv320adcx140.c
@@ -916,10 +916,22 @@ static int adcx140_set_dai_tdm_slot(struct snd_soc_dai *codec_dai,
 	return 0;
 }
 
+static const u64 adcx140_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops adcx140_dai_ops = {
 	.hw_params	= adcx140_hw_params,
 	.set_fmt	= adcx140_set_dai_fmt,
 	.set_tdm_slot	= adcx140_set_dai_tdm_slot,
+	.auto_selectable_formats	= &adcx140_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static int adcx140_configure_gpo(struct adcx140_priv *adcx140)
diff --git a/sound/soc/codecs/tlv320aic23.c b/sound/soc/codecs/tlv320aic23.c
index 04ec8fb5c6e5b..f31ffa189580d 100644
--- a/sound/soc/codecs/tlv320aic23.c
+++ b/sound/soc/codecs/tlv320aic23.c
@@ -507,6 +507,13 @@ static int tlv320aic23_set_bias_level(struct snd_soc_component *component,
 #define AIC23_FORMATS	(SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE | \
 			 SNDRV_PCM_FMTBIT_S24_3LE | SNDRV_PCM_FMTBIT_S32_LE)
 
+static const u64 tlv320aic23_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B;
+
 static const struct snd_soc_dai_ops tlv320aic23_dai_ops = {
 	.prepare	= tlv320aic23_pcm_prepare,
 	.hw_params	= tlv320aic23_hw_params,
@@ -514,6 +521,8 @@ static const struct snd_soc_dai_ops tlv320aic23_dai_ops = {
 	.mute_stream	= tlv320aic23_mute,
 	.set_fmt	= tlv320aic23_set_dai_fmt,
 	.set_sysclk	= tlv320aic23_set_dai_sysclk,
+	.auto_selectable_formats	= &tlv320aic23_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
diff --git a/sound/soc/codecs/tlv320aic26.c b/sound/soc/codecs/tlv320aic26.c
index 84e954311c1b2..7dcc960a0b9e2 100644
--- a/sound/soc/codecs/tlv320aic26.c
+++ b/sound/soc/codecs/tlv320aic26.c
@@ -208,11 +208,19 @@ static int aic26_set_fmt(struct snd_soc_dai *codec_dai, unsigned int fmt)
 #define AIC26_FORMATS	(SNDRV_PCM_FMTBIT_S8     | SNDRV_PCM_FMTBIT_S16_BE |\
 			 SNDRV_PCM_FMTBIT_S24_BE | SNDRV_PCM_FMTBIT_S32_BE)
 
+static const u64 aic26_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A;
+
 static const struct snd_soc_dai_ops aic26_dai_ops = {
 	.hw_params	= aic26_hw_params,
 	.mute_stream	= aic26_mute,
 	.set_sysclk	= aic26_set_sysclk,
 	.set_fmt	= aic26_set_fmt,
+	.auto_selectable_formats	= &aic26_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
diff --git a/sound/soc/codecs/tlv320aic31xx.c b/sound/soc/codecs/tlv320aic31xx.c
index 1d2e0ea6d4fed..a39bbad5023b1 100644
--- a/sound/soc/codecs/tlv320aic31xx.c
+++ b/sound/soc/codecs/tlv320aic31xx.c
@@ -1422,11 +1422,22 @@ static const struct snd_soc_component_driver soc_codec_driver_aic31xx = {
 	.endianness		= 1,
 };
 
+static const u64 aic31xx_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF;
+
 static const struct snd_soc_dai_ops aic31xx_dai_ops = {
 	.hw_params	= aic31xx_hw_params,
 	.set_sysclk	= aic31xx_set_dai_sysclk,
 	.set_fmt	= aic31xx_set_dai_fmt,
 	.mute_stream	= aic31xx_dac_mute,
+	.auto_selectable_formats	= &aic31xx_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
diff --git a/sound/soc/codecs/tlv320aic32x4.c b/sound/soc/codecs/tlv320aic32x4.c
index 9e0e4aa2b09c4..af4be5bee7237 100644
--- a/sound/soc/codecs/tlv320aic32x4.c
+++ b/sound/soc/codecs/tlv320aic32x4.c
@@ -916,11 +916,19 @@ static int aic32x4_set_bias_level(struct snd_soc_component *component,
 			 | SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S24_3LE \
 			 | SNDRV_PCM_FMTBIT_S32_LE)
 
+static const u64 aic32x4_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B;
 static const struct snd_soc_dai_ops aic32x4_ops = {
 	.hw_params = aic32x4_hw_params,
 	.mute_stream = aic32x4_mute,
 	.set_fmt = aic32x4_set_dai_fmt,
 	.set_sysclk = aic32x4_set_dai_sysclk,
+	.auto_selectable_formats	= &aic32x4_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
diff --git a/sound/soc/codecs/tlv320aic3x.c b/sound/soc/codecs/tlv320aic3x.c
index b38393a8130ff..c0f58cba8a993 100644
--- a/sound/soc/codecs/tlv320aic3x.c
+++ b/sound/soc/codecs/tlv320aic3x.c
@@ -1500,6 +1500,18 @@ static int aic3x_set_bias_level(struct snd_soc_component *component,
 			 SNDRV_PCM_FMTBIT_S24_3LE | SNDRV_PCM_FMTBIT_S24_LE | \
 			 SNDRV_PCM_FMTBIT_S32_LE)
 
+static const u64 aic3x_selectable_formats[] = {
+	/* Hi Priority */
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF,
+	/* Low Priority */
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF,
+};
+
 static const struct snd_soc_dai_ops aic3x_dai_ops = {
 	.hw_params	= aic3x_hw_params,
 	.prepare	= aic3x_prepare,
@@ -1507,6 +1519,8 @@ static const struct snd_soc_dai_ops aic3x_dai_ops = {
 	.set_sysclk	= aic3x_set_dai_sysclk,
 	.set_fmt	= aic3x_set_dai_fmt,
 	.set_tdm_slot	= aic3x_set_dai_tdm_slot,
+	.auto_selectable_formats	= aic3x_selectable_formats,
+	.num_auto_selectable_formats	= ARRAY_SIZE(aic3x_selectable_formats),
 	.no_capture_mute = 1,
 };
 
diff --git a/sound/soc/codecs/tlv320dac33.c b/sound/soc/codecs/tlv320dac33.c
index 9bd2ddd8dacdc..55a95b62a6505 100644
--- a/sound/soc/codecs/tlv320dac33.c
+++ b/sound/soc/codecs/tlv320dac33.c
@@ -1435,6 +1435,12 @@ static const struct snd_soc_component_driver soc_component_dev_tlv320dac33 = {
 			 SNDRV_PCM_RATE_48000)
 #define DAC33_FORMATS	(SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S32_LE)
 
+static const u64 dac33_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A;
+
 static const struct snd_soc_dai_ops dac33_dai_ops = {
 	.startup	= dac33_startup,
 	.shutdown	= dac33_shutdown,
@@ -1443,6 +1449,8 @@ static const struct snd_soc_dai_ops dac33_dai_ops = {
 	.delay		= dac33_dai_delay,
 	.set_sysclk	= dac33_set_dai_sysclk,
 	.set_fmt	= dac33_set_dai_fmt,
+	.auto_selectable_formats	= &dac33_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver dac33_dai = {
-- 
2.53.0

