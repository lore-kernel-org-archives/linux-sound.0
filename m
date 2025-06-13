Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011017.outbound.protection.outlook.com [52.101.125.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B107255F53
	for <linux-sound@vger.kernel.org>; Fri, 13 Jun 2025 06:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749794425; cv=fail; b=RMkZ+c3TV8od75sN04StkNujUDneXdYsi89SjmLEzNeQhp+XbB5fdSt27eabDK7LVHpZ/v+I44jD5RvgvICdp1i5WYPlySDr5yGkIGq71w1+6ByW+7fKNftr/s7VZ9KcGoL5s+JNBrsGug3BrhzIqgW18Od38dKI25Qi2cRGT5w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749794425; c=relaxed/simple;
	bh=ypKS6nkUyq9FXYGCYxZAshhAAKr9zjZVgOJP9zJTTg8=;
	h=Message-ID:From:Subject:To:Cc:Content-Type:Date:MIME-Version; b=Yzp81K/I7sfwDttzCLJlKg3DLycw4fUCodX5LvOqAZWtZb/h0Kr1Zag3NkymiM1UkJm1Feqk93hJ9/Xh2/61SR5zh+RDZ9KdCbB1wl1xgA7qk5L5ht2ua72MqlIMSXf3lF4QA8vtreM1hSMU9+1AoE+OUfjLangXQ37p3vPy0hg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=CAGJMM5V; arc=fail smtp.client-ip=52.101.125.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="CAGJMM5V"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O5P8+QPU7HVk0uvihQGjpkL5GqET7il7sbPFd2fbh22O5eTiClZbinbU1ROpPgf1ioFDOlMaKUWOslKKA27oMOZEcKybKnVhVanhwcdJDE4u4aE7h5fVkkkXHFNJCtNVz9KfPiY8n2YR6y6jWDFQv/uIj52s4R07xeXTvpNBaASSY9f8vXL2tEIpYBs5JfAiaJLLfRyySs3EOJqtCsqWn/tiN8f6IyZV+dhFmirbDWF7Brb7HojyE8R3tnmu0xJN0lovxPsEdC0EKqqeL53vKOlkxuqHbbDGHMDzoSAnc7ZxEIKQg25d1oEGMjomH6VdcMcj8kEMXSAGB9bR1H480w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VwrUPovsLzrRydTGRp/zKGwYwQ3on24cUKiBJHBDYLI=;
 b=imYbLUIkOA3IJG+pM/M0noj3+W0V0iQEUuMpqPHJ9fBd3qjacGf5D0FEQnRIL+8bVmlM//nv9BKJt3wMaLW9lLBcVrT1b610YjXx1A1q8YjUfNuutUb1AXYpe2AW+vZHfkeqcpTiTxPVr7C8Z/aEQD8p1D1wVxh1F1nUBVbcExdIV4xm6BFJgvKXzBIpbjOiDztdCeqdYsfrEReufbz0wLmlAMrjmDO+1EciulMcNZiyNRuwBQTHgSqHTViMILao0xin2Bxh9Wt8MkvAOnJJ3I2y8XYzd7KZvjhtwPdEUTiKYwQGJqt5oUpl3tPGHQ4Bj+QuzKxSFW2Fzg6F41rOXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VwrUPovsLzrRydTGRp/zKGwYwQ3on24cUKiBJHBDYLI=;
 b=CAGJMM5VyZWS29FI6joil/dy5Q4tTWqjh2vDzr2AFiVA9C9TCqEuxuGyrGusjBJJMOcsG4wTaCIhsMb/5dblIfcQ/6YCl1o53yAX5FCw2pPirefUykkSGRTp0v0yzSvLmFXX3nYyirWQTtwiM1orPWb7lp2aATIUOdSO4ct6Uvw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB9723.jpnprd01.prod.outlook.com
 (2603:1096:604:1ea::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Fri, 13 Jun
 2025 06:00:20 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8835.019; Fri, 13 Jun 2025
 06:00:20 +0000
Message-ID: <87sek489l8.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2] ASoC: soc-ops-test: dynamically allocate struct snd_ctl_elem_value
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 13 Jun 2025 06:00:20 +0000
X-ClientProxiedBy: TYCP301CA0075.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7d::13) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB9723:EE_
X-MS-Office365-Filtering-Correlation-Id: 2fa54f24-7460-44d3-e6c8-08ddaa3f9437
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?bJv9w6z2ddZioxode6n/EIKOTAxfsbmeNxxbVoad/3cp5wv0Ndt8LLtICDvF?=
 =?us-ascii?Q?XR1H/T6N2DsecJIodK9MoD7UdX7c+KNGZIrLDQFkRMptccGp1DuggV9mV+D0?=
 =?us-ascii?Q?f2F4ZztJZaCtW3nQDBk1MyNVH0UQkBQOAF/R16dYvLxQ6GTg3QuKsDPmycfs?=
 =?us-ascii?Q?MED2rDZma/RWPc66qvfAVKqGC6zlbZ4k6NwaVNqqAZ52jgjG0wVwojQXk52K?=
 =?us-ascii?Q?wvOTzfSd8nfu95Sa8aWH+t6M1ypdk6sXMiJmTmzGe1YLeR6QWig7HJZ0kwzN?=
 =?us-ascii?Q?emHPtUTAOcEY/rqCHwI1UEsC4+ZE1s15aQNFmERaRsGt0hRC/2V6y2JDj91b?=
 =?us-ascii?Q?HBFhK7jv1GO8zgvzNEyEtEAh2SU1ZMgDcVS6Wk/B1eNLIGKkfu/mNZaJGgfo?=
 =?us-ascii?Q?7VmccY723Fw2fxIHRLxPfsFjsUWUOlBG3s1lVsORgB5eL/6hH3xyvTtJEHz4?=
 =?us-ascii?Q?qWjB58susxx0SHoIxsRruj59PrbrPbvVOdIidZ5QM861qQhWsRDbrafvYWZp?=
 =?us-ascii?Q?rcxSRmBZRtULCli6EuMFJ8Ie2xPvXXWIYDYpxWUxNpylxPlYf6x74aTJpShc?=
 =?us-ascii?Q?TIXa5L+GUQYHgTtK+IcpzBFxVyvFfLL4a/0kG0fr5y/nmt+C/DjvkN06DMDc?=
 =?us-ascii?Q?kABRpxdEmYBTl/dd7Qlqpxzq3Y0VP8utUzQ2zmePqpLVKoNiLEXO8DBJj5vB?=
 =?us-ascii?Q?/nPE7JVVJan0FSxJfZ+CdCRxOJJ05XutCzOVy90CBADbExOYyGJ6NNUdv9Ee?=
 =?us-ascii?Q?DYj4yQBlN2M2TbrqcY+Ajw6nM66DSA9yArXMxK33LTIFUUve/Us/wPbvCHfv?=
 =?us-ascii?Q?1PSAYND8Te5VuhahwDJIb9lmjDfk50lr1Ujja33FsLY4h0EBeQjhUb1+eI68?=
 =?us-ascii?Q?B2vFG8RkvJqwTnEchTwOR47CX9w5HjeJZyUAHeGZp40vx8LeufNZ3+bwixHP?=
 =?us-ascii?Q?REWeyIy3MNtsjvHXK/NLuTtaU09hn9G/yNrcEkoFuzlwPxsxHCB5B5/SWXOr?=
 =?us-ascii?Q?uEmdmrKlt3tYhEqRODx0w37A++Ha0UbDp+Ci0BuXezvikJBgDJFkKgbMmQLn?=
 =?us-ascii?Q?jCg0FBYzKVM+mN3mz2k/LvMkZ/8J4f75nlV4vfF8neX9kE9Rdb/WQGgf2efp?=
 =?us-ascii?Q?44oI156/PR1BDv4XcFqSVLX2h6ZiEt14y06+ou6jy//muFOkw3cXNyFBjOTO?=
 =?us-ascii?Q?efGEIq9IGbesmeN0YFnayysQwOy5vCjK7Y6BNIWdmh1A6md3+x+SLd3N01xD?=
 =?us-ascii?Q?N1Tjj6I1mtJBY9uW6qLA9Wtx0AqkTTJodRpQBPCEoCN0Obd1FC26jbnpeSTM?=
 =?us-ascii?Q?cATCJa6T2/WEwG+w3G8KpJZ4eLwnPcA2q9Q3tDtAp7FRUVUxziKRxCL9aKme?=
 =?us-ascii?Q?QBDJZPHXHxDP6QGwkNAxKzJB9w3PqrGp5az67n0fHhlbPbLy1RUEtLQeDGp7?=
 =?us-ascii?Q?PWDV/RQUJhQB7cPd40aN5FwwtyW8RPDWVtSU+Z8Z0CZpTDz+MxOJOA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xsetVKvVgJ95pW+Tfb3CnTxp8SCXGjaMFdMC2LWzEu2Dp/NOcCeKMiarpMEo?=
 =?us-ascii?Q?DhQ0XwYZYbQF2VQ6/qhlNrrzTmIkyMsOTYSoFac+QtNPI47zHUkC4hUZJCo2?=
 =?us-ascii?Q?ylsrUz3tic7bTtQSMUhjcB0vMvj+Kmb4/3kILK3iJjh4DxWF5vr1hehw75Za?=
 =?us-ascii?Q?rbrdxy+45/5Jf/6D+pwQ61R1QzvbUyuHDIvSsK+WWVsTbqvYLhw4D2X3yfXt?=
 =?us-ascii?Q?L0qsyncpqTJENbhZ/WVWmePGVmnOIVR+NIGb9O8nJfo32d4uLLAaRSWIAD8D?=
 =?us-ascii?Q?ai5ZDeKSF2CYyyPzwITKK6wHJ+H1EYj8EHVY0YzaHPrXw5Q9GK9HmMhR5tES?=
 =?us-ascii?Q?X64vNPfeGAvz/MX+e9yuRwh0oaKN0jMoeMtMG2d38BArd2wTMx50TFV+3tt8?=
 =?us-ascii?Q?6BVOsLUSAi87/HmCvd1odk92/vM+5zagGxTXKd+IvkqEvHLGBXFvcNYM0Q6q?=
 =?us-ascii?Q?MoKWw5cKLMYGYcdKCCSxMSAJ35cvML6VqKU6cg6x4pyC2PUlCQs7xbebe5VV?=
 =?us-ascii?Q?P7RCCwA0nsqvtI1HvmdQMmbuA/59k6wVSwwb4x3EZ9xbAfQ3+rlZi1DHyRWu?=
 =?us-ascii?Q?PeBlzTo+q/zCtYZe3dTh2Nf2h5ZcGodEY600UrLBrv0kp/xCft88U6kEcNWK?=
 =?us-ascii?Q?7z8yHWou/O+CGEcshqEdgipih2BtDCfoD2+Wxq9QQxu91Bj/qveNTcO2GGNw?=
 =?us-ascii?Q?wWP/AaLxvQzUI165DgV3vhq5yCnZRH8Emnrsc3VSInr8Kdpfc/WmE3B9834D?=
 =?us-ascii?Q?+8TKzTWnmDjdGjSmcg3kfLx4clFrhBHo65l6nySsTNwaC/9+GSGSwAigkG0t?=
 =?us-ascii?Q?BuJg006LFzi9oYp1Z/ktc3htaRmfSIt0w6l1IgdWWpxvIYHPkTKYSIdJyQSc?=
 =?us-ascii?Q?VuJb0F0QHdNmwZy8uyEOTYQaxwvkQcF7pDU44enGROXE6LWeDOyxixKne2d/?=
 =?us-ascii?Q?ICQChayuKkKhJUzX/DktcFbpRa7ZXxht5gAPzdH8jSCpk2N8baOaq+djzrRU?=
 =?us-ascii?Q?Y+SSZbQLSDgGPREzmIiWHYj9Fewtxcv9zHRwL/Yuvvm26wAwjbf6gw+KhOqG?=
 =?us-ascii?Q?Fmj93CZaeipFhhz2O5t1lRY4242eEPe76VZgRXfD/ajeoQeI/1otPOPKrgJQ?=
 =?us-ascii?Q?uT5nnsH4h7oHnXzKfS5tJm0MoACctjwY845/Hlw6rHy3XfJB4eZUeE0T9xKW?=
 =?us-ascii?Q?16IAKTomYXzIZKT2Q4aaG9klyOvR5yowOGcMTVIOmxt2bdyW5KfxL+f10zDk?=
 =?us-ascii?Q?idQmEbUCsPutdYs2HICMzNmdYWwqwjLHZBUgpsIf/2svjPVJ0WTecXTQTKKT?=
 =?us-ascii?Q?Xj0d+SjCHaViFTCZ2/velTq9jyuYp+rR+UcU+AAWj5BVRXHA5vJ+93JHPV6X?=
 =?us-ascii?Q?bGotLu85xf4zfNVVGclvOhfGXsxJbaRQoqtvh25kF+oMrvSnw3zqdPtJNaN8?=
 =?us-ascii?Q?Wn8Ub6UHF4cV3aLYPMdzcsbdL/JNVJCiUZgI6WxVxbjtnVSNho2tq9MjL4dd?=
 =?us-ascii?Q?yI7lFIy3tiF4ebntX+sNXLv1cX0EAK8r5uCFnZjFoY8ba/PY9tfgv6kS+kt4?=
 =?us-ascii?Q?ynSEwu588DhDUGTjq2pX4i2yvrTHcWnMoMndpvbytt2d/i+DQPqrfXxAL3uA?=
 =?us-ascii?Q?VJaiMvmSlTL8uM7CTiskKaE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fa54f24-7460-44d3-e6c8-08ddaa3f9437
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 06:00:20.4055
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Op+Segc5YHuGlc9BnXrWdpzXKQF5ZXORMtWhK6P88/xyapLRvPcRhWIYTDT2NIw7flNNzvJ8fUmwQg2fFK9U5bo+Df3epyYa6nVEwXH15JmBxcRHKuCG23yNx8T1W6T0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9723

This structure is really too larget to be allocated on the stack:

	linux/sound/soc/soc-ops-test.c:520:1: error: the frame size of\
	1304 bytes is larger than 1280 bytes
	[-Werror=frame-larger-than=]

Change the function to dynamically allocate it instead.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
v1 -> v2
	- add comment on code

 sound/soc/soc-ops-test.c | 29 ++++++++++++++++++-----------
 1 file changed, 18 insertions(+), 11 deletions(-)

diff --git a/sound/soc/soc-ops-test.c b/sound/soc/soc-ops-test.c
index dc1e482bba6a..1bafa5626d48 100644
--- a/sound/soc/soc-ops-test.c
+++ b/sound/soc/soc-ops-test.c
@@ -481,22 +481,27 @@ static void soc_ops_test_access(struct kunit *test)
 		.private_data = &priv->component,
 		.private_value = (unsigned long)&param->mc,
 	};
-	struct snd_ctl_elem_value result;
 	unsigned int val;
 	int ret;
+	/* it is too large struct. use kzalloc() */
+	struct snd_ctl_elem_value *result;
+
+	result = kzalloc(sizeof(*result), GFP_KERNEL);
+	if (!result)
+		return;
 
 	ret = regmap_write(priv->component.regmap, 0x0, param->init);
 	KUNIT_ASSERT_FALSE(test, ret);
 	ret = regmap_write(priv->component.regmap, 0x1, param->init);
 	KUNIT_ASSERT_FALSE(test, ret);
 
-	result.value.integer.value[0] = param->lctl;
-	result.value.integer.value[1] = param->rctl;
+	result->value.integer.value[0] = param->lctl;
+	result->value.integer.value[1] = param->rctl;
 
-	ret = param->put(&kctl, &result);
+	ret = param->put(&kctl, result);
 	KUNIT_ASSERT_EQ(test, ret, param->ret);
 	if (ret < 0)
-		return;
+		goto end;
 
 	ret = regmap_read(priv->component.regmap, 0x0, &val);
 	KUNIT_ASSERT_FALSE(test, ret);
@@ -506,17 +511,19 @@ static void soc_ops_test_access(struct kunit *test)
 	KUNIT_ASSERT_FALSE(test, ret);
 	KUNIT_EXPECT_EQ(test, val, (param->init & ~param->rmask) | param->rreg);
 
-	result.value.integer.value[0] = 0;
-	result.value.integer.value[1] = 0;
+	result->value.integer.value[0] = 0;
+	result->value.integer.value[1] = 0;
 
-	ret = param->get(&kctl, &result);
+	ret = param->get(&kctl, result);
 	KUNIT_ASSERT_GE(test, ret, 0);
 
-	KUNIT_EXPECT_EQ(test, result.value.integer.value[0], param->lctl);
+	KUNIT_EXPECT_EQ(test, result->value.integer.value[0], param->lctl);
 	if (param->layout != SOC_OPS_TEST_SINGLE)
-		KUNIT_EXPECT_EQ(test, result.value.integer.value[1], param->rctl);
+		KUNIT_EXPECT_EQ(test, result->value.integer.value[1], param->rctl);
 	else
-		KUNIT_EXPECT_EQ(test, result.value.integer.value[1], 0);
+		KUNIT_EXPECT_EQ(test, result->value.integer.value[1], 0);
+end:
+	kfree(result);
 }
 
 KUNIT_ARRAY_PARAM(all_info_tests, all_info_test_params, info_test_desc);
-- 
2.43.0

