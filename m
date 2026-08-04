Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011007.outbound.protection.outlook.com [40.107.74.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 234833803C5
	for <linux-sound@vger.kernel.org>; Tue,  4 Aug 2026 00:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785804104; cv=fail; b=KkDCYPxGIbI79sU5TXtjk0B22a0U+9GiSok/einPZVP66TsX+rEwyGxjF0ghLFTnTXlsrWsjo9wd7NmGUwf0UzqxXes6pb7PdLYqpDnVnNqy0jQwWI6ywHKeNl1HKvcfoGqzze5KCSp/tikIQmyJONGpT2ZIgu9aFWf46dCrY6o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785804104; c=relaxed/simple;
	bh=EPbemQ1+3j88BCXbSCihwuSZSdTD4fIkgqNWECqqzgE=;
	h=Message-ID:To:Cc:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Rfk0EmqUQu+Lun7BJ93q15wZdgKgKs+WbNl3bCDO1lGL/ObHxLHGg1df3G96xNjOBp3qTGpr+S2RK+1L6+MzNLv1j/BHBqI0jkp2w7g8t6Du91fQCAWefIkAXtBgCO9AMa2lkZIf76nomLmDD37DUKLowcy8BdY0SXxoAZLmSyU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=dZUpy8uv; arc=fail smtp.client-ip=40.107.74.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="dZUpy8uv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HmUNqTdLwGNG3eGz2hx/n1nbHs6K1TiNOQGGexAeNjumfzseKB8zvdkfRnVOZD+8geteVqAmG6nivRf6mDbOgDKasiOpq9KxR8bhqfuUhQmhY+yXR4Odd7ro3L3Z17CQgUD1d48fMJCapBrGOlVFt7f9/nEUQKiQiYdyOyrRhuHh/BV2LzT5Ad++humONV9Mf+fJt2AvcniC2BtyR8UXVEnlAupI+1G5TnY2YVg8pUm7ck1EtItKRra2RPDXAZH+xum47UjebOPT9j/2G/PYks22cWPTQVKXM4JJGSdrT7a/LUDwO90vTRNUM1U0h/aHdyGPNvK3rou2yd8pUEIizw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fZNsXjrJ9g/Dq1KZoejWoV2BrqUFKR1gFxS3+IYhV3w=;
 b=Z5f4pivMio2VK9qPXmx/bJMm6hV2c6u1Temot7Keywf+m2MXQl7tfuoPePY52gH8XTK3Deogi3s/XsY3WZSrdmgDu8ZldTDXoSP0HksIYMExm1r3r7J80pphQFcZHTA6xyLqTc+aQNYeNqGVGPGkeEAkqtC6k6HOtP/Puwp+TN7Z0ZYQQaaOqmnflBL3xhRXut6HXX/YmvTHVhpXxwZm3Ai594DPApJNN+rIIXikYpxvi+p3+8+l7drzjsKRuX9DzV3GzLrIkf2ZiSYeWcdlT7G6TrKYRO5fDbcdsVFwxm/RkawzwPvP8h5fAzGtJwVZNqQb6WMZck1KF0vEZ8aw2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fZNsXjrJ9g/Dq1KZoejWoV2BrqUFKR1gFxS3+IYhV3w=;
 b=dZUpy8uvdBN7nEoWKdZDxdOGCgd1djAyfPOOPZDk60Xn/0cHRRegZL4iNOhngFt/tlTQ7YvyQVva+X9FZP3xDglJvoq11zEC5UuBXjjC6UNbMnLjkQVMGBqPjxJ3HMNoYpRKZQS/v1y7v4KnjDOjhODcDmkflV0vzlf4zvMX6MQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYRPR01MB15651.jpnprd01.prod.outlook.com (2603:1096:405:285::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Tue, 4 Aug
 2026 00:41:39 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0270.017; Tue, 4 Aug 2026
 00:41:38 +0000
Message-ID: <87se4uwwce.wl-kuninori.morimoto.gx@renesas.com>
To: David Rhodes <david.rhodes@cirrus.com>, Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Richard Fitzgerald <rf@opensource.cirrus.com>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 14/44] ASoC: codecs: cs5*: use .auto_selectable_formats
In-Reply-To: <87cxvyyazi.wl-kuninori.morimoto.gx@renesas.com>
References: <87cxvyyazi.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 4 Aug 2026 00:41:37 +0000
X-ClientProxiedBy: TY4PR01CA0114.jpnprd01.prod.outlook.com
 (2603:1096:405:379::11) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYRPR01MB15651:EE_
X-MS-Office365-Filtering-Correlation-Id: 97a8274b-07f6-4e7a-69cf-08def1c124a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|23010399003|38350700014|18002099003|22082099003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	Kxs7uBrlWyvYDfWBVCl1ntyQpBkRH7HkoKqW9rVRSSkJGfUgG/FbVbkG4Fz+MaXeNVKjlTI1bYOC7e17XD5WtYDJANUX+pzBm0eu7VxUl+OQbXhceu/oPXZ+1Cm+OdEWC4tjKTuB8h/uNN58sg9FqW2hntZXJZ68/EZIcB368ZzcKeOh2xuy/sq3PulDJrVnSwba+gxKT0JarWDP9rG+ZDIBu1ywXcvnxWA5oyxxyOvdXVrq5b+bHVcKN/AjVb8dstEOal84lI6yIoLlAHEHF8QcVOvYOMHRDuZf+mx7l34t0a+gT7XwMZTEafBIAJLHyd8y+G6SJ7S/rxfhQAMmkNiPwYKMIhSf70oCCpgs3NUEEGf/sK7aWgwEYAQGMCaLMVfaBJWlo/rKwL6puiRvre8ogiHxxkx1EL2OEVxikDUJVmB8Tqo9O6h+RDBw2NPdxBnHqMZttFIALv/5387CxWQKv252w+hPqIjs0eZD14w7UMSjjL633bSSNrj+9csiv1hlW3WW91zBoDaLgW3ZcqWzSv3JfFucLivZi7001SqvNZuImng6EcCoC1t6LLrVotuBuhkPFi5EupoihDVtrXHtXMO6EEvPzqxuLiIsqbzulTjzclGEdFaHPqxsBv9LXoaOFBsvn0pMfcitv0tzEW5g4xctJXvZO3+d6+8gb0U4OdVkpI0l2GE/X6RfN9s1zY4WJHRuk5P9qO9e2g7bUtrtyFyhM6Qxm13m/2T0gcs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(23010399003)(38350700014)(18002099003)(22082099003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tBoFUTl18OM8wRaRFbOsBp9qeMqeSkMaW1gU6FSX7huAYgJeKWxjZPoRl6jO?=
 =?us-ascii?Q?aKVGxQPOLENOv7LvAw9LT5++PrN9AizMuLSwjroOGzbPldFG851AXO8TwWBV?=
 =?us-ascii?Q?HwrFpv5SN870cECf6lMv4fsZWz9HA2vT67lPa4PUPf01QQIX1pqjZ1Ekcp8K?=
 =?us-ascii?Q?Nj8/y0ucc0+7CNVjmlAuUqd47KdtPXENxX/oaGqlPL960ERskrEF4iNVAqOe?=
 =?us-ascii?Q?cn8+5VTdztvIh9T06wlk8TWlTjpD1mJkx74RIxvclOqowWoWPgM+CctjRc1b?=
 =?us-ascii?Q?VZInESKnSH5lbjGLsdf6HzGIxWm3xJDcIQgRIc+A3VOkgINtNNWlIoGM/wLP?=
 =?us-ascii?Q?PR9l1XdFnsl4y5Klt9YdKOHLIq73beIaSSZB7jT80cbSBlT+pfDyEY9Rp1B8?=
 =?us-ascii?Q?ob/M0gigeE80I1p4VXhSpaGXZ4vE2YYEVf9oWIArowpCgTJybHCouUmYJGPL?=
 =?us-ascii?Q?RKGOHQwlMxUBY1drsbFr3HRM0yxN4Nc+X0qyZmZqj8zAV5XLAYVOlE/ZXihu?=
 =?us-ascii?Q?1EsFW6/9aMSrhqSt6OBb8fdeE+7fQ7AaxneRkOF8ISd/pwKmgqpwTaAglRkx?=
 =?us-ascii?Q?Hx9vluCKDWlV24jAI+z706h4pugfGeqcryVecsO79MAPwhaty06pGraJsmOf?=
 =?us-ascii?Q?NJrsFagv0POBL0hpTXPkQu2CekV+uC+PiqowANn+EwPkqcbr6D7FZxgq59GR?=
 =?us-ascii?Q?Aj0aV+LoFwhzSODibGhD5heF2YQ64jb8r+jtTXpDVv17jPFy1f1U9O08v49C?=
 =?us-ascii?Q?6pxl6u3hOoZ3bDQWpXz/vVzlUAn1sjKEHCr+0fSgVTxbSlp4vutbshUn16UB?=
 =?us-ascii?Q?Mgy2p8H9rg0ODbBaF8ukiDidgAJrGPojXyjUxPvN2mkI8oDopbxW/ERXiH4O?=
 =?us-ascii?Q?/8wqwWrXjj81hkThduGXP3WamPT8gizx6GSpRet9ii0YuYAs2O/MNUXiasPA?=
 =?us-ascii?Q?0LAFxMSzleMQVCHCsB0ZHmxAjJujd3dPCviZjiLkrSabz6tdySo+LBDOEasF?=
 =?us-ascii?Q?VYRqPNUipJlx13dMiRrRkO4AgNWhbnyYTdReE+FSBU2S9b/9apeBAT+VCB9q?=
 =?us-ascii?Q?qedTxetoPfodw2a1TtEBh7Xvbmj9iEuKbr80Fy7nxuSxse0iHdM/c85zFSyC?=
 =?us-ascii?Q?FAMzvwkvhxQ60rPZgsAjnkxOt5XzDRDqMhXuM+wh+YOdu2t6fn2e7s/cttTA?=
 =?us-ascii?Q?wKumy0SX0MnHv8gyotFFI75fcausYCgyi+5csqCrn2VDQJSYoQc0W2XBchnV?=
 =?us-ascii?Q?HSHWIjgiEAAbvFFeo63O4VNMxj/hBT8fHOzQa01yUv4SNdJFl4TXMzcgCvF5?=
 =?us-ascii?Q?OuNZv6SnUM7AmjjjtQgeqM//X01R4GH7wH/TsHAbmMweYgzaGSK7QmMia9Y7?=
 =?us-ascii?Q?g29vi1JUQwNYmLg2N/oHj4QyJTm0w+hpOnKYn0RoYH5JbObtoWW1NkX/N86z?=
 =?us-ascii?Q?KYF8XckSPiBqZHH7GCALRzN5xqzNDtRXqjyR6yLUMKhjTujxK7fLd3TPEI+k?=
 =?us-ascii?Q?V45IjU3IQdtL158QxCnZof8CZnKF6uwyYcq8NQjsUerfD3F7Xz1KvN2rdYXJ?=
 =?us-ascii?Q?t2gSjTvC1i2dEOyFYBA0qm6VoDlXb5tMVQNI7gK6K3xNjECIt31BSMr33Q5l?=
 =?us-ascii?Q?NTYAvusnJNMJGqlmYl2Is8FQuBuZodQYghuBufhUzQcFj0nlHzviK7z09RYx?=
 =?us-ascii?Q?5iF1R7OmmMZF8AvFYZCNC6JR6iTjUgeeeiB8mS+cgi3IAs/s3RrUSDrSQhYr?=
 =?us-ascii?Q?7Vv4BlC+ycfEI4fvHMq15pgHioCo0cSQeNWy8aIF6Hdpg3qTm196?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97a8274b-07f6-4e7a-69cf-08def1c124a3
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 00:41:38.0323
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NVS2GhXgse+UT7L9cV3NuBT4C5/V3qusTLSNc+8TkH8+KJ1GlH22TGd9tOP3836W6tOPu0/jXLrhTgfReBV7Ck831mg9pxkh41vwPEUj3hQDwUMDxHAsfG50cagzpS/5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB15651

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/cs530x.c  | 9 +++++++++
 sound/soc/codecs/cs53l30.c | 8 ++++++++
 2 files changed, 17 insertions(+)

diff --git a/sound/soc/codecs/cs530x.c b/sound/soc/codecs/cs530x.c
index 2c7e331359117..e0ea246edbd89 100644
--- a/sound/soc/codecs/cs530x.c
+++ b/sound/soc/codecs/cs530x.c
@@ -945,10 +945,19 @@ static int cs530x_set_tdm_slot(struct snd_soc_dai *dai, unsigned int tx_mask,
 				  val << CS530X_ASP_TDM_SLOT_SHIFT);
 }
 
+static const u64 cs530x_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops cs530x_dai_ops = {
 	.set_fmt = cs530x_set_fmt,
 	.hw_params = cs530x_hw_params,
 	.set_tdm_slot = cs530x_set_tdm_slot,
+	.auto_selectable_formats        = &cs530x_selectable_formats,
+	.num_auto_selectable_formats    = 1,
 };
 
 static const struct snd_soc_dai_driver cs530x_dai = {
diff --git a/sound/soc/codecs/cs53l30.c b/sound/soc/codecs/cs53l30.c
index 511453b4c3752..c9c682a312c33 100644
--- a/sound/soc/codecs/cs53l30.c
+++ b/sound/soc/codecs/cs53l30.c
@@ -833,6 +833,12 @@ static int cs53l30_mute_stream(struct snd_soc_dai *dai, int mute, int stream)
 #define CS53L30_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE |\
 			SNDRV_PCM_FMTBIT_S24_LE)
 
+static const u64 cs53l30_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops cs53l30_ops = {
 	.hw_params = cs53l30_pcm_hw_params,
 	.set_fmt = cs53l30_set_dai_fmt,
@@ -840,6 +846,8 @@ static const struct snd_soc_dai_ops cs53l30_ops = {
 	.set_tristate = cs53l30_set_tristate,
 	.set_tdm_slot = cs53l30_set_dai_tdm_slot,
 	.mute_stream = cs53l30_mute_stream,
+	.auto_selectable_formats        = &cs53l30_selectable_formats,
+	.num_auto_selectable_formats    = 1,
 };
 
 static struct snd_soc_dai_driver cs53l30_dai = {
-- 
2.53.0

