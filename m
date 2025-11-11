Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011060.outbound.protection.outlook.com [40.107.74.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDE6023D7D8
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762821408; cv=fail; b=mzUFCTrdxkdYJlwWx96NJ0FtWZRfJiEwwqxnns42kpvB4FX4eGV+c3iwcVmzDWuc3EUv6dcIzvgshrHB1lGqWdQIk8hWoIYDo4xxWFT/thqPot5oFqjIdkeSAwLHWqaHeW90MbmCbBvs5LOcH7KPMioU7bFHEelKeMNAFTzgbHk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762821408; c=relaxed/simple;
	bh=FcwGYAyT50bjkmzLsE2QDNUPLZUPGx4D5i1+DC3Wrts=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=KoyP32+CF/4/pX7xkssFyHj7iQxM4xvmo5tx49rXL1t2yOxP0AowdzevO7uMso0/r+CeQXiqx79jmc+f+U2Q/J05bg6ZSrwO8TSvIkVe8Hikrrhq0faOydVTBH5tnp86Js/2m5gJwBjNBRLK8Czb0nOiaaOuoTt5b+nhDhlTZNI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=p1JRrBpD; arc=fail smtp.client-ip=40.107.74.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="p1JRrBpD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o8WBhBRtQWLJGefCdYpvF5J/QHYHO7ImaXupaPO19keySjXU6Amhb9PF1KORlN3WHZDxcJVQ5dhkyPd0AK1E+pOKEDCDz8Hn2emx89rb8MFweT7O8Dfxy2MMyHy0x7leC3PWa9x257Q+Qz/3yiQx4z/IMGQw4IISyg0UuuY1uG7W6+DHjzudKyKddJQ8YDsFepHRLxeOElsFdFmzdysKwNpYSvKnjIswwdzgdkPbEUFMX2/MwIkBuPnV7nqNNf5T6CW5SfyPk6vRJgQF5SBBWY0T5t7JyiY6ne703ysw+hCKNRnRIIraUjemPH97fqieb2O4dnFeNyXB9eXXtfK94g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HUSSoqpawy21iqsHOnDs0SY+1kcBJZILwZZTlekqpjc=;
 b=MJjkroXYr7+sijm7ZgpDcmwzyQIIg+n1m6hOBwWOusNUgbQtxf0R69yyhJvWzONouJ4rtij4dsnRyQFNFEQuMdYO9iobBCBo3mPgH8GA3IRs54tNjGdKwwmOoKuk/9NKRZ+nwXwgoFg0mGZGn8tnE7Cr9UwUcoL4tTeOPMlCiTvQg8/MdcEoCMSiTvxivifcT/tpv97z0ear6RjH+W+f5Smu/qhpLIT/AX2BR1Hb76uEahE7Owl9CoE9gz47TIRs47z7G7YZDrMqy57Q/Zb//NbkexbBtLU/UWvL7Y4dvSUuSha8jj8fV/v8ix76VslyIkI0a+RcATPUVpdOocuEtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HUSSoqpawy21iqsHOnDs0SY+1kcBJZILwZZTlekqpjc=;
 b=p1JRrBpDB1CzkblgU5mBU5LRnzdni7+xLG7Ar28kEEl5ZLA12VrvAgduMvqK7TZXtO0z0LeqnZ+UGzkxV5cMDTrwM68ZUyhYAa2Fmrf7qZxmu82wpFo/QuOo+hm6+ZwktKPhX2O7lP17lT0a+tHNYA82oaw0yhabJjqGNgHOVgg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSCPR01MB16378.jpnprd01.prod.outlook.com
 (2603:1096:604:342::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.10; Tue, 11 Nov
 2025 00:36:44 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:36:44 +0000
Message-ID: <874ir1tnfq.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 280/292] ASoC: sunxi: sun8i-codec: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:36:44 +0000
X-ClientProxiedBy: TY4PR01CA0045.jpnprd01.prod.outlook.com
 (2603:1096:405:372::16) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSCPR01MB16378:EE_
X-MS-Office365-Filtering-Correlation-Id: 99f8d2c7-fffd-4218-80f2-08de20ba63f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?C+wiR8TH1rG0i0Ln6iKtEkFNN9w5mQw3vUTU75vR75sKKCo8L/Y43xjlCawU?=
 =?us-ascii?Q?Ywg4gpR05kDWEtUPo09il9WkkgVZXTMADqlKFgRUlK1GJNBCNviFhlxNUqIa?=
 =?us-ascii?Q?QXXts3SQe18XslYXzBHfLmLcsXeoTM4tVGoqnmwT8Hu5PK5lh9r3j4+MMMo9?=
 =?us-ascii?Q?VEAa1vQz5Fyk0AnJKetjBJGqtbm9IbQN9v31DTUJ97/R7HaiXI051ELMf5DI?=
 =?us-ascii?Q?fvVA97x3DQxKoBvl5PgJsVQ1RFMV44fJRji1oMWajilDT+CwzD2YYA5iGJ1P?=
 =?us-ascii?Q?gkrmhCTP1FkrWYE8lvf6fgLQuHs4SuBC62i7/ZzvQ201ukKhFXdJegpD1E59?=
 =?us-ascii?Q?HKgDayMhiVOUVzgPbtpuNN9gltsjPa7sXOugZt+ZI0P3qEpXfqlmngLwqItf?=
 =?us-ascii?Q?Zql/kL0U2Mmhgv6VQBaN0zentKxNKMUhhRCYgOy/5sfM8k1dUM4w+KTcRjO0?=
 =?us-ascii?Q?HCWxsCKKFZSmGSZ9GuzbASyqJzpchqCJOtLHQWD0zJySUmfDFf+b2w4gu2tM?=
 =?us-ascii?Q?3819+OpW+S0BoFb90Owmhek7oANGkx0Or8dsIyo//YmwQlHyXcLN7IGYWCXb?=
 =?us-ascii?Q?QW+voYuudC/+fBQb4BBtYPK0O8VfsPpik/FPC6k2MDTfhBWnJdiDnztsASq3?=
 =?us-ascii?Q?fsOOO+/YASW7I21YfbWvK9VwPGfZOd9aYNWRtLLw/rPXWXY3pDqniqPg41ob?=
 =?us-ascii?Q?d9/7S3qJhATrYuNBehdW7ktGVHVxmEJqrk/pRogLbLD8Y242B3KemMk0WrXE?=
 =?us-ascii?Q?uubqSbkljRXx4d4WT/fm6tXq1SZYbTYOeoAT3MD1WFBxfO99R9RBca40uNn2?=
 =?us-ascii?Q?VN/2LY7JWQ3ED75Ivn5Bgz6TtBhnqjFn08zHVAkoI0q51VDJAV9gZwSoerfR?=
 =?us-ascii?Q?63W8VnNwcbx7Ts1Y/oCUf5E0G8bMcEW/uaU1uoW+FcXrHJd+d1X0BdCClp/h?=
 =?us-ascii?Q?ytMm8cAG5CxLPvNie84y2vfvM5VOg9n5kiW3xoJfK8n5/3l2Vp5lfuytp6/V?=
 =?us-ascii?Q?nIHHAn886OHnr5KHDMor8ks8K3pBpu3HmG8CQXwa5nLN9Hmd+VDC0Dk5dtEY?=
 =?us-ascii?Q?MsJHiEv0Z2710j2C4PzwyaNsoyHtF8K3b9EFlPTiyLXHfjIDsXA2zp2VFtjE?=
 =?us-ascii?Q?Hn6mbeZVTMemqFXb8+wbm7JwLMPZ8HLIKbScX9UKTNW7ypdSTw5kfxUpsWQu?=
 =?us-ascii?Q?smbIbg1DWP4iHF8nom7XB+Cg5kCNfN7nTHckVWYO0qP2Aakm85JdxCdZAfc9?=
 =?us-ascii?Q?4DqNygLc0H2OVtTXOqjWMIGI7aA/G/v+YXs588zDYEVpcYu7SRCfxBFfwLdM?=
 =?us-ascii?Q?e83PSTJ2+2qWecj40Hr2LWrVQh5g9++z+5qAA07rVazwG0v1Tvmrdjt96hP+?=
 =?us-ascii?Q?sMPpuH4TF7WEKMpRO6KYmdC/apqyUGEqSTIjSC+xC1M4YsZlTl2nG87vi+kg?=
 =?us-ascii?Q?TcxCd9G/jzRkZvQ3srp7BnMjjR5409qQ3qKGcFlplHe8fnUWCSLmB32MRJNM?=
 =?us-ascii?Q?DnKeudMNVAy0rM/4+GA8lUhWeTUyJeUSZj4D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XPnE4jr0nST16H1BIQ69qsKSYyCApbY7bpFbdvG75pS/DqP1B1UEBgSbMKm7?=
 =?us-ascii?Q?Vu2oROM9aYV4+QGACQMgOtBenmfnLUuLh10tMZH4RFJMEs3uD3UuMH3i0Jfg?=
 =?us-ascii?Q?n6X3I5dToBbtdwodLE9cAUcCqnSFd6tq5B1ynQ2U4JgG3Fia/Y96ZMekVr+v?=
 =?us-ascii?Q?f8CZm26vlr4blcw7F12Tt2ghyP0Zk0Jd5UiESCgpYFWZwprf1NJoXr6G+WLa?=
 =?us-ascii?Q?H1X8kso/kRIEpfyRK0692qu77aeSsa9vlzvGIanjoBl1BwHQDHxM+YOpBTO+?=
 =?us-ascii?Q?2woh8KYWSDzNVtufoeb9sAyKL8FTHDRNR2ny1GHtQZOq8FFluplkrEt1iG90?=
 =?us-ascii?Q?vU7Hg3b6aQ8z9LXCBK8wNeFP7t725k2EoApBBgkz7Lkqf323t38OO1wT+65I?=
 =?us-ascii?Q?wuS8/6jg2Esnv8CgEtaQkqmSuo4Uu+xp/LjCr7Eu0el6RBwHsSMM0XK/cYXW?=
 =?us-ascii?Q?z2R/lUejohqv6Iff+JVIj9GnTLKwqHi3dIMrH3Fmw5urK2rb6zv8y/AWr1dN?=
 =?us-ascii?Q?sWsDa+oAkhI4G2nWp6u7g4H9MOOu9ND3upMUotBO9nBhbm4IRBro0dPg4ac0?=
 =?us-ascii?Q?+vFQGbSFlo5cKZ0qi1YEmrclM8Rx/YICcmHji8H18fK++dTAqdyRVmgO2H/3?=
 =?us-ascii?Q?Zsb3nlFsCue4Dj5N0E3CeXM1ACuZZX6vxjU74HDW6kXlU+utSHgmNjn8cmOU?=
 =?us-ascii?Q?3i78kUKMphCLZnNFqZ9XpeEpNPQ/e2bk5ZKOy7e4t2P0Os87sTK2jwG1OtgG?=
 =?us-ascii?Q?djwf8uFsJXcnXpktAUP3fA+lhnR7lAN5Hoa8RNzukJsmAHEDwa0+wDMTOchQ?=
 =?us-ascii?Q?WAZ1KUrlCD81hJGGtk13zLHSN3ADLG5tKTNe5OWGXKq3b83Wc0xewiWa8USk?=
 =?us-ascii?Q?ESU3Cs1DGL/O3grE1LGL7kSgOBCYjTgrLToaoyqkAMkHlJAxFpyGf8CSbJGP?=
 =?us-ascii?Q?Qj+H2vexuvrtos8W5NBfBmOFrXda7CLwOdh0L9eM74eChGsowE0ABv8LX8Lt?=
 =?us-ascii?Q?OeB/D6uy0wj/2QzH3LhM1LOzL98jcKXVm4XJTw8v1sIOKMrYFz5gEXz6QEve?=
 =?us-ascii?Q?52w8mSNWmwN+4A4RFG2hKnMw+tictqQBOHTjdQrFzwEmnWM+bWfneOi5fr5c?=
 =?us-ascii?Q?fYgLzkCz0agcIKLnclPYb1a3dd7SBBBmAdE/901JjU0R2OCfDTXj2fyNRiud?=
 =?us-ascii?Q?qKFcG8vvX6Jl+EhKzJvtbOqybbtCWDUqIXjFUBLcCI4RYNjrJ3ZzzVo1Rfcn?=
 =?us-ascii?Q?Khu96KN9PjEZ7t0QLvsgt7Ln9apv6zfSjD3T+BIc5Pi1CPBNJkxzJ50g9/RA?=
 =?us-ascii?Q?KNQqhaO+cDs8aN1acgEegqJnnDCiSWYjUs402/vz0sOUpPAhjYUV7asnTjPV?=
 =?us-ascii?Q?wSnZk44zzuF7ZS7O/1FEFkNaJ8F0PDrDk/LBjNiHs6R4OP2ZJfXeeFAN1inI?=
 =?us-ascii?Q?qzeM9ay084AqScghVCXCCMSVm5MPLDH6UiPPoYWO2P1ym7fFWVecjfuAoLsL?=
 =?us-ascii?Q?DUX4BXLEMu06TxvBiXZ8CKjoOD0IT3YREWOoT6zGUbjjUxyuoh/okpqpBPi/?=
 =?us-ascii?Q?sIS3llgjt6axdbWagbAVAc1k2saFkcdg/spr2VLI8prRCs7aloPsoy/+vaNe?=
 =?us-ascii?Q?+C1yxkPerPnR4FbEbcD0dm0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99f8d2c7-fffd-4218-80f2-08de20ba63f0
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:36:44.7174
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TpzWhztYEKoCuTvSAXjzzMtxA00Ru7vJkHvVk26qDO4qVaaG8JfXpeiWJDC8isP+rb7uf84nrmXD1dCKebAOeNDwEji1Coa8tBAnvjtuMxQPlaQ5pDmAkEHqZ2C6YyB8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB16378

This patch converts below functions.

dapm->dev					-> snd_soc_dapm_to_dev()
dapm->card					-> snd_soc_dapm_to_card()
dapm->component					-> snd_soc_dapm_to_component()

dapm_kcontrol_get_value()			-> snd_soc_dapm_kcontrol_get_value()

snd_soc_component_enable_pin()			-> snd_soc_dapm_enable_pin()
snd_soc_component_enable_pin_unlocked()		-> snd_soc_dapm_enable_pin_unlocked()
snd_soc_component_disable_pin()			-> snd_soc_dapm_disable_pin()
snd_soc_component_disable_pin_unlocked()	-> snd_soc_dapm_disable_pin_unlocked()
snd_soc_component_nc_pin()			-> snd_soc_dapm_nc_pin()
snd_soc_component_nc_pin_unlocked()		-> snd_soc_dapm_nc_pin_unlocked()
snd_soc_component_get_pin_status()		-> snd_soc_dapm_get_pin_status()
snd_soc_component_force_enable_pin()		-> snd_soc_dapm_force_enable_pin()
snd_soc_component_force_enable_pin_unlocked()	-> snd_soc_dapm_force_enable_pin_unlocked()
snd_soc_component_force_bias_level()		-> snd_soc_dapm_force_bias_level()
snd_soc_component_get_bias_level()		-> snd_soc_dapm_get_bias_level()
snd_soc_component_init_bias_level()		-> snd_soc_dapm_init_bias_level()
snd_soc_component_get_dapm()			-> snd_soc_component_to_dapm()

snd_soc_dapm_kcontrol_component()		-> snd_soc_dapm_kcontrol_to_component()
snd_soc_dapm_kcontrol_widget()			-> snd_soc_dapm_kcontrol_to_widget()
snd_soc_dapm_kcontrol_dapm()			-> snd_soc_dapm_kcontrol_to_dapm()
snd_soc_dapm_np_pin()				-> snd_soc_dapm_disable_pin()

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/sunxi/sun8i-codec.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sunxi/sun8i-codec.c b/sound/soc/sunxi/sun8i-codec.c
index 7b3496caa31ec..6bd42da57ac01 100644
--- a/sound/soc/sunxi/sun8i-codec.c
+++ b/sound/soc/sunxi/sun8i-codec.c
@@ -1287,7 +1287,7 @@ static const struct snd_soc_dapm_route sun8i_codec_legacy_routes[] = {
 
 static int sun8i_codec_component_probe(struct snd_soc_component *component)
 {
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct sun8i_codec *scodec = snd_soc_component_get_drvdata(component);
 	int ret;
 
@@ -1331,7 +1331,7 @@ static int sun8i_codec_component_probe(struct snd_soc_component *component)
 
 static void sun8i_codec_set_hmic_bias(struct sun8i_codec *scodec, bool enable)
 {
-	struct snd_soc_dapm_context *dapm = &scodec->component->card->dapm;
+	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(scodec->component->card);
 	int irq_mask = BIT(SUN8I_HMIC_CTRL1_HMIC_DATA_IRQ_EN);
 
 	if (enable)
-- 
2.43.0

