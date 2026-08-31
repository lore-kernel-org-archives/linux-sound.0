Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011061.outbound.protection.outlook.com [40.107.74.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D974D3C9EE4
	for <linux-sound@vger.kernel.org>; Mon, 31 Aug 2026 05:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788152967; cv=fail; b=SpzMxDlLuvypTmPUht+B+zFEglOL3xvUt0mZdE7lNGudtqREO1uMtCPcPEK7QCaHzntYtI631vYv+VKRpYBYk25sVo/UhEDSifVyT8qujHA0n8PQiqanJgwpcD66g7koo/7BIfglEH6KDdwsaYxi06VUuY3qxocKjATFmvPOvNY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788152967; c=relaxed/simple;
	bh=n0azm7X/WQeVhhAG/5HPkuaS0F8FZtad47pIWnSUXCg=;
	h=Message-ID:To:Cc:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Q0ZQZVpN+ApCP8Zqm4sOLCsfh//U1jWUERw+7ta4nCjR1db2FidpR7LLONAz4I0EmMx2VdbgKKlXHCMESxqhj9DwPW56dv6q6HC071M6XEsv5Fd5+fLdudEXl4H6TRYFKIw/qc57dhqgvXx8B+hOfXaVi/JOwbXdrCo1621oFLw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=K1sm5497; arc=fail smtp.client-ip=40.107.74.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="K1sm5497"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P3C8mH/2I2lL+zfTA5UPtZN5pH/K235QzWlthb4OeQzQqrp/yUM6pqzl1cFNxSpVp0zhyTpXUdWShv1TdDOhPuDfKqHy4EIBcZs2a8L8XRUVbM0ChDRnc+ihwAam8nP2PMZknFZT4Hgv1JLqNmCCQxVQ6NaTAU5itHmXQSWtw3RjTkzjvQADKqwePeSkHnzCa3uk57gFHNoXi4QIeTxgvjytSeu8EbRdgJZn5fxS38Epa8AkbEhToxgBZiY0TP16CM37f7t4K8lz6mJmsx92ydfrGNrLo0i8QvdsLS5SpFdC6XUsu1EVTsipP2jBeTwzS70XS/7n9AdZBJ+de/aN7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/eRRwOXO5NTMZTn1dlyEwtd0zLjKD72IZtGPIJy513o=;
 b=rjQdHf2qwhaz0+5r09rHvPiuaIzu2qSqmOSBCHv+gJkysiiLAHI4LHHO6oqVLRP2y2lFcGkBrHMoHH84NuG9LQQwV56HlD8Bha3R8p5JcgFtRDbFq3irXSfejHiktVXWUXA3UjWtdnrNoa0Apf7eTaQdk5luk0MlKIbaTtyn91I7si9dApbjSSAXfkTWFI3rmcHHs7IPLqsnp46w9TNhBTlLehlaLVr4xUSkCFNhZLLqC37lkE203470gpyU54g5EiMGtE2olU66SIaiL7Bx1Q+amjOCYHyl1+XZGm7yyEnBtEz5MF9B73sWUHF/oa/EXNNxaBTXy6HS1cHLHV+M2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/eRRwOXO5NTMZTn1dlyEwtd0zLjKD72IZtGPIJy513o=;
 b=K1sm54971vjuIxIv4+RqYAXg6DC9f1ZSweBshGN/y4qdJkqtjfCnWgf74nFcjVkv/xo0GaEQKHgGszEKm5/f4X30mlwA447KakFggiTxOkg7iDZWJq1zT4NQcnzS8sts/5NPux/PXZWTioM8zNephhv3uvN5ro7uLN+MugNnrAk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10) by TYYPR01MB12794.jpnprd01.prod.outlook.com
 (2603:1096:405:15c::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 05:09:25 +0000
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b]) by TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b%6]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 05:09:24 +0000
Message-ID: <878q5mub97.wl-kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 36/39] ASoC: codecs: twl4030: use .auto_selectable_formats
In-Reply-To: <87o6eivpyd.wl-kuninori.morimoto.gx@renesas.com>
References: <87o6eivpyd.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 31 Aug 2026 05:09:24 +0000
X-ClientProxiedBy: TY4P286CA0100.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:380::18) To TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB16474:EE_|TYYPR01MB12794:EE_
X-MS-Office365-Filtering-Correlation-Id: f078b67e-1837-4f1b-9222-08df071e0649
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|52116014|376014|10067099003|22082099003|56012099006|11063799006|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	3lpssKtuDIBfeTahq5trRbZEiP3ttWrMgMCxW77uk8NmPiV1tw9rzA5DBFyejo/jKi1vsmXr8g2+1mA5AuJlZ5RdBCA6w16ZUX7aLoEVDc/hEQoUoqqx4ti39OFmOYi+Md2OHQPnCGCqR06jaXgoI3hkYwBMcWoUllFG8qK2qaWRsMYOBz/7pGVDCc9PVTW+jMTbYKVkqmJP7b2EKbS1SsfSLkLMwVEUmKvUuHyusu8cwl4ysMtm64jsV0L9gTRxiLKAam3VlhQjbYYGkcsHFrzppdaHC5lPJ+kt21IMIpwXzNicq+iPoehbXqYsfIksf1wO0bbFC5FGj4Tth4lNCtUBM+uDfAmoKIF9ESsgMr+/wogRBD+S87s1iEmlBj2QTO3REPmLgQFuLmqjUjCOswl0WIsb/NAslJDTdHPF6F0YdAIh/Q2ErJUzjRFMPH7E9vF+qYcRTHPAImFVv8PN47nN3Sd6kpItkqCmStjx5H+wOpCaX0tElGRwBhsVbYiyn324r6Nz4npyHd76+1zgwPi4cE6J3yJvQqOuuLfT/+IuybSHjOnZ8p+F39hBApin5OUywUfsO5fEGamQ7kNKet1v0IWSYPcw+Y55juDECRUqllcRXm7rjysF2uPByOgcELCVl2YmpaIHoWect2uQ2BWAFiF6LMXRlFL3qW7CQqGVJFJnbzs4y7aFhAkVbJz/BGSMyVOzb7+XJM8zzNWU4o4DPQNmhQE8DslBx1Bb/rA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB16474.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(52116014)(376014)(10067099003)(22082099003)(56012099006)(11063799006)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mX3Pw8ZlWR4mk4kLmpMu+ma54FvxLvHDyupuVv0tVUNPfvlG60RaZno2myNd?=
 =?us-ascii?Q?rB0dFyS7O6xkxJcbbuSLGf0A+NhTiTfkPQ0AzlaOJkQwc4M7hyzaWCZp0EA+?=
 =?us-ascii?Q?Bxn/8r2Ku2Q47JHGuI31vUnzGEj/l0SIKiPw+8Rn1ajM+ij6A1IJA0YWR9qB?=
 =?us-ascii?Q?jTrJ0SXj/xx5eDnN6QwSSgWitJ/JZ+taL3+voFXNUom1IHhvXD5T+GQRYiZG?=
 =?us-ascii?Q?feKQtN+JJ+Lzg3q6WZbl2ExFdGekurzAiCxrhTiHm9VXDHFcjcCVqZTepQY7?=
 =?us-ascii?Q?fCdvy1NYPlHWR64oPhKja8ng/+qwG7eXn7sJ+0jOYX2BUa10EZiLW1Q8caqU?=
 =?us-ascii?Q?dzCjh/ie5mduMSHxSeYaDJarv9IN6Ajdcx+exLaSo0ks8NxToY+FrHJJb+b3?=
 =?us-ascii?Q?5UjFAhd7NDusCaAQThUU+cggSb3jS4ZhleWy0fvPZTnVSHRaCvaTA7n/E9lH?=
 =?us-ascii?Q?6O4qegoJBhXF9nePJC1zjPes/FlEN5I9bdyDCMhdFZAZkxL0jgCzUbse85Df?=
 =?us-ascii?Q?2HHfOdKPa6ZiUmGDCa1c6s9pYH45QRupP5TvCOEBC9AKcPnzDpqN/uX0d4Iz?=
 =?us-ascii?Q?6xqev4KWXYkASjE8VDXSQxBo1y7rpI3tYFlpWYd8cCmSGmY92+YpxVfnhBB6?=
 =?us-ascii?Q?75yuq4of7VRHhl9jMHue3GXvnmDTvlhvXNdV8hAKV4PcKo+347c4podf3vxo?=
 =?us-ascii?Q?shHIyoeP/ByOnlCULC5+of0XHLDkieUl299Oum4Ds7HMK9Rw51zHYjD3+f2N?=
 =?us-ascii?Q?qczk2B1tGqek5UDlgfOTpl+Pdq5988rvMBYZAVDl08i1VaOIlcW6HXc0PQwi?=
 =?us-ascii?Q?KpKOj+yOsJFa3jfstyXNqKyPTjwdBhmRdwwwO9q8LhOUowtec2ctYFt52o6c?=
 =?us-ascii?Q?OYuyltdD8uabu8o9/BHWB2M8RO/CW2i3l7Drlcapas79/mUDyYbwOR0689aG?=
 =?us-ascii?Q?5dt5C+YBda7JDRsiKx+1iLHDosTvliD5YBmJWkb20h0WLAEjK/HOgILeO7X2?=
 =?us-ascii?Q?53SeR9hY4vEVvSBbPhjPap4FTxd1PVS2w8/Jd7ScIdaHKv+6tSQcWNNJbQ3E?=
 =?us-ascii?Q?a9Suxdb99/iNJYopn/ayk5N/LPlqOtjXWpGOx7OKZ/ZLpnYqrbsDRvjBS/zq?=
 =?us-ascii?Q?srAlLcZxZj6P8pYrc9d68wv23NJNkWPCpdEneuMHesk7VKWeu1YWMXGakDFL?=
 =?us-ascii?Q?KXFG420AMzd3KnmqIz5b8C+sy5r2OkifImSTv6okC+QSgN5d0zgxjgGEU68h?=
 =?us-ascii?Q?++rj5/twNt/imkkuOAq9U2UKGpFeh54pSQIrc2KmThgtou+9rmoU/Ey0G+BG?=
 =?us-ascii?Q?bAEh9tgo4P39Ddwr8DouVnGVHrEFQjKm9ZhubnC2bGVqiqa7YRGGWC9uVEI4?=
 =?us-ascii?Q?scYo8gzSYnyaqEg3OsIDXpr1RN821ql+4hzLLJbWwltPT+awHgQXOwzAWB0r?=
 =?us-ascii?Q?TFbK9ezHiRZ0rXppda4r9/aWxhbs/T0oIGh3HNV9F3Hpti7i08TdgtWR4znR?=
 =?us-ascii?Q?b5GIIq9T8ZrO4mDVsJFTJr9aW24Gq42bn9fPv6K9OokIEk3g2sRa+/fuf6rF?=
 =?us-ascii?Q?Qlleu0c0MuGNSUYfYr4FRmuZg7xIZyuU6IvShmAs4ep6rln+2rjjKfuexy67?=
 =?us-ascii?Q?ks/nLSK3u42ZipD82lKEH1d6nwSDkVk0L3A2VQTXPl2OIHSwuqfjLY23L3Il?=
 =?us-ascii?Q?2Yf967TDdhx/4Dq8qibLcIOmQFtMcEOlK6AOqCAe8PoOMMlBfEQkm0tI3E1c?=
 =?us-ascii?Q?/Ea17HsT7zU3dVpGXFn0Kbd0XtlDM2mtmV8w0Xm9hWMFXUdA8mmM?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f078b67e-1837-4f1b-9222-08df071e0649
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB16474.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 05:09:24.8798
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H8fnVBukikMHaZZCfev93uERU/PoFomyxN/zW3hPov79y1SwBTrghKPpCRAuAkSk8AB6UnyrMGX+gJp9W9u552ckBZDZlZnxMS8CSNqHCUNDv7IMPXBOMN39OIJ0tFaz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB12794

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

