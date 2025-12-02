Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011057.outbound.protection.outlook.com [52.101.70.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 831B72F691B;
	Tue,  2 Dec 2025 08:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764664571; cv=fail; b=UGz1pOvVxwWrnimX1IH2sB+UBKLCM1MtsEiD3fRcvOhphhl/+4ZsyomQx4G5WVXSUsDigsG7IDNiYPa8HlSbP0iBP4UW3+/QuUtuEWp08FV2IZTD7BWgQtx84dN1xSpXGODWgU/FAZpLT/PY7cjhs6SuJBW29bg6Bva7QdwHg18=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764664571; c=relaxed/simple;
	bh=eiaopQaNDXygzHW2R8GcZfPHV3tAhnkZfXxh6qaA0zc=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CD4C/MSXLh4mB2eBhh3i+dQOR82Sujkupt7s6H8yviWsE59002aySwjJhrSs8atbn/XxiXbJgSpO4vT/kgFDjjR2GIqgO7aWBjvEYNek5+zRZUxouQeajhyCDb8EXFu8ig7vTT3VICMl8aR767lXPxCN5y3CerSvAiTRCsxsgTA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=MIn/V4ot; arc=fail smtp.client-ip=52.101.70.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="MIn/V4ot"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t6q5wSARHFowPHz3RQM9EdnHO9Ae7XgjZgMymgXQ0Uq+OYJdY7E1p1eqLz/k/5E1b4Setr8nsOYBYyixeYpq0wLZXDQwOC/9asXuXq+uIyuE0/WJTC5VSkEVnz4+DJ/yaoUVmgL/Lvr6W5k6BUWziboz6BIRkoNr4yyKMDWbKw71jt8PYkZbhzMBYvaFxEDfiwr2Xt35WD/eEpeDad0oKRL7jhv8TX/6eF/+472dX5STwaRdv6paaAQGvISUlYStKs+FHcQJy1X6OXwSVU3ExdZecOcvlgmtf+53QIYPEUls7SXKfMiPK/PUMg19KKWxNgnC3MzGbBV+dOT45ye2Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2VnDqbHIQcs+o7C4E/HehrGB7v0wrvxYnhZXLHQXq/w=;
 b=tc8hqfoJ9psF+jOX763TkUmLuO3+4KRJjrB+Ty27gJ5U7bMAsGV0iT3KYJbmgP+Ks0Ovno8Xwax0NStGoqdcjz7MxmSUAs8UMiQhz+l32xHCxLSG9gxWuiaAf5599RHYOusaX8un40liYMRetGfsp4bbu9RPiprx+RJLFZUlijEc01n5GVr4ExFsszNh8Y0k/EcFOZCWuhX0AJ+V32ABpxeBeOSyK/U6LA3yB01j+dQ90EJapv3XVuAWIanU/DMj0MDthd7wToB8ACykMQz9AaKOuK+x/N4yAjGAAJNY9kPr4E83ezc7DJMOR3gabQTxeKZ+BDGojEQkbzC+f2GV+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2VnDqbHIQcs+o7C4E/HehrGB7v0wrvxYnhZXLHQXq/w=;
 b=MIn/V4otPN13hH2uSrVgvtt4KFxvgpTgj/JWx1f73j0RV6Qs0BficCNvFQEAlz64096IlkJKPmW2lOy/zgrq7yndzBReJZPcn7NDQy7E4mqFAWUzoZGOsFj1qyeHj1WwfPsCn+Ex94aZ21r/csAFMCWarkVPdcshkANm67sQ+FW0g/1HUFN+yKxJJ5JMw2J5xXAEyjeEvz4SGJ8lRbssB5Cml0DJ/qj2m1qMSGL9cLYQmrulm7eXSkkwO+pendeempmL36KmY/yXFcdf/+bVfuTMCZQDRHoT06696KeCopgG3q4QNLaF8LqhLDUtjoChiexDqrMLAbk7/IxUV/Vc7w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by DB9PR04MB8464.eurprd04.prod.outlook.com (2603:10a6:10:2c1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 08:36:07 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b%7]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 08:36:07 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	andriy.shevchenko@linux.intel.com,
	kuninori.morimoto.gx@renesas.com,
	nichen@iscas.ac.cn,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ckeepax@opensource.cirrus.com
Subject: [PATCH 1/2] ASoC: ak4458: Disable regulator when error happens
Date: Tue,  2 Dec 2025 16:35:34 +0800
Message-Id: <20251202083535.1985714-2-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20251202083535.1985714-1-shengjiu.wang@nxp.com>
References: <20251202083535.1985714-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0024.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::13) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|DB9PR04MB8464:EE_
X-MS-Office365-Filtering-Correlation-Id: 0910614d-4096-46e3-208a-08de317dd674
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|52116014|376014|7416014|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9+SLedgEcf1iK5DEdaHx/OAsBnHLS4o6RblmZ059bqC5ApRnOg7aG8FXMF8r?=
 =?us-ascii?Q?Xe2sRQWq9SF57t4j66BhxcoOFVTrM183XM6KmiDV5lZCRmaFJtyiXzfhLRp6?=
 =?us-ascii?Q?z4qEBFxBsTFCi1ccsZ+p1wCkFifS8OKaEPDKU5Yhl6ktQp5hGGvO7LS980FQ?=
 =?us-ascii?Q?AxwS5B+mbP9HVKmRPOzZw5xeD+LX0Wxm3Gf3H8pWi21ZJH3TveJ30LkKGrMi?=
 =?us-ascii?Q?x1zOjzCFF0dXQlA9FqgcZ3EpbAQCBxYqNynWzf5+7EV5JEsUfbUG/2NBFpxu?=
 =?us-ascii?Q?Avhn06hr/hXbjaa9LHqVm/ng0gmtZm/kVtFAdmcxDS7FhI9jFlNaETXSsYPK?=
 =?us-ascii?Q?liVLe5w9I41rvjJN972PD3Zuf42gpX2/BpMMkBEFHXFYLWR2nb/Cg8F24EaR?=
 =?us-ascii?Q?qRrxVfGVTWpk8hQhwaawREzxYDHJ0NlB3XoWp39+UfA0LthpsLlWtg1cIIhe?=
 =?us-ascii?Q?GEJ44n4+wG0c+5gpePI9X11+lAL4VtGgx542qn8BQ7j6r2XL29wpsM1iprOv?=
 =?us-ascii?Q?pJFXFiuL7G+3bCa3NE3ll9hX5KFTvSB2qZ+qaf4bO1A4c1U1Sql4V30GAsYO?=
 =?us-ascii?Q?8NwTJqBUs/hXwZ8V2SDaQoV6lMMp+jxp9qyWnnuwsa8puz+GHOHwWbFWidzG?=
 =?us-ascii?Q?6394GCLj1FXgbk34MOXAhGGEG/LM6sbzFbwVXRuT4aPnMG+nRluEumWBUiUZ?=
 =?us-ascii?Q?MGxh5BftQwPQKVyVyQGAIcoe8KJY1altaHGhKwpDGce4z1FUlqQOHrICrvK+?=
 =?us-ascii?Q?aiRTrt+KK9Rg4Dphpiw9ihfMdiH08vxTwmWJ+snAcQkBKF4dSxztyGD6OfOL?=
 =?us-ascii?Q?x+x1lKuXt8SWpHGls6uW9avmXOxbAqNHBkTbyx3lscXfVfZR2CJDvDUcds3A?=
 =?us-ascii?Q?d/TUf/I3GPgjdQXwcOvNUfHm5ONh1a/+bhEEFdNtEcJbXfrPXffnnfrRGMwR?=
 =?us-ascii?Q?B4+zRwctmv4xl9Bo6nfszNwi0U+c1W81gAMhDpe9JTmNxXNE6anzwQf2juJV?=
 =?us-ascii?Q?8yrii5D0fcar4GOA1GESPBYVMdS15mMo37ol8HzdLkVISoabxEJ9tas0wh8+?=
 =?us-ascii?Q?TnVx4oFS3JB2teDkwVszFNkQ4kqBCm/JzuwLoYgsmdgDS0Eagiff0gXOvDxY?=
 =?us-ascii?Q?aCJutOro3Ue87q192nMwGYvcWhZX7M2EIFzIq32ZFm0hzSgmwovBzVEi1JHl?=
 =?us-ascii?Q?hoqGrmDSNhkt/ohfDVn2DQ5CBN9AXBvYQt+Lcy2h0azNhVV5V+XKZBjID6UF?=
 =?us-ascii?Q?8/zZW4KNkQR4W0INuwJs+m2RqZK5Lx2+frr0HX9CfsK1Y2kSgS9784nlyUFX?=
 =?us-ascii?Q?3NwrNK3Ois8j109y1Yi/SRI5BOCo1faaQN03mkuPqROfy4BDLX7XYsVyz07Z?=
 =?us-ascii?Q?3IcRcBV7frAlZHuqKULJuwoS/93+Tuz8eHvHIweh0iYBN/Y/+udbmLCVCksR?=
 =?us-ascii?Q?nTjBROHGugSxlH5DC7j4wgueoxinnHBtXfXwjv90uESUCUwnfUYLBblDKeQH?=
 =?us-ascii?Q?pq/IWYLJBy01AVBk8+A4FLWyKgNtlV6eWKP2djAUxWSmMp8JJKedHVcCIQ?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(52116014)(376014)(7416014)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?73/mHs00gC975eKr486WWjYyb3AqPEAAcuhgPfmKMCKOWIDJ3tIVJqZtJQKs?=
 =?us-ascii?Q?H7gSbKLxJuSOerr74MWkPIzCs9ZHcXsHPdW6HUCHIikFUfBCPiy5T6jN9gPZ?=
 =?us-ascii?Q?5wVGLwxxL1U9Mz5WrhimUjbC7QIvixhZeQYnCaVFheEGh1buV1XNmCP8ioY+?=
 =?us-ascii?Q?TiblQcJrbLNRp7cRnvriOVqeXJTd+An4zIDtZoPg+Md1uDP4tdgjs1vO+M/f?=
 =?us-ascii?Q?Kgrikd58laJIw1Kl6weWNpX4mEKlE/FZeUNUkI+qUJtJ8eme47SEPR1ZRDxk?=
 =?us-ascii?Q?1EgA2mq+egBB5Jff6GRNs2Sj3LVZsjRv1EUwVxSmkwkKwRdQ9l/Ei8cIa85X?=
 =?us-ascii?Q?94WiZYAROzI0XXyOFArOfxAx+yA4Cp8GsqT0LTRselyP8W8XysOj+W0yfYss?=
 =?us-ascii?Q?Z1IVU27xFZdcmmXID7qjAzGFQmTdrBYyOXioGKbq0rPlA0WoRX8F4VLugE+J?=
 =?us-ascii?Q?udf7ExMxbdeagPjOMaj4N9Il8apO+emDeazlvpkXcygSXNm1iSI+r5mQzlKx?=
 =?us-ascii?Q?e6iC2CmGZzBtWtzJTEDA5XGpHwtHoYhYc0vk1MpAR28e866HJOmzDilbSz+F?=
 =?us-ascii?Q?9awfsdETvWVfaZsR/fu6txb36eRcO67GNfOhL09m5M25+JHtOhfy3wYC6Aht?=
 =?us-ascii?Q?WxVzX6mT6QIB2MEu5oFGBcUKDnuNTf5ljx1SZUX1OPLiiZOB+gxf9swpGu5h?=
 =?us-ascii?Q?5qVYgi44St1wmKEQhJcbnjxCBKzEt1BvclgrrgipBRi1GHoYS0Xjo+J9VMrx?=
 =?us-ascii?Q?DltXt7qFD+efw17kpEGCfWP2qqsdt0SOvbKZci9DTwiCR8rOjZhDPbLnAGMj?=
 =?us-ascii?Q?Te4OeFSs4Snq8Mz4NlPo4bXi2f+v1BIOz06jGCL/6AStW7bEWYC0VEyarlJM?=
 =?us-ascii?Q?+QtFRUCI0jDqmlMZ3Mi0D47GcQxp5ShArQDdS+DZ/mal3ExEu0E2wKssuHN8?=
 =?us-ascii?Q?l3vA5F4VrO4U+QDOi9x+LPn3T6XwG2EWFr4OaVL879Q96PR7HJ0HnSPL9fc1?=
 =?us-ascii?Q?WKfgGta8lH1F+NzwqJoSoMzpN26pDfE7iJfGnPR9e/NSo15CgV9PjZ7OTvpg?=
 =?us-ascii?Q?RGT7sw4Tg9viTq/do8580jCRxxbeM2xAdH3e8d3/+Ivn9w3ls7rypBY56p4t?=
 =?us-ascii?Q?YJr6Zyf70d68GjEKYhPayaGRBlCq0kLu/DWREcXfpy/TbomLOi2TOCmKPWWO?=
 =?us-ascii?Q?yaTw7IHHlL5yf+2bf8nazQnIBCbr0qgFRVdjnCQwdpl0gE4W/RUBfZ+ngpQ+?=
 =?us-ascii?Q?J1JcbeXS5X5AqZBJEa/t6/QIQSNFW340ygumoFxjjUKKXo2TTQNaVoMeFML7?=
 =?us-ascii?Q?VTLqjvkdZc0dNGCTmpLAdsLvFzrby32bJMOmFbaVQQ3q6Xb5bLvrimLY5exb?=
 =?us-ascii?Q?ixVG0DAiM3mbgc6CjVNT46jDTMDY4Q99XXluZSklvXE6nqhgeVxXg6/Y+Xd2?=
 =?us-ascii?Q?T/cmdPDWgjjh3P2wUbIx4UUnTlydytQDLs6zXU7N2RYA1SkY7ZN64XZOtmop?=
 =?us-ascii?Q?0hjp4xmZ93lWiWnsaeHRsaJf8IjrFRil2hYZOPkgs5h/6xyw7pWGH7aTdrg4?=
 =?us-ascii?Q?wGiCB0te6lkwlv2bZ98w7/7StQ0qH4yzoIOT60m+?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0910614d-4096-46e3-208a-08de317dd674
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 08:36:07.5818
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z0+OnORRE8pUe6lBZdswUDsyCykXheJ1Xt+/MOGgbqaaavDyo5LjpIoWgOjXMBeRPUKoWdomswHV3H0m1kwthA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8464

Disable regulator in runtime resume when error happens to balance
the reference count of regulator.

Fixes: 7e3096e8f823 ("ASoC: ak4458: Add regulator support")
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/codecs/ak4458.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/ak4458.c b/sound/soc/codecs/ak4458.c
index 893071d7a57f..dab38d1cbaca 100644
--- a/sound/soc/codecs/ak4458.c
+++ b/sound/soc/codecs/ak4458.c
@@ -671,7 +671,14 @@ static int ak4458_runtime_resume(struct device *dev)
 	regcache_cache_only(ak4458->regmap, false);
 	regcache_mark_dirty(ak4458->regmap);
 
-	return regcache_sync(ak4458->regmap);
+	ret = regcache_sync(ak4458->regmap);
+	if (ret)
+		goto err;
+
+	return 0;
+err:
+	regulator_bulk_disable(ARRAY_SIZE(ak4458->supplies), ak4458->supplies);
+	return ret;
 }
 
 static const struct snd_soc_component_driver soc_codec_dev_ak4458 = {
-- 
2.34.1

