Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011042.outbound.protection.outlook.com [40.107.74.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 344DA18E750
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533601; cv=fail; b=LMuJdBz/NWQ6bI5hMzaqRvIS4AO80OWBmUELeSboDnB69cd2/mVC4J6xf5DkIfNpGCkdh91lCj1fpgTz/uCyj16umziTm+SBXpLij2L5pEfStBo5S7xhjmwE7js1ljzSjZruVdM+vxxUp4OQTS4vHC1uFY36TVj3QuVljIIE2Xg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533601; c=relaxed/simple;
	bh=mVyQrBZ74JFaZKVCqMo/sg5qa/SmlZ6FZYzvC8QYfhw=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=aU1kd3BMESXRtUP0r6b2UOaPyQQ0WNe7bZtALcRdyOSK85Kxp/igy7D99YdsVvgf7ZiWrr52Bex8UOmK1ENudQeSkCFtNidNWz2Rrnwv9DAxCVqEu392U1lPjNx1bDj8R41Sbn7lW8oBo/0IHxVXBeEm1RE+2RjT3ryua9u/0h4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=EPsTOMNH; arc=fail smtp.client-ip=40.107.74.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="EPsTOMNH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n2snj3fD1W1clSogWTUvBHT/eUjgYdEqGZdiFOwthrJXzx2hY7rfLPVbFNXRil54yoE2zNneV8IJfK7ZmriYjoM5/vNaCI6abhDzmfVkU77LoTF7GFK4g3rx+0WMrt1aoI1S8keQ346U+Yu0ZK9+R59L33bVGr4knBi+uqIWM2fYHER13lqxLc+MPMKG3BfHmyEYgZcAoPL/SBwFst+VAdpZiX03jfvVLxXLRXO2ypSq3V9TCh3BJxzuGB934gc+uaVE4QptAb9/+ZTQq+YNhlBCXZwD0EcmiYSgAYmzNoc3VYtdFaXh/kWz1KjtY/xbQuCysveYjS+oOgJl/rwiTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aRqJjg/Jc29AGSG3diM25XalisE/laPDm1MzPrjP98A=;
 b=LaAqoTfq7UAlwmZBOIgLzkkP8HcuJYW/XicKcif3F3nBbqL2WlwJpfuom/MvBdGawwACdQuVU6TCUcTEA716NrK/QyuWX3joqKaZl54yGIN3LD41lMiwiDf0egtruaA8pzhpFCGu8y9lOmYK1y4QT2FFlug6J94kU+O2OsTxqBq8gFETZjbzkAN/cfSxeAQeZ1e0rsJhmUGYLTA4fR4BrI9WRZbAK0/p8KQVxqFYnh3xop7P0yJo/UGkG0UHZC1TVqZlNysy1dwUyHvG7NIEoG+8PKPIQOFgukZ6A1GmhKvMhcgQmQEmeZlz3RPNN50HwOQGQXboegmm4YUKqCzedg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aRqJjg/Jc29AGSG3diM25XalisE/laPDm1MzPrjP98A=;
 b=EPsTOMNHE553fnDszZMfmtP85jWtstaaIR1BJ7wJgcfEW2JYB8YimtkP1XhPDACywC/Effv2QAg4Y5nsXYsYFyNAsTIpFGGkGkAumU3QtFsdUIHxkBCAZhUKlqn7ldVeHhjl1AIaTbJRJMO9+XbthJdGW9rIWBbKihoZG6EbGZI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY7PR01MB14457.jpnprd01.prod.outlook.com
 (2603:1096:405:240::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Wed, 26 Feb
 2025 01:33:19 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:33:19 +0000
Message-ID: <87frk1ebhd.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 050/157] ASoC: codec: rt1308: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:33:18 +0000
X-ClientProxiedBy: TYXPR01CA0047.jpnprd01.prod.outlook.com
 (2603:1096:403:a::17) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY7PR01MB14457:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a393a73-bfd9-4778-efb4-08dd56058c9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?CmbIWzviQcOOlpKhFNKdfPos+9PCU0LkY3/mT8viHkd3ErTisHSTVB9lHjDY?=
 =?us-ascii?Q?2dPe9nigs9/FXIYRywvrlyT3QCos8fNjJ8eKYzNfPfurKzVLLnE1STSzNGZw?=
 =?us-ascii?Q?mI9hFwboLYslyTPgca4yqqvp4WinptCyRJE6lzVrjVugScWJpsv6PQj9yWAI?=
 =?us-ascii?Q?V/2hHUsTFVletd52h5QGoIJGob1lOop16quFNrrg/sF1XVQU9tz/L3VEtnB9?=
 =?us-ascii?Q?VhSv3eGZv5MqshhgSJjHbo4LwsF/lghCbNLIXYVMjuMTrOnoKb+ix7TUxyTO?=
 =?us-ascii?Q?No+q5+uwcrQOUVQ4/8/Y9gJu5Ol5MtYYYgHzpQrllEefpM2bYlhDjDXLrV4K?=
 =?us-ascii?Q?3f/GzhMDgCP9qYAxBbio+Y3oa31A1L8Ao/W0KrOLJNcCknwKR0E53wNcZZIy?=
 =?us-ascii?Q?G8VdYZo78JBk7rnYTxH5NeAuefWvFeyqlCgwwDKK/5eojpX58pIrH1UagKL+?=
 =?us-ascii?Q?ATOSwUgTkqtrXbIskMa+Er4C8zu2tycxTyw4oHolwck38TDb8P+wSKpnfBn7?=
 =?us-ascii?Q?jHNaQaj+72VguwUahV5UfMwZTCTJ0U5o8M9j2S15sCntK/ztM1fU4usMg57g?=
 =?us-ascii?Q?glXj/YxMzobqky23sQb3q/hTRqIV66xGmR8GiH4FeTaGZDHAa8sBcJK0bFB+?=
 =?us-ascii?Q?rz1FqtMS8qVkiwhRListng/fIzOI36gyroi0/cYf+GDb0UqAdUNvG7T7MIRk?=
 =?us-ascii?Q?vzCspO575p3P2FwV1nhFQcQfustx6eXSPpHmhriRCW1ZAosocLue+1CV37c1?=
 =?us-ascii?Q?3U9ilzVG7MIVHU+ppwoTGT2DEvIYrmALCaDQNTCsN0qzrukVOyfohsbDxM9G?=
 =?us-ascii?Q?h/aEdESaq2zVpnt5lisA9QL63iCGI7Xli3TsHll6GTXIG9jSEuz8HJOH9ZVc?=
 =?us-ascii?Q?O7UuLBT61gt/mAw6BRET69/tUcfz5qcY+tm8IulYnwB8LPiMJOJ2/bqX1Ybm?=
 =?us-ascii?Q?coZH4c0g9/u14NUyM3OWXYS8hsNe/ub+ENEYkzpsr+5cjsBR0T2zfDnICSHt?=
 =?us-ascii?Q?hZ85E4IzR13IMr8N8/pau6WIYca5TXnpiOLFLhWy9XSn1qPNrWRD/7sZeO+S?=
 =?us-ascii?Q?+EV/nYc7WeS8ytY3srX3TUiqj0W4MT/6KDLS/lf9tfC1Km6ywqqW5we0wenB?=
 =?us-ascii?Q?xwFmPrxpof7t4e08ueM5HvdiYV6JIsnymWWrgmLO85YzG9yTQor7rCmkvEtG?=
 =?us-ascii?Q?mPfQwxpNRlMRCvv1mamOhXwP8IKMiamvFJuDQXRm4wtUT/1x+9WobM2TkikH?=
 =?us-ascii?Q?URtXJxXZ5zFp8K/5rUOUgnDVsq77nfMYHO0dZABZIhE/xC8ElJ2suGxTHc0l?=
 =?us-ascii?Q?VVxHEOLII4VOX8KtnlxdIwiwNVrkWfG1eU2KvLx0LndYf23lIuBs2P3m5OcY?=
 =?us-ascii?Q?sRSn9XWLn2w2xacZ39vPA5m7NiingiXYjyOJSlK+XI9kShn56VGNoAPKyTST?=
 =?us-ascii?Q?fY0YQr6BrnXmi/2W6SURv6PJWdGai7K6?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xkEHLSLna4lYqlPm0e8lnWViqTisgCYFh8VHEletFeE9hgxghe6KFi7uP/h4?=
 =?us-ascii?Q?ybxF5z1MHFY9mTiwBGVzNgUPKcjsRZ84XDg7cNQ/uOlJrQeX9ZOf8S5HbQgM?=
 =?us-ascii?Q?0wvXc/HeP+sZeKb5qmmHHGli+70yrRX58M/17qxhl7dNGw+pTaYH/zE68SOA?=
 =?us-ascii?Q?dAikjaS4xyvKBEXJNFKX/4ueQlZPoPa9rgW1VZYGJjgCAHwMUKLJ/8IUHKws?=
 =?us-ascii?Q?hgpTBeQYg9Ckpl0e0Z4ynuUCbWDKSjrwT0r21/TjVVVYZB09NbbDgBD/G49s?=
 =?us-ascii?Q?MM+0rQYUeUObjQmVPQm9rrv7b8yjgh4yASO7wmseIWfLbouPgv/FwqPihz9q?=
 =?us-ascii?Q?+2/cg3lKaAh1EbDIrCJ1F2NrWs/oRaZ/0hShjFaUEa8nsJEtz09jGLDd0Ulc?=
 =?us-ascii?Q?kRYBQmz0Cioarz1u1tFg/LEN4IWK3kbKmFBsRtG07VmJozeCsn5E5yd3OmnM?=
 =?us-ascii?Q?Uu5YcgOQgyoYCR7q50t21PHAAPfQMad+TDlWYvqH0Zr7cWutsGaoV6BhBGoz?=
 =?us-ascii?Q?shxvAiCZi+OWAEnxhxcr85R8+TekBvW6nsdO9PaevalNCRc+OytOMCAgLpvX?=
 =?us-ascii?Q?gh9L9bUBTvj5/1fdOAVzlNPTqMqxCSE6kol6OVgCPDvlH+UpKp2RSlxhUJIc?=
 =?us-ascii?Q?ypKCdxXsWevOEuQvti1SV6xIu0Gf/V9W/W/mawbfdpepLIzA38rS8iHZWzM/?=
 =?us-ascii?Q?GNYCK8qr9QrPQdoBtR66e47527FNLrZUjup99i/lC1WQ6efWV4UJE1Res629?=
 =?us-ascii?Q?eWsH77K+DpYOUs4KNNVsbwmrDvG5pgWhICo2NVZTGwIGiR+QRsfWCmarsgEc?=
 =?us-ascii?Q?27rJ9RCmLDIuJjtbVqfPy4T/QAasrwqEWuDxjf2jhVIRSPBwAQPeJCFu7FHm?=
 =?us-ascii?Q?VVw+viwuA93istdt1dgkZJgAt+mk0o6aC4KK2rmnCSBiF3PY82VgT370GRcs?=
 =?us-ascii?Q?R4YkRPLs+Cr5QPUAAvV77a8HmiMk/2c/5tzg4t6ZU3yQq/ejGSYHL2HuFvx1?=
 =?us-ascii?Q?OELPkTLaW77ITdVyz3iUs3APx/Q2C2V1dST4b2G3VrS8FkGTMvw4DEDH/9qf?=
 =?us-ascii?Q?3Q/YOdgI3c43nmFQfMRHL4fwaHqS77cemmKPuE7WRkaJvGuIBA5xve9WC3mn?=
 =?us-ascii?Q?AS53sCMHDWog2VMipNLAA/ziabAPRKRPpFFJGuR5elLx+PjWuQ+BTt06wdSi?=
 =?us-ascii?Q?KJkZUrO/fsALgeQ1pMM/HwoKCJbQ2Te/MT7CXQcefp+ycrQ2jsbjyjd2+7w5?=
 =?us-ascii?Q?RPAJorPn9P00c59KHh69tw+Reb37bwifbvmL8d5Ck/LDr5jR8Uwuvbhs7+vt?=
 =?us-ascii?Q?1s0JpEe9GV+N6RatBqluCXYfWTeKmw23UFRxoB0NT0ktAIf03VNo5041Whev?=
 =?us-ascii?Q?2eRAlIHdIYhmaAHJj3sMkr9EAFgUTXOn3BcAjRQTZA6GZ4/mOHNeOCWIbVTS?=
 =?us-ascii?Q?sevftT3OZOOKl+jniZbvZh4CKe3w3lbrNZTUCmdb4k4s4MXMq/Hm14P8fqnW?=
 =?us-ascii?Q?ZiuzyWfL9mUyZ/LUofr2/7fqP6OpEkfkJN8U4L4gly5+KwJ8NvTUBPbj+9pL?=
 =?us-ascii?Q?7XFmEaCeomnBul7e8F1YnXbxn3oyxiMndMAHTQ0JQ38/soOTmw06rxlhneMq?=
 =?us-ascii?Q?hGX/PvvFbVKY35BxFYDeU6I=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a393a73-bfd9-4778-efb4-08dd56058c9c
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:33:19.2308
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 21Ng90/I0JwqnnORvJH8brqrXwCdXTO4ddw7H+hZGHeMh62ywjv6xCJYIUZh7CklnxBzGAsU2GnCdX4c8lyRdoAo8td+JQLQyrZVtmVIXmcQMqK20+jnNikRWd8fMY+0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB14457

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/rt1308.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt1308.c b/sound/soc/codecs/rt1308.c
index b366338cea71..871391f8ffe1 100644
--- a/sound/soc/codecs/rt1308.c
+++ b/sound/soc/codecs/rt1308.c
@@ -523,7 +523,7 @@ static int rt1308_set_dai_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	unsigned int reg_val = 0, reg1_val = 0;
 
 	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_CBC_CFC:
 		rt1308->master = 0;
 		break;
 	default:
-- 
2.43.0

