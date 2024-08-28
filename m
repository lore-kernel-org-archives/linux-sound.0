Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010041.outbound.protection.outlook.com [52.101.229.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8D6273501
	for <linux-sound@vger.kernel.org>; Wed, 28 Aug 2024 04:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724819791; cv=fail; b=qkaES8BzwvgZMmxFi/f07WT0wHxup8LXDb8YNf9ZuLUkVdrqAUOYS6G/+c9SWFCHQaBWFIU/NvLpqsavMiJqoisOUpTfwf0sr9JvkyqNWs+J0xWm4LgQxpVVe83pzkFIIFiD9lYUpeC3xHEG4qC/cXwYCMizmUbbm5r8AmxfQyE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724819791; c=relaxed/simple;
	bh=CE3w7E5EgQgmY2CcYEBxjs7WFJSWmyRAPnWjW6Ga5GM=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=S5CHi/OqDfzhjvt7Wm/2nL5ySCG0Y54zu3zioDgv3JAGLxS/JCIvvbkhEnWAxgBEs5H2T3YNZpcBgkTcb1MJy+nbWZHkfWmSvf6bCab8yE7EBeupwZpLKIQRg48soGzrqY63s9yoRgUSI29J9jZoAlkDZjIx2T958xwphhk2FRw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=DRab/5Ms; arc=fail smtp.client-ip=52.101.229.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="DRab/5Ms"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ASZul9g8shO4JUePFv+3NtmypXEanHW95mr5xfHlKw0uCn3xEoKqTD4P4K26uKOeyvwex0FKV4YHByR5dkwXSIyex9rsclDT6eh+yVQmGsYyKMsQrVnZBgO6mhR/Diuq36E5VDiD3gwUjrISBPiOlQeCgsppQORsOy8GAT4TvAbaeX9Pqi//ve5a3Sd+b4HjMNHELsHonkgoQFk8KhsIpWHtTZhdg+EdEZJs/cN1GGPtx2e4GipNDd43Ybzwu35PRjkQqPRxmmpz83TkBzEUQyOKX59KJcbsSufS0C4bfEIQx3E0J2YFVa3gJsAdukqlhSr1VycqIVD+OrMbJaDf7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KPz1n4KN5aYVOCYmvx3hinNGymOAAEUsDfV/HxHPzU8=;
 b=SAw2hBLvWx0PRNLP+dQwbuYZX3WY1Mkuclm1kvSkHzhpUAFcTr7G0E01s6IE0sGokfG5i7iPUERKZh6PCQEorW2i4zo2mAdKOUi2Bfw5oYGCSupkXdmIV81hqwTJuDd9FCm+PMeJ6PbUYZWCcD+YP8hSbY608dYRfKCiwz861lrCPYb2OoPRhrr2L8DaTn+vLsMz8FjJkVGoiTDbU3zlm/aG9DMrc7s7MxR2eYuLo6lVODM/XkOWI8IEBJ/V3meFuRLekqX5DmgTs9L28mtB1L+lDuTuZ2naROJjAS7oGbVcMHWSV3rtjJWKyYr47vhYLY2HZBZh6VzBAaYso5A7fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KPz1n4KN5aYVOCYmvx3hinNGymOAAEUsDfV/HxHPzU8=;
 b=DRab/5Ms0T4z98ECxdnkllTg2DK9FnBeZrvQw4PjWY2wkAcpZKYr0wilVmC8fNWZlYOOv9Dh0smHln/y8CRos6aStU8WDnmPFTTF5TTxMHuwm/btNfikq3waCWBiLj+zwTLze7+TPa+6Mxg57loiPcSBttWtCuyoySEUAyvdLk4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSCPR01MB12816.jpnprd01.prod.outlook.com
 (2603:1096:604:33b::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.27; Wed, 28 Aug
 2024 04:36:22 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7897.027; Wed, 28 Aug 2024
 04:36:16 +0000
Message-ID: <87cylt2ria.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Zhang Zekun <zhangzekun11@huawei.com>
Cc: <lgirdwood@gmail.com>,
	<broonie@kernel.org>,
	<perex@perex.cz>,
	<tiwai@suse.com>,
	<linux-sound@vger.kernel.org>
Subject: Re: [PATCH v2 0/2] Some clean up with helper fucntion
In-Reply-To: <20240827070650.11424-1-zhangzekun11@huawei.com>
References: <20240827070650.11424-1-zhangzekun11@huawei.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 28 Aug 2024 04:36:15 +0000
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
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSCPR01MB12816:EE_
X-MS-Office365-Filtering-Correlation-Id: 13e43fe6-c55f-48e5-682a-08dcc71af41b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mFRH/vTTqpfwN186HbFXZZcibtf3AeB9Cw+JNY6t1HHwteiVa6D6oJ0JB/2/?=
 =?us-ascii?Q?lYXacxIOHOftqQdmQLtDJ2DHgA+MDOu2uC/K7hwr4l2U3S8M6wiqjSB8ruij?=
 =?us-ascii?Q?IuTiMMmZgE9Xs1O4AJTmZ9EkDKpQIqO283CzVc6SnLNSvdW3aMmuJEPHE7xV?=
 =?us-ascii?Q?GpcUNSQkPMDj2mbCaSVZFPRg1ZJY3s8od/gMFxVT0iDPhuNyF6mhpGgdMacK?=
 =?us-ascii?Q?Fbu6dOF9vl1WDDES5FkqLqjH5ka4X7BgK31RswTGgNI8AtmIYNohxt6G/QJ2?=
 =?us-ascii?Q?XphXM4vpfVICkGemX1fHIkqs/u2LGDYUSoB/KdCvHk2uOibatU2/7cjidHD4?=
 =?us-ascii?Q?2csjz6me3YyngJO99qIYdYKtMXspoX8Y6OaZ37MwEHzzGWh+1k9+1cR8JCHv?=
 =?us-ascii?Q?QRTpnk4ITf1PRMZDQyEuzaQfU75rI3oZN6NU0ZwyGmd5ka+fL1K24TE48MIB?=
 =?us-ascii?Q?L3wYCaMVaEX9MfFSxOrv890P0oOjbS0oPUgsog1vFmtxgJc2XUh8UTjGQkLY?=
 =?us-ascii?Q?qLgWgSVQ96eaAcU8GQOJBAGGOG0Yw1nAhyEV/Lgcf1AjtN4BAcPPX47vgu9f?=
 =?us-ascii?Q?GwPypOaCMEsBJyvOitSQtb4KI8cq2YFVWl173czL83htYzzBlfIHPm01TJ7q?=
 =?us-ascii?Q?SM3AZdwAbHD1NTdotBey5g/NrgOvdQp3BUkwhP8SxghgMgjeRR/RYQZad7UR?=
 =?us-ascii?Q?m9UPc8EHeOT1a4sMIlYocnzY5oFzEDTiTZf1N3UsgmsH89NhOMnsNWYx3mDS?=
 =?us-ascii?Q?A1eO3FooAJVU+b4/KH4QDbb/fzTfD3wmrSuxUMSrivINd1QWyBHtDF5PZu8S?=
 =?us-ascii?Q?HROSGHaqSO7ohhch9ipIq3m+E2tp/aXAfjc8EMZm2EIjXIB941Vd6mr6fSe5?=
 =?us-ascii?Q?OFXdcI4gASjszv/ZnUv1ZRzOwtnWnxffYyeOC4h6bo7ILMa+gYVaEjypYj2V?=
 =?us-ascii?Q?SuAo2EBU6gq00ZgnahBLR/D6ohKgWgzMCFNvHP7N4colTjHN1rl1izAp4BPA?=
 =?us-ascii?Q?VEF+jDdqufAPkLsC9pJm+6XCvpVPMHyOEwaqRQUCGEHbvYIhpnubCbI5/1Yj?=
 =?us-ascii?Q?fb5OBDxhgIqu4JbxzFaXY2tdcnB0LSBppIVIHB3rT9Huf9fFiL8gxIY68b4c?=
 =?us-ascii?Q?JyWN0TAiCQAx1VQQQ/xunbhsd9hMULuoZuDoavMHPUzW9mMY/Zd2yNst7apD?=
 =?us-ascii?Q?tRrnz75kcIJKDD9sJd8BX3rmW9u8vT5bfqf+vkh0DkN39M+PYUf71+jCPBC/?=
 =?us-ascii?Q?eu3bWYchj8GmbAcJOZR34fTjrSoprYTuWwoLr6SygQ1FrqnZ+nbtHKejwhmc?=
 =?us-ascii?Q?3+vcq/FPSAm7ne/Ide+tXMtYurwnFDrDbLKCsvP4I9HwKEL83HHAXB0YvBZT?=
 =?us-ascii?Q?ieXNS1y/wGYM5egfNW7bq3P5bsE8qjFlx6T827md6jHMMtjTgA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?q3dDdwLi0kUbm6RWgs6d2W3Sx6cC82TJMjbVB/mGjStjIOlr/5/+D5Hd1qVl?=
 =?us-ascii?Q?8jbCuKHwScVrJGx0+8sOIFMo5SUkGoIlhV72dj4gdLGa7iPTwlk0GF0DSxBr?=
 =?us-ascii?Q?Tf49ErIbGSMIgL/3NHNvnlNUMNJ2SWV4fUgX9pvzptiRJGn54kw/emjXKfhg?=
 =?us-ascii?Q?g8OPrN/JwOQAxe8ig8U85QNVYSzwjIpEjrXMKP48ZAk2g4X6R82GTSeJ0tSr?=
 =?us-ascii?Q?NX7U3dS47V4FUwGdGwRwkLnH0CQ1YRu7g0d23QkKruj3hZvtJ4Ng63h59DMq?=
 =?us-ascii?Q?95z7GPW2b2aghefysCOjRgxNjH9B01xZKpuFT9WoHP7aygAELRnAg+VdxZAq?=
 =?us-ascii?Q?JattqJhu1upoQtSq5wYqxuT+Vnq21xMBqiRhA33QzIpN2yaPsGGWv7umhLGK?=
 =?us-ascii?Q?bJ6i6h78DNQcdcPNzDy6t5dgEHyk+f8cE+QZZQtwPMpEvIflKuv1DRlXaQWL?=
 =?us-ascii?Q?aaZ+a5cG7Hu7zC7vS43cq97+mnXZFsHGfUWXi31lewxQkQPNZNq7gwfDru7b?=
 =?us-ascii?Q?LqFUWrtlQQs1QLUOgld/mlQZthoR4Dqxn3m+UrDsgfxHMsFWfvgcU/K/GSUa?=
 =?us-ascii?Q?0faGdzWCAk0f1tYDuu8Uj5nfgDThBz7SEL5EJoO74HiLwum87E5ffLPCdO5/?=
 =?us-ascii?Q?G33JcgPgMKBqwBLScuJfFTY2qjOw4/AmxchnEZCTQfN+8EW/Uk9a7NPtkZMm?=
 =?us-ascii?Q?9zAZg7BNuyaNeaL5ujpzKlk01Io7dYrO6I4bExAHJpf995E/hCINIyPqs5J6?=
 =?us-ascii?Q?6ilWM2Yi9pTh2zDiUDMJSM//mAKIlo8cr9kqbL5rzUQ5K9LSzvRfnfdV9Zns?=
 =?us-ascii?Q?4yLZKHZG4FcJZNTI/oh3HfinnIxjaljqhZXFeSAO0K3Wi/Mm8NuUIHrTuYSE?=
 =?us-ascii?Q?j/l9iQnC0V5WBBPWsT5b/3tMHI9TIGzEcY2CwHyppL7ZHusTUEBSxzhYarc8?=
 =?us-ascii?Q?X8vLqB7nneTyt1rZsr/sBaxJGgIE8eb7mMUsJBV2hJUa1bXaqXPt8fpGrmBZ?=
 =?us-ascii?Q?7WFN8mmadRErlJtSegD1PMUxL5pcNeoFRQl9RSX7AzWUGZm358VETdSKjxWk?=
 =?us-ascii?Q?rhMKMvzJfjlP3axwpUgwixWDW444XNu0AaifcHJKvpXLC2oWvMbC1bs2Sahz?=
 =?us-ascii?Q?jh23kcWWZN15p/WXbU+Fsxzt92L4ADZoq2U0Mcac9rH4gh4MwoqjRceaZ0Ek?=
 =?us-ascii?Q?L2kcj1SOEVnBr3e1Xey6kNDIFxdSQRPV7DIn0WzC4e1Fb5MIdikzvnsT4pR/?=
 =?us-ascii?Q?OWOTvwAc9wDqspoadtEDfDM/D7P7DTMY0pMsSYdYyGWOY/a7kd3i0H/+ylKf?=
 =?us-ascii?Q?qDD9U6+22OEr/9e5U6HeDeYfVHyxlYIi80SVRBI4noVyKcO03BoWEI7c3aLr?=
 =?us-ascii?Q?8mTnjhgZCkcG5swF30CpkbvwpN7WxzqYVqJ61GmsRJgWNaQjKZNPXk7QSKC9?=
 =?us-ascii?Q?tcWWwvjjMKlxNA+Ibju7pW3Ap1RpOFCbpfemD93VUC060feQ/cKkGcmx+T1S?=
 =?us-ascii?Q?EVaQvAd1jx9NnWlxphuMOPGaL99mXIj+9BvWNyHtq7DBGvXc+KbQUE0RcU/C?=
 =?us-ascii?Q?Ra/mkjcdw9qHMzyCm/bCmhWzxop+cghxeIEn/MCsgzzyiqQZpmOFneHMll7g?=
 =?us-ascii?Q?x0QLiEiLNSv+rn6bhnTLilU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13e43fe6-c55f-48e5-682a-08dcc71af41b
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2024 04:36:16.0509
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W/QTU3uTZpz4yU7AMTTbctHuST1shei4iNycJJLI4+DR2RiwC5vYofkcPuF30u68gCB4lvvMFlHMAea/tPTDWtJlDf9xNG1wDvgHUmp1wbtxFkUIrj6GRJWdJQAnVtcw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB12816


Hi Mark, Zhang

> There are some helper functions which can be used to simplify the code.
> So, let's use these functions to make code more simple.
> 
> v2: Fix a code logic broken problem and add the comment back.
> 
> Zhang Zekun (2):
>   ASoC: audio-graph-card: Use for_each_child_of_node_scoped() to
>     simplify code
>   ASoC: audio-graph-card2: Use helper function of_get_child_count()

Reviewed-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

But I think this patch-set will conflict with my posting Of-Graph patch-set
if Mark apply this patch-set, and Rob (?) apply my patch-set.

	add of_graph_get_next_port/port_endpoint()
	https://lore.kernel.org/r/87cylwqa12.wl-kuninori.morimoto.gx@renesas.com

Thank you for your help !!

Best regards
---
Kuninori Morimoto
