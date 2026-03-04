Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010010.outbound.protection.outlook.com [52.101.229.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A3C37FF4C
	for <linux-sound@vger.kernel.org>; Wed,  4 Mar 2026 06:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772605430; cv=fail; b=WEJUr5kq/G38QGNscgW9gZl6BwDcDSYfmF+20/N4Vd7E0EQ6XQJso/OvHFFYupjY30Whw+MdWTC8VF4a40+q9kEkCpdBCX0Bzzmgvu9itxH+tfv/GLoO/szlKL+gfUceoEnEd/XHkBuiv4Yw+8wAEpsOb+IoCez6yZjBvAh7gts=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772605430; c=relaxed/simple;
	bh=ZlbUkBMtPEDxEHOSwtFSP3aGSxxeAIsWbnVq1+ht6gk=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=jW6z/7H7a2JbzuMwRu0wcnGaDdrAf/E5I2ONkRE1DzsM+17DEdQuxzHvkhMaeIH1+F3IUyF0X2caJY9YtDRNtupnJ8UBAWQntF3m4F/6aMRRjtzangZPFmCM8yZ5PM5vxDrC8l2I92HwSjAP+uDM/bG2Vy//wQqcKLMsfUMsNXA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=DDhu1iOx; arc=fail smtp.client-ip=52.101.229.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="DDhu1iOx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tfOshwfUFnkPrpt2fp8hr4M0NVZIySLetKmUkn2zroYJlos8aS6beZTuLcylPiX9h6N6Y/wSTDCBSjNZMi1v7GhN26cOKd8hS+AEaYzdDQSbd/dL82MBnkkM4ZUMICDzou1ge07WrB7AXiXk3/0rEeGu2olHJB4nuMxoirM7mY1lP/hRI5MDbJw9xhRXinRNIz3A8TATtLyUQtW8KfftzBDikIdQKBrOyyK6VBLs8LA3LfKG/yh9SObxHXn2TiLxc/QTUOaa71aBLlvqEaUoA5kCA1oPlH1jhXbPXbGojIczH0ktxvxAcJRSEM4fjSdPEvrOMlWQsdmwnE1KJFZY1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HA8AKR0CYDRW3K8uOtMzRifpIiS7uycfQJy2hcR8f4w=;
 b=sYhQD61nBCLn2Yhs4RLsOF+bq09OuA7fHGuIU93qcy+IkkQUdKDNoa9WPDdLIDz98PrSVApLQug4v8qe1U1kdw2sKh+KEn3oDGMudWtRD1RfqTGyAdlVEd2c7Vb4Ibu/dNsZ9tFImUVuHTZxBhOXB/v2dx6Gy+8TVTU7nt/lfoPI1o670mCPiTYUA87F5RIWmtiBDHMBFysNhmX9q5VVa775Word3EHnmBKLptiWP6OFrl3EWCJrMtIwHvi8qxAsqf8MXNS+lQQ311+/xUbH2KBKJfEn/ym2bdjrIoyD5Lbh8k9WT7NCPoaLALQwPZXvU907f8fRPX/ZiPGAxEnpag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HA8AKR0CYDRW3K8uOtMzRifpIiS7uycfQJy2hcR8f4w=;
 b=DDhu1iOxK6POfjHKCmOz+L046vEcemAflY94B8RuPjEpTIWGNrOajtptgM6uMejSvIyZT7v9KeMT21TEFbmsRiCJbWq7Q6RaKKbI4g96vsqTPEa2p+5lhT1dN9qdViKZPraT9b5V3mJ49Na9Nw6pBQJFepDhwTMqDCR/i2gobXU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com (2603:1096:400:ff::13)
 by OS3PR01MB9755.jpnprd01.prod.outlook.com (2603:1096:604:1ed::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Wed, 4 Mar
 2026 06:23:47 +0000
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9]) by TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9%7]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 06:23:47 +0000
Message-ID: <87342gp0y5.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 20/29] ASoC: samsung: name back to pcm_new()/pcm_free()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7fcp10x.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7fcp10x.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 4 Mar 2026 06:23:46 +0000
X-ClientProxiedBy: TYCPR01CA0024.jpnprd01.prod.outlook.com (2603:1096:405::36)
 To TYYPR01MB7976.jpnprd01.prod.outlook.com (2603:1096:400:ff::13)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB7976:EE_|OS3PR01MB9755:EE_
X-MS-Office365-Filtering-Correlation-Id: 32eba6d5-d471-4214-c87c-08de79b697c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	rZY0CkySFtaxEjxobRfHRj1m1kdIJ1T38wyRKC88HcjQJj3TK0jMvh4fInZ4PQ7mxyObFIm1kpC9868QSAy4nOC8+RC8JA0kRz+0oI+lFpJCr4SuqMz3QQfsOHO50LgDslxko4y4iSwnUnLWNT96uZ9MtGV/+wI3PAxN4TXyQ6ivEongqWEOo4vTEMO3DeDxrmxj4XWjJr4iNIJ4ZX7WhYeZU+PlIi98YzJu/VJDwbThdhURS2pH0avKNBtq6pH3MCE7Noje7Db1hs7FkdHlsulZe0SFR/aGMmv6NT9AIXCC9g3Ly5m4CmWOlQROeydzrWNQEX4k1aHQgrV24du5HUKSOG9GeaUoUwymTZp2MpWXQ8BrW2n6j5ZxvCVDPraMlQuqTtNmj42ZcXmptFItO8UKDa4QbSD07gwPbcsZ5XamFBRUfrXZMzzBydqyG2up+y287xLFtFIKbk4L3H/OgGaUwljpGy+Zcw4lrMWExZyIvSQWQioxYFV4lIvPI8T5ReExn13LRZia39M5UrR6EkiXjX91B55aCcGoooY026QhsTbNj1sLKFCtVYrcBSHP+bflKDx5CyNMKJzPw7hFv78PlOK3IQMC5uc32wM5GXtvYpdvD/cgG2f0sRJQ8qBZ1q+DlVUWDbiRFso6Gzmzjq/Jiale45syoqSvJkgMYep4vfupnxle4h0CmW+5a4mlUV2Fedl4OCaJ6v0cRhWaXISjauBVt/AcA2vVMgDzqoqVsE/pEgTuEJmXglz4x/epsOKZQ+Z5XRBvgMlvEUghLYEpxXTRNX1nEFxJVRAclQY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7976.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?94dddP7N/YwpMI8Lmt9VwPvoJpsPkEV2iGTOwikVjABV6dj/24N9BUfKUg3A?=
 =?us-ascii?Q?8J0AH7Og3H19+Z9dbuuZowv9/PHGF4Z2nNAEKgkb0pIcbgWql+J7oyLtFb/K?=
 =?us-ascii?Q?//sZSHA1OeMSFYWgRiUXA5UqwfVTs9jOGNUfLrTSCHO+7K7e5lOTQE6pLaz1?=
 =?us-ascii?Q?4iPQeUs+YcStFmRZN9zbBbQnsBANvnuN+cT1HhEUePwfd9iappMptXfhsF/t?=
 =?us-ascii?Q?zlWrA4zUY3ihYAvg0uT3stoQu53JiSTt61I/yFQd+GjdEm6wxiQHhKWO5cqq?=
 =?us-ascii?Q?MBOvbS+BaxcT59Ykn4kyWG6f/Pv4gQiNIfTYqRvj895ozS6t9ts9TjGLuvn9?=
 =?us-ascii?Q?PrTWxGRfmhfJwULbgSwz5YhimT0U6OTzZ+w4bodLKt9jUCvqOMKef5qsMhJr?=
 =?us-ascii?Q?7INHHZr3/Gl9hyyqgQMAvLeQQy+mSMCGnfkBAUFh+O5DcYOgJghs0InhRsY+?=
 =?us-ascii?Q?hbIw2l1E9WbDqc0SGd3qM+DP1AzF3DTkrbJSWmcQEE3ZKpO3H/hjw5FRG85t?=
 =?us-ascii?Q?xPSRHgVK4WiCXpE9+B/lFCeoOCkGy2MjzCfWwqR/VWbuPYu8hT2L7KV8AXst?=
 =?us-ascii?Q?hqZ/x/+Y1hHaW7ve/xIKwORYDsAYYhI3JBKV/SPANetzmFbb3ASJDgnUdru+?=
 =?us-ascii?Q?oW+LJgAB/zR1Q9CVmtsALXSKHC2jAz98AHbL/Xz0jpJBOUno5GUIDp95NGN+?=
 =?us-ascii?Q?piKNfkpR4ID6ieQpgfO3qS63e9MW+4rh+bIDrxpAEetldqanSY7Kk4iJdUz5?=
 =?us-ascii?Q?QRT9P1seSnupa6V8bYpZulmWjLwYo1rhGa4gOxH18U1xFfPXGuYKIF1F7pgX?=
 =?us-ascii?Q?uQd9MVoXsDZ69z1954ep3imLoa7zTQcRW6DS8WKALUYcnRL+lINfhNR1DAAP?=
 =?us-ascii?Q?KiqmsElrd5BrHeuKxPX14g9kikJCZXdu9h0AatsUqmCVhPxidbeIjiIl2o1Z?=
 =?us-ascii?Q?OI9eNX6iY9UbZHOPsCEukScW2isNRZoWBlq6ZJ9xLS3vIvoCUNKuv/kxL7B4?=
 =?us-ascii?Q?bnUWmKu5vJDlLteljHAesRkQvA5YNVbtRCjLmwjcJvusYNQRbYZ7otyR6ugG?=
 =?us-ascii?Q?Bx4MdK8ZsxVAPh7VWQ4KZBKV62f5HOEAlccZwxCDXay1jAWYsFcUq/oncCL3?=
 =?us-ascii?Q?VTWoNl+VWMofFoMxyVwYq5UEjl7e6zJUb1SiSFSmhH6X7pK+hHWlXxFZAjSB?=
 =?us-ascii?Q?GPisPvBFfymRE7DAdyNYetu+V7azvPS2MSyPYRZmabowiuf7zYABe83KQ9tS?=
 =?us-ascii?Q?VQkwOW2uXtOc4Y4p3QOexrY9t5JPr/FpPOtFYiucE+BC2cDtUSqu6slu23Fr?=
 =?us-ascii?Q?op41DA8SPbp3Wtbjlk0TpljwaUvMiO4Mxbm061VfUe3Mr9S9n/aKhQsZmqZX?=
 =?us-ascii?Q?wW+bejtoAvqQK25Uo6dknxpasRnKgpLYFfJ/62j0C+BG+WcmTCN5jwZCGdrq?=
 =?us-ascii?Q?0kWB/djrdAAJ0MkoVYMobnEwAFHmfekPpTzkjnU4iujzF4lX0maRC5GKQLDJ?=
 =?us-ascii?Q?QUkRvNDmTEkhU0B9T25dLsN50Vc9CQLCTkAujharylTORJo1dSjPZuAFFPp1?=
 =?us-ascii?Q?qJL24ib/IFTTEEag9NVQNVMoETw60Kr3xnGlnWbMXtvLgQdQc/iFnBE/kb5v?=
 =?us-ascii?Q?+fvmVztzf68JS7jHhcpo8BemCxmosfyEc8qNEtDZ3ETIzEORmLnUY63Foge1?=
 =?us-ascii?Q?m4imxVSaeH49QWI9uTd2U8EWNKk5FSiRSLsH8vsSnVSBqxE/YN2jdgCCfYUp?=
 =?us-ascii?Q?fbjh9V5lbNSrSLArmS9GErIYQ4j+FeeFtG6DMYDyKTaCrqdQ5RIV?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32eba6d5-d471-4214-c87c-08de79b697c1
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7976.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 06:23:47.1112
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ev5qOvwFCBFaVAlfMuqu+jT74ULhG9DWgiG55d+lpp30pW8tQFKjH8+I9Y3HlxQgMCvCENLb+ZKlX3KPePrvKMyQ3ia304aq99ebl5ACGU12PE5BFtLG6jwFBC6A6QUL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9755

We have been used pcm_new()/pcm_free(), but switched to
pcm_construct()/pcm_destruct() to use extra parameters [1].

pcm_new()/free() had been removed [2], but each drivers are still
using such function naming. Let's name back to pcm_new()/pcm_free()
again.

[1] commit c64bfc906600 ("ASoC: soc-core: add new pcm_construct/pcmdestruct")
[2] commit e9067bb50278 ("ASoC: soc-component: remove snd_pcm_ops from component driver")

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/samsung/idma.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/samsung/idma.c b/sound/soc/samsung/idma.c
index beb7e09e9fac6..cb455ddce2532 100644
--- a/sound/soc/samsung/idma.c
+++ b/sound/soc/samsung/idma.c
@@ -399,8 +399,8 @@ static const struct snd_soc_component_driver asoc_idma_platform = {
 	.hw_params	= idma_hw_params,
 	.hw_free	= idma_hw_free,
 	.prepare	= idma_prepare,
-	.pcm_construct	= idma_new,
-	.pcm_destruct	= idma_free,
+	.pcm_new	= idma_new,
+	.pcm_free	= idma_free,
 };
 
 static int asoc_idma_platform_probe(struct platform_device *pdev)
-- 
2.43.0

