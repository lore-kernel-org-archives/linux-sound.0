Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011064.outbound.protection.outlook.com [52.101.125.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65F13192D98
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533771; cv=fail; b=TS9jAZtfiOPfKkI02SiZg94aWhXEx1dpvdBkmKARpQdOpOLkrf646HAeYWE87FL2SQTbqth21MMVBPq19zGbaUDG08DokOpJ+I3Bv9F0zeujwiY6Hm21u2y3FfaMJxBFUCckM54pPSSKacI541AImVPlM1uQ1W28QbL0scU1+Kg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533771; c=relaxed/simple;
	bh=nCj5A/UNk1uIcTBTWDVwCF4j8HdR2yN9VXLiIYlb/uY=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=D7gUDqL26X/dYsy6QOBNcgNrPdX3h2OJFIetqLtVe+apOMeh3j/bWezuMtV8nTQP93Vfaa3bP1WXXlyiMqLfbtnhKykdtV0ndxICJT0js+8gvdTiB6LGBU+dIFBopl8c6uqtYGUUiXUCaT2+SBdZgHqXP03DVoUsjHZu2/4y0Ww=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Sg3e/g9P; arc=fail smtp.client-ip=52.101.125.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Sg3e/g9P"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vMdqexiLrL63EnqMBCiHq29BcnXfL9t0N5XHFDTl9nre2aKq6tl6oaoDPIgLviJTiC7VkAkSRAMyFQaQMmMKvfBYpycBHFQwfqpSWKTUh5fi7Q+cdRzKnAFlObVjP2T+YEE+Lb2PSUi5HXdML0tqrb50Vv4vUcRkgmCbDJt6SVk+pA8JRS9lKfQcLFoYivXwUPSdedS0TRvTMTv79FX+bglq4I5szUZw4/Z/RDcmxg771pGLqwtwddb3Po22eAUNHBscMzKbU3gWUCNeGpzKRFcTXPdeb0l4P8Adk7AXQ7/ySf2HaHowOV5Cbl/X1/VAC92COjqLhg1xd4ofdNV2aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8wAq3Q0UgMS++Y72Fms8q8LywDo0OYieSjzQRS2wvVA=;
 b=aNfChL9MpyaVtGfpbcBeKS7uDH1IXJBhixShPmFvJDp3gcw7+WfjYxzla1+avUR5v11QMuY9cr/ZDyiPkWwwoXZLnH53+LGOVuMepzsV81JcXBiJmx+cuHyc1OCiQWL2ddVrlkk6id2g3KUXKJWnUQ7b57Wb2MK+JYLczy7tqRS05QWufqUi7QgHh8ZVQCh1YLt5/gKNDOZeCoJqFqEez78uvraaVVLDAlfj8YhZEYpYnh/vvAioEUl91ygP2jsiPxzydazHUOsIqdgQstBYzMCT9jaZAoE5OCvkodnM/dgxIQUIszcnRPo6TmJaKL/IfWHwg3Ix+hnlQd5VUf5sIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8wAq3Q0UgMS++Y72Fms8q8LywDo0OYieSjzQRS2wvVA=;
 b=Sg3e/g9PVW0ZbHVRQcbjiHQcIEE3F5aLoJGZQe0MIe+V0wwo2YldwfNOpv3GDX6/KsJ417Lq88SWorgkVBzda9p6Rvmtez4bSapwIQhxTzLycHvawcy8Yiwz/4eb/woZa2QFeRCAwnZi63BGmIXNEXvqnw1MmobhMZp4DTtfAnM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB9660.jpnprd01.prod.outlook.com
 (2603:1096:400:232::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Wed, 26 Feb
 2025 01:36:08 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:36:08 +0000
Message-ID: <87jz9dbi7s.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 097/157] ASoC: codec: wm8991: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:36:08 +0000
X-ClientProxiedBy: TYCPR01CA0071.jpnprd01.prod.outlook.com
 (2603:1096:405:2::35) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB9660:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ba3512f-bc04-4475-d8c5-08dd5605f174
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tyj9ZRog6gwJWrvTeHsbrtcD5GQsZt5+el9h7vgtSoEYZyFWx71uHxbftRlo?=
 =?us-ascii?Q?sObNlMAI637fgLB5x+EU2LqO/uMZoJ+fIQKLkmXxgddI/DIigFzOKLjq6se7?=
 =?us-ascii?Q?VQKrzJCO59o1RNF6BZ050JUU9udQkUNQlz1kJOTQyRET6jM/b07NXDb+HVKK?=
 =?us-ascii?Q?PJTyYS6pTewRMzZ387OuanXkZL1P5Y+ljMI3SYFkH2DSbYzajRi24ZKFGE56?=
 =?us-ascii?Q?WNo/ft2tlhCJolIxbAaJUhHZgMSoUUn5wbtq5OlAFTn66Rxe0/GqREVI9wbr?=
 =?us-ascii?Q?oOXCxDUTQZwA6tgsLvdCQS/L05FsAT4+Q8w8h1CVCXH00TF5xwFPSi2pqJSO?=
 =?us-ascii?Q?SF8H2cZ5R8nNlBaG8JXCVCmlcC0qrcewrbP1PlEnPZjpJ6SZFM2gVr/SGw7X?=
 =?us-ascii?Q?x4MCR4VIEnpons7/qQH/PxXf9UCu1p6uI3e/YGyQZhMwJyh0lj/FtCDf8P39?=
 =?us-ascii?Q?Ryl2rf/iU0uVwySM3PmrEVFzWBqq4GSTkSGw6fImHseH6YTALB8gSyloPOXh?=
 =?us-ascii?Q?GxnEglYDo3hQV+jTaQIArwQhPG5NQv0azahjMIzAK5+zgFtmLXyafEsPuOtJ?=
 =?us-ascii?Q?jIr/i8bEP4r/Qm/MYNcseTOlr9X9LjBNLkwsIBdZm5JpXTbxFkFBIj+//N+P?=
 =?us-ascii?Q?M3ogJbp4RXrkMV+NuIJ/4COUn21WRYFDShfDrhzYToQI5YAayHF6wNsHthuk?=
 =?us-ascii?Q?PfYrbkzVNuDdcXc0DRctA/2u59kFUDRzzYORqDTV1ch8ggMfeNHi8nZBIi8F?=
 =?us-ascii?Q?A+bmHFW95ACgv3NSoYVwNCkY+XiHnFAxctpkAvn1xMyaiYRMzT3VEQtSJE5F?=
 =?us-ascii?Q?lokU+zbE1ddxvUlky85sAfYXff6hNEO34+0UascB6hfCZ9bXlrC9eE8Ri8Bs?=
 =?us-ascii?Q?DZQxfNCAS1/RQKfyj/UvO5+Ayuajzy2StXm1d+nuW6ehDYdHkl/TUklNFcG1?=
 =?us-ascii?Q?UUDOA6Fufcp9CeFn+WwFO/7SR846hKmrHTjhjLqpaYs/3Sa/gQ1VD0tzVDi1?=
 =?us-ascii?Q?UDmUlydmy8pyqrKiuJkdz48hbXgJKUWcWsZDzyuRDt3ZYt+DMPiLwUa8cjhp?=
 =?us-ascii?Q?Uf+XhsNmJFyG739WztF3/ihLLnMJHgAvUBDUlX2yVAT8eaQQbT1jFey4Ni5x?=
 =?us-ascii?Q?F1JOUyZSbWDj14vPczdHcErkCAPNaJLUy6rrdGOMqN/Cv3bXH1wemMfBaCvu?=
 =?us-ascii?Q?8F9ns4DK63j2Sm24KrtsG7zWjMyvuKnhKsGLg8n1AgiX1+PQAOIrJSvdkCdG?=
 =?us-ascii?Q?idFhYuT7UE9xBH5ckbkglZcegBH2mE5ijddynpQ1DWf9Oyc4UPRmEDJ2QNjE?=
 =?us-ascii?Q?FeFEidzmcjUXwVpY/HAP4Ty7YADwSamxmG9+SkGTKOz72bhYbNeQSwv8+iQW?=
 =?us-ascii?Q?EjqSSZM82YplaciWu450B6ztUbm/7B26NvFfFN1Nrq0sIWNcI+Gv18RzeIln?=
 =?us-ascii?Q?Co7B5d/bn1C2NqBKVzgHQwaDqtXAr4YL?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?U4eBTkxYl+0KeYtTM9PzMq4PrUK8/p/U0087UF1+0uKairpVDzpCrEbkm/Q5?=
 =?us-ascii?Q?wakIY2d6nKolncEmuB8fh8czo3Mtk+CUjc4eC82GoYaMKWKRIv0HNcHhEcoT?=
 =?us-ascii?Q?/a3jDEO+wqyCgm9qt9c1AbqM5a/mGFvzkxBYizKJ8ozw/gF/KjZJPH+P7DVq?=
 =?us-ascii?Q?yfabdpoap5bDQe5CjCsv2H5vKZ24GM+qFofxyeeH8n0GlcwYyqVxQsPoFEZ1?=
 =?us-ascii?Q?fCi6pBSOfbwkzKFVDb0L4NZ2+3MLMVVjLpfZ1mtMo8+C3eeWYdmKeVcN1MZ1?=
 =?us-ascii?Q?XwLYiKqB45lcGalSVrQpl0AgH96OT2Zq26Z+esWs5hUP7U5NanaBgzpBzG2C?=
 =?us-ascii?Q?M0mj3DD1f/L3q6xrPQmXqXvy7kCRmylO4Uw2WWunqDrBinZzrbZd82+/l9DG?=
 =?us-ascii?Q?zk2zZ0B28cSY58gNwSmzLHDJWvGXGSIvJGno00WMnnH+7E82Qq12UcMhWR2z?=
 =?us-ascii?Q?+xbGu+86kwqttLjvek0k/cvp51xZMlHiZKddAC2PAWR6Lb0AcOJH7+xn2/fp?=
 =?us-ascii?Q?Q1Fm5tnqwcFWZtRaiIo3KrKvKtF/u89y89TzOlH/Poq81MoPueMXhRweJJ9m?=
 =?us-ascii?Q?SSG+eR+ouJsrNGg2T+1DQ0actl2d0MbVzLn7bw05NxfRLgCbc0/7PXPUGYZM?=
 =?us-ascii?Q?gQhgv3Ki3Xy2qRUweiuUN6kdNLbJqoFy65HWMT9uP9yDVHXnYIGHOF7Ei/XO?=
 =?us-ascii?Q?ncrm3Su3V5LDOHoKR85yoBTIQaRuhZ/lnkXiCAe6q0RM99z12yqONtr5ne+2?=
 =?us-ascii?Q?YgKM7qi4CficRmFpTe0ZWo0Rsx0bf985y/tTsUBEDBdhnBVWoEdfcL6BZZxX?=
 =?us-ascii?Q?0I0juSWl5z2vtgx7k0PW086BXs8otyuao0jhEtIZz0c4xsYIzjRlaEWnLoRI?=
 =?us-ascii?Q?aHsZ0uNOqL1hK1wP04ybdelzdWKznQW/uddL4MDJhZ5hoQOJG8f99uTOxsaf?=
 =?us-ascii?Q?aqCF50jLyKre3rgRzBuDGPL2Wtz0nQHbP7jiSNRkBD605y6TczHegEpcdQWC?=
 =?us-ascii?Q?973MnOXAoPUT5URQVbqHiW5szU1leJV7M5WBvUcr07MDtr5uSLVrxiKm3L6U?=
 =?us-ascii?Q?8zEuO2T9mbXN/Lclw+4ehxos4cXiHLBlw8xdZSmgbH8+X3nweKoZlCYL8tDl?=
 =?us-ascii?Q?XOSqPKopjPb14HubF0yAIyPLAqDkMuXcmgAslozAC1VFM/kEGmr0NoC58xro?=
 =?us-ascii?Q?2cyHnLhrwqzlMWtI4pN7FUvb7w7r6jwTpo7uSjFLW009KyeJezwkpSLsC1MF?=
 =?us-ascii?Q?9ki8xo0uF9d8z+i32bqpbQJuuxLM26TXM2DaqhiSbePRG1jYwDMZVj8n/M/l?=
 =?us-ascii?Q?w6XN3AuXehSMfK8JeqHhaHRJ1XEfIlMcnSsOfvXNqIDIXciuq/7IrK9vb3dT?=
 =?us-ascii?Q?c8BmeglZ/ImPbCXK4TJ40RwKRDFjfdpL8kQSd6MY8G5DQwvII+P0I2nmtp9N?=
 =?us-ascii?Q?lvUDL9XH6Z5DnVWgn7Ds8c2jYGnCnA5lepSLvbzczTIywP8m37QBSWFnJa+H?=
 =?us-ascii?Q?8dZZHShTLkHxHFMIbgQqwVF0yrsPSuZSuoInGMjcI45Jh+vLxdCXjITOnqGP?=
 =?us-ascii?Q?vbTf2JYZzkHUql2vyeZj54Ypelvcz/ZXE3IsId6jxV2iuIehZs+jXO4SU9aa?=
 =?us-ascii?Q?O4jzw0K9SO8Aoh9q4hjFMRA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ba3512f-bc04-4475-d8c5-08dd5605f174
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:36:08.4687
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4AoFKZwGZiBwtQdRMFxxF+JIfTqALeBQie/Yo9dmOW6P7npE8fDvsSvXXzVJEoSNJB8X7PYzuvbVDECMa2SAJZuxYEUZVKGCnFH7s/ZuTG2SHRCaVT/Hr3DoH8UV1jXp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9660

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/wm8991.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wm8991.c b/sound/soc/codecs/wm8991.c
index 3bd9b362051b..c3dd44c1dd0c 100644
--- a/sound/soc/codecs/wm8991.c
+++ b/sound/soc/codecs/wm8991.c
@@ -958,10 +958,10 @@ static int wm8991_set_dai_fmt(struct snd_soc_dai *codec_dai,
 
 	/* set master/slave audio interface */
 	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_CBC_CFC:
 		audio3 &= ~WM8991_AIF_MSTR1;
 		break;
-	case SND_SOC_DAIFMT_CBM_CFM:
+	case SND_SOC_DAIFMT_CBP_CFP:
 		audio3 |= WM8991_AIF_MSTR1;
 		break;
 	default:
-- 
2.43.0

