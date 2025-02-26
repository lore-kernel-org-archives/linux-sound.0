Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010056.outbound.protection.outlook.com [52.101.229.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C74A2192D76
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533801; cv=fail; b=Hy4LtDDLai+5uXf260Tn2p0KBtSCentxQcKS1XiOVySQn/ZQ29Ft/w+3nC5IP1PSbEJKYTnrNJS2N9eAZQqgdG6PaCLYvJIhL6QqjT+8X9+IEjjN40Ws1tkP/Xd5kSE67RGcgfW73nV96uLxjwGbncV2UhrYvshqIymaVfakDtk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533801; c=relaxed/simple;
	bh=aTha9PfNBBmz66CU2NjTb23yvgs0+RlMw3TOGnonxvQ=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=SectgV4Y96yLuT7BJtPXaSt3/b/NKm9LyuLeaRRJYzWSIO/re2bCFOlUanj2Q+EbbM9cZm7PU4bZPNihSbAAbRc6YQhs3Fwib3Zoq7S7Zv5mNj/adlBNKFKSfH6fxShJzuNCb4KaZsZx268HeN4Q2tZvbtbMn7i/O+RYQCICdYM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=AmqfoZTZ; arc=fail smtp.client-ip=52.101.229.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="AmqfoZTZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=elnlAWI9VVElqVUlsxnxhHoIrXVsQvpKTYaw2ym0K6b49mRw+X7seqE7gpRFNNjZe07ClNCR0MHj13AJrd+K6bp7zSt4oIcDuzZCTzwkve3SyrTaoUMtkwgK3lOR+QTEEGaD3CohmbcbNe1isoRvfTPXphs8KMtJeEjsNgwObxiFMY+PTl9SVIf7GirpS7Dz+c7uymivYA8HFAP2ZhfwUqKaoN/AdKwIZeJj8GfRb5DgmgGB7ofOcdyQWQBGXgGDhAxd7plIAQ0pTzJTnzbAI7YMBeYijnM6VKNib3aoWyTvuKnzWSDx6g0MMiVifG1ktmzs3+lxIhCe5uoHqFLWig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W4/2jWR6XRZG4pdq1gWkJDdSKY0sjLo8JvTcEo7dYcs=;
 b=EHMhBhm/2KWV9bAJcg/EHyYOiXorOTNweWrSB42OkokuQKTTqdNDVsht0XNbFPLRMAknwqpcg2UX2xOvuEmPp7U4cg6/xiHXGTqpkGunBRS65taOGoebc8ONkwL9F2e+2E6z2zaV0l/kX0+XUyuwVDMmGVBFpul2eAEn+TCNxSMtfG5V19C003CAR3TjheYFCzlY6M+U+1pnzdVfsVdNe38n4cdBRT/wkrVxTz6nJdfEbkMCdJ6ON6VfApvdYhQViSVf3Rvjg0KqHcuTyAyDpOQW7PQ6jv+a6viYqiOUlZmJ1XsVmYNTLMQQ/ezP0l1e7EZuJ05w0MHJprv1N6ILWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W4/2jWR6XRZG4pdq1gWkJDdSKY0sjLo8JvTcEo7dYcs=;
 b=AmqfoZTZglOgLl6phMmhqWHotdE8iArPTM77lypgb2DEEaEWu+9cOgyhlKXN8JLAPAsEw/pY0sLVK9n7j8yVTJta+XOvemWOUvuE0K0AWzn9Y03ZKFuAsTqlx+g2wT0Hi8eRVc7n6sryxS7un4sk9+Uxocw/Bdzs5MsKrV5uqeY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS7PR01MB11967.jpnprd01.prod.outlook.com
 (2603:1096:604:23e::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Wed, 26 Feb
 2025 01:36:36 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:36:36 +0000
Message-ID: <878qptbi6z.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 105/157] ASoC: codec: arizona: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:36:36 +0000
X-ClientProxiedBy: TYCP286CA0254.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:456::8) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS7PR01MB11967:EE_
X-MS-Office365-Filtering-Correlation-Id: 64a6ea88-f603-4cb2-6dcb-08dd56060275
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?U4LKH0crS8Kt6C6kuSA9O6eqjZt6kLFhkOi/wV5/FpHHqJzy0jeq8v8/ZJAN?=
 =?us-ascii?Q?burwzYMA3n7gBS/1Q3gdjLC6lgem6ka5TGpMawlRsqnhxIYaZ8zdqIwuED//?=
 =?us-ascii?Q?Y/79BZpq+zA2OB3Fgr5HEZ583hrUYeNnXFKcVDsrOjY6iDtjpQVPlk62aNqo?=
 =?us-ascii?Q?0M0JOLfKN64pZ/h8wiOzezhWJIsOKUZz5CnU9T4KAeqzXRmE3OGqloVChlvl?=
 =?us-ascii?Q?BDchM1WDLesKd16ugjaUqfXmMafUG9sdCQvnxg8WTf6yr8UuBr2vuUeD7ySa?=
 =?us-ascii?Q?jedqoUnxVVUFnREVBrI859UZhbRetrrcjPRaoAzHC9OD5giXnME46/xJ+4tz?=
 =?us-ascii?Q?NKLHow9YI4gFlNXAmgWX5ljxECodq/2RG0Dfulvw3FCMpeZul4aygW1CDdI2?=
 =?us-ascii?Q?sbw537MWtbMaIgYdpufxe0lh+CNZMLALC6iUj4pWoLSi87ae1O20doKRk7ht?=
 =?us-ascii?Q?hOovwhsZc0Yidx62iw8SFpQQEZca++w+PpvQKWp6WULH/zlpuqsHkUdZjwij?=
 =?us-ascii?Q?peL0djnAto8aA3zMuvQQ2yNpyx9L4Jox/opYPa4kxxpmDe19ZHI5SbwD+4rJ?=
 =?us-ascii?Q?FjwRY2301v4e3cmpxExReOOQyYdBLxm07JN1uyt7zz1xeAR12oeuDEBFRRK3?=
 =?us-ascii?Q?U6Xu1bIAhpjCNTqhHfA1g3CD0/w9oz/E2qIic9IcdX0YEPhzBor04Be0j/Ju?=
 =?us-ascii?Q?GEbF+rApCRecY9OWOyICAag8ulFpypBwL0Idrv1uIayEWHxJQMrfWQBEjprV?=
 =?us-ascii?Q?UjJT4pqWs1xOzFWZKHIgr01kxqwzigq5w47KSe3F2cy2IE6TWmKFgrz+PVWe?=
 =?us-ascii?Q?WJ/zisM99wo/mQY54AkSFgHANrrGEFFXKWki8w16YiT7l54YiefGaO0Aj1qc?=
 =?us-ascii?Q?G/mV/d+lv/6tce38TLAWJOWeMK8MSzmRpqwS8ymBFj1STNTO0bcuxwAan8rT?=
 =?us-ascii?Q?ejSCKZJawfF8AHzrCW6Y+QqbXpILc2+SzzGd9ak3JcrsrFYobuPi93SroyrW?=
 =?us-ascii?Q?n5u33W6ThPxUK8JbPqHOYNGeC4m5JrODNsShia+y1IRSh/BgUledkDUFfens?=
 =?us-ascii?Q?8Y8Fn4z/x5Wj5DZO1Lp7WrZTERkuhF75unKbRwHfNYuIwSjv3xnijtmG8dcc?=
 =?us-ascii?Q?tvBNo51PFfWUHy9nJslGUypVLWlQ6pxXWIbuHD0D+jZWEZiReliMCaZOfyIq?=
 =?us-ascii?Q?NVVkv0JxFks5sjEaiz8tVzRisO0TUSpLeucuPwdNHmcXQLTokFkXsUPhNOiK?=
 =?us-ascii?Q?DnsFqJWu95J16/Z3bBhZtpeijbPsDNLyPzXO+ZCEfjo0+zd6kFSgM14RC06f?=
 =?us-ascii?Q?5JRZNgpLvlmSxP1R6Mo0oPUbfIwmYmKLuOBZOKBF8nOjg2lvjgMO5xU+Jgyv?=
 =?us-ascii?Q?UaQHiUQThyQVOfT7NGnlF/wWJ2XIAWbTqIoI3Zt086u4M5JGeyDk+MwD1Wco?=
 =?us-ascii?Q?7RXkPl1GkbDB3xVZeGQ7uuZvfU+Gan5b?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zss4QYQyRJUNoXoEC3f10aeiHARmC1pMABpA4cMd6+MtTOnq0tjHymXXPDtL?=
 =?us-ascii?Q?DG6AhhS9kzC5M0GDy4atacm60nv7DgoUzgmvuxohPIAQDiKKBxTNxDlMfQhz?=
 =?us-ascii?Q?o8S4Nh83Rf1DmjdvneLe1LwcDmmWq0YzS1m/QxoPvdnXmHc1ZeT8IFCFep5h?=
 =?us-ascii?Q?JFAuCQxI0Ur4dSFO6yctSwu2aL4+C/TZk2Y/2oC5OYO0McNOxTyza6d5RtuQ?=
 =?us-ascii?Q?TmCD8mvLKo6Iphc6ypnoupgkrxyd8PmJK8/ZKCYs9Gk2i0KbYHKe2OKooLTb?=
 =?us-ascii?Q?UOsoL/CTaVW6RB5/2XhWS/XgHIePcsi5aHAQN1fM+YrNoJ20TYHB8MvORY+s?=
 =?us-ascii?Q?Z5cpilA2AKdROeix6hdxqSZFoKI+rzUcnMpiMPna/2i5H1sBAsuojF5JnvCi?=
 =?us-ascii?Q?hxxV9m4E3CE5ViX3o/ovEg7RwvIxFFcREkcwWvGks8AQ2rpNBxg2EbV5pPtq?=
 =?us-ascii?Q?C4Gf5jDsUhLh5bujO65MuZFqn8eb6oxMLlGWliya0FoE0juCa0TNTbVNFAOW?=
 =?us-ascii?Q?NqrXa/mI4aPIJRvMqqsqXHCOOPIi408QR4pQy2UFluZOlGFMv0B9cYKWlcJf?=
 =?us-ascii?Q?I3vjrkwEotjDRhJRDfukBYohQWB2bqbbQFPxaWHIJ/h6zvUWwf32EtkSTW1X?=
 =?us-ascii?Q?3yofXnWIpBozoc9jf8VGpnoEp+Og1tKPLS75sa07VYeb/rVkJreCe/FdxrWv?=
 =?us-ascii?Q?z8CO432HsV7Jq38bYLc3y63umvRrVTX5DzoepQpuDX0lay/hh+gr4TxSFTnn?=
 =?us-ascii?Q?PGkPZg4J13exueTONZSUj7IMPNE75mesMufNCbCLDQMehHpDHzzi8e3GDsKV?=
 =?us-ascii?Q?qJLYuVEAyf/5niuSlrrvZtgKA5ubOCSwrv8DcpbViaz2erbv8UMLyd2bnYiG?=
 =?us-ascii?Q?O1b7UmZe3DcIcdsXe6nHQLbMYz4ayAwE2zOEVwnKGeKJVe0GVgOj4p4J8kFq?=
 =?us-ascii?Q?zV+k7FbAJ+6c/Y/xU6qGa7nUI5BRKNiBWpyyG4SDXcGpIAhWnUEpnk6GKYAH?=
 =?us-ascii?Q?Vu1MlrdvL8nJTia6PweAYYc1tuypiTBfOzFAKsoCUiwFoMYSv4gzBnCOYPhQ?=
 =?us-ascii?Q?1ls7QYfRr8Am3+ckdzpcgM4/18ix7rThumiyh5hTGY25RFJIPSbTb9gC9AEh?=
 =?us-ascii?Q?TvOeUEz2aRfTFurTwCYfSfPTNcfydjB39d25UJfCj+eCy5lMm4bTEYN0WuHg?=
 =?us-ascii?Q?2ZDhvr2cWjiTf6hWx5mkquhD+jDmGBL2UnlGOkbCHpL+jBm3e/oILRkxYQZb?=
 =?us-ascii?Q?JCrotyRaPYbk0xTJpGuifsiEAPmTSwhZ7Rsklc3HoUQsXpox27/lYimBTcao?=
 =?us-ascii?Q?7/Gryr+eT2HOSVokqMgykZdSGGp3d7izLV/DYFcR4qpqTwskTlDy2bRCJ+T3?=
 =?us-ascii?Q?Ormjo4nb0GQpenCy7s1ijTmgDOYLLKwU7cMWTVqMo83SzumfEdf+OUCXTtA0?=
 =?us-ascii?Q?lBeqLf+/Epd+FPsDn+aBcU3PqrKWjhWtpsYjoHE52aTQd5t15alt31xDTs+2?=
 =?us-ascii?Q?fOEZ+NT5qpBLNaChudemN+tIHS4haICLPqi4jWNQnZ6tEYUgCVGeaGKEMvaA?=
 =?us-ascii?Q?0s2hvUzTin+Rhv6j83utqCb6m1z1y6mnsOdPKH27GLRVAYb/rEqzLU6rkFmW?=
 =?us-ascii?Q?b3VIwdfX/F5G4Ze3K69i9hk=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64a6ea88-f603-4cb2-6dcb-08dd56060275
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:36:36.8646
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: woZCZL11fxV9WnSBR2v6h3Pkr9z5bMiHzj3dsGY+Ub/oCkO+JEOUsl3sbGgD+0rrz+CZulXywytj/kqc/f+wvXHQkc2S/ym9Mg91MnAKtazqqud7RDPQ+bNroneu8Jvh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB11967

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/arizona.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/arizona.c b/sound/soc/codecs/arizona.c
index 402b9a2ff024..6bb1e8698d41 100644
--- a/sound/soc/codecs/arizona.c
+++ b/sound/soc/codecs/arizona.c
@@ -1457,7 +1457,7 @@ static int arizona_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 		break;
 	case SND_SOC_DAIFMT_DSP_B:
 		if ((fmt & SND_SOC_DAIFMT_MASTER_MASK)
-				!= SND_SOC_DAIFMT_CBM_CFM) {
+				!= SND_SOC_DAIFMT_CBP_CFP) {
 			arizona_aif_err(dai, "DSP_B not valid in slave mode\n");
 			return -EINVAL;
 		}
@@ -1468,7 +1468,7 @@ static int arizona_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 		break;
 	case SND_SOC_DAIFMT_LEFT_J:
 		if ((fmt & SND_SOC_DAIFMT_MASTER_MASK)
-				!= SND_SOC_DAIFMT_CBM_CFM) {
+				!= SND_SOC_DAIFMT_CBP_CFP) {
 			arizona_aif_err(dai, "LEFT_J not valid in slave mode\n");
 			return -EINVAL;
 		}
@@ -1481,15 +1481,15 @@ static int arizona_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	}
 
 	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_CBC_CFC:
 		break;
-	case SND_SOC_DAIFMT_CBS_CFM:
+	case SND_SOC_DAIFMT_CBC_CFP:
 		lrclk |= ARIZONA_AIF1TX_LRCLK_MSTR;
 		break;
-	case SND_SOC_DAIFMT_CBM_CFS:
+	case SND_SOC_DAIFMT_CBP_CFC:
 		bclk |= ARIZONA_AIF1_BCLK_MSTR;
 		break;
-	case SND_SOC_DAIFMT_CBM_CFM:
+	case SND_SOC_DAIFMT_CBP_CFP:
 		bclk |= ARIZONA_AIF1_BCLK_MSTR;
 		lrclk |= ARIZONA_AIF1TX_LRCLK_MSTR;
 		break;
-- 
2.43.0

