Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010032.outbound.protection.outlook.com [52.101.228.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F160118FDAE
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533643; cv=fail; b=rXmeqM/3r4R5w3BYpael02sQA0hDS6l4CuWhKi1vYOzRR7m9xeUDjYcXa4qU+/YcZIDCIMYmaZaCqH/PVumnmhL0wOuGrtMt9xA4P9yZJ9rodnbfBIa3gMa5MMh/li5apmvGfCUUzhhrJ5LzWKcEZSUl6sKuIZfIRYO0+8bxMpw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533643; c=relaxed/simple;
	bh=54u9AA7Rj7xMWPsOqzRaE7lKKRZ4YB6uW46053MtaXc=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=PkDZsL5Ccc9V2RJLW3OcdavSksuRoaUFa1AE/4vbDtEqCKEH/G0nddag+nWiH81kmOXan9AwUJebVWkybnZkiWze5HKFh19pdkVOHcLh38iz5hkfOiDAfEzhB4+HqeuyenDGT7Ra8b/S+J3JAB5TUQ1LwDYhhUhIzCJr7B5c0X4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=gIVjT8G8; arc=fail smtp.client-ip=52.101.228.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="gIVjT8G8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GOumvt+p5qFpKEiWpFOPT/cyoRFk75aztAaKQnxmJFGx52zs7jmKaDNxuzzX7aFOi7huMrPDcDRiHixEbG5vHZQRoUefMkcBKmK5UOoLdFk601VvHPClelsHBuPw2aSV7qRPUaZkP8FYhpXiafpyw8/TbB1IfpqLrtr/molCBQhaWNTOjSh/lIzcAXKxslx3z1eJLDgNWjXukY7c1mbeqEsSmTv4XpydeqVXmXvIjhhVo4lbFZOrkKviuKyYVFoocFw6zwp4eLcT1nwa9zKMSVrsBk1fQuXJFwxRs5PBKBVwKDRgZ/iCku3+HqUZRdBrPjjORefwI+QSmXp+kKXG8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BL0kgowDHu6lwwvfKMYMOMul/+sCdkaMGd19nHI3jd0=;
 b=W2uyeAR8ilBOZRqG/GybwGRW8BgRZtJ1Qjd3ut/pmgNDjMDMwF5+OrgBfvBuOdDLSpQAmdzGqmeoAkYUtGZMizuqfSAgQlxLcBsssk+0g/QjugWYbvtd9KhzmmwVM0IuDeyxenixqc+nKIqrEt27vZscfnIWbgiSjjayVL7rWRGMfVgFsNnh0FJWUVe0MWajhXpGHNnJEEsrDhlmbX5jSqX1pI780tCMXtItPTei7x4RV0lLBbLFzW2SI9ecU+Pip9HJmDzWaahGRhBwx1+BR890NLCVc6iVNHwiHS04IaSikXp8cw5HmAUDvsoZRDC3vEsKgrNkXcgCtHDEe5gJiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BL0kgowDHu6lwwvfKMYMOMul/+sCdkaMGd19nHI3jd0=;
 b=gIVjT8G8x0RsLh8prIFAp6l6ueFuRrzwuA1RUTbSiiUcUEteJnDqk+D03SX4DcK/dzcnjUnZ3knETkVrKZ20Kv73vmbakxxOBMMJvsRd5D0HFSDe3gSSCyTj5TrW65JqviXDR6m5GwiFwMG6VQzoHVqtov20U+mQnPPiWoHb8xw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB10414.jpnprd01.prod.outlook.com
 (2603:1096:400:246::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Wed, 26 Feb
 2025 01:33:59 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:33:59 +0000
Message-ID: <87zfi9cwvs.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 061/157] ASoC: codec: rt5670: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:33:59 +0000
X-ClientProxiedBy: TY2PR01CA0020.jpnprd01.prod.outlook.com
 (2603:1096:404:a::32) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB10414:EE_
X-MS-Office365-Filtering-Correlation-Id: fba5c266-1c14-4bca-c089-08dd5605a4d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?c8ddtk8yIcFFlE4upaP4cF6xYlhnn/hQjM1BuZUOpK1wFeNz9Af/JXKwkhX0?=
 =?us-ascii?Q?n2XY3RCGaL5tSFNzk7bWcW7TfYowIKob4EwvtWwO9zcFh+ueavygJLnJIbMC?=
 =?us-ascii?Q?vLOLLWerwXriW7X9e0hf+uI6gZ8HUu59WcQydH1o3dUT3Lu+eJWXVE+X4VJt?=
 =?us-ascii?Q?rxgKvBmxDVxoP6BLe9pBW1RyYSArOcpMw0LYWvb6JOxlXB1z/v+IWC0NjTL4?=
 =?us-ascii?Q?Oz/dhts3pM/jMoNGx99QhST1kkUbTfOticoxrULxKDBgYep01o8wCtavk+iz?=
 =?us-ascii?Q?05t6NPNrQdiujRyGiU4kC59eU5GI2rtY5Vjdk8gkkFOmLdtoGNbAZLwE0qFu?=
 =?us-ascii?Q?PQqgg78YkvNmSULHZWM+1IehBRFli8516OSWxDWKvW964icUpFzRybCnrkpn?=
 =?us-ascii?Q?iehxW0V6EgUDXQVg8Kn05daTxsxaoNB6j2i/eEH256KcbD1SJFRWrcX3fV3v?=
 =?us-ascii?Q?yAk7laEySMpk5nAbMX66H7p4qCIvtSv+dNTIQTn/JLW23kAdh3h8r7bZ/F6u?=
 =?us-ascii?Q?fcRv3M9x+f/MaS3oB2lwysQWa+OOlFVg/1Z9Gf6h2txlx2sWQMgq/QjRgPWz?=
 =?us-ascii?Q?/YntS7n2BOT9k5l8kX0P6tdoq7MZxl8Yw9f6Tq6QdBMvmh95CLbI0JcIxaRG?=
 =?us-ascii?Q?gFNNxpzBv2xlf3qc4SjW9LkCA/h+2YeJm3R9g6+9MrLJIvPeXU9Lgpn22syy?=
 =?us-ascii?Q?A7EYHtu0TdBcNFuQVFMa3iC2QMr+2moMTqHrGz8Yehl0ARG+qQFPHS3NUcdS?=
 =?us-ascii?Q?aQyKgLlMCT+9FzIgxOTc3P1NYPUdpMVizVuRuJwemoSxtwwgsr1RPXFxxity?=
 =?us-ascii?Q?DlJjluliM9yosX9xvY5DThTHD2gR0HDXvFWTpM/d6zHFnq2Fqr6w0HmyC8GN?=
 =?us-ascii?Q?qBHQ7ca9JLyVExZkolhT0wMhCJTJP01bmn7KyaOZAEsWOCNdboNTf/YRqnMP?=
 =?us-ascii?Q?VdiopfGK1DaYmQIPXbenrFerOPFYZI8t7kOqGsOW8/ibb/dpTrkJlX9Zb4H4?=
 =?us-ascii?Q?WIxbgQlSOArp5i/hHISkYnFjH22A5/Tl3I1QwoQ02Wuadj/DCjXXDSyFge0z?=
 =?us-ascii?Q?a2pk2jSbgo9PX03VME+nz5SNny2WHZf2jTDXzKmf8qzSCBxKUEy3h7PukZyc?=
 =?us-ascii?Q?wlZczT0uXWMMTjH68GFO6sAibxTgV5zG12bwG9zJD34QpZcHLRt+KC/X1FYw?=
 =?us-ascii?Q?Qa9Qv6SRZHa+MyH9K+xCgR68MQo2LD6A2RqHxM688H1yigAk3vSkvrN+3FMz?=
 =?us-ascii?Q?+nkfa1hpHAs2Bq7Qo2Qkjmspc6d64M9hpBuqIl6fbs9cxTxUD41wi4m4lS19?=
 =?us-ascii?Q?IzVg0ORNCimdaLDRBFfF9UBYEqg2qb/Wv+oooW9HmCfFyoHwEfvHYHZYbrwe?=
 =?us-ascii?Q?gzGkQjwy4iuJllAPIwoM+TQYFr3abdQI0BFIr8NPI4EyE50cDg0KugN3XbEq?=
 =?us-ascii?Q?CpNXXp3Mi3lrStNcirs4RY4R6ySurdof?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+pOEItWC/QMM0puKd+fRB2f4JlXqiJ2t/WoEzr/fay2WqMzkgTQD/hgmkjQC?=
 =?us-ascii?Q?chfoIUz9AJYrbBus2InSHRUb+vqHERHeyduGv+j2ZW5TM8Y3fnDy4c2L5Wae?=
 =?us-ascii?Q?A2OCxUSb5OwxD49Rb+SVyWPfyslw/cW30OQralkBVQnl8i+qo14TKMo83qW5?=
 =?us-ascii?Q?TeLV+DAtn2fA8Necw+kIE1fSx2fXrb9mhAcQKGAntte3No99VlsM9p1bTpi3?=
 =?us-ascii?Q?o/w+JX4FOl54tFUeHrrjSVHCOsG5O/YqcjGg5Mo2qnKTFlo+t0/nVcAzOo8D?=
 =?us-ascii?Q?oEMnD11zBgOWno9KzZaoTdzahe0m7aAQBenGubc0182wULHY0gKQZ4KajGjh?=
 =?us-ascii?Q?UemwVp5HFfY2661yB5DhKZHpcFUDJj3L3/gQ9EsfnzHVU8X5wAboxq/Tgs+Y?=
 =?us-ascii?Q?c2uB8NaCTl9A7/77bazcsICXvXdt5loBa/DD1lz7ATUrtaUKYuLsnJcQhXjy?=
 =?us-ascii?Q?QVk0kZT+oCXqvtsSjXoomQ75/yWmcfcp5CEim9v/gDs8CrS2SnDmg3hvRmsL?=
 =?us-ascii?Q?pHGEttiaQS+/JWBIThFTLAepCPdc4Hv+d6ihy/CBJRtsZDmhJFS2je96NSOP?=
 =?us-ascii?Q?jElmmIk4LW4myFeS+4OqsKiaRtW294042bHxDoPedv40pTGGAf+htseqoKmU?=
 =?us-ascii?Q?6JyO9orN7WsXavX+B5RO+mFairJbNpnPTnYbHomO4u7WtW8EdpUBfhg6iHzm?=
 =?us-ascii?Q?Q8tRdbg+97RdQlUk+xkb6tHaeKU3UXb0wpSTCDDELUqgJQKzBVkdgZNNj/Yo?=
 =?us-ascii?Q?9OGHKthcwa/dDcwjV5cmedVK5zvs8CAfzAiJGGpKQpS/XOOTW3cMl77e7v8r?=
 =?us-ascii?Q?SKb3VKZtmpbkKjsQjeOlEab9RM5TnoJ2LXss+gqQIYIyVZikhYCbXi48gp15?=
 =?us-ascii?Q?KB1eIN+3a9UHLLMxRt+K0YqxQytEZ0Gxx5yfx6Fd+cBXAiokdVZOpv7ukWO9?=
 =?us-ascii?Q?fORtmApepUCSGIP9Ik6LEchyqsbnMCDIQdcNQaXgVdXbtHblgfsgjyImAs+X?=
 =?us-ascii?Q?Wdft0tY0V5MV1BzufnxNWJWs2VxMZ32u4lgaYVt680QDwlRa0RQtfAZeT6AB?=
 =?us-ascii?Q?FqFr4OsRZk4ts/qGjfJYJ7qB1GzsBvwO6b+BFIoXS7Gp8DBmWYDvCnZv44Id?=
 =?us-ascii?Q?M/ON9AhCuAmfKX0smx7r9o7M0knKDEmNje73FmBfVBaSsXPOImxsVCRtad2n?=
 =?us-ascii?Q?5gVxziYfoKHqe33vt4tYB9+6bjB/rhDgA7LeLBTBmzWpdo8k7A7xDskaoqS4?=
 =?us-ascii?Q?5LPqzX9gQTd9NNddlh1MMk50svaLlXrJFKgV7YV3CW6sW3/WtB/qMED+WJO2?=
 =?us-ascii?Q?oaXX/7HXf/nUY/CEmwHKCYX8uucV0G+eCCDgTBOrfXaBg7EhAZJyOp9KmPOY?=
 =?us-ascii?Q?OVk3lFzJiHI8Ud2iGIPy5QXxgb0Bk0y10uGn/VDu/Wnug5czkiBT0jXTXdLK?=
 =?us-ascii?Q?LkHAMF+7SLpiehIYU8tM8u3MlcmiBC9se5pyVLsOxWF6OnTKKE49UoTw/XVY?=
 =?us-ascii?Q?DjtQEe0YfRmS6Q/IQtuP0gCGE4xCZKpaWNgMwtq5/FKpv829i0WWH582RDMI?=
 =?us-ascii?Q?HqsiqS09YNKh4yyv+cLAEusjNQGHdtTP2CEW9htg1UPSRo7Zk1qUA5aVoy8k?=
 =?us-ascii?Q?OK1pZz6HoWJjUDpSAN64hkY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fba5c266-1c14-4bca-c089-08dd5605a4d8
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:33:59.8128
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VaLxW6IbmvQlfHz+O+OoyfGE+tOP5kJitUGKeG5AujWRL8fuJSGvtb2pX/uaGNsKmkdJw/N9RrV5tdLx/uhb37IMs6fUy/NXUM5pAqgI/uJNN8FQ8a9lYhGhXfSiiCOP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10414

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/rt5670.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rt5670.c b/sound/soc/codecs/rt5670.c
index 30bf96c35b58..4129071f6b83 100644
--- a/sound/soc/codecs/rt5670.c
+++ b/sound/soc/codecs/rt5670.c
@@ -2439,10 +2439,10 @@ static int rt5670_set_dai_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	unsigned int reg_val = 0;
 
 	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM:
+	case SND_SOC_DAIFMT_CBP_CFP:
 		rt5670->master[dai->id] = 1;
 		break;
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_CBC_CFC:
 		reg_val |= RT5670_I2S_MS_S;
 		rt5670->master[dai->id] = 0;
 		break;
-- 
2.43.0

