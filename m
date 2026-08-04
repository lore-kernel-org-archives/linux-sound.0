Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010019.outbound.protection.outlook.com [52.101.228.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB3192D3733
	for <linux-sound@vger.kernel.org>; Tue,  4 Aug 2026 00:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785804244; cv=fail; b=iMf4LB5XUIyIou1RwlKeULpTMlLg33TAyAOACsneJ7G5D+bdXpV/haGgy6bpUY1r4iwL7A4yMV3EorOneoBGqlKVGJyyOxbZRI7ggTgQXd/V9hWgSKd3DapsSzgb4RuNtzTX0Qy3Ulex1E7qodrumoojAk55RTvB5Cp1Fwmw5JI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785804244; c=relaxed/simple;
	bh=n0azm7X/WQeVhhAG/5HPkuaS0F8FZtad47pIWnSUXCg=;
	h=Message-ID:To:Cc:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=R7FL9xvyhzWmJRNv8BplWDkBybn++mgM6cK3yRTztgDf+Bdb4yfBNcH1Sg04cv7Vn/YCMhX9GRh3EnLTtf+hmXdWfIWqoilt5h9k4JaU+URa/HktQ/j3a9A9lVk4Xo1d1fXDzwZpSimzetFRqCK8YVhE7v6jYy3mPdzND/oC+Rs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=awgYDC2S; arc=fail smtp.client-ip=52.101.228.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="awgYDC2S"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NXD1UjY6mVmLzm0Y9LrkCy1tP4dm/qqu/ETh6+HQpWQHSHIcWEkMIzNw2EuIWXvQbA+LFKUaW3rKabAA776epSqsXm8kVCl1PV9kHEdKeEbDNE8ZozX48USOE9h/bmLXxjlhdpOs0zifjh7bOQn9wzcjuB9zXjyTQ2WHfmsvZ3najd+dTvB3jtfKDnDASKWhuPs3kOVJID+Nl1cbZf7hwbF9txB4dN1nU4+ZjtXW+8owbHhBzwYh9u9MVBJxvavOPIYRD+uRgokD6fX2HOQ3zWslJpN/9iOHIGqHWEENgywpbVljthpxfQ5jUQTenxzn4gSSxL1Ea1oaeP94A5qglQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/eRRwOXO5NTMZTn1dlyEwtd0zLjKD72IZtGPIJy513o=;
 b=uamPXNR31tN4WdosqwJE5PSO0VVESE5Uck+ra/uVmRq1PtMOIxOJJDV1e9f8VEg8euS1Ygx+vbQS5HsrLMTDizbGLniOrNq2a3y2amJQgLHNxUmaNz2aNfMvbjpHqFx/qnNslsCB7Gl9m9dxrCz8nOKzsu3/ohz9rVNq6qMhEVlTfud1244Y2a+Ft/cWZ1yXiXvQhw9OYWBgCpoXRPUp6pzUXw4Br5intaGU8mVucMqY4HAzaoZ6hoRh/1CnCzqaE3evMMIyfK/+mPqBp//RyS5t2p1zjHv98QjLuTIXRvLhC1dh9UT6FX73ldhF2ibFud0MNxDr0Sdt0dWPudjpnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/eRRwOXO5NTMZTn1dlyEwtd0zLjKD72IZtGPIJy513o=;
 b=awgYDC2SA1PJuAiMgXjdDe7SMNDy5GyjejC+b1Eq5lW31Zk6gKTM4y9rZFbZNLCaAdt5YvhlqYBKcOy4hGHOpa62o4ZaXUeOfPJ9Nn7dtMRhI+ThiwEpGeifVh80qQQNAJD2jfDU4Ut3FGjA3glCBWm1Pt1UBFjSkAWGWqhb8wM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYCPR01MB18293.jpnprd01.prod.outlook.com (2603:1096:405:3ef::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Tue, 4 Aug
 2026 00:44:01 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0270.017; Tue, 4 Aug 2026
 00:44:00 +0000
Message-ID: <87pkzyvhnz.wl-kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 41/44] ASoC: codecs: twl4030: use .auto_selectable_formats
In-Reply-To: <87cxvyyazi.wl-kuninori.morimoto.gx@renesas.com>
References: <87cxvyyazi.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 4 Aug 2026 00:44:00 +0000
X-ClientProxiedBy: TYCP286CA0118.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::11) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYCPR01MB18293:EE_
X-MS-Office365-Filtering-Correlation-Id: a9886c22-9ef3-4385-4527-08def1c179c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|52116014|376014|1800799024|366016|38350700014|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	1H6tmOHt0twkfSefnl1v4jYq+77hbqvZen1MZjr5GFMSoUTX4wkA8swuZSFT+aTUqqkpSxa7zNiXzTX5DPTRLYe/2x6UgquLqnrQxApp8U/9nFi5vHy40PlZDWIia8c087u3y7CssTvYk0bztSdbGaUTVLhBNt7ZTzeO6wMP6XsbhaPD2sp7zi5CSqy0KMM00m33MWlEDfgcVl5k9QAHgLJCbt92sK4KtDi8ZCw3+OwnnQOUwkMgzYPKK1qHHGQJGMhRDkES/NrUxiDffT4CS+youUVk/SjeprNAhViflxtFH41XuExSW+eOMOTyL4wq141o9SetEHHwzcWdCstsgWPv11W+K5Lftu7/HEp9DLioaYVhB2kY17cSurhef7/ZS1IPrC/jviBmyBEFZHf1zQZEaRNpKxzRk9hL029QoGaZdGmKV3XW7lCXHaOzOAxiBcE9Cjw0SZclsaK6ElfN04qC8YfmnbUrPXOrfVHrpTy1J/ce5dQhRoaHcNX2rYygEa8IhWGndAj1J48lkPhYlXT2rM4VpFuiQ4zoU1WJ0bHUWcR3uu/i7+zkh9i3peX/S1d22i8YPwoNq5LLFTZDLrwBrAd3WN/iDBouZue234XWzRdtqjmJ1TmvV2OxmJOdsu1boBoZbkfXEhTvKDOYjI0d5INUueLtx5lpVBDvCydmtc8kVA2rNrSl5OLKp+1wGpcgp34rIm6esTghGwBOMH7zKJlF2qozDSubbj0mPdk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(52116014)(376014)(1800799024)(366016)(38350700014)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?M3GTT5ykHIg15UFNX+XrZHU5Y2RG/uyoUe3m0teRRaWiC0fgpvA4zDsLpxo0?=
 =?us-ascii?Q?ncRwMOxH16Nq9zOvubJyg5lla/BEolPH2DKSh4by2MSaO1KqqSC1+vMKLtdg?=
 =?us-ascii?Q?WNP1VSEX0dRaspCf24x7/MXVa+mDKg0Xi5p7SF1gE3t5yAX+gKFp/bPXs+pr?=
 =?us-ascii?Q?tVHZ0chxtcMOyaE7/OCoiXcY0/pZoYRXjHqprPIIePJL+bKSaC39dOzmd3vb?=
 =?us-ascii?Q?e0cjXHZkIoxh5XcIVeKbzRo0LxMFabp/PeNUjPTPyPZzv6VhLY6QfwLy2aGi?=
 =?us-ascii?Q?781fvHqbb1ux7CSW+/Sh2jh9hROEO9q83rCgYx/LubHL5yNFdRlJ+q98zF9k?=
 =?us-ascii?Q?IV2ylfN0QIL+bRTNsEa4wo6BBWEH4kch4960drV6gPGnA6qiI3q1E1v75rvV?=
 =?us-ascii?Q?ydPGbx1tvB+c9APwXlKRawTE3eNqBETu9mQKSuS1pdBp3Xt26Nt4zRa/MYbH?=
 =?us-ascii?Q?cTd6c92iSo4N7Fiwk6qCsXD/etGMR7NAKjc65mQ4I1bqM0ZXcr0zh5XCgUTy?=
 =?us-ascii?Q?6Ca5TWPyvz6Kqi0zBYZq8dkVH4ZK9PrNx1xKXP3WtLuVMQWsaejh4LYoKysS?=
 =?us-ascii?Q?E+arkPVARabWhAoskwea2ZCgT/obrHQtZYRsuwG3uM32PNL/fi+WTTZMmbUW?=
 =?us-ascii?Q?smBZ1NYb3KkKMMAlrmDig3XJKrV+X/JplAnIuDUtxTMVFXliLgAG0un/nqLA?=
 =?us-ascii?Q?77Iw2M368/QRY2E12FEH/P72AIzrGY7ASuVlXH7ZLmbX+EaK4jAtuH4yZoPj?=
 =?us-ascii?Q?YTOV9PoaoBq/k7prDU5Im5TWQ9DRt3MQo00fV+FBqponpScFhWEhKzfoAOyl?=
 =?us-ascii?Q?C6FDKBJSuqjQ0qZ7t5xeuP1+avXQdBOeL//Co3jeI6K9Tv+TAP+w7aO6T6IM?=
 =?us-ascii?Q?Lg5AX28EUDFrabv2tlyYN0sfXP2lCXnAMT2Lj/lTTrNw3elk/FlctGJUbYOF?=
 =?us-ascii?Q?XzUgE34A6u0b+22Tlb2iUrJ8IP9plqcJnGmxvnjW1gDeQrjf/aDGs66Dmu0o?=
 =?us-ascii?Q?sGRLQes+dG9qxJvAoeWOFojuBwOkyNcw24pIIlDon7+JVWohDSAgK/jP2VUn?=
 =?us-ascii?Q?qetQ6lSrx8auY7ksl4PHb6/xotlcC2c1M4OwlWJmPBLmLhsTd8HRWAKMHkcf?=
 =?us-ascii?Q?fJmzO+IbkDid19+Pty5tp8XH44MXj0mfzn0SkcdFq5EfzTOBXuLzvBErfLZj?=
 =?us-ascii?Q?DYmIglEycYmJALE6el7wXyhAulJ+bY1M+Mt0PrjpGqnBhMaImIDtLI6ifW6S?=
 =?us-ascii?Q?stlXtKvm64FCSQ26B+qyFY9DRiIEUc/JnD5v7SHYfltzPNCSxCP8hpCDhl2Z?=
 =?us-ascii?Q?Y1VNCJiOVWG+4AWnBkisWq+RJA9gGhb2XCGPwuY+P+bnPjngW4vm8ngIKgyr?=
 =?us-ascii?Q?LKXzQ2j7YqbqeK5M6W9ls+3WDVOzezqm9gTRIdmS7cjbsI8eWufsVzEc9VFy?=
 =?us-ascii?Q?Z1MT3brrMEwSmnM9N68gFUwhxVLYRnQat/ZlZzJuui/yRXBAVngwwIFY3/43?=
 =?us-ascii?Q?Nus6RkyVOnFIO+FqWw5MzWTLKShX93mvBNvYJxbpsiuozIGJf5G4zuoGtIHN?=
 =?us-ascii?Q?mMshhLRIkonsPonNcsfWAvGosjtsfCyllfVQZ2Qrtu+zmPLU5O+xLWan+Nay?=
 =?us-ascii?Q?JZia4iLPWT0VayM36b4jM4DeMhtVRJcZDYJkNBLz3+EiYyriAdk9yCuqFNME?=
 =?us-ascii?Q?NHS3CbZ0rit9c3QW82sP09CfojNCQZPjaONzvqzXBOb7LxkuF4ChO/f7mhNt?=
 =?us-ascii?Q?5KBlBbjojNRe0L7M6989cWQcClOd8D0Kffsop1NSSdwvifDRjYcH?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9886c22-9ef3-4385-4527-08def1c179c9
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 00:44:00.8673
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9FdKPOzjn2D59FbEsrAZXdCV1y5WMdQPK1gCGVhdKRPkfdRVUzMtuMaVg9Rd095PkT03jUypd+9/PnGJivV9fEUAhXyie6HxlZDnhbXiSAaUN7tLgIy1Z+ia0tP0r1w4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB18293

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/twl4030.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/sound/soc/codecs/twl4030.c b/sound/soc/codecs/twl4030.c
index 9476cdfd4dde9..345bb6243fb89 100644
--- a/sound/soc/codecs/twl4030.c
+++ b/sound/soc/codecs/twl4030.c
@@ -2097,6 +2097,10 @@ static int twl4030_voice_set_tristate(struct snd_soc_dai *dai, int tristate)
 #define TWL4030_RATES	 (SNDRV_PCM_RATE_8000_48000)
 #define TWL4030_FORMATS	 (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S32_LE)
 
+static const u64 twl4030_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A;
+
 static const struct snd_soc_dai_ops twl4030_dai_hifi_ops = {
 	.startup	= twl4030_startup,
 	.shutdown	= twl4030_shutdown,
@@ -2104,8 +2108,14 @@ static const struct snd_soc_dai_ops twl4030_dai_hifi_ops = {
 	.set_sysclk	= twl4030_set_dai_sysclk,
 	.set_fmt	= twl4030_set_dai_fmt,
 	.set_tristate	= twl4030_set_tristate,
+	.auto_selectable_formats	= &twl4030_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
+static const u64 twl4030_voice_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF;
+
 static const struct snd_soc_dai_ops twl4030_dai_voice_ops = {
 	.startup	= twl4030_voice_startup,
 	.shutdown	= twl4030_voice_shutdown,
@@ -2113,6 +2123,8 @@ static const struct snd_soc_dai_ops twl4030_dai_voice_ops = {
 	.set_sysclk	= twl4030_voice_set_dai_sysclk,
 	.set_fmt	= twl4030_voice_set_dai_fmt,
 	.set_tristate	= twl4030_voice_set_tristate,
+	.auto_selectable_formats	= &twl4030_voice_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver twl4030_dai[] = {
-- 
2.53.0

