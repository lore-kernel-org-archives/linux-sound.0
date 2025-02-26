Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010009.outbound.protection.outlook.com [52.101.228.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA8C718FC8C
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533650; cv=fail; b=S4W4Kj8L1zKUT5s+sxhB4x1sej419SVG09wiHBpxwxaoM2XYDIrLZiOL8cJpcG+rz75oacnj1EwjSI0ADJIq/ROwiL1Lqt94adPubBZv7EBhn6pq3+F4/JY6PUvHcUMpk44qD86T7DezJtozrCDV3UMM3+trVEgGp/DXZzGBEj8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533650; c=relaxed/simple;
	bh=48ZxtuQyW0tVf4T/a3xGAfuQ+d6fImyLjUPmD2ezDZo=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=WoJTme+7xtnP/4wphWDTib9itP/Bqvmrzm/trRfBsDtOn+vJ8tsC7aU4+HDMH0/UW3/65oy/YAFJ/eFvlfz6Azz9ImNdIF/w/IKnGYMkjV7gG+JI4MFyN41EMUpPJ3y9D5DOi7SmkMWEBCHKOSpcA3wcetdGBJyCv0ltKvcq5u0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=ggofVqqu; arc=fail smtp.client-ip=52.101.228.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="ggofVqqu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VtnBKr4UfpbIuicB0kCoMDwG9OlCJCIpyfL0AuZYDURVD9TCMhrliGSaP16eAB5QzuGqDizGpPmCGLmZ8HfLaYuY0qjxz/vpl3SEe5xFg8PrIS6CasfCxSuMUjU3DyNvoxcoz8t+JPmuAkykdNtJsLl3QJ/A6BC0dc/7vrgp1jdiWuWtZU16Dn6KLurKUXA8lgsU/D2DD/Dn8V5nsNAWbrlLJvgu7bx/nQU9Ig9ULgMvvQPyfYbmXZ3TaAb+cMDJWN2IWUWXJBHHhDGZQdcPoJsf7QDAzssJb4GXWlqx0wGnMob0/CQYKjGt71ttFXiEpMYRl/UiEYK77fGZgrYXmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CTF4e6G1ET8YmoUWnB2AZrTiismqowVkHaNGgamfnGs=;
 b=mH4y7caywzIpfjJy8pjzQX9/Rdq4LrAxNHMgwVKsGjXvVGdMQQOsyZWPlk2qmrBNru7jqTloyVdkK+OVuP9x+PruyJ1HSS2e32xnxOTdCTofuvp2KgorFJXQtK+PUErz/EkDn0wFRqG5k6tyhmw1QXOl2hdKxgOL/D+715EJFRB90rY4bmjnWho2X3bodhPExugh09i+3qJR03XcyTGaupscwZaJOtnKcrxhJiYl2jw3MqUlQvxfWd6Z8ELpMt1AxPgG2CnOvkHx799Nvu4+qE+w+vCTo6m1Dn4NZtZa9EVZ9zJgSEMUg4CJ3j/lSsumeNJBR2fetWU1NkxSlforRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CTF4e6G1ET8YmoUWnB2AZrTiismqowVkHaNGgamfnGs=;
 b=ggofVqqupOvoNMTwVOwtplEs4r3xaZC5Ja216RqU55WpMTtFpdPS4Jtneh5zHCfE0YtcthGKK9thcQlO5BqYOwghIl/PteI/5T6xWq7qytUtuuD5LllstfFU6utS91NNGKRbBhhSXfWaoy6KFqi0wcPHMeliL26H6lJC5dOsLBE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB10414.jpnprd01.prod.outlook.com
 (2603:1096:400:246::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Wed, 26 Feb
 2025 01:34:07 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:34:06 +0000
Message-ID: <87wmddcwvl.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 063/157] ASoC: codec: rt5682: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:34:06 +0000
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
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB10414:EE_
X-MS-Office365-Filtering-Correlation-Id: c53f388c-a1e8-4db0-3e95-08dd5605a913
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?StVdGAQz45xMiJLqnLn8hpyPju6cKDDr/XQxJG6+018Yq9EgReYGJYlQ4xCE?=
 =?us-ascii?Q?rkAzaXeF3DDZEeEXWc9cJbJ0mL/ugGijAeEtMh9zFUklyxiVSHhVQtVP61n3?=
 =?us-ascii?Q?z5TvlojJyc1zawfcAdeD/zELDG969QIS863UJzDPYDwk3fhcug5TtI+EqIvD?=
 =?us-ascii?Q?5VJzPsri/iy+ylevDpQyW1h+C3VubZ2+UIB5lcdU2aukQgefGiNZVLa5jRXg?=
 =?us-ascii?Q?jECEJtN+PK1FqX/f51VV66T9Pnr8f7xO/1KU+lSBK9OiZMkHGdW9JttZzE/f?=
 =?us-ascii?Q?LE172og2dDaLqYuD0zpPLtVyDnIpyUGft/vmdCbU0cQQWPFLcr+bfDOuqSCq?=
 =?us-ascii?Q?2JN5/WFMOzirvAZ9+h5ydhefCDoi2pYADpB1nDcM0e/7jfqP7480GVQWXYHo?=
 =?us-ascii?Q?PXVUCrnBCFFsP0kHa9B7MJ8rJVvhAv4jnRgjZp1dlJxwuPlClr9fGeRXPAk8?=
 =?us-ascii?Q?0DbJqCLchS9NJDPYUABthrAuLLQxDjo1aH3kLaGToIMzhtKpcjxuxo0+QjzQ?=
 =?us-ascii?Q?zot60MPbzYbPZEY6MIG0YubbzyxttmQbIA7CbPQ90fgAxmPhV/ExWYyHHlgK?=
 =?us-ascii?Q?RNFPclRbkFLp3qQWvI2ttGl1/xRr3Qaw5iEEgl76H9sqPhKV5IdvejBSmklC?=
 =?us-ascii?Q?FxqSRIUuvK8pMNh5dCfKBQJINNP+oNnoR8FTfdyjpQViDgy8OThFk9v+QJZM?=
 =?us-ascii?Q?cR2lmEsvgWybmVvEJwYQkLqJNQcFykEG6g0eOs0MWRHjEMTYSpQy0817pkZp?=
 =?us-ascii?Q?aG6+XmgLlIrM2uUsz3QN8zgazINsK0QPNdUGtKxKLH+KrXVJMCLRZEDa4IiJ?=
 =?us-ascii?Q?PkIfCjRvNLTgv12uCl/eZac4P3wMuuO0RJ9MUJN/EvjB+DYRsayKZxM0+Bbr?=
 =?us-ascii?Q?thn7ldzCJT6G7tiyn/bY57OpBJvZQV32ZIpswkHFyixtoybb0dzv9Rv2iu8k?=
 =?us-ascii?Q?3FJdJ7CwHtjA3j0kaxid2FzllQVsEaYV+RqM+bJXAEBUqlGWmC4ngovaKco0?=
 =?us-ascii?Q?39Db1D/Fwj3/P8BZxNoFi1Ip69WzzbWDEQsMraopp3eP2t2d6IXwoA4eN3np?=
 =?us-ascii?Q?OrQaw1aaEH0BFC9+sP/cvo4vgjpSY20u5SfSxDf+NSf5kzppsJdgheAkYakY?=
 =?us-ascii?Q?aOnnEur1aVZCbiObA1j6d8LGcyU1bIqmlMIKoua8TzP2ziPHAMYNnzFAISKm?=
 =?us-ascii?Q?iITDMLpX5xAqR6rX94fJ9k24ith+ns2iyTj2HcQTgOr/PkPrHncz9TkZY+c3?=
 =?us-ascii?Q?BKIyr9jt5ztZPn77gTsgyw9kPHnfUykD9iqtNB6Iyhr0+0yIX/lDT9Mlsosm?=
 =?us-ascii?Q?7Q6p5eGPENV9r5T5+Ma230asH6B1LAEzBvybiS590K0sVspT07q5W7bIPdhG?=
 =?us-ascii?Q?hB8vDuTrCUppzY2Ef3TjQbe358MbfjjdXSaNUPuRXBqDTC2W1hq6niyX6qbs?=
 =?us-ascii?Q?kontNgeJo7Hwreg1gzKKL51hQ+tt1/NJ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?47Hxp7yq5h7gzqZlibnv8jIgITXYWvspwL+qxL5n/LeLgWl1U9wnl53aGXeg?=
 =?us-ascii?Q?GUASpNjAh6ckDRtq5LgIyXcCoik9on22bCZObrokAXOnUg+XaNFLEOodCNC6?=
 =?us-ascii?Q?qsPY60Ra6b9Jd3s2FMDo89Mv+EQjGAEwyMx7HRHCBgw6XP74I7Riu+qEmzlI?=
 =?us-ascii?Q?xXArAVxbJw15xPUSBcuBl5zv7zkbqEcQBl1Z/f10VM/ehxY1AcFSuwQ54Xgu?=
 =?us-ascii?Q?sDNbuw78mDbHINS6sM32dN0NeK04Pxu4OXsHPWAVNyOrGdh5RRhc4SKxRUx2?=
 =?us-ascii?Q?r175Qj4ZhwToc/wNa2JIwAQB/Yg+lgGV4dH9/EtryfQdPdoxSVrsgXiG0qqJ?=
 =?us-ascii?Q?aFe/ofGUFDuhfHp2RvSe0cfYOhKMdgovqsRxkpSFfiaJ9ad/B2hkDx9EnphI?=
 =?us-ascii?Q?UBJuoBSspZwOnI0K92CUSrDUhNNmHkDOHPSEyXAaFWKmCLbeEFOYExYxD1qT?=
 =?us-ascii?Q?Cj2aqUeb1se+4ijKVCMTx7I2DKdqo6hBSyLG5scZu4NGC/7GQF+XSPBH2Tlq?=
 =?us-ascii?Q?WMhyVddU1t6PB2/TIJgU6kO996noQSYMiOYOAq4IhBxXX4Hxa5teSyvHMcKE?=
 =?us-ascii?Q?PtZQDhCfd2V18NcFMEzZ5HbUJVmjedqMyBHozRpCtzbKrM1bRcbwt93KzYUG?=
 =?us-ascii?Q?Afgyyw/CxGJeCaQuxOxpJO/q3SKqzPE/uGFkuAWDtCEQ1M1zwKrJl/Zo0QtP?=
 =?us-ascii?Q?owjh2ijGEoN6LE/je9BdI/XiFOKKD4M0JkJwIOl5LBg9YXmRd7ufYBfMCJme?=
 =?us-ascii?Q?0pX+LZAfivnX8TxrEsvHYOPENb4LZ3XrkWpFRQTYZelfyqDrb0ZXKJSGQeLX?=
 =?us-ascii?Q?CgRayHUS4p3ySFxBRBIuEv/Ys8nAaVOOuiaaaPZltn7kOi1wriLCxawHfcHa?=
 =?us-ascii?Q?YrRRo59iSj/91SO2KK+tYwMcJPP75m8K7JjA15ZytUPuPqfrS94U+ar/U0Em?=
 =?us-ascii?Q?/O1Vr/Zg0v90AGIAQkYqS/ipF7sFjc6RIMbLIm1/u9TurXfYg0paiONx4Axt?=
 =?us-ascii?Q?Nd4RGkhaP6sdFOGx6OUyGZPKiKzbJgohAKinkjRUMv390kBbCjHoCCWAy6Pp?=
 =?us-ascii?Q?kKBizHnywHQcGI5iIwoNqBuJ8AOcowl0JIQ6QZkSWbVECWXpDvqI7STdMXL/?=
 =?us-ascii?Q?UaulEAfcbxZEEhnlX0fG8p9wsUbEJNFZ8bjRmyYlE1X4qUFcyw8dz52hnh77?=
 =?us-ascii?Q?fwmlta5fQokhHhKarCa9fdISxPhKEhlLel3V+MCuTQF3ZQKOqfnWdwiOqfx0?=
 =?us-ascii?Q?9WpUFfloYVhIpJT8Px2DRGDjRzZvDk78GiNsc4nl9PZQfY6TVianbsZZOrX7?=
 =?us-ascii?Q?HTJ2aDzbqxkdzpFLzMX7cYVMMsbErYOZY/sGaLo5Nro6UIIKJH/S4qCN48kY?=
 =?us-ascii?Q?Lj8QHSMxjzKU2y6PhUkWNi1wdwvG5bt84evg1/49Fmz6gFLZfZhcRk1A1GVM?=
 =?us-ascii?Q?6k2tRW6Pox5AiqjcdrccZja5sLi+CJy81sd0jnQPaHAwfh34kUChIl93Hi0j?=
 =?us-ascii?Q?CKTItPKeAKk6XWkQH2tLI5tU3ZNoHlzsfBVM+Bjgw/4aL+FVS9xHvQbbmCXi?=
 =?us-ascii?Q?1hSi3J6+Am7E28y948lZQ91W9tPO072xAxtl2lBNA3j1iJbzvFQSKSW8nspz?=
 =?us-ascii?Q?ho7WOd3qtwUgCvRoD2Ai//s=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c53f388c-a1e8-4db0-3e95-08dd5605a913
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:34:06.9554
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mvetz21e94Ipdj2hwuiWeZus0o0i59LLCFNiDAEKxp+HNmg/4oNvuA8PjlmM3cgxitymyQ8fKJelf8YwIJM4WXeIZT/xE7yR1Uwmveyijmwxj/FyUoxuAnjDnrIAoDuS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10414

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/rt5682.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rt5682.c b/sound/soc/codecs/rt5682.c
index b4d72fc4a44d..7c88370e2dee 100644
--- a/sound/soc/codecs/rt5682.c
+++ b/sound/soc/codecs/rt5682.c
@@ -2225,10 +2225,10 @@ static int rt5682_set_dai_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	unsigned int reg_val = 0, tdm_ctrl = 0;
 
 	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM:
+	case SND_SOC_DAIFMT_CBP_CFP:
 		rt5682->master[dai->id] = 1;
 		break;
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_CBC_CFC:
 		rt5682->master[dai->id] = 0;
 		break;
 	default:
-- 
2.43.0

