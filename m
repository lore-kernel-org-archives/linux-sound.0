Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010000.outbound.protection.outlook.com [52.101.228.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 507F919ABCE
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533902; cv=fail; b=lDEPOcZeMkkgX9uIuXPPgIqfy3nd1c+EbdyQkw7/GWU11CLCPAunJGVALL9lJ1/zzhuAzdwk7JHQMl84G35lMr919AxdaV/xSZAyQ560kgG6WSVjf7MJip13P7UzF6/oXrrA5q1MHy+lxXKBQLdCAePaP5wWYEOlY6TsrPaPk5o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533902; c=relaxed/simple;
	bh=T8/ZaeaITwQPJn7N1KpcuhDqvUUNhxMvq0dlloQaxxE=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=VQ4a1hTp9+gKc8noJlNbogQoQJxbizMgli55FZGtW42Tbbas8jfgr++54iNgQomFDZyNvl7zTJV6JCWif+/YLP7SGkZRDxs96Xa666QaZU8oM5tYbC5DQQM6c+/PCI0eezhICX43JtEhcH4lDo/24B36lyhYTalDr4i1HJDzXyk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=oo6rD2me; arc=fail smtp.client-ip=52.101.228.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="oo6rD2me"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vb/BMB0cUhYd6oFsR9Zv7PxbNIZfDUwqhDbsz5Bo04N2BAuLJwD9Oq764Wf7YiQiNPpY0Z7PA1zQrzTrGiGwV2CWu55YBd5eWcw/Z6Hd45DauXwJMJ7cdxBZXfp2bd+2PeIQ0/iJiixQEatTpvooSECBKBWxArMIJRWpQL5nZA9NI7oWaOCGkVWh6UoEU+eTB+I0vcalIiXA3EEs2NkCpNUfEnuE4/UPdoBXOXh2kpCo7HCbblOX5Wz35BLWppYcrQCw9CfFCTMuyMRA2kbywJGG12CwtzUbY+XwqbeLhj/vd5TK7QWewQY945qlv3LVwfn7TUXwlgbkP155xmEBPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8IP8Zl2H7GgZ2BaDeicU6XHUU7xh7ZuQxG6v9PhaWBA=;
 b=HzifZRgmmgBSqDET5hPzInTLcJIlv8y8mVZbGPPZnHdOCKRjNUnABwhphobXTD21c09rGnnElgfA28pPve1Q0jzJPvMT44ROBfRMZQVPTBoaAVJssNBskpuDTrtehljta80I0WCQUZiXcYLZk972sfRUXGmpJRrVW81VPRkT/CghjBb31b4+NB0u31gRSJ5/dxjxK2MrRN18IhfUt3lmvpNniIrDeYAGaqu5z1LNR/9jug57k+Hw9xB9uspLlbmVsMfSu2lwnHebIOsWyj02nMTqu/kDd+ssFekhXedUEGFHtZLN30224/HVHhSfkTjz4xTmjx5nQElJbUPU0ZH0uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8IP8Zl2H7GgZ2BaDeicU6XHUU7xh7ZuQxG6v9PhaWBA=;
 b=oo6rD2megbz7xjJKbUAF1NlMyu+9HCTAWI3XBaEiShToaWGTinpFUTIb62xGCk2P+f7t4L9huMXCkrQX+JDwwDFuq0dhrS+Kls4+EVBUTEPT//joe7Y6RLlpJ6hwyMLeva3HWysCaP1HzwRfWRGltVqJ6cMVsMrK8YrMLbClIeo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB8864.jpnprd01.prod.outlook.com
 (2603:1096:604:15d::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Wed, 26 Feb
 2025 01:38:18 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:38:18 +0000
Message-ID: <875xkxa3jq.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 132/157] ASoC: samsung: littlemill: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:38:18 +0000
X-ClientProxiedBy: TYCP286CA0225.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c5::13) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB8864:EE_
X-MS-Office365-Filtering-Correlation-Id: 2cde6d7b-0dc4-46e4-5be1-08dd56063ee4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?T+tyOcU1yvmbLdiVtTVtGEngYKBngtBg1UFIOkPEC0MWbSv43dxdtBFE5+J6?=
 =?us-ascii?Q?3PGEg5PYLYjrw3PdBIOTzNAhP6BgC6RZO4lvOsL5FbXC9c6snczvQyyoLZDR?=
 =?us-ascii?Q?9McvaKWjnffPnXm8+2DQQO2H2Np9xeWQD+CvXOQoi2beu48r+MFob0UtlgfD?=
 =?us-ascii?Q?9tENGD8P1PpGTkWwR6n+2gsZaLfOU15rdDjZP7L8MbjqG9tKAFfyAAJRBEP0?=
 =?us-ascii?Q?OO7AT0dRGnOgX526w8rY36X3DrEnoPnuHpS1h/G+Gd5I8CmIL3/4jocDlLpO?=
 =?us-ascii?Q?NoKt/w8YCwiMzIzICC0PoaHKO98DdiQ5OfXtf0CNVvtLw8//RduyniZdUzmh?=
 =?us-ascii?Q?nW5r6HlIn3AAovYSjFYO1MSQam8siFrXzJ4m1tOMC0L5WP83AEGjlC2ChYnD?=
 =?us-ascii?Q?SfSMOf+Pc3jxF2S3KIYpzjGYjRQ8hKefULAM79hBPVC8uIDHchkJBmubi1As?=
 =?us-ascii?Q?p5jucbFkD8n7WwZUwNUWC+d9tabWuRLyJByStQ2AlcBCPDKrHE1L+Fq3X1n0?=
 =?us-ascii?Q?Wz2RZwkiXyhQIo4MUWZ5UgIn/tiFPQ+WLSccUL8IeWMP+pv2VKVNVwKjnu63?=
 =?us-ascii?Q?ZdOeGWerjRUSfTzOHdRYuwmQCDA9bz7Z8gfO5nFsgGOLhzlofiMu8iM3bmlK?=
 =?us-ascii?Q?k6OvpzOeLjM9EK0nqd50bfTlUjOh+ACjCiNJEseo3Nb2J5u+dT7qHWi6YBmD?=
 =?us-ascii?Q?iaWHjySp0tDAuDSwLgZaeS0CCIUIWKju/0fhRCBT8zLkKuH6DHJ23Eli+J6S?=
 =?us-ascii?Q?+YObDBoB8DtdseKBqwZoHi1pH8hOgvD5xxkCnMPfACn8nz4xignZxxx1n52K?=
 =?us-ascii?Q?fPcrdhVnUazeFGdZnO9p6LRRw3rzD1Uq6qLLpHdMMPQL/aAE9iGbCDnm5/nC?=
 =?us-ascii?Q?uWWxtqIJV+pm6BbbGWsP6AzNyRDYMxHG0+9uMDaO0MM202WRQuUXe1v/UH+2?=
 =?us-ascii?Q?c1L0lWvI9CAxGTWytvicCphzedlMgbPFdPrnnUsnlI7KNvrno+loaii8fOQL?=
 =?us-ascii?Q?cjXXxgRKOQPZOZo3+xD0araItGk4OHrH8Jw852YxcKiZaSAwtmGIxsHlp1Pw?=
 =?us-ascii?Q?sQcl+qeo6HjBWVh9uVoTNEYZunW3tXM60PzYEzsn5qZBRoZ43OjmxvCWXTzz?=
 =?us-ascii?Q?e3+fM1UaVUOBabBC5aKgH1ikSM3qGSehJ9O8jNnytktslhfiJNEDVP8QrQUX?=
 =?us-ascii?Q?2RM0st9BYUw6KXy6qAfgvZ/kmBR4cFE102tFATL3IJK4CvkQSiRCAD/8jVSm?=
 =?us-ascii?Q?2HtBtn5dTGlcj+H+s3XrmvRW838PNgRRifj9Z5J8X7iAEVyYyo2vZlDYTk3t?=
 =?us-ascii?Q?qECSl/XNrU1oGHog35F9JqDOYVsZGuFFaIa9SKzy5jiq937wXwlzlt7yNrSg?=
 =?us-ascii?Q?jezCMqJHshVVNjFPIF7yCED/RrcGr3kK10VKGLYteXggSIg4xdJcpDee1ZL5?=
 =?us-ascii?Q?o/4X3q5d6+yhyLtNMjXWIEdeGT+OdzOW?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UBqOJyDi9xDIDDWvvix+y9Xf4c1UuszoPlgAJ3drPWDdQd1Ah+QGEEKobKLh?=
 =?us-ascii?Q?Zn+neGGl0pZUuoWx4ukKePEccuu2D7FyUXPibMI2dyYwRLLh/OQfcdvMNQU8?=
 =?us-ascii?Q?emaoiUQS/J9W+lEkb9ZohuOF/84NGrNcdz+/+LSxhWrOWaGOaPjCkNyLgbbP?=
 =?us-ascii?Q?ve3DFYSGSKuQm8ou9D2bswT9i7Ub6uOpfmcUAMiNCEcCGvauBxYjLpd7TfD9?=
 =?us-ascii?Q?6kNCX2WAg08u5CjUMqdl0aRTtYqW5DH3tUhZpmlntk6WLiR2DHsJpcXMrAdJ?=
 =?us-ascii?Q?C+PSJLB6sfA47J9ibNdQdt41o3hMSBttKJBHY2HfTrqpPzCS5LQhHiNPv4W6?=
 =?us-ascii?Q?uxDXZqS/0bKNb1LFCDNW+NfKuzaOj5PCJ/8tR66bFnqqfkvf7UOPfDFKiGSh?=
 =?us-ascii?Q?1k0urKV0fQuxGoDOZoIMjtCAQ4Ny03NhCmW+TfbnFbpOkttiakZVcPRUliXy?=
 =?us-ascii?Q?77YsU9cwpF06ZZVlH2RjyrqPg0W+lHXVkT5hhMxUOl9V+8MRCCGbXEp3YIVb?=
 =?us-ascii?Q?9ih+KLEztupiOJ3TsXjsBlfirvYGdoulZXhJdJRwLtdC4h7knK/RY18/9qR0?=
 =?us-ascii?Q?EvQ2ODJKM3/07ozteyEXco81bho6vxRzd3iqxGxmdwmG34q+H/sbnX8cgbRO?=
 =?us-ascii?Q?748OCsIUXfSvx9PIvnFOfk1ROUd43diqzJ7YB9GUHnz28TIqBrO/45Ky8gOQ?=
 =?us-ascii?Q?v4jnAkaR+2sqlkrUXCl0fk1+MMf3ZxwMdsIM9lMfduw8ULU9O9Xdhi4Ms3Xk?=
 =?us-ascii?Q?xG4rCbNcuMLr+EBep3zjV2lcjE22huvo2xltBoukpKNNmQfRLIrNB3iDmL9x?=
 =?us-ascii?Q?THc09v4F6N/4U3PNXpbV6eoNG2vlNvAFalvbLgK0OS8Ab2Maq2VqC93bStwJ?=
 =?us-ascii?Q?9k0v6mi1CIXi3HxePeow4gbHCW1MwtavcU3txR8RhKhg+1o2R1UAsoze7L/3?=
 =?us-ascii?Q?Tde8JO0cQ0R1x0p6QTyq3B1fLJUK9lLi+hkJy0zWIX8/N35b+7CcxGVM1MXS?=
 =?us-ascii?Q?fl9O1WZRP2wgg6s08y/Sjif+RFpM4R048fyuh0nNUakhaIc4oqMA43zNscGv?=
 =?us-ascii?Q?OG9uigFNI46RYycE6FjdHV57sP+RDY+/7HXnPrgHIlutEa6442+O9AabOGs2?=
 =?us-ascii?Q?DogsObVSJAKo61yc5XK97QarivRuVp93SI+cHV4nmZSTxj/YawI77ixkh/SV?=
 =?us-ascii?Q?RwzC7epQWWxkzYWq37z2zbWE7aRD60AAuBvOfhPDzdDHBk7qXUiJTIrmB1mb?=
 =?us-ascii?Q?IGYBoXhzCPZ78NMFzglOr8D/HagI0GJqcExvcI3u6vZ2Fv7WzVcRs212EJaQ?=
 =?us-ascii?Q?XthcbrunoLLeS97JUzttZKCQ1jMmPlZMb4ONW+oViZb1kE0cyEM6n93SEZif?=
 =?us-ascii?Q?9H7uoLKW50i3ys3qmiPvqS61dN8f/I+Lx81S0BbQrdGgnUeWYD35K1ihiyj9?=
 =?us-ascii?Q?hFMD7IV8gPUauPDuoPf6I4YwDqgt+lJ2fYFQCUCPnCULtSPHTFnz5hSwaWFv?=
 =?us-ascii?Q?Tv6WOLwLJODjy53/YNIHeEkZAOoAOtakovpxzIpElSwND17Jm/P0qL2MuzgW?=
 =?us-ascii?Q?of6MiDc+O/hte76FN2vnoU+1SM9zC85E7s11HAWikndPKemc+3PT4E/Igrcv?=
 =?us-ascii?Q?qyKe08lnZ4cGLGfDtByjsG4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cde6d7b-0dc4-46e4-5be1-08dd56063ee4
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:38:18.2566
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GNKFqr//M/Op0b8LSev/5vJqyQB8nRl5W4dV9RYvK+Nq4wNYZtWJxnAYCSRBM5K2kwue/DC8dU7HLvJ6MWXqi4ggDqEK8/6XlL2khXuLtxJJJOg5U29ncx6Nj2aUGXdv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8864

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/samsung/littlemill.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/samsung/littlemill.c b/sound/soc/samsung/littlemill.c
index c5260e101c2a..b32ce027be8e 100644
--- a/sound/soc/samsung/littlemill.c
+++ b/sound/soc/samsung/littlemill.c
@@ -157,7 +157,7 @@ static struct snd_soc_dai_link littlemill_dai[] = {
 		.name = "CPU",
 		.stream_name = "CPU",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
-				| SND_SOC_DAIFMT_CBM_CFM,
+				| SND_SOC_DAIFMT_CBP_CFP,
 		.ops = &littlemill_ops,
 		SND_SOC_DAILINK_REG(cpu),
 	},
@@ -165,7 +165,7 @@ static struct snd_soc_dai_link littlemill_dai[] = {
 		.name = "Baseband",
 		.stream_name = "Baseband",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
-				| SND_SOC_DAIFMT_CBM_CFM,
+				| SND_SOC_DAIFMT_CBP_CFP,
 		.ignore_suspend = 1,
 		.c2c_params = &baseband_params,
 		.num_c2c_params = 1,
-- 
2.43.0

