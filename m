Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011027.outbound.protection.outlook.com [52.101.125.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED9E9219A81
	for <linux-sound@vger.kernel.org>; Wed, 16 Apr 2025 06:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744784845; cv=fail; b=nfsDRHAM/KMoYZ50EHvJeZfC6S8U17gkGY7dSoBJOwxvQB8DMXwScm/Q17mrcpMIQ0rtBpvKqbnoFMF/2p4XWJASiQVlR8eQUn9pX7DJWybnNuORwYaGrGAHxGxY9C2FSetqOQXUhbGKjPgt9sRprOLvxFmk+Wd4/VZlKNw2ro4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744784845; c=relaxed/simple;
	bh=YBq9QiuRueVyrRPR03sMNQS354dArzNQkPMvRetl3qg=;
	h=Message-ID:To:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=mn5mcxNU006e0sbDPrDYFbtIX0AhDUeM83ViAWNSw1ADOR+oIdJ0aOEh8wMjt3m1Tm2R8UugMKNeRrpjL8yWcKOaBmuq2DiMeyCV7SDMkkuyKFUILJu6BGS9L39sN2On4QjvH7qKkdyQ44j7c6HSlvL3X8+Qd6DNZSw6ElPjn3c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=ao4ja9Rn; arc=fail smtp.client-ip=52.101.125.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="ao4ja9Rn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J+Lscu2y0KNIU+3rHWyoeoNUO0X/LOwlaFsrvrUtB7qzNrYSfcAuXkkxLExpWfuZW/oqBfhc229xO7FQtFQy7x2F0SfpptOJ0NFYG1h5+RJtuxhCD7SD/Fp9xRlT7sbK03VoHqDILLo5tCrGJmpKkonBkyaIGIhWU2uwGWMj+aGo4dKRkJNudNRnjXXhjkYDaTqsYIYkp6gpCJ5xtdQnriWHZgiDaF4IoKf/yz3uoeLCvLYtjA0dj3F9Wu1ZiASikNXMsNhaOklZ2yANnh8gKH21sqS0HBCbJmWWw4KA4C1pbl/56jkg2zWIPoxLYjDaXFUXUx+6+DHAVzKxzTkLbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4sH05FaxWqwQ1pTvdTUJplSANdbbwwdqqDMHm72CVlU=;
 b=lp/tHm2om3MvyF4gByFYTaaqkCdnmEO1DUQZGO4VPw7JfqdapkkI5udSykeHWk1i13XdYXCnqtV6+ZWLsb6/GRoLrUhMRmHdnnN2U2bKiw5sPNVAt7+momX4fsaEwB3RimQvIPH3TafC0ybW9ZRVW8DHlgXIydYHGcsRpIya6onijuNbtOpmOHjQvnCb2B4Jdwt+Hrs9Uo51JsOuIL1bn6RSe9Uih4C0rKpRZKjnSKaI77/zZBDEGOW6Dr6khyAOut+AbaiAUy9NAu3bIMVwszoQmjhN6hk9l1qg4UegcWgbduLBTxv5trlQxj20ShifuDg8w4/qS1qtcUV5uAMnOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4sH05FaxWqwQ1pTvdTUJplSANdbbwwdqqDMHm72CVlU=;
 b=ao4ja9Rn+XTLehKK1VUq3RD8C8U4bxTCf6PMNGZVr4ms8ygNsKIfyCxZa0w99zdTLTGWd3LrvIonerPkNLnOUb2zAcZrIW7gzpvcLKaYO6WMRyl7JaudH0UDTdRedCp7nHiUK9EOkNFR/8/gkCEjov/mknqsVKQGStA7J1xKeKQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB12992.jpnprd01.prod.outlook.com
 (2603:1096:405:1dd::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.36; Wed, 16 Apr
 2025 06:27:16 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8632.036; Wed, 16 Apr 2025
 06:27:16 +0000
Message-ID: <87bjsw8vuk.wl-kuninori.morimoto.gx@renesas.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 2/3] ASoC: mediatek: mt8188: use snd_soc_dlc_is_dummy()
In-Reply-To: <87ecxs8vvc.wl-kuninori.morimoto.gx@renesas.com>
References: <87ecxs8vvc.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 16 Apr 2025 06:27:15 +0000
X-ClientProxiedBy: TY2PR0101CA0020.apcprd01.prod.exchangelabs.com
 (2603:1096:404:92::32) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB12992:EE_
X-MS-Office365-Filtering-Correlation-Id: d7eba116-dce8-4c8c-fdd7-08dd7cafbb3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1Ewg6dgiteOigrZlKtlVw50z4q5uCd9ECBY6ovxhGF8nERxOE4qehK2v4pEY?=
 =?us-ascii?Q?ACi78ivDTt1KAA5J7i1fUy6DnruNl4ZmZs4qR2D35k/OtbcKY/0Ik4h05rYp?=
 =?us-ascii?Q?FspFtC17wms/hmg0aletV0Jki7aWimMWhCZb5sBsurXTabsK9TAPLzIdJvzy?=
 =?us-ascii?Q?cBCFnMXVjFp5OMBetNQHhzsa9C0qg41B2My91vjkoVfWn2GX4k2PqY7BqmqX?=
 =?us-ascii?Q?NTDCzP1px5+yWaj3eRqUJ7ry07qzCODp+n9fOgIe9VOtNTrRQx7bIrJk32MZ?=
 =?us-ascii?Q?sqNttZb426SGllk7/mtC1TeAt1mzQXCdrbvp1aPSqKaqAY3CeZrr4N/fMwqe?=
 =?us-ascii?Q?l/UpampeOr58hMH8+B6e3oaIeB4ADR37LGpVhhJgQ/q5PX2zbjpOAtc2cgi7?=
 =?us-ascii?Q?RpklFaX8llJ3Na7yXbQpgajbI9l7fd1EEGX4kcbyegTjWgZY19Q6I1oRVLcB?=
 =?us-ascii?Q?q7dwRDDn263ud/Y4AtXZd/lpi0KfxnPaD8DX0r6msJElFGqa37ToGs7rPlvQ?=
 =?us-ascii?Q?S2gvMOVJlgrUVx7xuxd1rNbqKHC+yLLUBwylnCRTm9EVdEnPmWjuquP8m7Zh?=
 =?us-ascii?Q?AJn4H7wItTc8NmayzZJuZoB0zkwxgNX+PkhxRtglGl2qexU6u0l2CqfvvIje?=
 =?us-ascii?Q?PGba60rAXBePeDN0+2QPK3RKQc4flf+Qf4wWDLJBhgXSUzLOh9Bt70HrYwR6?=
 =?us-ascii?Q?7HVccYaAbHHSIA28i1YlxxYpOwTZlPWZOVIAAZw/AM7n8u84RcAJTN+OVCDQ?=
 =?us-ascii?Q?cmlMbi+nXilvg6Djuf96S2JIrrCObMn+zapdwl6MfNQJxgUUU/YHWO2QBI8x?=
 =?us-ascii?Q?xWHs8VUWoH+Bt4dqC2C8hmKXi+uwt1o32vsDKrY/g8+GLm7+BK/LkmQvS5eL?=
 =?us-ascii?Q?xD2SDnomuT+Qp/69M9d1B6cTv1vHh6NMz/BaKFShrs3AODEXsWid2gA1Jxcv?=
 =?us-ascii?Q?mei6H/sOVjH1HLJB0qVnTqGand2HxPirpO1BDo/GBt4zAqAeUJR/5go5CMO6?=
 =?us-ascii?Q?Wit+lUByi1tiT3meZJFapcBktKyPHwmWaTmPsmfU4Jle/hea1Vtm+x9NBET6?=
 =?us-ascii?Q?xdwW2JMBlZlLl4dio23aNMpfYxhI5+5cjtj7PE6d3KoaBWa3Ol6ZXDyZjGua?=
 =?us-ascii?Q?xeFpRfHx+fAKGqWJi/tVziCdHMJkyo4rjDEi4oJ37fmpvmmbTs0VGPCn2AWV?=
 =?us-ascii?Q?2kgbSATjVUbDm21wu+djKFtuOsE/Ml4zehi+dIAqJOLs3isgkACcOu9lixFe?=
 =?us-ascii?Q?KtTYs14WiStqHo2L2cGiViSTPKJDOhMr2Jxq9YUka6REFXc5Mc67u0S1UZl/?=
 =?us-ascii?Q?O6bGXi+dfuREhxfjgLt8jjQKOcCYKyTVy7CnwFdJV2tvgQbAb5+kttjycCvZ?=
 =?us-ascii?Q?hpxTtp/YbkkU26qaL/ec/35GhnDcHmBU5iRfNl0nWiUXqCIb2HndxhpomvVG?=
 =?us-ascii?Q?vzCt20764GmBKw1ogWPILQpP9VOJFKePQxd1OSwsf3ldp8pJIqIczQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?aHeUsGIF1EHJfctXEPi4p8owFrIxcx4au0WF6NhTHXJXWmCLo8BkjAbh4Cq7?=
 =?us-ascii?Q?3pToPuiCYByYfU1XxCNAWKkoo5tOtJeiuXdCYSJ2AVQb5wDvg/TAISIEQVS9?=
 =?us-ascii?Q?MXStHDkEipepizjYVlWwBdYbr/xcVTkQzi04NlAoelIipbfrixs92X4nst9z?=
 =?us-ascii?Q?DxJGR01MlrjHKfbD3dCp+EFC7/eex8alyYy3peDGth1y5MeH3Q8yzTUd35y1?=
 =?us-ascii?Q?PQrfC9JqbtqbZ2RqNSV3AFoCYbkzzDL4Z58wovlnpi7afqQjtBkNn2KiNEv0?=
 =?us-ascii?Q?2+tzTlXJQ7cMbUwOQNR0GVUfeDMtKmlwZVa9Fv7ovW94mcFAJcsgkGEQuN1K?=
 =?us-ascii?Q?D9rjIXQXz/TzrvypeP9HEDcbmPvGFTem40AzmyqSV8VzR/Zbm7c4QXY0wN8b?=
 =?us-ascii?Q?2cDfiTOX7Sys2Ksy2tPaGlq0imQxkYc3DoEOR5WVV3tfzw99E6qwZMF7d+go?=
 =?us-ascii?Q?1tzZsH6yCRxVLRaqiKcxmsuWopoFmxxl4BTdmMwMSm1qqbkd1VcbUTohKoh8?=
 =?us-ascii?Q?pgbJnLJ1Pegui9mdTBxo91zoziJ2xAgvc7/9iugH/9V3raObXMH5G2Gb51P6?=
 =?us-ascii?Q?rYTZQWB/qbTuj0L7BAmWPecBcKyORcg3hP5u6GMEUwO+CaM1RJ9fQBmzPXBK?=
 =?us-ascii?Q?G0k+QO9rY0vMhtY6/RqsDw2Bzj2BU9UEx/5xfPUmLpOtytwVcZaFFQeLXEMf?=
 =?us-ascii?Q?FLGllAqYiBJrt0H9NLBVWjL9KBPLIWpr/QsROFn46vLNcs2tsEQa9jy4652G?=
 =?us-ascii?Q?3zWN5/STYl6dMVP1FHUzNW70tDzya1RGbhzhQkQs+vxlrwRI7BK1UBrSTfls?=
 =?us-ascii?Q?PWVIoTGG7WVuGeTPLk/n/GSl53A5Xoq5lsuN0sCLUhMpfrnO9g2rKI1ZGIr1?=
 =?us-ascii?Q?ssyLLtR/jY1oiiHwcPdMPx60MD2v+rRuwzEqDfXIz8Stg/BSU91Mg9EB2V0z?=
 =?us-ascii?Q?1hqV2KtGAoT5dGmzCFbExHrVrPLaFJR9V37NoijcXyL19jEcbmUjAFaTPQNm?=
 =?us-ascii?Q?YjAPIu6b2g8L1LyzRmEcvMeAfaISnG8pLhuK34IOSMfRgeQg75pBSnpvdVof?=
 =?us-ascii?Q?QLfdFcLjaepSKpeOFF5b1wkJW+5LhI1QLwKQYgV4YZqdqCNeEFE0FADO47Ul?=
 =?us-ascii?Q?327Cn+SqYSA7ANwo0tgqWpSlCvH8VZkK4tixWqZPVwVWhedrPibrLTv7QCHc?=
 =?us-ascii?Q?UTHBDjuL03a/NfhfCsSiyxZ6jjlhSGvoGOdyXuGaoEeAsLaI5CuV7GdGTHXB?=
 =?us-ascii?Q?R0cJs1m6wziWwmGP8H8Fs9XtU9zWavG9dVUVO5oxHrNiuUxXAIW61L9X9HAa?=
 =?us-ascii?Q?FCKm+90v24Kn5TELtUml11Pej5nyhwh0X9FIIX+xV42Etl/uRbF7Zmt//T71?=
 =?us-ascii?Q?Hgq0dQUb9TCTj6CH3fp3fCVShWlYsSkmMrcZmcvHKn5aqqHULTQJvqQkYbWd?=
 =?us-ascii?Q?R85MZBWb2Fru2q5S0mk61Za68Wk5S2yqAo2aO5LwdKB6Q29CgdxFEMQ351zD?=
 =?us-ascii?Q?3jnXyC6/ra65LjjgrTPgDvksIn98x48gi1dTBmCp0llXTWUPvZDRlZhyofQK?=
 =?us-ascii?Q?dmDdx8nbBnCp968YTlOZXd5We+kz49NCUqr14BbDCpo9fn53EzAUJOfmw6kX?=
 =?us-ascii?Q?uPiKJH/Ci9Js6vM/H+fS6D8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7eba116-dce8-4c8c-fdd7-08dd7cafbb3b
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 06:27:16.1009
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ANfrL6bNGoMchJq4YlPRcokYdJr/a/cF4SD7or1IDachVwziHrycQpw5hC3EV2VtvB+L59BxgxuK5AhArmFm1x/Bp/0k7yag8J8Xe3HJkKgYZXeFtCxAj12GHTBNYOUJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB12992

We can use snd_soc_dlc_is_dummy(). Let's use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/mediatek/mt8188/mt8188-mt6359.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/mediatek/mt8188/mt8188-mt6359.c b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
index 20dc9470ba76..a2a76b6df631 100644
--- a/sound/soc/mediatek/mt8188/mt8188-mt6359.c
+++ b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
@@ -1333,11 +1333,11 @@ static int mt8188_mt6359_soc_card_probe(struct mtk_soc_card_data *soc_card_data,
 	for_each_card_prelinks(card, i, dai_link) {
 		if (strcmp(dai_link->name, "DPTX_BE") == 0) {
 			if (dai_link->num_codecs &&
-			    strcmp(dai_link->codecs->dai_name, "snd-soc-dummy-dai"))
+			    !snd_soc_dlc_is_dummy(dai_link->codecs))
 				dai_link->init = mt8188_dptx_codec_init;
 		} else if (strcmp(dai_link->name, "ETDM3_OUT_BE") == 0) {
 			if (dai_link->num_codecs &&
-			    strcmp(dai_link->codecs->dai_name, "snd-soc-dummy-dai"))
+			    !snd_soc_dlc_is_dummy(dai_link->codecs))
 				dai_link->init = mt8188_hdmi_codec_init;
 		} else if (strcmp(dai_link->name, "DL_SRC_BE") == 0 ||
 			   strcmp(dai_link->name, "UL_SRC_BE") == 0) {
@@ -1387,7 +1387,7 @@ static int mt8188_mt6359_soc_card_probe(struct mtk_soc_card_data *soc_card_data,
 					init_es8326 = true;
 				}
 			} else {
-				if (strcmp(dai_link->codecs->dai_name, "snd-soc-dummy-dai")) {
+				if (!snd_soc_dlc_is_dummy(dai_link->codecs)) {
 					if (!init_dumb) {
 						dai_link->init = mt8188_dumb_amp_init;
 						init_dumb = true;
-- 
2.43.0

