Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011020.outbound.protection.outlook.com [52.101.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C05D2E717C;
	Wed,  3 Dec 2025 10:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764756391; cv=fail; b=KWRCtCHidZdCe80eqYz9zaBAQtLb7WtR4yorcm20CX2B2akKaTb/fk6otAI4XxJFTMIYPC0hLZIOH8LmcNbtJ/VjhigIuV3bSmRv4eky7FoFFeH5xH4BUDSAFQgzDURLjRjqHIkybz0j/UvZ95PPZkdN5Ht3evGW7o8YMILAZX0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764756391; c=relaxed/simple;
	bh=WnO+YNQ3F16Gk2wGGnQRemzEet5JJ/qzpWnVXUsiu80=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=X+9/iHzQes5QSJ5RArRWpF+hnnQUdfAq+PSvhcxK3+SC2TejhU6I6CUhYLzjCKwXZwMB728nWUpZ1OpjR268dML6N8NPuhkEF1aWO/v04N9zIs4SlWixXgMAkvNziKAmGqc+4JbHgHFm96xtrl92Mbgg/HVfTM0kyOg/9CcIavs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=b3E7JTz2; arc=fail smtp.client-ip=52.101.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="b3E7JTz2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IoTDF0y6ivnVi44A/YEoS4XvremCmeMfWZfM7te9oLJdbjKhcTJC2pUUZM2Q+w6guqSeyQF7MOVOly23bvogu2FhsOYtC3Xfup5RViUgZDmdh4bhG7IREIj9lip1IoEqXNcDeNFO/YsWUOyFjc0N8mZusbQygt9BnapzyY3YbXjwgPYZSjMYIefoDVM71KUDqwg1AgY4YbQwQw2hB6aP7dFv+V4bN4LreGprhbGmlouKehj6LSTJoqUIW/OjgqL29pluNBrCnmvePP+yXImEJm5fHLS8CcJC+zBP5hCS+a0DCw5AOeLgdJcAj81+TdZ0yqM7Bg8U8/N260VGkwTK/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MSe3cUBDh7flVAYKIPywUUoHJB28l05Z9djwEzRggkY=;
 b=kBHj41zz2VPH8xKWuWiBB8YScwZHyblmRp5mZCAuoiPfDDI3y2fKI9vIb2ny7FGaPtDHaSgFm6UPHh6xFZaFWpQT6f8tHZJodiyRCty4MOhp2Cg8Ovy/wPueRSEyh4DP/9uPBE1uMQsNSWy21FC8uGHO7I1lHuv39Yjf+wVf49jeVZeuQ/p6/TbDKl1INAJ2NfIzOEaAWG2RmH5U+eGRXSIz1aCTPS32HOVO7NyXsjUmEdfba2mfoxyN18hvy495Y+j+LLsDpEiMBEmn3ifGmNZKnXYOynQUJT//XyQdlSAar/4+KKtH55GHMC3nwqOIc9ONIR7+tk9XKU26V9ok/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MSe3cUBDh7flVAYKIPywUUoHJB28l05Z9djwEzRggkY=;
 b=b3E7JTz25cZIM/ESbLiSVMPYXaVe3hvDMUPaWjtgj7UdS+aLYyHECmva5YFfm6NFrXtRDZkHN1ZXIRVJdjn5pUXogpQM8j4p6/mexXjVHbeSJ8JUO0wGxokjUkTOIDqZhvSG73420S3qIAK9x2yt11vz+NrfiMGfy6CkYU3AFMOqobPkb6YMODrZyqMi/p6iTePLxYhCq98WvSh/AHs+ZATcUwVNvdMaSwuSOc7HCKqB1bV8wAD/54u9NObAM+lyTMtUSm8sRaTQjQDGuZfiYW/35BABuk9yATigPEIqhYWbCp5xpRE93NscsMzQyiwfM8k0z1IsRsHdjEPQU6KvBQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by DU4PR04MB10766.eurprd04.prod.outlook.com (2603:10a6:10:587::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Wed, 3 Dec
 2025 10:06:27 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b%7]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 10:06:27 +0000
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
Subject: [PATCH v2 1/2] ASoC: ak4458: Disable regulator when error happens
Date: Wed,  3 Dec 2025 18:05:28 +0800
Message-Id: <20251203100529.3841203-2-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20251203100529.3841203-1-shengjiu.wang@nxp.com>
References: <20251203100529.3841203-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0119.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::23) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|DU4PR04MB10766:EE_
X-MS-Office365-Filtering-Correlation-Id: cebd18a3-6377-4ce8-ba4c-08de32539f91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|19092799006|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?uBXD4GaG/8+nK9RqcXyiGAhju2O/zMfFRW/3nmU/z1eUkZwZ/6zmB5l9wu3q?=
 =?us-ascii?Q?tuV97Xe7OHyR7QAKliySqDJ0+i32pj05RX84grYvdT0JOWwWanwYz2aYRoaj?=
 =?us-ascii?Q?F5LX1QHSnsk+TaD4vgK6qAE4oWF1FP+G7ISp2zrCdEEwyEJ7vbZTvBdWsCtI?=
 =?us-ascii?Q?8l7tMkXy5FEBWbtalrye/oAos4LogaDzyIRu76eeaM0OqIip0xdi6YxJC1RV?=
 =?us-ascii?Q?o93q6iLK5OAxE19hwPC4A2IIAKC51Cyfvw7TCUhw9yY1jo5O+XRaSccWTpSg?=
 =?us-ascii?Q?3ZkQfMAAueai/VXAMZN3GmRWXtNBfUhcxaYBxeqF2fBD0hEj+qBlk5kMG1cV?=
 =?us-ascii?Q?7+lI0Nct/8ZlGSjg5Z89Taok9jrdhzDYGtfVgo1mXi3l3HIP959r0aB4LJrr?=
 =?us-ascii?Q?oQPNZDHhC64Pv6UUtezGARktN9ksHshDVtXXIgvY34kLHi010UowwblOHxwt?=
 =?us-ascii?Q?Vp4wVBs/0z+1chQ6LWS6CSvZ3sOERFojc/2+9PdUiiGTko95uGXL5uW4veYT?=
 =?us-ascii?Q?N1GWDMlbvVq4/wa/9eZN4J2of6EUkWQvGkhc0IzuTpEqd5HHX93ePBAdrvtj?=
 =?us-ascii?Q?R8neH1fwSYv0s3+WGCudfzyq1tKHKVbt8SZILL/BSIX3tFLdTjAXxTjaWWs8?=
 =?us-ascii?Q?LvARPf40+K9GM3+RzLbb0/W/9bgyQ7A+UPnXSIUOb+bpORQ7uAQxj0MmRXSs?=
 =?us-ascii?Q?oq41oQfx/9ITJPRp7ZKXUgK4G8oVG1pJ/IYS+6v8g70zOi8628tlpOJO6YMF?=
 =?us-ascii?Q?4rrSX/PeYdpD0z6N6e/5uTgDTpTWRCwp89MsZ6I8FVrXi6R3QO3pf5Pgt70l?=
 =?us-ascii?Q?pOB9mWuy3heigsdiPKnyKBY42JF8dgp+UnaUjVYtBzzCae5M+BoftQMRQBRh?=
 =?us-ascii?Q?Od0RQucIoOy4D7dTYfkXCy99/kzWjuL0EzSJ+bYR3+lxHHmKepfNVKvGaU1L?=
 =?us-ascii?Q?SkuqmR+NJ/WE5K54Arg1g3FztbxvQoK+r+MkKajanhNM5qvJAy2wlT3sjG+X?=
 =?us-ascii?Q?ehvFe+cHb34/VmpBxXBN9wfcFyi57Vz3mhwgMc9kUKpI4EEGh1AaNQjGHEd9?=
 =?us-ascii?Q?wpDkdvoUXwOEtvNVM4UoqEMzWbrbc4byPGsDDDnFfjTFoKg0BXnGsQfL4Pes?=
 =?us-ascii?Q?iA8Ll9mAlAWkSwh4UBB6IJfQvUZWSIolHz/JL6ZY4h28d7HHKOELiIbDauIP?=
 =?us-ascii?Q?VjoMj0/rFQsA7MVJ9L3nJ0WG1lPZ3DFJeh/gn+sgD3vWeJemeaHjlkEtELMq?=
 =?us-ascii?Q?k6KOx/a6zNkMEXJrny4xQ4f30QP/eWI4za4wxiPOkCFHkfo9x8KeAk3ruCfR?=
 =?us-ascii?Q?XyQoHvcPNkgzhE22UW2NZ0y2fAlHFmO1o0+h81/h5DXFUZlpkIARYF3kgVI4?=
 =?us-ascii?Q?qKa2zVECWyhtHutie23FlNMXNJmpj+deGpWwelcHWIzcWypLLCR0UY79IMai?=
 =?us-ascii?Q?YKoXa4ljDBgPCyNODBUeFQxjzDD2DM0gmQU8Amdui7mJ8YwFMdYCyouw0Nu0?=
 =?us-ascii?Q?w2NGKfsHb6pvkARWFaKIX0hUr/oJQ12F08ByoouHDVlZ61/U+tORysNxOA?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(19092799006)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qxVKTrm5Zhc4d4ceWoKM9d/1DsI9Sz0elB12bzhNsQ3eUBlfDXdb2OC3QDsx?=
 =?us-ascii?Q?u9bMcZ5uDxmgUrfNWERz9vL2Tbu5I+64quY2RqVjGJtI2feKDDDUvZhwhyBJ?=
 =?us-ascii?Q?nrlHdJ1uV2FXo/y/5M4e1bgkeuvP61fE+7BA1cs6pAF+QMSJ8MbWwR8MxnkF?=
 =?us-ascii?Q?OqxiBQ4aJe+GH7o2RboKDL2efzIwHc/jBk0HQmUOg1oFMq9BrpB3cBMxHJGi?=
 =?us-ascii?Q?g8tJEkIRu6ZuJPcRxAEOX4WllhgevDMCJNHF1Y9VIU4YQAqnD4t+UtFMW0DK?=
 =?us-ascii?Q?38SGr557gZc6zafQuG4pIsCCV8xoQ5A/WHy5HU2XrySGcNVFVPscj9dV017X?=
 =?us-ascii?Q?Zdnq6nejBDCdbnR8CA3S1u0PVPjNxnu6SgATt4nvO6nvpX/ArY3LwpHshEDM?=
 =?us-ascii?Q?1UkRpZj06eiFZHxJAdWYC7+dLp+yENjXYSFGoZlo0hB7AVP2nNEqejc3YLrp?=
 =?us-ascii?Q?Qquu174G3gF15ttgOjutIIyhlvjZtJx5COUIN7YIPr90KhTfS2/JQwAzMvHY?=
 =?us-ascii?Q?kW35mR6gXNvjlqbrtr6EiQ4wJfAdVJGsUT3v7uCey8HTakhfq7by1rEDucp8?=
 =?us-ascii?Q?9R5AzbL7a3Xc4c4Pmg1GEyosO9GwfKkvUCXtsGbu765ecJwoUdXfpBlX+mmR?=
 =?us-ascii?Q?HOyTfQhMiNzmekrf6UrG6tBJf7RyQQCG1g4m4ElWyiKbU+x50Gpnn7ers0iO?=
 =?us-ascii?Q?0pwFVTmjdYcm1pEzARBj/bMrimyg3AyoHx/gPT7RETVjDF4BemKZ7fYSt/m/?=
 =?us-ascii?Q?oTyjpGhs2miHfDFB6rofs5CkttolEOVQ+xMyESkjKV4gBNxz162LXtgs+HJe?=
 =?us-ascii?Q?EoJfDO3TJMVojuNFtjDHHhrv4dgpcngeE1J8sZxMexliIif/CIkq/klVVxcb?=
 =?us-ascii?Q?8Ut7SFJVCFTN8U6NJ8kHumhpSfEPq/ll0H3m4/tq4wryw6SeaqbPAIIj6uc0?=
 =?us-ascii?Q?P+7zXn1znTcl2cPp2IZFmUyUzBJ2K793NlScNA1/YiIaeDaCDWjPZvU8Grts?=
 =?us-ascii?Q?0NPl9bpdaUdEod8vVHK6vGF6Jd1+8LlPybwuXHCeoTmY1z+Ps/jXDqAzfYRu?=
 =?us-ascii?Q?d9dzYHNlpa7fzC8DjHZFjJES73vSauIAtAkgUaWxxMdJe4+XxNGFHwwGkULX?=
 =?us-ascii?Q?LeCy5oE+LdY1D00T4xKdzozi6i2b3R6Lp2bSrL0zbyP6zXNYwJgUirP7ztC8?=
 =?us-ascii?Q?/TFv6YZ3y2t/EKOziG4uExcUI3axUCFCKfMroOC+AiLCEFoJjFvtrPEQNMWN?=
 =?us-ascii?Q?uMqjfArrnEKYGKVIpOC23QPMgp+wrRZZdVG68wkOb2pxn/RNfhFbK5hDfHX1?=
 =?us-ascii?Q?6AhREkvVrdA6wlM/kJDphManqVJe+myirC/30XEWQHoTsswx4mnDSzUcDBmU?=
 =?us-ascii?Q?1PzC1n4pEqEC5gkhXw9lVRDMZ1xTLcLkMpQXUr+KzE9oFuWlNe4qHA1SxSLk?=
 =?us-ascii?Q?uNofjOe8UR9YedyhbfolLG8km5xKkNKQNC1MCDPNVszKcge9LkIiHq9H6qwO?=
 =?us-ascii?Q?kpt8dmUVSapaWz4ftMGUQNOU6zdGyBmEy54OBv2ZBHh2ExmMG3oaOezX0Lb+?=
 =?us-ascii?Q?rzkMlfhg8SBQ1jdnCnKbeZLpJXdJR/PGLhbQszHu?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cebd18a3-6377-4ce8-ba4c-08de32539f91
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 10:06:27.7476
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m5f7WSiMJJRsMFj3C4A0dkm2PJJoWY35JYdcCBmrdrzy7dL/6VEf9Wviyh2E4KIIxX29wBMSxR1Vz/5PxB+mjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10766

Disable regulator in runtime resume when error happens to balance
the reference count of regulator.

Fixes: 7e3096e8f823 ("ASoC: ak4458: Add regulator support")
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/codecs/ak4458.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/ak4458.c b/sound/soc/codecs/ak4458.c
index 893071d7a57f..f81cd8cebdd8 100644
--- a/sound/soc/codecs/ak4458.c
+++ b/sound/soc/codecs/ak4458.c
@@ -671,7 +671,15 @@ static int ak4458_runtime_resume(struct device *dev)
 	regcache_cache_only(ak4458->regmap, false);
 	regcache_mark_dirty(ak4458->regmap);
 
-	return regcache_sync(ak4458->regmap);
+	ret = regcache_sync(ak4458->regmap);
+	if (ret)
+		goto err;
+
+	return 0;
+err:
+	regcache_cache_only(ak4458->regmap, true);
+	regulator_bulk_disable(ARRAY_SIZE(ak4458->supplies), ak4458->supplies);
+	return ret;
 }
 
 static const struct snd_soc_component_driver soc_codec_dev_ak4458 = {
-- 
2.34.1

