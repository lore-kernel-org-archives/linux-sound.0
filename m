Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011064.outbound.protection.outlook.com [40.107.74.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A3CB190055
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533609; cv=fail; b=iZwEryss2QExckK1MIuZCWjOZt/P2P6yD84D0ZL0gEnh/N9uyEmB12osLoXro0LS3G8e88PaIAhHZ/SZuLtmmWbnoWHVE4zz2XbtsdSnysxEgKNhUaBL0XQA0AzS0NBZJp3+MUliumev0TdBeUYI/Uo0lCKmdNdLrrRaELACvHk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533609; c=relaxed/simple;
	bh=zmFR+EVnoGtnqJN4fXojOU3vVo+m5bjxu3pSShN50kQ=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=swMsBy8vOvS32l1aZy7Aykrofm0QXtG2gIVsxDZOnGaYdweaM7qM6fu28gv8pnuPHZqpO63gaoPxCr3pOYVsQWxhYqtG2zg80fN5X/vou8wzmkmBmMjvYdYdnl/JVlfgFIRNgtNnxU+rJV2DMbU+SXhO3c67iw4JzpT8ls5FzFs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=AsjoW4v3; arc=fail smtp.client-ip=40.107.74.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="AsjoW4v3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FbpMXcHwyyU2gMVleshbOc4/po+G0w+F1iPe7//7rPGSSzvltw8/x0UHhjNkjeqs15220Xw51q3uqXQFRk1dSKhhG2U0Uyh9V9ogyJ2ubqUfZ2F1nve0+6S11b/j4VkytHcpp90I118e8xjboi7iMahYBQm5havHSvmpXorQfOAzqbhSxzD3cLRPsvhvBFnI+SCsTVxR83Ws+WrhHfe0XnZ5ctZQSbGkOgvDJyQCgg+W4SnREGoX30n7921zxGeDwhdCqzjCHpuHCpvyrqvCQCUeA82ARlA/PSQ6m5Xl0Sd/xtfqxDCUVGKYFFsA+TrNIPbBXw7jomkKCAdd+WOhUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TogaSoy9KzgLQWCKYAeToFzF2z9kcHjOCoLzDXmHITc=;
 b=XL//IrdiMIIvzDarJg0uOy1+j1fIEIc9KQoZsoeo0wk+tZu5zMeIHCGeR/FAG2l9ONcX6aewzI2FmRCPKLAEfOw9n9N14jmqAIg0Q9M89dxY+jEejGzHXnd6OsRxO6dczp3A5+xrQTRWtT5XTJnpNVJvnC8WphgYDOwfIJjRSljMqr8k9KwpLK32B8EuBSFjIOsd4RVZK2XL/ZYusORNzp5f1uk6Nu3KYj0m9VsmdPCK8grVuKzH64R9hd0ecfFlznplotU1a/UBjLG69t+WZ1/T03pQT4LndR99DREjF5a4tF6FT2XmcC0UOy75n1glT0KmgubFwFhkf1X9lpeRNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TogaSoy9KzgLQWCKYAeToFzF2z9kcHjOCoLzDXmHITc=;
 b=AsjoW4v3GIhVonybG2phNXTISCVBbYPT6jzzKjjaa441mv0iYHUNP8oPcq8kpx+Pi9s7nZDLx3cgRLGANtgLJvtWygOZSl0KaON0vSOwbQMd8l7oGi0KFgH5O095WTGgLBQFC41lA/obrMw3J+lRO1H51UJSUqwxx0y3RsR1m40=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB8745.jpnprd01.prod.outlook.com
 (2603:1096:604:151::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.23; Wed, 26 Feb
 2025 01:33:27 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:33:27 +0000
Message-ID: <87cyf5ebh5.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 052/157] ASoC: codec: rt5631: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:33:26 +0000
X-ClientProxiedBy: TYCP286CA0317.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3b7::7) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB8745:EE_
X-MS-Office365-Filtering-Correlation-Id: bee8343d-c7dc-4d6c-c8ad-08dd56059133
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jZL83ZbrC89lhlCbuVoayqWwRSNJHw3ib9xJv8wirjaf1xRW2Jy8+L6LvTIR?=
 =?us-ascii?Q?wVsJKyEbJkGro/HdXGO6+eBn8OOXaKuB5KD7SKEqqXtJg0l9imLvE5Wi3EIs?=
 =?us-ascii?Q?p/T6Y7PnxGY84/XtMPu/RkiqiarzMiZzNQZw6tyfQRkchQL1TZcCQ5KCJKN+?=
 =?us-ascii?Q?6FKTeKfWjuk7Ljn1BA+n3OPf1sTHn2kkZzOv5wsyLKV6D5ANw67e/q4DL5Hw?=
 =?us-ascii?Q?KYyHb4YCG0LyjAjsvCHXeo8XUgw1riehaYvtprW7qiMUEVgm3zI5YJUpj9NZ?=
 =?us-ascii?Q?Y69dCQ35IG4Ykx19jWFplafFHxIBn2kDrpZSkYRGGDDeqS2umOYs8BkG1ozF?=
 =?us-ascii?Q?+aFzpsiMqNpY1keja5SNxYf6So8YBiKekdP3lUeySqVJr4x3oxk8AR6Geyco?=
 =?us-ascii?Q?y8GOXJ8kRonu3kmMY40ZJL2lD5eeM7FKukjCLzXou0ZyZuwXYDmuojsCL/qn?=
 =?us-ascii?Q?dS0uxB3pBSysb7gzxageQ56PtAIYGGPjElvUrVAhC2sfab3zUVdtLi7BrZ1f?=
 =?us-ascii?Q?y1UTMkJ8ycyweNTWca9A+A7lHAobIasGbEr0rhakY8IIJX/kq7xhFBXb23sv?=
 =?us-ascii?Q?zjTvYzGXX6sHy//djCEb3P/Tkr0suLp2pj8l1wS2QfrnObs+rTohY0QhSghX?=
 =?us-ascii?Q?mYymV9HWL2SY90PCy1rfq34yZtzZic0QTRdtnbL96BmDE9XBi7Ca1mQFq4MM?=
 =?us-ascii?Q?0a9PWZqYBRrFkD/JrN3gS69pAOMgCY1kVaFl+lWChVM0oasGZb/NgPLHec2n?=
 =?us-ascii?Q?TDbawcNwSbvNeI3IUw05kOguhKFKVVBswjAUGyRWe6XawFcfwwGp8d+uEq1k?=
 =?us-ascii?Q?FswRjLApeBOXVZHUjx7pYBBFGfroCSVS+AAFEDbqqKVtrn4bM8N5hkS/BAbd?=
 =?us-ascii?Q?w/GNobBceczpOkTgK8B+U6MBRbIHZe1Km8cgYZBAkeWN3L3XtAlxfqn7mEbf?=
 =?us-ascii?Q?Ill0Kbrhp5yPBjYt3pVlZVo3xkuuzjdtAZJxDq2wYbeRKdwlmqY8iGmRr751?=
 =?us-ascii?Q?GFbRcxfJtinAhp+CucKeY4ymnEHVwmqGbvg/YvKEgbRjoLJwC4LCVJcZj/ua?=
 =?us-ascii?Q?zw2BSHFNxAMjidHQOpm1oCQ3tsFV5FzZ1FogoXa/qhKEmg7QfNKcyuhbtPYY?=
 =?us-ascii?Q?aW2Aw0qBrJ6k0IThR+HKNVHrsLuFYssd63DtjYNKTYN58znLQX9Er/9dm7Su?=
 =?us-ascii?Q?SqrcldO+a925gxnPjt+CItAIwNSDEX9TEh0td3kEpkS5Dpe2sLVoe9EptCf7?=
 =?us-ascii?Q?1wdvGHN+JERY2DrUj2VAIVS0yQIYgyXDB1tRrTzoOJGkkln5vi2D3fOsza97?=
 =?us-ascii?Q?agJ0BfB3grk8L74cA0h415a6cvEFyMoMxr7jXWHQ+RrMahhZb7tUvGrPWVPy?=
 =?us-ascii?Q?V8UJdahfgTyZZVNnOc+zDAZswxY8N4vSWt0aJx/jKz58ZjFoi/6gvRiFZ7XW?=
 =?us-ascii?Q?q+/p9NxOTN+Vu18TEAx7WoUAVXeWhh9M?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?z/wdvwj52xr1lO6z1A7bXPYSe0/7jgm8kuW20XX0gpVDLuU+j5YSl/6RgN7b?=
 =?us-ascii?Q?dNydmngLmcWqj0Sm7vikOxFBRQ5FvX8NphSYM5Rf2Hil/rAoSlbvwPKU3RAQ?=
 =?us-ascii?Q?zr9OWxcgbmepZJjQPns8EwMgNfEeLxMQx3Kyw4OSh0xjn28HBHO0kXU0kY8k?=
 =?us-ascii?Q?caEW/lyUgqlS7VuStZMnDdrIxwpn5q4wzttJivzwTk4P21ewZCzYIEYvHGpN?=
 =?us-ascii?Q?t3KtkrVCVP1y1gE6wcrp84r5TkV9FYMCQEzss3ThZhuQLBOUhPQ2cGYUoQzz?=
 =?us-ascii?Q?9K34HRDwNcwNfyUzvsnj2WbsxQ3TpddpU9TG9lcQ9aKbZw9fAdV4Vqnd9sxC?=
 =?us-ascii?Q?IqzBCAlvBHNWVgAILBFfjR7gMIBscPRQQucrioUfXmh1/aFsCX1UhVBAx7yD?=
 =?us-ascii?Q?S0Q+uEfgknEsxiosKUAxrc5+NEir9XbC1S2wqmysKa9xjfp7RGol4CdT7ilJ?=
 =?us-ascii?Q?oJl4j/81SbHe8dUXKO/IgyFgVTcBzLtuCoN1RBy3Gl50cJ5v0bPGM//sEufR?=
 =?us-ascii?Q?NO5L+VH/4VQQoQb0H+BKIw6qu7PEuMz503vnDIMH9D2HQu/neKAttZKBn2Tb?=
 =?us-ascii?Q?mGTjO0ZM/CeAh4o7jQIJkPZOFnXpXxqLAVVW+L6wH4ACoOwVOG9rOrRFp8dW?=
 =?us-ascii?Q?ijdZogaajQkDuS9KiNkQxJg9vJa26MEZkUFWx5HJdsC85gesJ4TiRm2wTn9A?=
 =?us-ascii?Q?kz1oLix6YtGpG+1qgxroFL0c4xSs1b1aIJsSOZxAqpEJn94hyTEGZxrx+ink?=
 =?us-ascii?Q?pZr4a+UZIgxoCPLTeQxSCkZs4WYOv2cZel1lQZ7lgdwJCW/UodebSC1go4ug?=
 =?us-ascii?Q?+mT01tp+oNuVaPAQq2sRPwqD7GAo6ZLpJOaVvV6iO4B5EIYdJMttrBoZHICz?=
 =?us-ascii?Q?xNAN1JWWPRXmqWsLfJebBF/xvl/KyOTAB/OgWKDeP9cRrKmcEbP9rfMg4UjP?=
 =?us-ascii?Q?CavENsAsidCVP2/b6eeEZJUtFPBoWqFWoT3v4EUOZzCUJImAsovS1k27ArnL?=
 =?us-ascii?Q?KhGKfQI+2/kbHhC2qS6HN2BbJZeLftWcJQmynkPH1FGP9pPU+TaFHawEv6JW?=
 =?us-ascii?Q?I5GMGOFbrWrjFO0SRAgizbPhrff7t/bcVolgm631BOYUfi6xWRAF4ZycrxCz?=
 =?us-ascii?Q?Y3yxysVWOpn/B2fsJ1FL+GWsnWJrK/UWSCBl9VAXUzq7GnBWa4nf5B1Up8rU?=
 =?us-ascii?Q?q0vpqbDQ2hDDWOWTZuKyTmkGoFqu9OqT2bJ++0D97fRIowZRtFVhSGH+x1QS?=
 =?us-ascii?Q?kMfte7Xv00gSRFG0/qTx766a/2X4yW+nUrAo0dcl8J6D1GWNmTi3Ht9ET5w+?=
 =?us-ascii?Q?F5cDbe+ySHD6oLZie9la4Nm/nkZUgADoUR7EYaWW/gWUNfRr0AA+tTdgsBf4?=
 =?us-ascii?Q?Mrk6jKYOCNSWqTeXMG3+vY3Tim6XCi9n5lnin23L7N4WBgiSPYudyWKD01Ma?=
 =?us-ascii?Q?cEIsoYIU7dj32q9ypB6l2bbWkbSpK8n5uKETfIegUCUGaJxgNi5yy4szFtNm?=
 =?us-ascii?Q?8lHBnftAP1ultZ/QIfqgon2yzXbFWjbUuxYR/InW5wsJrtjGw4ydlpphjy5M?=
 =?us-ascii?Q?tDZeZuhVL1HOVTTmyoiis1y4XCXI1t14mK68GBxMmwV+jZ+cARheHr+2MDuP?=
 =?us-ascii?Q?81+2o+isqwuYG0v6KuxYkmc=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bee8343d-c7dc-4d6c-c8ad-08dd56059133
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:33:26.9780
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 42XqZziSZLngs9LWcCBJffm1pflC2NAaJzdGlIVBkRlQZxIQSZp/rBO5AWZm8GyF3aqh+O2UhtGTkyt/5goDqFJaA3t2i0Wes496toZJVhM0eDgjHF5f3AYbbNbqcKSK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8745

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/rt5631.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rt5631.c b/sound/soc/codecs/rt5631.c
index 12df0c4f2097..d523477c5102 100644
--- a/sound/soc/codecs/rt5631.c
+++ b/sound/soc/codecs/rt5631.c
@@ -1411,10 +1411,10 @@ static int rt5631_hifi_codec_set_dai_fmt(struct snd_soc_dai *codec_dai,
 	dev_dbg(component->dev, "enter %s\n", __func__);
 
 	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM:
+	case SND_SOC_DAIFMT_CBP_CFP:
 		rt5631->master = 1;
 		break;
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_CBC_CFC:
 		iface |= RT5631_SDP_MODE_SEL_SLAVE;
 		rt5631->master = 0;
 		break;
-- 
2.43.0

