Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010013.outbound.protection.outlook.com [52.101.229.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 428D3320F
	for <linux-sound@vger.kernel.org>; Thu, 19 Dec 2024 00:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734568541; cv=fail; b=rMKDuo1AmEGb0RKAyVoe0lqymAu6ikwfLz9eBCtT2za6VkIOJkD7Fqw7WEERVvJu3WQvZ/NBFNRrE5ghT+0NQ5AFKAhDdlCZxiD0K2/Pijj3OGGFd2Lw3Nsc7R3r0GSyHTjzeKAAjRjb3I+mWVlhP3z1Wb5IH+wlJolVEvMoCVo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734568541; c=relaxed/simple;
	bh=P3lBIYceFZvtGODMe5E2CFfedsXcVN8l9R42YlMN/GY=;
	h=Message-ID:In-Reply-To:References:To:From:Subject:Content-Type:
	 Date:MIME-Version; b=iXi1OSN6u7YOB4wWnPtpQHLrra2K93V6T33Hf200/useS8sWhTRC+jYvfr9sJiO1cIGgGuGDbrks/WJBuMM8UoWJHFQYKhEXu+v3kQtYGZ7tadHr8nt54CgIG54Y87xepCBGbIyi8TGlcBnkpy/a3zrug8uNokXjvJVc5nyb6Y0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=FHh+mUFq; arc=fail smtp.client-ip=52.101.229.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="FHh+mUFq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AWTrGp9ZeoRm3fjuVE8nktEBlBGvrwdD6/bCcfXBT/GWZupLSVVKYAOwrqliPntsHdzl6efeyh6dVHdZ41/Qy0SUoGuk3koss90iHSgXcJF/PkIvconHOG5eFu7lDw6BIFjNg8na0+DwrfsIWLW+iUEbso9fjU/X8KwRiRC8S4yV2g0WVmdsGyyEm447NfkGNtuXdXzN8P4u62GBLj7wZTXP0Pb42mFVHcj986axnhzdiSszroljB/943N5mSa6z/hpIna19ml1n5U+DeGepe4Zwmt4xkRi6bSlnRKsC0eP+/5q6VSav/2kJagd9X50Oo0LXeSDHRE6uT3j13oEPbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ptxx4KlXPLr54EzR49exvE5r06t9J/AL/yfOPW20bxc=;
 b=kuCgUJ7m8x4OJ5JOyR1yfTHr5Sq5ZMi3KEIz9qHS2lxi39bUIO1R4yhK8tMDQ+RNy9Bz8EaOMh/4YigS6b0Xcl4eraZLApOf+YnlArJrmbdCnl8apVCYkZnaTBif7imuNCON60V2QIOc6eBS/PEzKl8T25Z89eTyayULePbIkWJjbQF+tu9hYSc8yiA5cz4GlUs2/KI+7KjDrhJV1pARbYONm+hPYUeECuH3T7pLrxUsFbV3oGPpW01ZQ3FgdH9egFa1NjwEh8PnIMv4gxPeiYI6sWcUEDyYGSaVf67tE2yHHlsd65wpqYvUgUA9hm/Jy++t9DjaRr56w10MfV/Q4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ptxx4KlXPLr54EzR49exvE5r06t9J/AL/yfOPW20bxc=;
 b=FHh+mUFq//x2JZ7NjjZyGDWSPCn5ZHPONFHnR0Qhc3HemktRvf69Xy5GBM7yHsjmw/pHYAQJb42ACfxxEfkUWw45O8waS+U1AdnRGtZEqs4Fhsx4rM29U9q3I47R30Xin+i7PFxRsv+f761AB4+bO2QB0V4dVZuE3KQeWmuOKI8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYRPR01MB14144.jpnprd01.prod.outlook.com
 (2603:1096:405:221::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Thu, 19 Dec
 2024 00:35:37 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8272.005; Thu, 19 Dec 2024
 00:35:37 +0000
Message-ID: <87jzbwcxwm.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87r064cxym.wl-kuninori.morimoto.gx@renesas.com>
References: <87r064cxym.wl-kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 5/6] ASoC: soc-core: Enable to use extra format on each DAI
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 19 Dec 2024 00:35:37 +0000
X-ClientProxiedBy: TYCPR01CA0043.jpnprd01.prod.outlook.com
 (2603:1096:405:1::31) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYRPR01MB14144:EE_
X-MS-Office365-Filtering-Correlation-Id: 8916638e-b2aa-446e-1447-08dd1fc50ee0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?//i2vttovlpssYj9Srd6XTGXzZZi/0YJGQgaXxd0g+SExtSSwZPpEGewIaIe?=
 =?us-ascii?Q?uvdzZHtco2L3zFxezhsIEMVCzeMz4kJy+x4pjIj037kT/A0PqfewSwmAr9d9?=
 =?us-ascii?Q?mgTS18vh1olPl00/E/UoyrxQMNdgXXPwRCS1mhpEKoqa5IC4Y+ULqt8ZRtg/?=
 =?us-ascii?Q?9ga0IHQFJ4bln4RbTkzyD4Bo/KDTXDp76IBKK60iCdqQrEB1ZCG+u8C5yu2j?=
 =?us-ascii?Q?6+e6l4D/c9BvBJKCe/0D2pfHVk8B2KawJpufIf4lBAzixUVLoVFq7jL63/jS?=
 =?us-ascii?Q?X6FehpZbzszMhNcCfyZxr0mHlRyIO1I9cOCJ+S220w9e6f69uT/V/fq6UMLB?=
 =?us-ascii?Q?LFH1M/NUmksnQUUAvUEix7q8dqBWSqlG3I9OPc4M9BFHCnsh3xr210sMjcus?=
 =?us-ascii?Q?xucoJ96aEshC9Mitm3u90yRlijLn/s00qmT72kAD6rUyNbqKdleh8lsl5pdx?=
 =?us-ascii?Q?j2inbq0K/WjQSa6n8BSLumk8/AYGmb8v/7CKx2KKkrRgwPpYjieZSzOh0ock?=
 =?us-ascii?Q?CwI5gkP7/Qpc3I7+LbxMlHyXsLJnj99HjyKQhL9BL3QP6+L/7QOMgXyxJnw4?=
 =?us-ascii?Q?FweNf2HHDKtyKdPZVq3xJtTJJ2FbCkcnmIMXxMBIOAcgN2neWvQiYg6mvcwZ?=
 =?us-ascii?Q?VbzKjoMCymKDGAHbKupRgFSu945bRyoPUHrT16YFyEiZtmJE5BPehQea2/Mm?=
 =?us-ascii?Q?5K0fcmhrNW2MDEpMC6iy0hwdsRFSzTOdyI8ABbAIgNK7X2Y/TaTvKh2ZEe08?=
 =?us-ascii?Q?6w/MU2C+8UZr0flCsc8S5BtzMeIelJtJZkntmUPB+BL8MbCDaBkzUUZkl8Xb?=
 =?us-ascii?Q?17L/fPoNYJ7n/0awp2haR95NfAifFARi9q18BRRaXaul4bmQjseHiij3gPS8?=
 =?us-ascii?Q?Tf9+ckRWeLAzWp7XA0ycZuPbA1E+pBUaca7QIhLTz5Nj9sZ1dM5SirP3qp6y?=
 =?us-ascii?Q?47gxwkVMM1v5CNTRHR6r1zXk0p3smAdpRJxGv77ZtUc2l5jpvsBZQyoFjqM+?=
 =?us-ascii?Q?/wRudd3Vi+nUBmrkYEhjKQecyTMmQeHMtRVmIQuEqidk6EtZE2RtH68cXkf3?=
 =?us-ascii?Q?P8yNPk9WqCEW5FA9xh3u9oiIhTvMkRLlm8NDUrryfu59FR/95AtR2o54gPUa?=
 =?us-ascii?Q?FJOoiADURO8CyiLMiWpihW1KFQOPcY7YFFoj3K/XF4RRbimxYrmhjFHsvO17?=
 =?us-ascii?Q?zJpys6zjqERI8u72uDQk9gAOamLoSGvB+pzQ1qAGGxa2YxDo/1L8IzfTQm0n?=
 =?us-ascii?Q?K4nHe2JsQLJiHquGv3xsdw24Kg0TUozJJM6AjVrnBmj4P/Qt1uHLU0xWcOYN?=
 =?us-ascii?Q?mq8fKYJvx/HktU/dT/siKoJ6j5tFlvyF7y+OpzXMdzHPt2p8ieQ9fy8yN3bg?=
 =?us-ascii?Q?nWekQdZGmPjsK7z78FutmOB+gDeMm7V3vSbx2PsW/kLze8rB2uhKh9c7ZXCl?=
 =?us-ascii?Q?F42SP4RkKFrbDF8E1ccMGvGYEE1rKnbA?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NsoUFLb+GyTnIQ0lFuA6KNs+d9zWi66mRGA5FvqfYLwLZuaOzndbRnnR0W2j?=
 =?us-ascii?Q?pmoPu5AODeXc7uzR9KSPuHflusRtD9SyIJ2W5y/Dv6EEIORAPyzTiO1WagWr?=
 =?us-ascii?Q?NoFknrms0rTcjFCOTGbKbtDAFSNnLIYh5sPYUxoqQF+HYJiKQNo8/r5Mrpb2?=
 =?us-ascii?Q?FthyDCrULFCv4YeTURW8syNtyq0lAz278445RKJVYAdl/bHU8YBiHyPvvdiu?=
 =?us-ascii?Q?MkmS+iWs7KBNJwTXHri1ec5nBCDJSNiN+b+9a4wwec7tQti0C5/xPmaS9xvY?=
 =?us-ascii?Q?Fj02h405tRmBOjYVo+X8ONB/0v1BUCjEwsYDrdEd7jJ3sInP1pUkfNSKYZ+V?=
 =?us-ascii?Q?8u5w1Mxx/1tyZ4F5BXh9vOPxrjsTR2NqJHlxcXPZ8o7MVnPf51Ey202m0H9B?=
 =?us-ascii?Q?wvnMQU3y8z17e3p+elS5RThNRruKNyvfwpNyZk5Vtlmi2mmKnuA9fDdTX+V5?=
 =?us-ascii?Q?e3Gwj9C+l/KVKFUhH6BWoiiiQbnYhsNxTIBMrBNZV/vrUqSQonvSz2aeeCj6?=
 =?us-ascii?Q?SYBoTR4k8w/2lM9+J2sp4WmaIWNcwEI+pPxNMUM38MUaZSMRymAaJNlsHoml?=
 =?us-ascii?Q?kcxddFFMbFhwE9DPwEScbtqgJD3Kjyu3MRs4l//GOSpaDsvouTnxU/UmFYQ2?=
 =?us-ascii?Q?IBj0v7Q9AAYJLnCo8NgroKcB3rDIRDOJW31U/bIlLGFiq+yyy/mdUc1S1RjC?=
 =?us-ascii?Q?0QTn6Pj/rG8pjvXtJixVWxYT6tjU6JFrY8QOjn2PuQGA65N7dx/0wgkoDD+z?=
 =?us-ascii?Q?TTQBwEKtGXyAf4Up0JgBfLWCDoDnAuB5lM5VGeeS/la3Si45heJFLLYmreRD?=
 =?us-ascii?Q?poFi7AuLdQcPC4obVQ1QcbejHUGQRaxutGA6M03DIfstAiDauSxAe3YcPnJV?=
 =?us-ascii?Q?nyMKjfkwWBkhM75NykRo9O5TJY2/AN/ZUbOcuqyJ+6lETA+NTBnqctBVwpM+?=
 =?us-ascii?Q?8slQWhPtP/cFLo3KIojA9r57+ApaILrvYDYwS/Rw/5AP/Yq5NzD/xuCW1dwz?=
 =?us-ascii?Q?Irim+7BRdMAy0zCfLxUZ2wCn0wWm1OnaxlyYOf5i/ucvi/rpLUP38j79WecS?=
 =?us-ascii?Q?HJROcRdRzg0V3Hg6b3DS/y0FWXYERyLgPwm9sNv+2+o4gV0DJIT8wIMtT6sS?=
 =?us-ascii?Q?rIFJVfPEkpCForUUdzgGgQuUzUiUJH3x9BeTOkRFOKLi7w5P5MIQjEfkDXTT?=
 =?us-ascii?Q?byiC9CZsoV9t++h0irKEmccWKGfjyDh6oalrRNu/46lxS8LE587NOy0Nlejz?=
 =?us-ascii?Q?U1a2cNkSpPyYEVhK4gUUPldbAMszTiWoek38JxCh8He8i7WqYfe0sio5i7PM?=
 =?us-ascii?Q?KbBLMtSq2b4qkrSUnAx6HPIHj1T3msgsYRxK5ayydABD3cAo2KqC7x8zYy08?=
 =?us-ascii?Q?6xUumapOmD3syrLf4qCwF1OcX6Jx4z+Rvy+IZ5f98nRVhB4MlFl2d3+zkZ1k?=
 =?us-ascii?Q?7ZP2+Gq/xd4K4y/yPqQxLJJGCY9RczcMc9CkDgRMugFhcxZXrH6aT73/1Ccd?=
 =?us-ascii?Q?ex7lGDKb7ovnLXihiWC7mrBch/cI/AjAS1Jm2JgoD0t6x89EC/VlXXDHtkLT?=
 =?us-ascii?Q?w574wZAaw6zxOKqS54En7NzWW9jmwwf1BS0IKVb9DOqWOzMGVhVCkkjlboA+?=
 =?us-ascii?Q?2/SDO1uRIU3RPPVT2jGXRoA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8916638e-b2aa-446e-1447-08dd1fc50ee0
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 00:35:37.5918
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZBBhih3HuhmJxugKKqqguUCZlsxQG9j9/Bgqc9BW6TWVrLlZPIZdLmvJJ5MiJ/i9ULCsnGEidlefZbT5nkqNhFJarcwHEJedN1OX8rRAoUX75TvRV4seiZOnrBjJioFr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB14144

Current ASoC is using dai_link->dai_fmt to set DAI format for both
CPU/Codec. But because it is using same settings, and
SND_SOC_DAIFMT_CLOCK_PROVIDER is flipped for CPU, we can't set both
CPU/Codec as clock consumer, for example.

To solve this issue, this patch enable to use extra format for each
DAI which can keep compatibility with legacy system,

	1. SND_SOC_DAIFMT_FORMAT_MASK
	2. SND_SOC_DAIFMT_CLOCK
	3. SND_SOC_DAIFMT_INV
	4. SND_SOC_DAIFMT_CLOCK_PROVIDER

	Legacy
		dai_fmt  includes 1, 2, 3, 4

	New idea
		dai_fmt  includes 1, 2, 3
		ext_fmt  includes 4

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc.h  | 11 +++++++++++
 sound/soc/soc-core.c | 27 +++++++++++++++++++++++++--
 2 files changed, 36 insertions(+), 2 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 4f5d411e3823f..61eee40da12ad 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -681,6 +681,17 @@ struct snd_soc_dai_link_component {
 	struct device_node *of_node;
 	const char *dai_name;
 	const struct of_phandle_args *dai_args;
+
+	/*
+	 * Extra format = SND_SOC_DAIFMT_Bx_Fx
+	 *
+	 * [Note] it is Bx_Fx base, not CBx_CFx
+	 *
+	 * It will be used with dai_link->dai_fmt
+	 * see
+	 *	snd_soc_runtime_set_dai_fmt()
+	 */
+	unsigned int ext_fmt;
 };
 
 /*
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 31cf499e3e79d..bd16b3fe59c8f 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1449,23 +1449,46 @@ int snd_soc_runtime_set_dai_fmt(struct snd_soc_pcm_runtime *rtd,
 {
 	struct snd_soc_dai *cpu_dai;
 	struct snd_soc_dai *codec_dai;
+	unsigned int ext_fmt;
 	unsigned int i;
 	int ret;
 
 	if (!dai_fmt)
 		return 0;
 
+	/*
+	 * dai_fmt has 4 types
+	 *	1. SND_SOC_DAIFMT_FORMAT_MASK
+	 *	2. SND_SOC_DAIFMT_CLOCK
+	 *	3. SND_SOC_DAIFMT_INV
+	 *	4. SND_SOC_DAIFMT_CLOCK_PROVIDER
+	 *
+	 * 4. CLOCK_PROVIDER is set from Codec perspective in dai_fmt. So it will be flipped
+	 * when this function calls set_fmt() for CPU (CBx_CFx -> Bx_Cx). see below.
+	 * This mean, we can't set CPU/Codec both are clock consumer for example.
+	 * New idea handles 4. in each dai->ext_fmt. It can keep compatibility.
+	 *
+	 * Legacy
+	 *	dai_fmt  includes 1, 2, 3, 4
+	 *
+	 * New idea
+	 *	dai_fmt  includes 1, 2, 3
+	 *	ext_fmt  includes 4
+	 */
 	for_each_rtd_codec_dais(rtd, i, codec_dai) {
-		ret = snd_soc_dai_set_fmt(codec_dai, dai_fmt);
+		ext_fmt = rtd->dai_link->codecs[i].ext_fmt;
+		ret = snd_soc_dai_set_fmt(codec_dai, dai_fmt | ext_fmt);
 		if (ret != 0 && ret != -ENOTSUPP)
 			return ret;
 	}
 
 	/* Flip the polarity for the "CPU" end of link */
+	/* Will effect only for 4. SND_SOC_DAIFMT_CLOCK_PROVIDER */
 	dai_fmt = snd_soc_daifmt_clock_provider_flipped(dai_fmt);
 
 	for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
-		ret = snd_soc_dai_set_fmt(cpu_dai, dai_fmt);
+		ext_fmt = rtd->dai_link->cpus[i].ext_fmt;
+		ret = snd_soc_dai_set_fmt(cpu_dai, dai_fmt | ext_fmt);
 		if (ret != 0 && ret != -ENOTSUPP)
 			return ret;
 	}
-- 
2.43.0

