Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011028.outbound.protection.outlook.com [52.101.125.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D3D2472AE
	for <linux-sound@vger.kernel.org>; Mon, 14 Sep 2026 01:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789350214; cv=fail; b=U8jpMUDxr4pbsKfaNkC8I/A5+WEkV6Y8lK4oSi2/ekfZlJ2yxeStr3thFGSNqz8mnlbSp7h4dIYy8ZuJLu0G6uVltrOhJ9JJAj5riWARCuGSPHnqQVvHWOY2Mm7ZMS+HakXzrESvzPeQlBcSNkY5gMnBZxn6OBOoCbNNh+LLTCw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789350214; c=relaxed/simple;
	bh=xZN7zhcq6GO0pHZ/1W3bzZQ+tKhqwdxwwJmc8LYyHuI=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=ell3cFdpCWas33ZgxHaKAv0pO8SZCcD/MbQWq+CZBvxE3I1/RUcpKq6ybhFimVvvWpc7ZDuegZgPyv4SLeCuH9Mo7yYAl+llP3iTPW3IlLUqSXFDV6L1aeWLBfxCbufPGvGN8hmMUjpRCpOteI0WahTJwAMe7wx07+E0k0ppqtc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=mYtWQe0l; arc=fail smtp.client-ip=52.101.125.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="mYtWQe0l"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UsUKabAXY8lXn27HVpiSHC9byVDpU+w4d0C6NCQ8Xd9w49PbX55X2YWglSKDvBpFcTGgaryKcMf9PxEE9CwbI1e4xb5s5QZKJugOw+/26wpFk+86Bx1IuIYOUUFWGVogHB4FBC4Atv4msDqmWKydL03i+xCMROz9GvFRdpKVM2ZanrmPCO/AsOz305dXZoWzuLIoPWml9Rl9+evc9ktBkqADUGtG20+DWZxlj2ti9ZiZ4HAfUQLlH2VPqef+jEQBitrHq/DL7aF+/KL+spoAgIbnRP8oeelZ6/tUq8kfbrdL8B9KnqaRgIgH4CfjKeu2MCF9f7DPHtbSNIY2d0dJwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Lfw0j86WIoygUy2nN7kLGSRf3M+yHqeX0iayVkN1bI=;
 b=Lv2el6sIMmO7JFL558sHbBfD8BTcs/RnuNjpHYHNYuDq2L1rog5JOHpyUvwpKl7769YtyUmcWxRRht87kWO9V8oBjB39j2lHxaQ0qmFtjgqVw4NqjrhfWyoVW3Xo5uCSOMGRT0t4t/4Z5YJZRhVytgtWyDOrigAiOBB9WIUf4E3Nbig6mkzt3tFBm6SxaeXjcOUgMuKGsslSY9rA11wEqBOnrpi6UlAIay6w3dUQNNVTpstRi+1ZHL9wI1h9xmTQSqD+0MMBHg1ioV0IflFImanH4fCp8W3VrAShjQijWdC7jOA/9lQo6byEgHIMr1UQbDH55FuiyKGpvtfIQaZIMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Lfw0j86WIoygUy2nN7kLGSRf3M+yHqeX0iayVkN1bI=;
 b=mYtWQe0lnQieqrKytK8KZHFTKPfFThGQ63fIwqXiVFJYLFGdtmPfhj/bWwKnXWl/jtIMNe0AGFVG2L1v21WZOFoTHLzzYFdDFNCKWFmzDrbpnvg9S67gg9mUQ2xjusQV3VzJ6RSQmsufSrxxRONx8X5lw1a3QN3U0Oq8m/Hfwgs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12) by TY7PR01MB17747.jpnprd01.prod.outlook.com
 (2603:1096:405:38d::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 01:43:30 +0000
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45]) by TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45%6]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 01:43:30 +0000
Message-ID: <87o6e0li9q.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 02/10] ASoC: soc-dai: add snd_soc_dai_to_component()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87qziwliaj.wl-kuninori.morimoto.gx@renesas.com>
References: <87qziwliaj.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 14 Sep 2026 01:43:29 +0000
X-ClientProxiedBy: TY4P301CA0029.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:2be::12) To TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB14118:EE_|TY7PR01MB17747:EE_
X-MS-Office365-Filtering-Correlation-Id: 200ff323-f506-4154-8fa3-08df1201941b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|23010399003|1800799024|366016|38350700014|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	DYfSYuKHi6G20vS21ub+TZKbAO/A8B9pzP7jO4J9ufZs4zWLLTz+D2xABjtvjpHaKqd2DI35B4xkU17PDZc6yPKLGnxR1k8dZd8mSDhVujwIUJHTygYKJcye8dDEaaSvKhK5ct2radG/X0kLGuI2ev8AMTLpUz6aeOCU6v5LhLNLUp9qIUI90hGa2TbGa6BoAmUvmm3hioO/T6doMCzx60Jje5zcblDVk63d9mEw4zsVGzJmATtbVCHMF3N5TNVH3lJKudlFmj7fv49k8hNFeW0BXp6KCFCOJT0HdsNpzvkgFirwjvRuF1b8905Q658PdHHREIvc/TPKN6fW7nzcdnNjXqKJWqhU4/5LvwAiWlneyhG1LMtbow9KJ062/izXOuKTd7dCaIg4r/ktV5CF0qRNbE9jvyXlo9i0YPU5DuEvj+Pa8X9rsWgLq4h9HNvNddgVgfy93NxQtfdVMLT2X+vrQChItwvLWMHv7Dx7WOpfY/5/mXSBW0yyPBzeunS6VpV9vjL9g8WJVUydybvmAbxUogqqnA5fB/KRKMV6yQr/j4ZV21YaHypr4ny3BeeIsNFmVx1FMY0SREAiuNYicqZGrxQMNESih2x92Xyv78735hbxDwukZbueM6/vHZqR+n+iQe/EcdUlmwQrvQ8R5HobB2gmVfNDRksfryiHETUMWlij8OsnHen9CPHtNjpDvmXtT4yxByLvBAhXCKZfGZlpgp8AlfWsERS3pNuH3rc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB14118.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(23010399003)(1800799024)(366016)(38350700014)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?oErVlKfZgHFcfLOmjCEi9EcFw/9FY2Xq0ked7OVHsMzHx9yDwc8GMoEwGAX2?=
 =?us-ascii?Q?RVK/64jTnEzL5fgf7yb8q4FKNN7GMFe9d/s9/0Qe/CYAgmkFswxLoZm7HSMu?=
 =?us-ascii?Q?pGtHBmfH+VkMAUT2oMnNLycbIjjjStlX7SNWS5QKsldIAJ2t7chWbN6wB+fW?=
 =?us-ascii?Q?lDjhCBRVrBcpTaQMyT7Rnr2EvmWrsNqB1FSKuij7JS8CdZOctoT+t/AKKst1?=
 =?us-ascii?Q?hfGwfgdcqJyJYdH1WJ6Ycv9UlGHELaQY0fiQ0j6910S3Y7v3b+WYwKl7BZ5c?=
 =?us-ascii?Q?z4oM8kQDTfmdFwyVX+hnuwrUizKzhIHjlYCX5bVhXWQeJGKIOQmIB6ipg4I1?=
 =?us-ascii?Q?Wnmf39TstgpVj+HuoBv6B7CRh2A0LeAHF+yPR9KI7iFIZepPvLqtYsvpk4WA?=
 =?us-ascii?Q?RR6WB9G216UjDLVnkYBcRSWubWwvV+QG22/OG+cMX8etg1vdEtfrnCyFz1b/?=
 =?us-ascii?Q?RJQ457hs9VkRpNLJ8g5+XNfNaCLtwe7/EVz1l1mPE5g+fwsgCJgIrGRTleRX?=
 =?us-ascii?Q?kKvQ1O/iFqYxFBLEJSIh7UNZRmIm8Kk1fdNrIqvfsftQkM4NgU4E2MBWsf5t?=
 =?us-ascii?Q?+irc42tMOgTT/ZgGydO3qat7IXXv2I13kOZ+sPgZmgKinvCbIjP/Vs6qr047?=
 =?us-ascii?Q?RBkAaTSZqOFmE5tNsP5IIWMxnhNi8f7vT2XthPQyfMzZLZJt+7jVeuokfose?=
 =?us-ascii?Q?/ImcxVfZEnLhiQ9YJKXLDPCTDk37lWfLRSldy/GSItUaFyYNCpcaZgzFxTZu?=
 =?us-ascii?Q?sHW06qJkyEtF6376maq3vzR8b592MlZXib8L3WanSaniV9fCGqWuk+3o4rjw?=
 =?us-ascii?Q?R7nYEGGlf6Jws8c/WegUQqChRxowZNL7buWI7EZvfhP2gxUrsYDB9qRUNWHq?=
 =?us-ascii?Q?JJUTESsg5ya889XCu/pNdS84fyzcwE9zwSdwAmxz9/3m8VwvM0flh+FLRJja?=
 =?us-ascii?Q?RC0w2UPJIdmowTE8EbfbBfxryGJZNxF/cOMRiFJVTY1a+y1Why0LhsWCxJMK?=
 =?us-ascii?Q?esycV95AbHx2Rh69YM733zgUJMZ4Yu7eywIHT5hjrHEuWgwf8FbceMlyfCkE?=
 =?us-ascii?Q?M3JyShHW9ZVT6xae9IQf0CI5wYFRLX78zeWyjGOTrOkcg0a0QYU3HhLN53zk?=
 =?us-ascii?Q?d3zdnAsT+aBjQzEjGB/fx5lOZPg/ubQLWUzv0u4+Ws2jhhpb2MjRoaJERcQi?=
 =?us-ascii?Q?FnzFCaQ84W4Kctm0h9LVjI4KE7LhjqIupLfHQWmnbwQPG7NEflxXzxEMAoRx?=
 =?us-ascii?Q?9kkDTa+gy02/yxl6HZ+WGNkJI5uswVhXCbcMSTGVebm7fMk16r7n3LFP8XFz?=
 =?us-ascii?Q?UYVTx0tSzh+sARul8OvDP6qKPNMVuUQP3WoI3rPx0DLpblFRplTyBmPPJfgT?=
 =?us-ascii?Q?qmt5CSe3XMzFZVtI7jsq5qsekv49EJcTycsPMqjC2YAVSGVETJ1UvGHd12Z7?=
 =?us-ascii?Q?au7QerXD7R7D6RMzsMojIGgJeNB5hYSZpVFyQ/pR2SI8RH7gH4mmAiiZeZKo?=
 =?us-ascii?Q?ZeHNlUjwuc0EBdLTC+6YKMyQo1P0nD1ZdvdhgeJFg3NQUP9O9jDJb7ayBNCd?=
 =?us-ascii?Q?R5w8YCjBXMGTW7LKHa39k6ePfUVeM0MnB5aUFl+2g6h0xPex2DaA0gw/jdB7?=
 =?us-ascii?Q?4GCGGVkw6Nh5MbnTdNqrHvU7Xtnjo+xzhbQ4MdoM3UU6omHJHHsJfUStGQXo?=
 =?us-ascii?Q?yJbDVi5e15J6TAa0s03uPM3FyVfGiAJ9FyUun7jmhCDvkkZhq7VbPA3AabpT?=
 =?us-ascii?Q?w5GLEDgQVNvVZWVc8xd5X3O/Wn8AgJj5ALJMudp5oSCdLeUNhBOY?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 200ff323-f506-4154-8fa3-08df1201941b
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB14118.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 01:43:30.1346
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Uw3nWiW4z/rP+0xU7Cy/ArKaXZ05KzgEaPu0UjnFPKyhlb0X07QEJzyZ84fgTYvv7y4QkkpkuOxy2kqr5le3d9QZHc+sDKiHyGmDT+B6bW8yJFY0NI7H1vIdJD/Qv377
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB17747

DAI parameter will be capsuled soon, will be not enable to access from
each drivers. add snd_soc_dai_to_component() to get component from DAI.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-dai.h | 1 +
 sound/soc/soc-dai.c     | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index 02b52fed97c9e..7f8a64db0dc7f 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -212,6 +212,7 @@ int snd_soc_dai_get_channel_map(const struct snd_soc_dai *dai,
 		unsigned int *tx_num, unsigned int *tx_slot,
 		unsigned int *rx_num, unsigned int *rx_slot);
 
+struct snd_soc_component *snd_soc_dai_to_component(const struct snd_soc_dai *dai);
 int snd_soc_dai_is_dummy(const struct snd_soc_dai *dai);
 int snd_soc_dai_add_controls(struct snd_soc_dai *dai,
 			     const struct snd_kcontrol_new *controls, int num_controls);
diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
index d4c47da75fd27..2027e6b6aca18 100644
--- a/sound/soc/soc-dai.c
+++ b/sound/soc/soc-dai.c
@@ -20,6 +20,12 @@ static inline int _soc_dai_ret(const struct snd_soc_dai *dai,
 			   "at %s() on %s\n", func, dai->name);
 }
 
+struct snd_soc_component *snd_soc_dai_to_component(const struct snd_soc_dai *dai)
+{
+	return dai->component;
+}
+EXPORT_SYMBOL_GPL(snd_soc_dai_to_component);
+
 /*
  * We might want to check substream by using list.
  * In such case, we can update these macros.
-- 
2.53.0

