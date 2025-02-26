Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011058.outbound.protection.outlook.com [40.107.74.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57156198E6D
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533947; cv=fail; b=bP21HIYEY6xDDhqUOTT4aiK1p50RFDjdlXvOxkiKRo5csWATZqDrsNEm8/L/ab7qT8bYjuL23PW/nerLsYajAyx20GGx9BBg9sYIQ3MUC5RRsS/299XmoVRjy53IPDoxTmKM4e1TtI+cn1Ih3Bge562y/BpGFBhBbTkVXcl9qng=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533947; c=relaxed/simple;
	bh=IAGzgpsdYCFbw4ag2DmoFrFVdcr4Vp+rq1CPN83Wa0Q=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=lzPi1E70AE15ErmlkH9Y8qkg7S1H8NaHNHyM2uiqwUIKZv38p4qWD77YvZHqxs6+ZzswmOvi121ULAQdIkJGG7s1PkaHlqbGuN1xMetG2cz/hP1CcU7E8Z6rfRGl2AxeyyBoeiLVQoMsnHgUyTQHSYjq+6oQHlHqInOmg/+CmAk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=GnX3eMdc; arc=fail smtp.client-ip=40.107.74.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="GnX3eMdc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cR9/3/RlSzaxP6K3R/j/U7kmu12l95gNwSm5ImUcc2a+fXJa0fNF+EZi7vVQVZ3ZhN15fHrFopHg3FVl9b6u6F2A0e35fX5xoXiHunsbfj6CE5CmtHvOjeBALXiIFs5+8kBzVzM4TQDVNsgLHplwWBxmMHTWFodHFmYrm8vmrPpMurw9K62wwLG1To1N1hlHxq5D36nrZiaMx1BMzF+EsPZAsZmgxWzFh3fYespfPcwByW75+SXinzoQH7Y6C7lf/XnOnVgLtFs2byq6YjMz5SHmWGYNodNiVoJLlQcwOGKoeM1rmlEVSm8XyVxQfn0N5KxMjidmPNLp/WAVwnUKjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=esZKO9Gu2OGPIcRrj8bhX81ft99ubS4oOX9QX2EHmTM=;
 b=NGRMBfFQgmLFNHx4QvPQJY2Iv0QlL2gy/B4gX9vFYfwSDUH6/00JefT8lmgZR8JWAYix7D9uzXSPz/W3vD/XkAV+5ms+FB++YrItet+52V5iK0azIasAtJY22LOHTdnqR7KMfy47dPEzLaEmEZlzSBWfAyWaapYg93/PHCtrso9aPwo0kVpCkAqaetZOMCVw1VSp+bD8RPt1lvjvK+dWbaFOItJAYYKYvBYNRYVmTukoKMMYcBGDiNJecQr/S/UQ6mx8q1BeG0WCHr/ZDdkXuH6Ix0+Ie5esYCfoPvhurMPslws6Si9uRJpOVFBpBADRzVVgqvZBlD6gM1YrKu9xMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=esZKO9Gu2OGPIcRrj8bhX81ft99ubS4oOX9QX2EHmTM=;
 b=GnX3eMdc+LRr1xSyf6kcekZKCmkeGevm6wI4avW7RKExMVn1CHLLyiddnFBhAaKkSTxbnF9HwMRAAeCl2ubHzlKvVg9FxfUuscFjAmuIhPEnA3yMtYdw1SJYVH9qacuvgxUznY7bEPBbKXXEZnpH5wv3rEbu9s99zLe5k2xUg4E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB8140.jpnprd01.prod.outlook.com
 (2603:1096:604:1a5::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Wed, 26 Feb
 2025 01:39:02 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:39:02 +0000
Message-ID: <87plj58oy2.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 143/157] ASoC: mediatek: mt8173-rt5650-rt5676: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:39:01 +0000
X-ClientProxiedBy: TYCPR01CA0208.jpnprd01.prod.outlook.com
 (2603:1096:405:7a::16) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB8140:EE_
X-MS-Office365-Filtering-Correlation-Id: c3c13585-5099-4f24-eba8-08dd56065902
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fKoN60j3aXCY2OxJKCRk50vB+rgJIBj0j2RApnOeAtpvbyYEQyf2WkArz/Da?=
 =?us-ascii?Q?kjSDuwZkNwvOhBauyIyMP40vz1Arxu/XycpzH7rWGcBryDe1z4Gj5fgfWOHK?=
 =?us-ascii?Q?22v9KhnX2kEV1wG5cO2fTTqczor5fA9cHu4hE6IieuZksU2yt2u89Z1w0ET0?=
 =?us-ascii?Q?EknbBY+bKu0vP9t2Zr8Ohyx/29W/+KEhpoHQXB4QwKtUXpW2/3ccLwEpNNKb?=
 =?us-ascii?Q?qV21i7ufbEz4y/EgqhCgDu9cr7d+b/VpQ5uh5WMzYyvtMBTqFzhXZKWIVU+m?=
 =?us-ascii?Q?UcIT3RhHe45tw0Fl1yru8bvv0qu+s5syCCM0nU3gYyrVlkArGlhpdryRhaRY?=
 =?us-ascii?Q?tL8pMKtYA6XKfKrw1TD0wuU8oe7+sdS3xshYklyeblyZqpn/WcQmigNbW04u?=
 =?us-ascii?Q?MJK7sgrnEZ9kU3eT5zymMClKcfZ3f99lXcG3kaW09CaVvZxYiLOTWhE348O+?=
 =?us-ascii?Q?YgRCtoTlAQr/ytTYMMrDFWG28dDViTjt788amtq17axv1d1BlX0g3XfHX800?=
 =?us-ascii?Q?0hQJXNu8xOJpYcUVpezpFp0Gitr0BscY+nD7uE6aqTrWsHAucyFKoOlwMvfP?=
 =?us-ascii?Q?xi7EvumEH9uDg2S/Ft/m2B9c+sI8RBzQmMgSajpHj3UMqonWaMz84cWl1BQZ?=
 =?us-ascii?Q?4s8aX1V0Tjm7jW9pIk0tANPZDuPon8swQpBFwvMQIVa43m1k9Ct8JBGa8VNu?=
 =?us-ascii?Q?KnXw53PDQFjtbQ801TtLjW5XYIqn/Egfx11oANNbqQ90pGgBXpREU4GFCX9p?=
 =?us-ascii?Q?JcUC9Z+hJ0hSp01G1YfiD5ppdhkLMnnhwNT/2/TFJbhUy0fjFrxv4Thr8HbZ?=
 =?us-ascii?Q?FkW5BPscTpcE81ns8/ye1Y9RGicIwxhlAygTsPC9PQaCDEnq9XBXZpMbafla?=
 =?us-ascii?Q?RZKmVZAObI2aD3fILGEfyEnqXfXbx62gf2Zk4DZu7ZYBLtugXk86dQ2XwiSK?=
 =?us-ascii?Q?YVtaDs7c6bTNywCBPnl1cwKFKELomsdsr1bm98cD3948RNUz2BlsUhHxgXTs?=
 =?us-ascii?Q?LDi/uISc7xpWvg8s+yw2DrJt3jstgyaT1QK9gWHxb/lYEb5sOhil141J5A/Z?=
 =?us-ascii?Q?NEojV9g6cIyId9vl2NuCoKxR1LTr0BUaEX5y3nF2SEc8UiYvx8Oa0NITD4TE?=
 =?us-ascii?Q?MuRADS/+egTbhXAnhOXIF6EknsWmWgw9e745EQtoTr5nbvh8jOGkA5KrbdQU?=
 =?us-ascii?Q?yK/0HWMFT38nypsGFb3DFBmgYlrMSb6v9J9xWy+vrgHJbx7DNBe3rws4ZThG?=
 =?us-ascii?Q?kjecMk/8lTYiZ23LPK4CkoRptQOUlghKVt698OQSfgeOTQi6YOzeb/h4eAuH?=
 =?us-ascii?Q?EyjXFYWbdFYqc7n/hwRoXpX35X8XLOYsTtMyRqNPlb9PHR/vui1spDCYGCsJ?=
 =?us-ascii?Q?G8xNNTr+FvV43OXA6mTmEFYCcMjSTN5LU/3XjegZmPvzGSCEJZ6KVraTQ2DS?=
 =?us-ascii?Q?/HSuH+kfKcKd/hncVysBgZThIk0vGMSw?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?g37++A4GYrqoXDw9ERqlqMZsZB3YE7dcRaHj5HDDxsIZuy92pyIe8l/eyxMB?=
 =?us-ascii?Q?XGKYu/TZXfHAaK27q7FkXxXEj9xh9Ub+3wzvL/kruHuUQyxDuDNlr6TIrH8c?=
 =?us-ascii?Q?Y/IjzqM1cl4iC3etkrlCf92TRp78zSUb8V2nU61IY/tXyXFfWAO2KEA/ly2D?=
 =?us-ascii?Q?FFsZ65GWbuIO+PZ8JIy1KuxYV/4vIek6qm7n2QpDnG1w2i/IlhxkfwrmkBt/?=
 =?us-ascii?Q?qYDNwmV01iaVZLwKB0ae7gORjb1vbX5/BBx80EjrlaWOBAXQnlzi61lUZsGV?=
 =?us-ascii?Q?4JraXJwC9r00uH+Z0DW2qAN63SP3x7vyDabSkO1sC/qsEIIVLLFIZMFH8CkQ?=
 =?us-ascii?Q?vzWQSEtYQs5zqF8t8XhLM/b1u2VpTD0lU8jX9qaM7ZiFEIOH33q5Ch/fRDGQ?=
 =?us-ascii?Q?G3eOIlagTJydespLv5ZgYlx5Eq4LC6L0zymwlev4ZlgpnGqLRcCV1zKaOnve?=
 =?us-ascii?Q?vpcxcfofhATgCXleduHdpJDrMO5dL3jEHvpCw2crvCmAwn6CBhJxgBrmBNeM?=
 =?us-ascii?Q?TbRS49DJOz1uvFykf8wvS9wbWsLbOML7bBi/eJma/m48BiC5/HBXkPdRqs6J?=
 =?us-ascii?Q?Cd+S2umtR9q5WrJRGFwxhng++42cIvVLCQ48VUWrZhxZTe7VgyZdOhmvSEij?=
 =?us-ascii?Q?15e5+QwrV1i/zM4n+/jCamaRtpmYL7H00sV+XKAHk9tbUvLe7l0QC/0Cs6sH?=
 =?us-ascii?Q?9wnyfRlOp1cNXHJ6s9cXyj9bE18/6EWRKC+nUS3kN54URqRseUE8oOMCPLJM?=
 =?us-ascii?Q?tORulbawyRtsdHBcNhB2iK51SKUh8M7ZKyjMC18OEbfHEKYdsyFp2tNkmRWl?=
 =?us-ascii?Q?QKl0tEArtSS9OYL9MiZquWbjYk/QttNJFzJdzYE5+09HFxYeS/z76YVWD03F?=
 =?us-ascii?Q?IyE3M730exUeIRTBqsqINCBk0uypLzihyns8sU4m8WWo3QAtHB25K6COc5fU?=
 =?us-ascii?Q?Z7oaRa+QVU4DSJDFP0BGdbrBqfEYsLfKbOPoSCHocpDb8+kUcRVwjG7CDhN2?=
 =?us-ascii?Q?yMPPbvh3MKdPw3LQ6fFnxBS2FNvQefvCn6WDEdAtnXjCcgDeilWv3MY1f64/?=
 =?us-ascii?Q?kQuPYpxE0h228UclltIb1dLQ3WlyBSXdSPH4bvtirQAdPK9tXsfIAeK0A1hR?=
 =?us-ascii?Q?OHFGYh2M020HFVQbLkUHIbp+1YSOmv5VUOxbA+omUL2vX9DzlL4zxkR2YiY6?=
 =?us-ascii?Q?l9ktc1iJgnxv08sZ+g6ooE7aDX6kjpo3I4eetECDlIHkrW+e1jGzcseCdKi8?=
 =?us-ascii?Q?uRfPltec+xwgcUQlGO9p67qJQ6VLtpgCCb0JhmGH0g82oTJRzQbzRXG5sfFu?=
 =?us-ascii?Q?R568a1A7f+QyaiUE4sF8WUm8XFUH142eB/RUba5saaRIXIYE12nRrvDD37u9?=
 =?us-ascii?Q?zPIAYdeKAWsdeufOxVWbtgIY8dkdLIV4lV9I7Tpy/fQ3vKJ0yDuaa5C2snmk?=
 =?us-ascii?Q?vOEAXifmDd7C+liiSiO/cq790LLmeK/gl/fRZB3U+A/TDdHgme4cqc0ZXB6T?=
 =?us-ascii?Q?bI6i2Jwr2lIxXCZzs3pXQIp7gktIknZgmfZZS7pCsdInPGTxvRRL2z7/TeOj?=
 =?us-ascii?Q?EjHMpXvN+IVYn6k4HTRIc/fbZzJSRA4lNwQiCdcvE0dFiXXy/OEPtriRCwo0?=
 =?us-ascii?Q?bHno+C4DBC0I/hLr9LJJp7w=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3c13585-5099-4f24-eba8-08dd56065902
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:39:02.1231
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1ftsYuYsAaL3wdw0BRFMwZPAWjdrHQ+4eptgsY/oXbpsSebFh9qccxugxxuaQkNL/J4mMm5AmAzuuRQ2WOJ6mz2Y5M6szutBeP0Esa+ELy1qCS+ivEUQhCR9jxHkeeeb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8140

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/mediatek/mt8173/mt8173-rt5650-rt5676.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5676.c b/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5676.c
index 488f2314dbf7..a1ba5df87e1e 100644
--- a/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5676.c
+++ b/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5676.c
@@ -197,7 +197,7 @@ static struct snd_soc_dai_link mt8173_rt5650_rt5676_dais[] = {
 		.no_pcm = 1,
 		.init = mt8173_rt5650_rt5676_init,
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
-			   SND_SOC_DAIFMT_CBS_CFS,
+			   SND_SOC_DAIFMT_CBC_CFC,
 		.ops = &mt8173_rt5650_rt5676_ops,
 		.ignore_pmdown_time = 1,
 		SND_SOC_DAILINK_REG(codec),
@@ -214,7 +214,7 @@ static struct snd_soc_dai_link mt8173_rt5650_rt5676_dais[] = {
 		.stream_name = "rt5650_rt5676 intercodec",
 		.no_pcm = 1,
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
-			   SND_SOC_DAIFMT_CBM_CFM,
+			   SND_SOC_DAIFMT_CBP_CFP,
 		SND_SOC_DAILINK_REG(intercodec),
 	},
 };
-- 
2.43.0

