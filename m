Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011027.outbound.protection.outlook.com [40.107.74.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 430A718DB23
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533554; cv=fail; b=QKXRfgfzrmO/UWcc2f6VeaRW4jauf066pUAzHeGMxoIudGsPR586OOgnqvdIq2MOPj9LGMf4IV74pb+Nj6Mg1bUf1hSRdzEM3rajBI2kvWV1SkmQGnnkdOnLoxKfJ64e2+azirdRcxlJF1UvM/TCZa2YZ5qEmKhCd6yRrsEVbEI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533554; c=relaxed/simple;
	bh=yXj1NVxYVK1zjhUjEa7v9DMd0PW4cLWf4Wq5OLKVUWI=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=a5ZZrt9vewHFkzVGHk1NVYDzF2pns1Nih30m8wQcagh3M/hujKF5GpeFeG5u30mhMBHthcza7iM5uosjqqMnE2Gpj+o7+sv38ZsfSXOU4cpIyaaknYx0AyC6Vq1ZlDK5A1JxKaL1NaJPviqVXEUZMoFvEJpiuw98BrC+C6jh9Us=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=fpSwJdup; arc=fail smtp.client-ip=40.107.74.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="fpSwJdup"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a2GKKqXziEbAF06AZt/U57TXkhOtUawPRiFRkBSw/nLhoF7enmQxWMjJP8SMkFxbFk1OcaO++i6JuONLnJC/tGPLxnVyKTgJowPNtw158edNqWQU9IHvF1UXff5gUw8YXrE1xAAMLIyolNX2rKLI1eh2GdShn8bXmzh0a+jBca4NTn/TzoWUabm5oKAPFdLqGOsLaLGPQLDIkPOT/5aXuvHS28lgMLJAkSe4YPtH0PKTmUk7kFT2BU0lVsSw8xegEMDPsodYmdc1r54zJsiVoeE8PaJBZN7eSIgBEVmUDv+l9KFQ3OxZFUsAr4ThQGg8kJTRmEzJOSCq4v84ttzzWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ORb1eTCN07mTB/9UB0fWIO4cAiB+3u5GuLqwGYjEBEk=;
 b=metXNOh9HWHJ0dax6TmswGNO1lkWuEPOa/OJMriPIPKD57qVO+TnGwhcBM9SzqoNuq0Dq7OphFdSNaP4Sf6zuCrfC8BPLqiBX9v/ITURiz9mhBehdmaCOA4FZTcvq/KO3Ww4lzP4FMpuwaoTnOfq3n6DnxMsdp95XvnDO03/y7IWju1RX2VOF3+kE1Z5Fxnxl1r7Ythy3kSgnqUBsiuV/aN3m/GNx00FeVdKIVhDSguD2NJMtO3XYMdV23qE/CZA5qHjh2AhQNG5JYtnFDZRQFOaCI2FubHoBujc8px16kI2oKnPtxqo5tpx6bL+z3CT6R5PXhNWa1d9FexloRSICg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ORb1eTCN07mTB/9UB0fWIO4cAiB+3u5GuLqwGYjEBEk=;
 b=fpSwJdupY2isNimmFwYbMLZ0pusPYM0d9BEVqlZWwk09Tv7l2KjXhAIZpSV3jbF3hCMpbdI9tCU5atiO5RftXYUqwZHN6w21sBxiF5FH1QVsoq92Qd7z8yjQoXexBjv4FM5a/xLh8ycznygqcq5ev8OvZ8zIGp4TnCkA9QP9Zoc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY7PR01MB14457.jpnprd01.prod.outlook.com
 (2603:1096:405:240::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Wed, 26 Feb
 2025 01:32:31 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:32:31 +0000
Message-ID: <87wmddebio.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 038/157] ASoC: codec: nau8810: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:32:31 +0000
X-ClientProxiedBy: TYCP286CA0181.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:382::19) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY7PR01MB14457:EE_
X-MS-Office365-Filtering-Correlation-Id: c3253532-0a7c-4797-9eba-08dd5605705a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?InicO5qSaDwyBac8fViGGZj2nOMgjkThE4GVljW7PhAVnFDoFB1hr8XgHI0a?=
 =?us-ascii?Q?tXtxAUfnqkJZ8yOEQhnV4ERNCVJm2m0GGad/2BvWWOC9DcGMT+s19dV2UloN?=
 =?us-ascii?Q?pyrGAVq6a4eqV/hGn/d0DYL03SDNH+kyKtqWERopKyjFeo2U32EOTFsNQ7JC?=
 =?us-ascii?Q?l81lhX10g2ccxmvmh/36hI7rb5LQLD4JZp55gRu3Mt9qCFz4HO2pduKDZrSd?=
 =?us-ascii?Q?GbthtVtjgdD5TkPv1+XbZ9xLrqFaR88CDTUuIC6dK/G8qqnwUhyMF3+Pho/V?=
 =?us-ascii?Q?3DTr17Vy0fj9IiyP8DRRJY5XB59a5GLmPYmnsmZR6g3edgkxjYTOtBqXqKhu?=
 =?us-ascii?Q?AmTQ5gksEG8NlAdIJL4ryNiZE7e9K86eV9pte/SKMTsV3GKX8PMtH7WHpTgu?=
 =?us-ascii?Q?ZMUmGQrmiSxQU5PoYDOba4x9kuHICv7UqX875Zfy/gmSJQgQNbeae+8WF3Sg?=
 =?us-ascii?Q?48XQEyL+tbLP1xAz2VOGt19pmi5SbhmNZrRsO9P8uYtSgvaQjDQOe59tx7e0?=
 =?us-ascii?Q?cukw6RqKF3gVPsmCwnLe83q4n8888KvzBTkNxKSbRt6MRs6/DQzBg2PGOuqq?=
 =?us-ascii?Q?KW/OgTivmKaKPvoRPdT/tLeDCyY/MRMGiLWKMLAxbLrvuXgkN4Gs2rqn//hw?=
 =?us-ascii?Q?7HLeQO8Scrg2bC3+RNfDHdsTt1Z4YbZpKfn2ptoEtAxJtFcfhmHncEbRMTxR?=
 =?us-ascii?Q?oCYox/iYFT6C0n8CKJ8An9MpeQ1btnv/fwHjgGw3OD1A7ivrrmDO+4XvYBeg?=
 =?us-ascii?Q?IpF32mG0nseCbu3lZcuRcwKnaEwdaTkR+iO7m3d7e0kZO3Y0B9HvC49TCBzW?=
 =?us-ascii?Q?bw9dXwvDMgKIc0IksX2splMjkbIjzNl3scdHVg+du4xpXBIm4HH4q3HGOpP7?=
 =?us-ascii?Q?kC3iRyPD0RkOnFDdAKK0ZSXhSHgWLYNAvocwOxNa8gMSnuSZkv12JXNOFMsI?=
 =?us-ascii?Q?/a7em1HTBk1fbibPwlRdqv83laoYO0QMOKzHTc4UYG0Oij1XtSiT1wkgV7ov?=
 =?us-ascii?Q?c2AC5rlm9EYlE80Cb+wbo0HX5VNypEseJYB3GxZJlg4Virp+6yLY6Cvx6M1G?=
 =?us-ascii?Q?CEXauT52QzBU1esAixn95iC6HYFWvKyjZGqaradQROPIrQd8whpL6fE4kMP6?=
 =?us-ascii?Q?n4QP0pgQJht+EuArKCqqCpQsFLyrTGSTBDS15XQh6MEtu6jsjiLla1Wv3c7O?=
 =?us-ascii?Q?v6nkO9QqlLRqOdhDy37ASWb3qWTq8iI0tfmYWrX3t7i7mlMIGswsHou7hH3r?=
 =?us-ascii?Q?6GHMIHpIpSFgCuxYsr3/LKAnVx5HMLyBVwX8lfYXUp4yI0rUEtU6JDQP5Zut?=
 =?us-ascii?Q?bXET36Ojc+J8a+XF1RXLMakSJiXBaqrkjUCDkVwmBmkNyfoQ5CxDMZ/bNeZf?=
 =?us-ascii?Q?O3FccPhJWAGbWi6dWgQxN5p0vllxCzMkLrJw39M+BIQHiNkKk3UM4SF6ui65?=
 =?us-ascii?Q?Scckiqtx4822e+YnOCjxolHtQk+Wk3FD?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?n44nJV0XX644M0zOO9seycGWruHzEz0g1vaZaMtqXrJ8CQJ+i4wlc4PSY92A?=
 =?us-ascii?Q?m1jY667cj9oYvwmX60XMaJqRm/YlV1C2aPyufLLEtCRCIa5fVAUJN72hF91N?=
 =?us-ascii?Q?46ymSMPINXf4z3HaIXK5y2dkMhdKNxu6Ptev2gy7jaD7EFh4pjrI4U6OjXMH?=
 =?us-ascii?Q?cOxOyjS23R+jOZPEhPgpJb3bu0UuvS+eGgOz6qezLFGroSzx5eo4kWnT8yRt?=
 =?us-ascii?Q?vp6aYp1NwBdGVfHY2juhqJnFppOM1YdYWRB01hKQdNle5VGZ8vI8QRwtr1mX?=
 =?us-ascii?Q?3HuDFvsaddUs6+0jAWDRPs0DEHGDIBN9btLdzknEn5XFwf9A7oHwS4gSWBPC?=
 =?us-ascii?Q?n6i6u/o0FJq590z3eULHM516et9OBaIpKD/n/stiFFwjoNRiKBHTK1TTAvR1?=
 =?us-ascii?Q?0wW1kEUWaKO5pG6IPGaOWK5bCSdqUNcQ1aA5+4LKvR/mIp4R9UpEpI+5puHQ?=
 =?us-ascii?Q?Q3I51xcLt/msX8AL4rNs+XOMKdjEefTcTHvBSNnAoMw51V6xKKxnHmTXHWH8?=
 =?us-ascii?Q?H1vlKxcshW47+N22kx45hew24OqP+A4Us3Ni+4NuO6yO8DqepSCtXrYQQZx6?=
 =?us-ascii?Q?qYXQfJwlUeZWVtECEQH4+UO5ILJPEZcYyXeNjB1CACkcYE6CgQ1WmX19dxEA?=
 =?us-ascii?Q?UeCK5FkWWteM5ILtMvwLTnpGDEQhX6Gf2PNyCbI2gb2PCM0/TuwkmvSahJki?=
 =?us-ascii?Q?BgHCOTKwNsHG2TQ7nckskVHaS4+4oJrlif74AHZQlfJHbq82c359Kdb88WUV?=
 =?us-ascii?Q?gOAKfHM0fVvrkz2ZRB/u/WGs12Lu/j7mYjSQXRpeWYXlX5U5HIQR+20D/NQz?=
 =?us-ascii?Q?hUQr65SmSzzr7haxUft7cFc786NrUECLJAWTHY6v4CFyCCUy0zlmH+o2lS91?=
 =?us-ascii?Q?0IgVpTcbIC/rXT8J8NGfAg7Tncq0rGPFmKlBvRU5HMXQ08JcXZNsWVgraSzp?=
 =?us-ascii?Q?FPjb4nuK6Sw8VOV3sZACUZgAtRSMnpd/9WKybY71XADlvEawf+FzL3cU5/8B?=
 =?us-ascii?Q?yoPwGKsLLyvVvP0jUMiN/Hb+OZ92lYCGRiQBTht6ZoH33yzDga98mGOMQpdJ?=
 =?us-ascii?Q?duTlWrxEc5mRKt1dogkYpm7i2jWSPX8gLbut1uJyV/EEJQUyoETFuQYTUcC8?=
 =?us-ascii?Q?NgbT9Jrt32HSdmDhzRKYEn1bc5o6Cej8VwZ2g94j3AeCOziW6tqIfIYePz24?=
 =?us-ascii?Q?2aVExLV+Nm8+ZTJ9FjQhef/rt0fZAGs+6Q41XMaQkeXK8+uKLxBe1dMs/64X?=
 =?us-ascii?Q?lj7W/zfyhA5vIHzLFhzyzS/eeFAkPSFzhjN2wIg+0GjWmglUnLyLsnZPJXMY?=
 =?us-ascii?Q?oP94vufRxTzfB8QxXOePmnMpaA4NOX8VbvrWqL0EkVz5cTAB/O4STeVv+hz8?=
 =?us-ascii?Q?xoq+G63LF2pdRYLK9u+ish9lqAbXOwEiv45KleaqZT95OsJJBzxUYNIwjcgg?=
 =?us-ascii?Q?3rp1hcOAqU/o+Ht55ZvaOD4Z/FR8fjPpBN+gg8sCMx/2n64ithU/DLPwr6OS?=
 =?us-ascii?Q?kZjnDlAmG4BI+doJ/qNU8RYVxlJk+FVdWpTwPw8lnIm4mNjZbB2+GWT93Fp+?=
 =?us-ascii?Q?nOD3r2c0s0rrwwgymypCIibOkmB27GDARt4AOy1+dEM0Qg5fnN21o9km9R3H?=
 =?us-ascii?Q?DPznaIX/m4LbqappFvqR/NU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3253532-0a7c-4797-9eba-08dd5605705a
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:32:31.7323
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LTn7A8SZcyK5pB2Mlcvxvja3NB0HsaPtMlFhMCnSzMCfKHBqpW+bIkDL4/J9+FupSOE6x5dZ9oO2GfZ/NbvfWt5y6JVgqWDAK7qFu4ml2yynmv0vv5/FwAS0+Re6393Z
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB14457

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/nau8810.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/nau8810.c b/sound/soc/codecs/nau8810.c
index dc3aaca89919..6f432b992941 100644
--- a/sound/soc/codecs/nau8810.c
+++ b/sound/soc/codecs/nau8810.c
@@ -613,10 +613,10 @@ static int nau8810_set_dai_fmt(struct snd_soc_dai *codec_dai,
 	u16 ctrl1_val = 0, ctrl2_val = 0;
 
 	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM:
+	case SND_SOC_DAIFMT_CBP_CFP:
 		ctrl2_val |= NAU8810_CLKIO_MASTER;
 		break;
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_CBC_CFC:
 		break;
 	default:
 		return -EINVAL;
-- 
2.43.0

