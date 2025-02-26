Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011063.outbound.protection.outlook.com [52.101.125.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDC8118FC8C
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533661; cv=fail; b=VBc65YdsVxnO5u0w5+gPlQOTnJQaJdqFmw1jxqY+jzNWAySqL++V0oWjqkbiZA2LhZQeXKVsfADC0b4L4ljDVBfkP7mutfK7flj5I/7efX6VQzAeOYzEspKAq/PtZmXUUdo2k6UrVyUjHS/OvFh6HU+Hhf5C+e9gOkv7FvNEMpY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533661; c=relaxed/simple;
	bh=XjcgyfHS1KYG1QI0R5XwN3ZNgs6atKICI30Gh4H2IE8=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=pjuMjKSEUWI6hAaaQHM3BsBsHylTBBhEt1PiDmx413rZsIdr1DYTZP/Lo6pxv3r2me/8WwH2PqY4OqO/226N36QQzTxzmahyXdWuz5YsTtNGIsZdyQa2CWwmGHmYM3P3BooBiMQZ68X31UjvPU8bXjVRyIsPDv5bGuXNNHfd4uY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=nZ1/yUKo; arc=fail smtp.client-ip=52.101.125.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="nZ1/yUKo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JnTXV/oVzNOhyn/jMt/+J2uu4Jj26JH13pinqBTY06C60zBqP+xQ8NvkkeoCi8WgXEteIizMkTWXkRscIaA2vgU/P25Q8i6tj0b8GmRaAjdYsgXCS1VBf5grvPRLEic2XKD2vC4FZ6RDC5aUD/LO4050/QwkWDuGp3SVKQVgpBBjGhgiYbhV2MFQMsi5Lowqd+Uk+Ge/l6xdhvLRj4LNDuvu57o3eYPhEbuxpsGnlvMyv5W6LJ6EvnWmBjS2GbBxpfvxk1XjDl3gF3SAMs18bMNnId8sCwpzQM3GaRSvaXYqdTpbO9Iwkru7Vjd3mtICKq1/m0EH9v6fOY2S7mkBaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bRNmVcCK1oSl0oUcYpgWfWJousAIrV39cFvPQMFEAQU=;
 b=kLBYiCw8TN63x+XIDdKlR35we8rLGhqX2m/RcsJCSUzEovnfiSl2cLukeLYd1rnnHuNk3OgMbrtRkJLseQEq3uScdVbxg8i+ZHPxvWoK7zWy0N4GNqqKbZQ6fkZNHBqMmafvN6K2sP+wSUopktOzK2/tfmFUZ/kIa3+icgMBGl5J9mPwsqVhhznADcJ3bM7F5NT6gdobdCnSwQV0rrcIE9qAUQHIg4uOQKnJclJIYdV0r06DLTcO9q6WQjXYph9kZiuDYxEQ4GRMUTpl3PfED+6ghiDKUDZxGWs6lXk3ANI31samY/pp5c09ZzAaMW2fFgskk3tD54aVTUbGyGYG4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bRNmVcCK1oSl0oUcYpgWfWJousAIrV39cFvPQMFEAQU=;
 b=nZ1/yUKo3IgaURxu35xmL+r3wV5RuHHTWr53xNNM7eu3KD2sH938Ra0w7hu9j7bGjVniam/Wf0foOtObGzaKrZvzgAcH2X1Ujb6VZw4IBujTgv5pGrQb/ZrL2QWCnyoodp+TxpUJpLuZht6FzhX7ClD7paDjOBq/oJTo2UwUc44=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB10414.jpnprd01.prod.outlook.com
 (2603:1096:400:246::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Wed, 26 Feb
 2025 01:34:18 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:34:18 +0000
Message-ID: <87seo1cwva.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 066/157] ASoC: codec: wm5100: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:34:17 +0000
X-ClientProxiedBy: TYCPR01CA0202.jpnprd01.prod.outlook.com
 (2603:1096:405:7a::15) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB10414:EE_
X-MS-Office365-Filtering-Correlation-Id: 1aea8a35-11c7-4772-13ac-08dd5605afb3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Zc91+yITC/JfzGSYpVnS00eMw9Qukz2HLJAl1s+OyFwjRP4BaZrHjmaQVHVG?=
 =?us-ascii?Q?TJYn7hxE329Y3+nEhrn/4k0x+hZgg03pWPeTIuKzfql6ZIx68D6ctEVOwS5K?=
 =?us-ascii?Q?27kEnJARb6MAUdMFlhlwcVKN44IbZ4WnjWTBsYgFfQrT7rrRF95thO1Yg41G?=
 =?us-ascii?Q?cXDwnR2T+kBgdrkUWXFp6HIcnKb/I87TYChO2J6W8WN1WkZAcurQSAhVARFd?=
 =?us-ascii?Q?0f6MMdAjBuK5SYxKKZS0yr0coQgLu4D7d8QMVZor1K/xflYWD/XhH5Wd+R7W?=
 =?us-ascii?Q?IXVaYpgezMLLz6OKXC/BIEQkFFKyq/L2cqvdmo6EpHBanbLSG7Xx0KbABIN+?=
 =?us-ascii?Q?1GrzWDHzYuyGbCezeH2sa5EW9F0+PkJi7MAqxZ3EQrNPRwe4OkUAQZCNlUFQ?=
 =?us-ascii?Q?GrSjVl9fYxs/7QVnuapYxQjuiUTL0H0wH/G4Ie/MP5W1ClXCklce+6MQLJRm?=
 =?us-ascii?Q?sEsPApxgLJPIv03jASJaU3JbIkTkhi3M6rq/gd5oYklRHSRit05C51Q0G5Hp?=
 =?us-ascii?Q?HU43limFQ85u8CMh2pj+Y1NKILJb0v+nlpmAIcm9umzuiqVO2VAD2bmtpUYM?=
 =?us-ascii?Q?86tfcNc9wkjO6BwwOcrwHg+8gLCSYkIhLUdm9l3SVOg2M9EX6m4IeekPq0oz?=
 =?us-ascii?Q?UJWsxWSEyhsmj/rjL1o3bi5J905ZhbJnVbB6S16y8S7vdv6TwJw2aIM9l+WB?=
 =?us-ascii?Q?fiswYVYPdDeOSk2sPcuMgx3W++Dyau7S1T5oMfumB9YXgU3vDv2tJCOsvS49?=
 =?us-ascii?Q?pxafoHAxHmp3VOqBt+N2YiBMCac4KlrcjnGUNCRTUZJhxFal7IwfP8kNVIFG?=
 =?us-ascii?Q?UCFXaIBG7gPgA2/wIl3t425iNji9l8XHHNd/BDLtJwWZESray8vEYvRc/OgB?=
 =?us-ascii?Q?MshjDPb8+mn88JQk+CadxKyYVOGPZy7TA4rVIOaGeaNEwrst81kadNp387OG?=
 =?us-ascii?Q?eiktkq021FWJmoSJCOmP5WZ+KLNU+lmWr6YwShBtkUIR50TBfqrDzPBYXDqs?=
 =?us-ascii?Q?0GUdaiYCmEbTMFiAa9vSGr7B08vSYUxDpmnKevm1AvNjtnqoTuwP2Ve18T4j?=
 =?us-ascii?Q?AvECQkSyYkB8nwGD1ID4Zpoupa3or8eypv1GMF+XK2N03jYmSU6o+ZodRfjH?=
 =?us-ascii?Q?06LJwc3uXH5njf6Hd5tdCBVH3Ev5Yd4BIQg+yu51xEkWCpEeBnk/NdNkQkNQ?=
 =?us-ascii?Q?SG3IVyyZEH0dBixZ/0oxlvx0s2Keuvd7c1VR8DRT6SCcmM0RLJx/ETTOw6tH?=
 =?us-ascii?Q?ct2UClHEg2QH+VabixJI8uCN4epnJp6IDF9Y+J3m446yRyakLobDH14YdvH4?=
 =?us-ascii?Q?7ffHnsFJ+Jouusyan7Fml7Wg2IPrcgBD9+JWl+t7XUFWPErvoRUiA2R82YyB?=
 =?us-ascii?Q?PX4XglX6d4L4ouabUOrMWOJ+gnrnvaeTWRpI8ziO9waHu/tEpInsTHVa0u//?=
 =?us-ascii?Q?RM14bvOXvmVVE1Bq/Df7GIvN9AB6dYTW?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zOyd0xl43eDpZfnN8zTH436qG2TPYLfxF8XXSEeSILnoNECz9wgm5v7zgE09?=
 =?us-ascii?Q?X3zXzSVxK2hzFdOQKAhzrF8xeEW2S1jin6cHYIVVf1xuVS1nXxjxyjjrqBcL?=
 =?us-ascii?Q?9UKyulfGlXUw1vULZT6bCP7nxXj2/pFuv+AbdEWWDAY0IRUXUru/HleRf81N?=
 =?us-ascii?Q?qU1vadnImic2UF15Fuy3/dJX/kCVQQRvAh4DjGP5a9TdIzTwVZ3n1fxk4TwV?=
 =?us-ascii?Q?BIW7xe0WqamNI/RLUXgG4xAFJNPMFW1sMJ4wZgTcKYj5sAv1cWTMhnZXZOdG?=
 =?us-ascii?Q?5y+0/MdBwW5Rq3AP3y2Ho6ngn87Yqbr94Sg4PaVaLlZLGA5TOQE9U2mIhDwN?=
 =?us-ascii?Q?rxU84GLJxt4mMFmhGWMXr9/qdH132eix/yHfIZsEqmWZ/fDsEgWeny19dkon?=
 =?us-ascii?Q?wipyKIojWGPHHR4i4/ly+Lca4KF8r3+H8Z53cUrfvw93LRoMPO2KfflTsPlA?=
 =?us-ascii?Q?c/rDHOMU1oDMiu1PFxwW/nnL6rU6C5N9V8bsUE07ZTrXP2yn8SigXgAReDH9?=
 =?us-ascii?Q?7P1XHnT0kBykJN2sbt9lzDI7selqsg74XXV8COidUgHztOVYa64au80/ONAp?=
 =?us-ascii?Q?lIS0NkRQ2Xad5+WrpmKCCeapOMtmuza+Ww0stgbl+HsiiKYW0EkRxJ5cTC2L?=
 =?us-ascii?Q?4OuFSnwY94Ys39yTBBSegD9pTchoRYBgp12F67tgv3PCNvpLLPkx9h8cHHAg?=
 =?us-ascii?Q?CQscmGjm5P4v5ULhR6Ey1puCtmdfFftcPGYxBNaKxhYYJlwJ691YtZIovVxk?=
 =?us-ascii?Q?b553V4i6GoYkZ6GNVrNcbSiN6dlNJkLARwb2zw14+Ekx+jMkfkkYsjAEO+WJ?=
 =?us-ascii?Q?UuZnL4Il+WnhIIqw6bAiWPbfIjCADPu3XMRWMn2jouLbmtpsWnItvdu1cJ0g?=
 =?us-ascii?Q?JV6LPY8mM4a6hcHeRMxlfMdNwEZ7Xl8qJisLHPac4qaeVF53+6uMEwq0cTMD?=
 =?us-ascii?Q?TazlyjXCPn/kqdZtMLbCdQGfbxY5ToqoJ+4ZVnPlMEw1xBRkNcGbFdNMe0Xj?=
 =?us-ascii?Q?6RVkHUFlQ8QP93omHJc7dS0DrFezoRNJAJhACQTDMhn0oFJwKTmdt5sowVxq?=
 =?us-ascii?Q?U/CpkiC3TAFbNJf1Dj4qiJ4VOBkpJhOkWmRkd22TtrXLeQuuNuNDfV/v9MFU?=
 =?us-ascii?Q?eA/SmvteGd3kszof0PalTazUo6QYRAX1DSdtQMQD2pzAIkMs/5mLyMVrvHrh?=
 =?us-ascii?Q?k0u3RYDnbJ/qyV2lf5yIC25PkM5vACGr+rM4ZNJhPWXL7z/7v18I2E+AnQpP?=
 =?us-ascii?Q?edEjWZLpUJ6eUA4wen4Y28ivO/h3U9OR9qIA0QEVb+qd/7Dbum4QTkEhUjFB?=
 =?us-ascii?Q?2MR6oD2qoSQuSiRYiCEu58QrB7BwnGMqGQBheoxsUDEFHtSf9rK4CtoOSlfp?=
 =?us-ascii?Q?zYXEQqATSDaofr1jgYktOIWrNOpEieTxSE+sQaTOxlx7TsN/fCmPXfRuoeXg?=
 =?us-ascii?Q?6//ZguzGX7/NapQwDAhkkTm1brQqoXaa0WCVgTkjq3IoxFq20WVMiZ45jZIj?=
 =?us-ascii?Q?+DRyHJT7oD9MxlCtu+jkP+kNJbYar07Ac3l11Gr7NBWmgNb1Y+3OFzK5Gm28?=
 =?us-ascii?Q?cootBQtXhogrJu1bp9bPYS0JGWfaWeQ7kU/6DP2ssPIGydDUgg2JnMu/xtCZ?=
 =?us-ascii?Q?gTVIPhfgS68OsC9VdlvvSqg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1aea8a35-11c7-4772-13ac-08dd5605afb3
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:34:18.0429
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JTkPAqOuiDJiIV55f5j4IpFOa9f8xnmzEwur8RxwXrL3tRTFAh7KSOwI+r3XxDSv1c8EG19BX8wRF4aWfoVMipiq65fXB9UaMIYIyIYVIoVevaAC8NQF9eny+yd0lfi/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10414

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/wm5100.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/wm5100.c b/sound/soc/codecs/wm5100.c
index 11bbc94a282c..dfeec55159a6 100644
--- a/sound/soc/codecs/wm5100.c
+++ b/sound/soc/codecs/wm5100.c
@@ -1303,15 +1303,15 @@ static int wm5100_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	}
 
 	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_CBC_CFC:
 		break;
-	case SND_SOC_DAIFMT_CBS_CFM:
+	case SND_SOC_DAIFMT_CBC_CFP:
 		lrclk |= WM5100_AIF1TX_LRCLK_MSTR;
 		break;
-	case SND_SOC_DAIFMT_CBM_CFS:
+	case SND_SOC_DAIFMT_CBP_CFC:
 		bclk |= WM5100_AIF1_BCLK_MSTR;
 		break;
-	case SND_SOC_DAIFMT_CBM_CFM:
+	case SND_SOC_DAIFMT_CBP_CFP:
 		lrclk |= WM5100_AIF1TX_LRCLK_MSTR;
 		bclk |= WM5100_AIF1_BCLK_MSTR;
 		break;
-- 
2.43.0

