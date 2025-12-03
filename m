Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011051.outbound.protection.outlook.com [52.101.65.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F08622E718B;
	Wed,  3 Dec 2025 10:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764756396; cv=fail; b=k8QTs/B1QSe32aFRxfAcacg4hFRj0vq9WCa6vWbyCrLK6JXa092gF3XwgPdMk+vzceixZCv+AidEoKMbfyoyy/KZDVcYkNBuTDX61g2WygcEdpSuzH/jQlUFHsz3esHs3SFJ3k2d1dGIVU4tTrjvdKoiTnGuel4bgWJ1GDmYyeg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764756396; c=relaxed/simple;
	bh=MlBpZjgyRNaKtUT2Ac0x1Blb3+tgJ95dFFczgUqOL6Y=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kY7ntyfF6FRrDmjx4d4rAeIWYw6LD6AMFDpFfLG76xO1ZE1nnzVt+5gtC8ey8MJILTKo2m3TbHLUYkeBfaiox7yPQi5z8ey4XIlfLfRaj5zDjgn3bTf6OU2PmbMe/7VvkNZ4Wz/2gBF4Qg9ghuFLlt7VB/qAIv353tQwBr90ESQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=k8XTbgmM; arc=fail smtp.client-ip=52.101.65.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="k8XTbgmM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uE9zlAToMEdEkzUpsGgCXNqAaPQNK7iLm1nbVFe2qvUJqt2xmcBWuOu2+iiMQ3Bk1s2Of2up2DYPDQJRHshCZjrgbSecs3jpfGsWtztBBBYrSc0w8U1jA3Otvo0RnqmS174bS+OLrj5RzmRL1DBXvuuYQZpre+hfuddZZxemouATz7g08cfZmH7FSJOD8lXb8fz8q5dK6RG8N23sKakVqdcS/+HindegxSQbFCZJkehgQNEQmXCag1erwNLnmkQfYYErS5cEgpDSMUt2HaeemysJDtRLPl1ngE0oUZQ4J2B4IaX2OpJQIopmhu1f3yRcgX6dCfwyfNiqeQHJiGVxRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5LKDr1Lrx7rCB+64Q5ieDFcJXJkkLhXGMKVG0jVkOfg=;
 b=t9K82rW1NtFyNIwwtN+DXm1dGT+C7gei5yLsUfVW2P/P2XIRbJ1HljtGxrzr/TKsOrmrKf0rZmoiMN6Ll08ZolPAfSek3G/m75iCk2XUluCqjnLm6izfXeSxlQvkzRKrsMDDuxJxCapngSlxYmeOA4Wyb9cJ30h52wk4lDLfdF9fcVoT/94Het/TIE+nr0sSk9aI707H3rD2Nzlh76CN2s2MvO6t7iNFCMbnmIPvsFFg0/9nZAPG+KGwGMj1AmpXQnEDwxx1EjVMhGybYORqgJTQEfJePFVbE80aJ/hMQfJXTbN2SzX79QI7TCl4XgQwqMmm5ge0oSd4ia2/WWPuBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5LKDr1Lrx7rCB+64Q5ieDFcJXJkkLhXGMKVG0jVkOfg=;
 b=k8XTbgmM/HDjZPx6w8J+yTqO9EBQIPPqysSlvxhYmVntOx9oQLcBFgcDfiAwwPiiY+uVR8r/PiLpj5F9puxp4o8gSaEnoh7eOmZ7EGq+HrY80H5/Ok+2+tx+O7GvcjJIy4mXhv8pKzavDnLTvS6JuSipb9+WZqSB2+yjaZiW04NY3/TfYTwcMtIxeWPlm7JNQKzhb/GDRgbSr5KDuOsM5WSpq/oLNxWycTvPHPbWX2exXccg0mmLPxnGZkUylTlTXJET18QdVlTGLMV0EPYpDdnElw+Dd2mLWG2XPiW8ffBtcGdlbh1H+ugg/4S2DjRhjmHMp1hg3RVDy1AEBYsZLQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by DU4PR04MB10766.eurprd04.prod.outlook.com (2603:10a6:10:587::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Wed, 3 Dec
 2025 10:06:32 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b%7]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 10:06:32 +0000
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
Subject: [PATCH v2 2/2] ASoC: ak5558: Disable regulator when error happens
Date: Wed,  3 Dec 2025 18:05:29 +0800
Message-Id: <20251203100529.3841203-3-shengjiu.wang@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 2e3db97e-f6a1-4c84-bf53-08de3253a1ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|19092799006|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yr7+tvn205fVOCY7wsjjCnN6fHvPGIJ1FUdfLJSIzUxHaez9PU/iOAPWQusH?=
 =?us-ascii?Q?mZjdmbMpkwE8LwvurYSHaM/LoE+6dzNKAi9FbNp7/XBypSu1MtypIhFSew7V?=
 =?us-ascii?Q?F2obJ6yHyyvcPBaWwHbsucQpOfY8DacWq4h2UVRgVMkjgXVYfScEkrZtvZoQ?=
 =?us-ascii?Q?JtZC2/9k5mto4MB3SgUWiXLvuhCF1YZR2SHSy6aWzThRxnxOvutd3aTmdKtI?=
 =?us-ascii?Q?hKgE3hkyAsbfU9sGfHFZGbJtcyA8kfvxme+SJsX7vL09lOQJWy8BL8h7EGSh?=
 =?us-ascii?Q?nE0cV2I+NM4lfeB/FLYgpKIb3ganXRgpsLW8PUW9Crwf0zmlBHHRvF11E5As?=
 =?us-ascii?Q?XPUjpsn4NsIRSYGV6Q2FE1cJPfg4U4/i95hRr28Vhz5fWR58GeZJPPicpJfm?=
 =?us-ascii?Q?yhE+TRy3jonGU++FR9+xjm007YTcDhvgYSbLeEYbVORfgyTlRb5PDA0hfPoo?=
 =?us-ascii?Q?p5izArz91lynH+8xJB1cDsNHfAwhzKaZupV9jKkLm61j1qQ6+B9nZDx5vltk?=
 =?us-ascii?Q?f7z5Im5t+DTDDJ9TnA53Zud28ImGgMON0+YwdDKASN6+HEGF331aDH5fphdJ?=
 =?us-ascii?Q?s5+QJgQnhrvsrQ0rxU9Eg6w9hgY9LKP3aYgySc/am/mNVgx8oj8/Lv0nb2Bm?=
 =?us-ascii?Q?BVEuMB4TMh0yGHj2F/K+AImPXh5O8zzw+0woI6btz2g1GuDBYeWs/8C8EATv?=
 =?us-ascii?Q?VvLyPmpVRkaksNSrz4uHo+ehqC5Fn6V/p+uvZr0Xykj0iM/gxlw875NW1W8C?=
 =?us-ascii?Q?b4/t5UNiq61IQacComAKnAFcc7hpSSRANLC9jyQfMs1xNlrSDeeVtcega5D7?=
 =?us-ascii?Q?bGaBaBP+W7lq/6N5RWSVUB3HwvihXVdEIk0hGaxM17ueqfCv49qPNf50cEsq?=
 =?us-ascii?Q?diZdtyd+qz30wG0AMUMEObkhbrjBlfzeG20Sqgc8tSsy5ykhbCY8A9FpjYbY?=
 =?us-ascii?Q?mKauYxe3/TUkhxW18qWhXdttCOrqAihZNBBk9KfQ6VphcUTzMJOer+ZbW5qj?=
 =?us-ascii?Q?L/0hwTKs5MYTEIlG1XeBjLEDHl6c7SgA/VczIu20Ova2bet/8v0W5UVti5hM?=
 =?us-ascii?Q?Sb8KGDzKeVz384uMzCBIJm1XS2Ja9QH1ZhY3anukc2/NJmCGycHVaLkNc2bb?=
 =?us-ascii?Q?uDEc7w7daovvpkj5hnCFjgm4IjWzYxJtvA28ur1A2PZbcESe7fqNBSiV6joS?=
 =?us-ascii?Q?IUevTNcUx2L0eX4I0hSgnoqeh3jYOMREkn77PE/zjvFewBZOItigYKkz3ZZJ?=
 =?us-ascii?Q?pCejYHXrK+FvVx3lPmRfIyvddFLrNXKBFlEMSESa43+BXQ4JmZ9t8yl6HtbF?=
 =?us-ascii?Q?DK6QF2yMxUuZCJsaLF6XCavj307EUB8jrAoxHC68cVP7zaS4ObQqVJUjYjMw?=
 =?us-ascii?Q?p+2SDGjahd79EnMflvyV+7tFAnpZ5E6s8Y144I/C+xslewgmROhiGeHi36zj?=
 =?us-ascii?Q?VJKBmX0uYXN2TQSJi8tJqMH46xXQ4AzNMeQw0P7YoLhM5V3JaAbA0aDXa2xx?=
 =?us-ascii?Q?Fgh+Pbd50fmWSkvfLC/9XRhFU3jM1IGFYyxO6r9hlLzLhR46z6Hx9sTkAQ?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(19092799006)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kd7Ffi8plsHqiTh4s3OeSa05Zl1qnsWeZ5KmKAzwtywqAKcpX+ivwr7Thq5K?=
 =?us-ascii?Q?Y7TB9uwtQbjQCUpNgFlVZH4PbPHM0WGRMBAwRe8IYu2sEDqE10YIHMwLKu0O?=
 =?us-ascii?Q?rwEIddRzmWxJEm4ZDO0wDiSzPsoEIVwUjRrgkkAZ3iRb8o7KDO6a1stZkmg4?=
 =?us-ascii?Q?/itnpOfJwJDq1VhjyAZ4Ue+Da87+wcI01LhbOBZ7By6dm9M04eBvlZZ0vEkK?=
 =?us-ascii?Q?xwjZdIiPMJq7AVL/oS0eMkwO6NBQ2pjdAvQId7pyFkoNQwCHPvXEOxvhS+tu?=
 =?us-ascii?Q?I+j7K7qcVJOpcw3zz3rCo0djtxtN8HeZprJObzTlwWciX2jCch7Ip7BC8dE4?=
 =?us-ascii?Q?V8XORBioDEEgUtx4uUNL+h98TAD+NAx9lWEXWvmJ0qatAU0dDd8MXNwF6Pcw?=
 =?us-ascii?Q?t8qoijXbF6honsad7e5d5ixnjVfS4wtuPpFpE2w1lomDJPhSBPS4eyMrd92V?=
 =?us-ascii?Q?g7LLnHe7uBetVJeJNzwIbVxd6iUTIquV4cp+s9g9djNKVmisPpDxplRNeofp?=
 =?us-ascii?Q?h6ZpFIvzQfFu2ZIyUN32lELLvbTStPdd7e5budRKIbXgBJmxeSHXnHGF0gUM?=
 =?us-ascii?Q?vhOXbfUPzxDAygSq7zGx7oSpmGgOBoim8JwdmOZesw0hSO3U4qmporLrfetK?=
 =?us-ascii?Q?E5FmdV0g0SL+pCeIphNVH3CxPcCrvLTqyYl01Cjs+kYPAq6+SU5TziEqtmV7?=
 =?us-ascii?Q?tKCEwYbTRlwRF9U+F82FfZS1ldjF8GmGrcUaZdGsKoteKHPekbwig1cCZHdr?=
 =?us-ascii?Q?eh7omYSgawGYbtfobs0DjxiN4EU24O5Yn4iphQ8o2xA5tc4nJc8Nohhbd3rd?=
 =?us-ascii?Q?5Iwh+t1k3h4s9ggjkEYlQpmqBfNp7pvgnuXwLIauqvQCBkiKUIBGK4+viDfz?=
 =?us-ascii?Q?G5aULx1lUaaKVU6Ptqf9AV1fpRD7mmJdC+KQyv0jeWAGXypMoG44jFg9NDui?=
 =?us-ascii?Q?c6Pewb4DM4OtvtNJrIMfbfy6iXhztkIgqRWB3CyKts6SGx4WG2peE+YzD4YN?=
 =?us-ascii?Q?vz6XyIFWpuq1SnjIqv0eWVCscs6JN954g12/Er+1GT906VI7z1FrybekYwFN?=
 =?us-ascii?Q?Lecd0fOvK7sf1xNTh+xBX+6v28MayyUoEv535EUrihBa88/+aFHsGpTHEjFS?=
 =?us-ascii?Q?bII3Aa4Gk00cCaYHaUAwOxMLd6pZSFGyb/LtIShFStAl8OvCl1x3cv+gNkWg?=
 =?us-ascii?Q?rfHbihWiycKAdKTTyC69FxCvPwSH3oDb/Jf8KIQk13h47Ny/oxcBtPUgnj9V?=
 =?us-ascii?Q?CrTBD6CU0fcQl9xrivGcMkO5dzaIsLpplQHDn871cI8KCaJesHhV1z7XXE0H?=
 =?us-ascii?Q?1plFQh5lx10kHpvxtyw8K6HibxsKCOiJCoeEu8ghUCLNakbfFQB08FWcWLd+?=
 =?us-ascii?Q?WBvN+cnB43yeJsqQ00WTzOqllQBxrnl9mn/5YGb2LwwdQ3/Qza2xqUTRlwMh?=
 =?us-ascii?Q?bgs3wUw8GTsYs9p9i+ugA/JqrHYPpG9VGo5WcHRf+FgOgazN1mbhWDPrENjM?=
 =?us-ascii?Q?qyE8Nh/3eCeMnFfxjE/a6G4oPtOxlCTOMR+87J+l4zybJLT4rSEC+ajMtT/2?=
 =?us-ascii?Q?4xdTMDfr2EYQTj3TrpT+KD3BEKj3w8NpLKQPEf6P?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e3db97e-f6a1-4c84-bf53-08de3253a1ae
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 10:06:31.1399
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mx79KM0wHzTW1z+RhumpvnnqpXjzavE4doDhJYfDLXeL+2ZVRVzuAn6nDCgfJrEXr1vxsSX2jqocelm3P/IOkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10766

Disable regulator in runtime resume when error happens to balance
the reference count of regulator.

Fixes: 2ff6d5a108c6 ("ASoC: ak5558: Add regulator support")
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/codecs/ak5558.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/ak5558.c b/sound/soc/codecs/ak5558.c
index 683f3e472f50..73684fc5beb1 100644
--- a/sound/soc/codecs/ak5558.c
+++ b/sound/soc/codecs/ak5558.c
@@ -372,7 +372,15 @@ static int ak5558_runtime_resume(struct device *dev)
 	regcache_cache_only(ak5558->regmap, false);
 	regcache_mark_dirty(ak5558->regmap);
 
-	return regcache_sync(ak5558->regmap);
+	ret = regcache_sync(ak5558->regmap);
+	if (ret)
+		goto err;
+
+	return 0;
+err:
+	regcache_cache_only(ak5558->regmap, true);
+	regulator_bulk_disable(ARRAY_SIZE(ak5558->supplies), ak5558->supplies);
+	return ret;
 }
 
 static const struct dev_pm_ops ak5558_pm = {
-- 
2.34.1

