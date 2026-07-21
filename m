Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010028.outbound.protection.outlook.com [52.101.228.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC5E12DECA1
	for <linux-sound@vger.kernel.org>; Tue, 21 Jul 2026 01:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784595638; cv=fail; b=nV5edlKcFa/FV/iL4ua9YMjJSXhh5Uu1+kZVSp4ljpYy8/aat+k+GJ5mXZYd2lBDKj3/zja6O7EkNlNK5Ry2FOWserWgRzu1aHkzgbFZcJKznu0N6WUe4ZlnHFbhaBwBWDOcp45S+siu/pWY8SD5ZNRgcG9bOcm5QrkFYXz1fMQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784595638; c=relaxed/simple;
	bh=KHpHBx4NLE6RQDv6MQldyNCL2xRlcC+UB5oafL+BaRA=;
	h=Message-ID:To:Cc:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=K0Uw406XqrnIaO3oy/FymuCpJxv0vDc0d8p+4Nn+TFmqROIuLI3JK/zu/5kODi5IBswfdWWubBrjuN4y7bl2ZUUN8sV/I3bEvR7puMKWs1AA2jem67qfDSpiEvZLa+qk0XeTeFIByWqoOrCc1nsXL1oM2ywCrKJ8kbOwD7jxesc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=OqmJrbTG; arc=fail smtp.client-ip=52.101.228.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="OqmJrbTG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a5AcEXfWBdLb7PrIk/TfkFCzHkfWf0+ZJt2/yI0CAwkiP0xjRGkOev5aqh39Ofy+2X/54Lou1rcGC9WWr/6cBjfDlrv+6vffp13C3KMgGYPo2XT2sngycntEeuZ77MI9uBN5xS8SSlrz7xbZFpq6C0BqQgNsZADXlSb7QJpnFcKadHeJ18yihneDc+1HlQLn9/ua+Qw//CitcGlV2M+LGWThevUvGZLH02Nzx8DBpCqbJXBFbIO2GUvuXEknBtPTZo1EtoGAvGB1bokDqgpQAk2yHKiocyYsul55qtUR+E9ihQHN10rVw8SxGHLeRsh4xfTsq9R3vKKTwmQE0HsfQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A2CEgrABOfuZGQxpMWmvnaAh9ljk3OSGPhBgnK/xmYI=;
 b=CdMnYHqSQxUP9VCBXI55+FsF20OgwVu7GqDK0e1Ke9muBX3TKC4DPZJtO/KsyC00pwccZNNU8s/Yzbpcdi/wIU3CRjLgaESMiaMPVIZolIfuvtw4aaofe4hT1EmVLXiHTUGoH+ZxywvxuCV/aXtIS8DFYpdt7+hOV2fy7X7kXCnys9+DFyVQhEV0mziOhL+cqkmoj47a4NaFTQY765ANEuRbOmNyyTNH7yjTDytmLjnYwOsKCcDndhOM3/8V2LV625weKSWdLwNMdF+YK0kQrlmg6WYNgLT5ISUj2QDGcRGp67euXP6Q+iavUAAd35p/jLoeLdu0YXAER93ymJD8Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A2CEgrABOfuZGQxpMWmvnaAh9ljk3OSGPhBgnK/xmYI=;
 b=OqmJrbTGjlmQdVNhvk6L+uHcbbSn9IfpDhNgjmah57sG03ZBb48llsuKTip8PsXr3aRWSToOFDPcgA2azbIkajSziUq4iS6eoDeMcFW6YcvX5vs+e6XVKhG91oipeFiL/JG51nx8kWGXqMvjDm/6Sxj1uH6Nnvsxc6ZAW91vKV4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OSCPR01MB15382.jpnprd01.prod.outlook.com (2603:1096:604:3a6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 01:00:30 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0223.017; Tue, 21 Jul 2026
 01:00:30 +0000
Message-ID: <87v7a9jgwh.wl-kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 3/5] ASoC: au1x: use .auto_selectable_formats
In-Reply-To: <87zezljgxy.wl-kuninori.morimoto.gx@renesas.com>
References: <87zezljgxy.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 21 Jul 2026 01:00:30 +0000
X-ClientProxiedBy: TYCP286CA0005.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:26c::9) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OSCPR01MB15382:EE_
X-MS-Office365-Filtering-Correlation-Id: c6125245-417c-4a77-1a25-08dee6c37615
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|52116014|1800799024|366016|11063799006|56012099006|10067099003|6133799003|22082099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	XXQ2hXViV3V8TxqBQ7ToSuPERwW+ikQsFZfVK1Qv19Vv6zSTzUZOnMgezUc79a4sTfQgn0QbZKt6vhVXI4w+gLqD5DyEbeJ4u+nyE8BzvbG+dkJ1lukbxoiOi/FuoWoH8KxyxS0+JM1hI8LGI7W2or/tHLweLCjvfqvjKi2k/hnpGcc8RiBg1JtlEQhYh59n9uuBV/pGpPCMFpcJhvSAvc7ww8Zg9CbiDPX+OXK/jVuAa0JUWF/cofLYP7QG7JUK9Wo2GBjjj6v3BFAtz8rpXm+Scy9crrqFISd7LPY6X4aNkZ6dzNRbo3pcsZbW9++o80nx81wVCNXc/9DOzVVXKN159VDsTc1dWJIDBcBJw/QaxcjvRH+VrFxmZ/wOlrmfZYr4SiAOU2Be0Tk/D5Ibk6v0SLUviJkZgs33/5Rr2XNfkpqPdosn8h6R+qEH9qM5lkg6EO/5v3O7PvKPdIbec49LowYY9y1dd/seI1xLN9jUawgTB3zKkHblqqnAPI2mHKS5zA21wS8CldYdnzP8F/ZtcVZ4+G18mim9p2bo1iCFztHsuPo79/hh1pNAbiiDwIV941c0Lsvt1mR6D1WZePkRDEMxBwPEDabrn69AcOqr0/KZZZwe/nKTP7Y3Fd/uaFhZwHsDzoDl2DYqQfJJ5M2/gsGOz9OyyJBpoQFy8ODdLghen9dR1AYOac7K+ZuXS56PvfZ8PcABVTuhNZErvgigvLtq1pYQR4wHGB6PVqA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(52116014)(1800799024)(366016)(11063799006)(56012099006)(10067099003)(6133799003)(22082099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?N0/RPUBd2GiMYcFbl3PAOjY+Nd8FRKbEOmvd2udh4eSJ3g3kiet3vPy+UYhp?=
 =?us-ascii?Q?0R8DMGvHG/pWWM0X8brUR4OipfRkArO4Y1Y65bWnqB/heD5ZPCwAY/ZXK2TG?=
 =?us-ascii?Q?46dYoECOoMCFGmRSIdJBKy1e5/iyAai2JiT1B3JBF1kV2BqKhixuDwrKp4oe?=
 =?us-ascii?Q?Bukif4U4OJpGsxNuT3fPtOE3HkA3QKwOf8IY9p8f4go3GAIC2AjJBKrob83z?=
 =?us-ascii?Q?Gq/VCjt81G5ClcwhLeTBevUwWGy9P/RQpo+fAx4NFAnVIq7Ydz2ZuqkLU3fT?=
 =?us-ascii?Q?PSnQTXT+SeNCw1iiBgbkUbtfVX1QUPEVkpBAmWUPw7Mipsc9glcgMWURnl6j?=
 =?us-ascii?Q?Mqu78ndKB7AGwqHu9X317NKzp+g9rLOoEp9bxbL3eWjUbGwideR36gD9MuOx?=
 =?us-ascii?Q?QqE47QaifMKsl3sOw0XhQVLhgbCVM8wzWHg2751XFwxGC9dfj8yXGvgnRP3y?=
 =?us-ascii?Q?Qc+KN6XTgydT8+7gc8ZUvX6f24vqfob6lYOzrxqOKB7JT7xXD18w8KAt6UEo?=
 =?us-ascii?Q?kfSNQx18t7BdY81bgn+GLXvX9R9ReHtP2clMK/gyXbr3kT0vyoUWSpBYswiv?=
 =?us-ascii?Q?zdiy+JyNiUAHB0GghkhAVoL1FtjTbMgkO1CDeH/ix9X4DGtoaLB/82QUuIza?=
 =?us-ascii?Q?OfyuLDBlvvOor8Hq7PB26WR1qc4iK8Cdqr6ZI/Ztv1IFU6HbXRsMuFxd1P0E?=
 =?us-ascii?Q?LAyr5Kbsdu3EbpTTtl/h2iNQ3roQvNRc3gCQb/rHye3RibBs/h3s136JNc7V?=
 =?us-ascii?Q?clJ6F39eVmCFl27ysnMRKhmtMbxYcS0pwSBGap7p5U3VEtqDnUfbNUjKhsBD?=
 =?us-ascii?Q?fAId5Y3bU7lxfMEs372NIp2i43jUz6UHgUp0xF5RBdlgjQksU6Xl8Ad6s9hT?=
 =?us-ascii?Q?mxuH2W5Fo0+3EUYCsjSq0INFYL/zVIQwetugyctPF3Mh11PbIJt9ZBCJrSqW?=
 =?us-ascii?Q?kjZXVO9Tsia0g5OdosYQUGEJFCYWw6RGLaEFMROwygypj0b2LbSNQPR9V4+r?=
 =?us-ascii?Q?jsiWFAuFs4aPEoC6dLoIkhpP8vq/vj+DaydTNCym12wLL9SM9PLzQxxPYL5w?=
 =?us-ascii?Q?1xe7C65q3Ny4ALFwmWmHIx/XJQuO0r6/06rib6qbyqPnQxLvgvjBNyWCuK5D?=
 =?us-ascii?Q?yYqc9mRUYThec/3sflR87/ctS7SwW0IXHpV2bMp6oDYgXJ0DFO4lFk60JXXT?=
 =?us-ascii?Q?tQAideza8DG8kJPXdfWapIMqa6d8It/9Sj7rRB5RREO+D5GIvyjCr9xMymCH?=
 =?us-ascii?Q?1U0+AkcQ/4iiM6qoJiSa3CYIVbtOmUdYNBVkTvV3F71Rw0JJpRsPcYULYYUn?=
 =?us-ascii?Q?IBCab+ntvUtYqpkn7cBlDsZHc8yCwOLa1+U9/K+ziig4lfJeS47zvmBDw3s5?=
 =?us-ascii?Q?36QUpqTvmAQeMJ8Q+7uOW7E5vgxPVdVGMznX3e9tB2X6Rtv9QXfINrSToEcQ?=
 =?us-ascii?Q?lM8oKL3tHb3rH9+fRpX77ZNMc/4cPhYfR5iVMy+CMKKA+nD6D9qDT3czEUjO?=
 =?us-ascii?Q?QbmT0FvadSVwZn8bX48dx+DgF4nqHtM/3VOOSvE7ByPu6gphSFtKYqIw8B2f?=
 =?us-ascii?Q?owLWiZyUNJj0IF1CRWBmpsWH32cRTahx6Zg+TZDWNsIkpwftWQ41c/CkUufs?=
 =?us-ascii?Q?3kam+jJW4iARHEEZCBv1HG05XdPyNGVNhVUTxUaKG3fLYy5bQXmBcI992sCF?=
 =?us-ascii?Q?yv/vEw/gx4b01i4WNJKWbsVLvbwxvSN+pgEivHr046fh/vcsE62QJCdjPMlG?=
 =?us-ascii?Q?N+4RLLkPdOS33kXR7age+NyH/o88LmM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6125245-417c-4a77-1a25-08dee6c37615
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 01:00:30.8546
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DuwHr/em3j3n81l+mMrym3qMz5pz2lcROU942lvPMqP0bAnbk2KCjrwivVB2S/mBJwKUwqS8TeTQ/KlnVyC+hCIVq2+LXfnZCPeiMQRwPI3tMWy6FW1IQokPrGdowGtW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB15382

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/au1x/i2sc.c    | 11 +++++++++++
 sound/soc/au1x/psc-i2s.c | 11 +++++++++++
 2 files changed, 22 insertions(+)

diff --git a/sound/soc/au1x/i2sc.c b/sound/soc/au1x/i2sc.c
index 57735004f4166..0e9c7eef9ee84 100644
--- a/sound/soc/au1x/i2sc.c
+++ b/sound/soc/au1x/i2sc.c
@@ -202,11 +202,22 @@ static int au1xi2s_startup(struct snd_pcm_substream *substream,
 	return 0;
 }
 
+static const u64 au1xi2s_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops au1xi2s_dai_ops = {
 	.startup	= au1xi2s_startup,
 	.trigger	= au1xi2s_trigger,
 	.hw_params	= au1xi2s_hw_params,
 	.set_fmt	= au1xi2s_set_fmt,
+	.auto_selectable_formats	= &au1xi2s_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver au1xi2s_dai_driver = {
diff --git a/sound/soc/au1x/psc-i2s.c b/sound/soc/au1x/psc-i2s.c
index bf59105fcb7a6..72aa5177147f7 100644
--- a/sound/soc/au1x/psc-i2s.c
+++ b/sound/soc/au1x/psc-i2s.c
@@ -262,11 +262,22 @@ static int au1xpsc_i2s_startup(struct snd_pcm_substream *substream,
 	return 0;
 }
 
+static const u64 au1xpsc_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops au1xpsc_i2s_dai_ops = {
 	.startup	= au1xpsc_i2s_startup,
 	.trigger	= au1xpsc_i2s_trigger,
 	.hw_params	= au1xpsc_i2s_hw_params,
 	.set_fmt	= au1xpsc_i2s_set_fmt,
+	.auto_selectable_formats	= &au1xpsc_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static const struct snd_soc_dai_driver au1xpsc_i2s_dai_template = {
-- 
2.53.0

