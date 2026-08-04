Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010061.outbound.protection.outlook.com [52.101.229.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2289C380FEC
	for <linux-sound@vger.kernel.org>; Tue,  4 Aug 2026 00:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785804151; cv=fail; b=cmREEnsBNs6t2WdWfDyPIHk3sHAT9IgXTyjofOBWWLsRlyjZwlkdQDSpGrXEOPLf+HPhlKRi73X6hDaMrHZwLEuVBw9ANFG2PMQbAaF5sN1vEoN58HyBL/x6rED6hK2WGEQRL2Yw/DImZNwTjeEn8umwFEHv0r8Yi/t5g+lOTOY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785804151; c=relaxed/simple;
	bh=wr4ZxzfhF5FRVqM9Hjs7n3WH2vgAbuKIqY1GjTb3e0o=;
	h=Message-ID:To:Cc:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=MP6ym1clMfNNFNhsYNca6OLHecKtmfIAlBiykH8U50++2oEjs4KtJY2UOis6QhVchj0heXezJNCapSfDeHrQtsjjod3jNvgD7udkqM7QbrRdInG0JgwAPbL24kFoSkJwTjPJ8K/RgC23Cj0ggYmu5G04IRDjik04a3L/CDc5Ik0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=K0hA47bE; arc=fail smtp.client-ip=52.101.229.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="K0hA47bE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oMYOOfY94zvUn05dJgOZoEYzi+BwNk5aoJl8gVVKoMTJmqt0Q1jIAV8VMS8j8xIcKdvFYqYjfrWKAj5kgd49XisGyROxlN2C7ncUQfnAmY8mSLXDLPVBc6RTEx+RXanQROBZ7H7m0FHCXSpEs27RXRyPKvG1VVXJ/6azM5OvB9sVWEfZ7ZMO36FmC1vg0Wgxc6e1RITUupEGwP0bnsOE0WWsexGwD0Cu7Io0XsgoGvHl8I0SCeR8c1SRdmSgRC0mszA1zHO8uTuJC5EnMhRS/T65AZOjK13mNKV+1E12CZhBiI6OEFQnmgK+1BRTdOpRcufwBZ6VtuqqeUb7fbIt0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=huJO398mq6ELbnbsA3eIijlyWh1GMDvG1Gski+sU96o=;
 b=C1x8+L0P3DEWofc5S/YTKMrpxoMDzmI5QN+Mzf6PX1k/RgIdEa7Xo7NbSAzD6FJu/eqlbsqbsWr/NkBOT/w3Ahxohi4Dj21o7fSpVKtgcM7PhOQODvS4YthF91tCijDMiOgOrYtFvhnt9qaaIXDEmZIv3aBVbHwEqx4X9CbCraRVARptv2agR47Kj5pnnckqQz9DoSi2pcjq4PzCgS5vr6ta86mBQoLrrTmFBWllcK76A3yLLUxEKH8HbLBYhV7/dsLH97EWpuVCcT5XWTS2iow1Yu5XVabU0yLzERJBTrU2OEYYpMVKnwcKp03LNmgIs/VleRlFjqjAlarepWUSag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=huJO398mq6ELbnbsA3eIijlyWh1GMDvG1Gski+sU96o=;
 b=K0hA47bE07Xgipoy5BFDIculeWeqAPgCwXIFF3dE9EiWnSQh9Iu5KSkqs+VQKQB2uHzdEU2n/mcy854z1j/ngocNXaQsAljFvEsqgw+W2okojfctC0Tri37XR4371Q2f2FIh9uvLpP/2sBmuYYQF6HsJ2PvE3J7bNmaCSIJoQ/Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYRPR01MB15651.jpnprd01.prod.outlook.com (2603:1096:405:285::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Tue, 4 Aug
 2026 00:42:26 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0270.017; Tue, 4 Aug 2026
 00:42:26 +0000
Message-ID: <87fr0uwwb2.wl-kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Peter Rosin <peda@lysator.liu.se>, Takashi
 Iwai <tiwai@suse.com>, =?ISO-8859-1?Q?=22Uwe_Kleine-K=F6nig_=28The_Capab?=
 =?ISO-8859-1?Q?le_Hub=29=22?= <u.kleine-koenig@baylibre.com>
Cc: linux-sound@vger.kernel.org,
 "Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= (The Capable Hub)" <u.kleine-koenig@baylibre.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 23/44] ASoC: codecs: max*: use .auto_selectable_formats
In-Reply-To: <87cxvyyazi.wl-kuninori.morimoto.gx@renesas.com>
References: <87cxvyyazi.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 4 Aug 2026 00:42:26 +0000
X-ClientProxiedBy: TYCP286CA0103.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::16) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYRPR01MB15651:EE_
X-MS-Office365-Filtering-Correlation-Id: ad6fe263-4a29-4018-6e34-08def1c1416e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|23010399003|38350700014|6133799003|18002099003|22082099003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	D+aC7z6PTOBlmCQEXFujZZFForq84FQ65QKp6UQAkr2ZehDh+8EIDTTjRMQux58/V9YSLV48PTZxJ4011mp4vn2lvW8pe2arw+47/QKmhLLXCy8ZeN1IakgMjG2/HwptQ/1VDGm5Knv2ZjuiKurHTlWglEmbvHsZXgHC+mS4lGOus5tH7lKNT6L81PmKiakn0CYtfXaxw8azTHiVEuLh/sZgaEQKNNsn96hAmri+btbJvuPKJNhtVOCIQyiyHEe23Z1O1C4Bx+zVh+yDan4qo3tRUkwf8ijoWgMugOWx8Es83DqDCwfEzYhxTcTgO7/2KPb5jEpaXvxK4YpIu6EgDQplaRH+GfNLYqcpJFT6l1w7vGUnBGD1oB/QGeqaMdS6UDMxmhF26IAbxZEMlVJTMBtCJiaBpyN4zXVkc2xuWZ0E36Zu+CERD16ynV7oDNUnhE0EDJ7Q+H4qIhPBFYk6ysfCAMoJfKYoqHS2XGpb64+fAwTlJYbMFOQokJwhg1rYuf0/kvAtVXNtKXhSctahtlJ+3u26MoYgFRC/6+F/dlEuu8oHcN1S7/gvu79ck+AJ5LcG7EfCbUrMhkmMQ8pI41yOqWZXOdeZwZpyGVfQkOtMhye2q01FYSCx/hTzNyjm2T4hMd7YachJay/HmaOJRD0kZhgLdhCOVgZsmTWFkKV2zEaPYMV+cORPgrUDAxYOmU/a9GDaCozBwhaCjkJH3GDGl7KWw6luUCbFmeBE3VI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(23010399003)(38350700014)(6133799003)(18002099003)(22082099003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?F9pSzebagySCOPBR5ImjeixsMGd6aGwbUxLYdn4y+u/NsAZOLzfaM9/UtPUg?=
 =?us-ascii?Q?FuWkRwvozMJWEm5UFKxojdkZ2Neka7o28wHjgVWY3SA1ZmmUig3DgXsjUeo5?=
 =?us-ascii?Q?TjvryhX3wD1Aao6Zq4W06QarrHxeKvpIp831rrJe5fYpPypgYag2QvtjaU80?=
 =?us-ascii?Q?mISz8W0yC844P7y/1FtnpppSJLLvy0YZjtHkbisnV6w0ouooZlctcIboNahN?=
 =?us-ascii?Q?Os4XntNEOJoN1KftHHYgPgxKOQ32vSXV/HT7yHX7+/gEeVcJtvVpBthLiQQD?=
 =?us-ascii?Q?Ic8hVnb97keG4jYoBSPf03RWyJ68SrEdtp0px4K8ZZmRZ5Iyen4PgdtZBUhI?=
 =?us-ascii?Q?Ljj7PDadR6ENc+UTuBdSUnvCHfFm00oHHBIQkiElfxGouRGDPyJx4Egi/nY3?=
 =?us-ascii?Q?MMHXBCFkKqkv67LakZBdDg1MB6G8q7Kb7xcml2RP0fNA5ZbgJ/Eqq670HRyZ?=
 =?us-ascii?Q?FMezHoH8i011kvZsdYcW33TGLIuLk7oSHoD/jCaP6G7ByupYQo6tGcEB3xI5?=
 =?us-ascii?Q?9VQrzhIoY/oX3+GbXKJisIAEe6RaavzV4IYtdxhn/Eox2kpPYX10gdKR6LrJ?=
 =?us-ascii?Q?C9ebluaVJRvxk7fJdxgnshD/t8+5iAIjgoXOGzxqC1gR+VtnUoJM0rOW/ngH?=
 =?us-ascii?Q?uMDWmqBojka1B4wZSF8EogPLvCwOi+uJzTMfHR/RoLRQ+hfuI/agcPmNo3Bg?=
 =?us-ascii?Q?WwK5hZlHXMXijKhANQpKwuGrdawyD6AMtZwCK301lDkrx7tdikeBWi6k5Gbb?=
 =?us-ascii?Q?HzPIpRrSlqjSrizDwwEDE7O0u/2n3+qhdqRtJZ0aZcnMV9acrXs5q5QnEfpc?=
 =?us-ascii?Q?FqAzzWSugIbj0mJhfjpeAQh6NMKHRd3bNnw50/OmqHhP9bd6ocJpMetZXF0p?=
 =?us-ascii?Q?2pugEcfEVPQ/SFJeXTRXmZYJGu6CwjbCV+7bHrt57gdZ8IY7n+8A8MSPg4Sy?=
 =?us-ascii?Q?Pg4kEDVDO77BLh16zybIvwvJjqg9W2EMXnxfNSFhVeMJn5+7z1DxKewHFk46?=
 =?us-ascii?Q?y+x0h7mVP4yYnBo8Ys5f8qKeexXE2g9DvsU4sXs1DLi8QqNx1yd+wxFyHB9s?=
 =?us-ascii?Q?jNwMVdJeQcp2ht8Xt3YXyC1Ojckw6+KoCZKjFQFM1+8W/en88FTAxCtBmwHA?=
 =?us-ascii?Q?rJvO0OO8M0Dago3Oo3zbupzBjzp3MdoCYRaMYiPBFrmTJn79IzxZiqLDgYJb?=
 =?us-ascii?Q?3MRkh+viKnoKZPgJGgWK92HOVxx8GkBmCDrwmetTwFCPXow+HV/jd+kwm9T/?=
 =?us-ascii?Q?ynOpbKT/iDibUD29dAR7jqsY6LvFJiRchXMM10qGX9OTae6oabu/Nkr23QCO?=
 =?us-ascii?Q?7awHwz/Jh7nKudsavoU6vo+cFG4nRLz5tYfebQv6kcw2AuF6iogdrK7LF2Jd?=
 =?us-ascii?Q?5m98jdct4wZAleS7FFo3+69VCUinFqS0wB9V/B1dEY9/GkoY8lGG6+fTGZln?=
 =?us-ascii?Q?SpEC11DJzTc0cXYbo/ur9nae27vMMiuL4VfOaBtiXQ86+rD+cD4fafZ37kKu?=
 =?us-ascii?Q?OtfGvy6t3zpGZnXatefUWlPwFQFZGIM5N88BagXcU4D1fUpC1CdziaJQHg7S?=
 =?us-ascii?Q?DaEGFV52fu1dZj2FWtaWLIGXJTiLhhhgxIfF2luQq6GSSCDbc0BxrRf45v3D?=
 =?us-ascii?Q?J64xbBNXQyQ3sIKZMDr225+kGg8zMkScm2Jeqgdu2lN37R5GLgl37yNQSj2A?=
 =?us-ascii?Q?6BURx2fj+QP/2ZrW/EOqO56vG6TpxZ0OKXwC1BVlVQIxATaVNqo8HYtWQivB?=
 =?us-ascii?Q?ZnefEUFZCDZIDEs1EiALX5dAUCpWUTmDXvFK++WmbpKii1KzwFaw?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad6fe263-4a29-4018-6e34-08def1c1416e
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 00:42:26.3496
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y0IhZ8oERXY7VSYY7BA7tD08HzOxuy5G+TxXe0glZL+RWymZEP091P0DiqGuW0NF4gWX75ePpSgf8jm9htI3r55y15ozpSJb1J1LvG0nIsUHoh9DHkyKxYyAB/NsFsQv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB15651

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/max98088.c     | 12 ++++++++++++
 sound/soc/codecs/max98090.c     | 12 ++++++++++++
 sound/soc/codecs/max98095.c     | 14 ++++++++++++++
 sound/soc/codecs/max98371.c     |  7 +++++++
 sound/soc/codecs/max98373-i2c.c | 10 ++++++++++
 sound/soc/codecs/max98388.c     | 10 ++++++++++
 sound/soc/codecs/max98390.c     | 10 ++++++++++
 sound/soc/codecs/max98396.c     | 12 ++++++++++++
 sound/soc/codecs/max9850.c      | 11 +++++++++++
 sound/soc/codecs/max98520.c     | 10 ++++++++++
 sound/soc/codecs/max9860.c      | 12 ++++++++++++
 sound/soc/codecs/max9867.c      | 10 ++++++++++
 sound/soc/codecs/max98925.c     |  8 ++++++++
 sound/soc/codecs/max98926.c     |  8 ++++++++
 sound/soc/codecs/max98927.c     | 10 ++++++++++
 15 files changed, 156 insertions(+)

diff --git a/sound/soc/codecs/max98088.c b/sound/soc/codecs/max98088.c
index df438baf05dc3..1dd7881c84aa3 100644
--- a/sound/soc/codecs/max98088.c
+++ b/sound/soc/codecs/max98088.c
@@ -1342,11 +1342,21 @@ static int max98088_set_bias_level(struct snd_soc_component *component,
 #define MAX98088_RATES SNDRV_PCM_RATE_8000_96000
 #define MAX98088_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE)
 
+static const u64 max98088_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops max98088_dai1_ops = {
        .set_sysclk = max98088_dai_set_sysclk,
        .set_fmt = max98088_dai1_set_fmt,
        .hw_params = max98088_dai1_hw_params,
        .mute_stream = max98088_dai1_mute,
+       .auto_selectable_formats = &max98088_selectable_formats,
+       .num_auto_selectable_formats = 1,
        .no_capture_mute = 1,
 };
 
@@ -1355,6 +1365,8 @@ static const struct snd_soc_dai_ops max98088_dai2_ops = {
        .set_fmt = max98088_dai2_set_fmt,
        .hw_params = max98088_dai2_hw_params,
        .mute_stream = max98088_dai2_mute,
+       .auto_selectable_formats = &max98088_selectable_formats,
+       .num_auto_selectable_formats = 1,
        .no_capture_mute = 1,
 };
 
diff --git a/sound/soc/codecs/max98090.c b/sound/soc/codecs/max98090.c
index 60da518b0e57c..038790a2ae609 100644
--- a/sound/soc/codecs/max98090.c
+++ b/sound/soc/codecs/max98090.c
@@ -2382,6 +2382,16 @@ static int max98090_set_jack(struct snd_soc_component *component,
 #define MAX98090_RATES SNDRV_PCM_RATE_8000_96000
 #define MAX98090_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE)
 
+static const u64 max98090_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops max98090_dai_ops = {
 	.startup = max98090_dai_startup,
 	.set_sysclk = max98090_dai_set_sysclk,
@@ -2390,6 +2400,8 @@ static const struct snd_soc_dai_ops max98090_dai_ops = {
 	.hw_params = max98090_dai_hw_params,
 	.mute_stream = max98090_dai_mute,
 	.trigger = max98090_dai_trigger,
+	.auto_selectable_formats = &max98090_selectable_formats,
+	.num_auto_selectable_formats = 1,
 	.no_capture_mute = 1,
 };
 
diff --git a/sound/soc/codecs/max98095.c b/sound/soc/codecs/max98095.c
index c47bfa2378b89..787b62738c08b 100644
--- a/sound/soc/codecs/max98095.c
+++ b/sound/soc/codecs/max98095.c
@@ -1413,22 +1413,36 @@ static int max98095_set_bias_level(struct snd_soc_component *component,
 #define MAX98095_RATES SNDRV_PCM_RATE_8000_96000
 #define MAX98095_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE)
 
+static const u64 max98095_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops max98095_dai1_ops = {
 	.set_sysclk = max98095_dai_set_sysclk,
 	.set_fmt = max98095_dai1_set_fmt,
 	.hw_params = max98095_dai1_hw_params,
+	.auto_selectable_formats = &max98095_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static const struct snd_soc_dai_ops max98095_dai2_ops = {
 	.set_sysclk = max98095_dai_set_sysclk,
 	.set_fmt = max98095_dai2_set_fmt,
 	.hw_params = max98095_dai2_hw_params,
+	.auto_selectable_formats = &max98095_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static const struct snd_soc_dai_ops max98095_dai3_ops = {
 	.set_sysclk = max98095_dai_set_sysclk,
 	.set_fmt = max98095_dai3_set_fmt,
 	.hw_params = max98095_dai3_hw_params,
+	.auto_selectable_formats = &max98095_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static struct snd_soc_dai_driver max98095_dai[] = {
diff --git a/sound/soc/codecs/max98371.c b/sound/soc/codecs/max98371.c
index c8d4c68af5623..b62bd98f2252a 100644
--- a/sound/soc/codecs/max98371.c
+++ b/sound/soc/codecs/max98371.c
@@ -322,9 +322,16 @@ static const struct snd_soc_dapm_route max98371_audio_map[] = {
 #define MAX98371_FORMATS (SNDRV_PCM_FMTBIT_S8 | SNDRV_PCM_FMTBIT_S16_BE | \
 		SNDRV_PCM_FMTBIT_S24_BE | SNDRV_PCM_FMTBIT_S32_BE)
 
+static const u64 max98371_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J;
+
 static const struct snd_soc_dai_ops max98371_dai_ops = {
 	.set_fmt = max98371_dai_set_fmt,
 	.hw_params = max98371_dai_hw_params,
+	.auto_selectable_formats = &max98371_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static struct snd_soc_dai_driver max98371_dai[] = {
diff --git a/sound/soc/codecs/max98373-i2c.c b/sound/soc/codecs/max98373-i2c.c
index cbd7ebffa6d61..4e52282ace7f7 100644
--- a/sound/soc/codecs/max98373-i2c.c
+++ b/sound/soc/codecs/max98373-i2c.c
@@ -398,10 +398,20 @@ static int max98373_dai_tdm_slot(struct snd_soc_dai *dai,
 #define MAX98373_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | \
 	SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S32_LE)
 
+static const u64 max98373_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF;
+
 static const struct snd_soc_dai_ops max98373_dai_ops = {
 	.set_fmt = max98373_dai_set_fmt,
 	.hw_params = max98373_dai_hw_params,
 	.set_tdm_slot = max98373_dai_tdm_slot,
+	.auto_selectable_formats = &max98373_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static bool max98373_readable_register(struct device *dev, unsigned int reg)
diff --git a/sound/soc/codecs/max98388.c b/sound/soc/codecs/max98388.c
index d97dab41bf0f5..a653e0a21899d 100644
--- a/sound/soc/codecs/max98388.c
+++ b/sound/soc/codecs/max98388.c
@@ -776,10 +776,20 @@ static int max98388_dai_tdm_slot(struct snd_soc_dai *dai,
 #define MAX98388_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | \
 	SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S32_LE)
 
+static const u64 max98388_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF;
+
 static const struct snd_soc_dai_ops max98388_dai_ops = {
 	.set_fmt = max98388_dai_set_fmt,
 	.hw_params = max98388_dai_hw_params,
 	.set_tdm_slot = max98388_dai_tdm_slot,
+	.auto_selectable_formats = &max98388_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static bool max98388_readable_register(struct device *dev,
diff --git a/sound/soc/codecs/max98390.c b/sound/soc/codecs/max98390.c
index 66309e87fdbd8..f91e863868f6a 100644
--- a/sound/soc/codecs/max98390.c
+++ b/sound/soc/codecs/max98390.c
@@ -462,11 +462,21 @@ static int max98390_dai_set_sysclk(struct snd_soc_dai *dai,
 	return 0;
 }
 
+static const u64 max98390_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF;
+
 static const struct snd_soc_dai_ops max98390_dai_ops = {
 	.set_sysclk = max98390_dai_set_sysclk,
 	.set_fmt = max98390_dai_set_fmt,
 	.hw_params = max98390_dai_hw_params,
 	.set_tdm_slot = max98390_dai_tdm_slot,
+	.auto_selectable_formats = &max98390_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static int max98390_dac_event(struct snd_soc_dapm_widget *w,
diff --git a/sound/soc/codecs/max98396.c b/sound/soc/codecs/max98396.c
index e5a2fe824c03d..935319fee41ba 100644
--- a/sound/soc/codecs/max98396.c
+++ b/sound/soc/codecs/max98396.c
@@ -790,10 +790,22 @@ static int max98396_dai_tdm_slot(struct snd_soc_dai *dai,
 #define MAX98396_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | \
 	SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S32_LE)
 
+static const u64 max98396_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops max98396_dai_ops = {
 	.set_fmt = max98396_dai_set_fmt,
 	.hw_params = max98396_dai_hw_params,
 	.set_tdm_slot = max98396_dai_tdm_slot,
+	.auto_selectable_formats = &max98396_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static int max98396_dac_event(struct snd_soc_dapm_widget *w,
diff --git a/sound/soc/codecs/max9850.c b/sound/soc/codecs/max9850.c
index 9bd6a61212c1d..c229b732121fe 100644
--- a/sound/soc/codecs/max9850.c
+++ b/sound/soc/codecs/max9850.c
@@ -254,10 +254,21 @@ static int max9850_set_bias_level(struct snd_soc_component *component,
 #define MAX9850_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE |\
 	SNDRV_PCM_FMTBIT_S24_LE)
 
+static const u64 max9850_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops max9850_dai_ops = {
 	.hw_params	= max9850_hw_params,
 	.set_sysclk	= max9850_set_dai_sysclk,
 	.set_fmt	= max9850_set_dai_fmt,
+	.auto_selectable_formats	= &max9850_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver max9850_dai = {
diff --git a/sound/soc/codecs/max98520.c b/sound/soc/codecs/max98520.c
index 4fb98505db1a1..57759d85907be 100644
--- a/sound/soc/codecs/max98520.c
+++ b/sound/soc/codecs/max98520.c
@@ -326,10 +326,20 @@ static int max98520_dai_tdm_slot(struct snd_soc_dai *dai,
 #define MAX98520_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | \
 	SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S32_LE)
 
+static const u64 max98520_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF;
+
 static const struct snd_soc_dai_ops max98520_dai_ops = {
 	.set_fmt = max98520_dai_set_fmt,
 	.hw_params = max98520_dai_hw_params,
 	.set_tdm_slot = max98520_dai_tdm_slot,
+	.auto_selectable_formats = &max98520_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static int max98520_dac_event(struct snd_soc_dapm_widget *w,
diff --git a/sound/soc/codecs/max9860.c b/sound/soc/codecs/max9860.c
index 0d7ac37850bba..ebbfc4adae9a3 100644
--- a/sound/soc/codecs/max9860.c
+++ b/sound/soc/codecs/max9860.c
@@ -459,9 +459,21 @@ static int max9860_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	}
 }
 
+static const u64 max9860_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops max9860_dai_ops = {
 	.hw_params = max9860_hw_params,
 	.set_fmt = max9860_set_fmt,
+	.auto_selectable_formats = &max9860_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static struct snd_soc_dai_driver max9860_dai = {
diff --git a/sound/soc/codecs/max9867.c b/sound/soc/codecs/max9867.c
index 07a53ec2a18a3..f2214e3a19ce3 100644
--- a/sound/soc/codecs/max9867.c
+++ b/sound/soc/codecs/max9867.c
@@ -522,12 +522,22 @@ static int max9867_dai_set_fmt(struct snd_soc_dai *codec_dai,
 	return 0;
 }
 
+static const u64 max9867_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops max9867_dai_ops = {
 	.set_sysclk	= max9867_set_dai_sysclk,
 	.set_fmt	= max9867_dai_set_fmt,
 	.mute_stream	= max9867_mute,
 	.startup	= max9867_startup,
 	.hw_params	= max9867_dai_hw_params,
+	.auto_selectable_formats	= &max9867_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
diff --git a/sound/soc/codecs/max98925.c b/sound/soc/codecs/max98925.c
index 4302ab16a642a..fe43ef99a0cba 100644
--- a/sound/soc/codecs/max98925.c
+++ b/sound/soc/codecs/max98925.c
@@ -484,10 +484,18 @@ static int max98925_dai_set_sysclk(struct snd_soc_dai *dai,
 #define MAX98925_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | \
 			SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S32_LE)
 
+static const u64 max98925_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops max98925_dai_ops = {
 	.set_sysclk = max98925_dai_set_sysclk,
 	.set_fmt = max98925_dai_set_fmt,
 	.hw_params = max98925_dai_hw_params,
+	.auto_selectable_formats = &max98925_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static struct snd_soc_dai_driver max98925_dai[] = {
diff --git a/sound/soc/codecs/max98926.c b/sound/soc/codecs/max98926.c
index 5305e1f9d97fd..d57620a3e958a 100644
--- a/sound/soc/codecs/max98926.c
+++ b/sound/soc/codecs/max98926.c
@@ -448,9 +448,17 @@ static int max98926_dai_hw_params(struct snd_pcm_substream *substream,
 #define MAX98926_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | \
 		SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S32_LE)
 
+static const u64 max98926_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops max98926_dai_ops = {
 	.set_fmt = max98926_dai_set_fmt,
 	.hw_params = max98926_dai_hw_params,
+	.auto_selectable_formats = &max98926_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static struct snd_soc_dai_driver max98926_dai[] = {
diff --git a/sound/soc/codecs/max98927.c b/sound/soc/codecs/max98927.c
index 524300d8fb0bc..d8dfaefdca7e8 100644
--- a/sound/soc/codecs/max98927.c
+++ b/sound/soc/codecs/max98927.c
@@ -463,11 +463,21 @@ static int max98927_dai_set_sysclk(struct snd_soc_dai *dai,
 	return 0;
 }
 
+static const u64 max98927_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF;
+
 static const struct snd_soc_dai_ops max98927_dai_ops = {
 	.set_sysclk = max98927_dai_set_sysclk,
 	.set_fmt = max98927_dai_set_fmt,
 	.hw_params = max98927_dai_hw_params,
 	.set_tdm_slot = max98927_dai_tdm_slot,
+	.auto_selectable_formats = &max98927_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static int max98927_dac_event(struct snd_soc_dapm_widget *w,
-- 
2.53.0

