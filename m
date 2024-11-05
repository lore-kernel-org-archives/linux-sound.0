Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011067.outbound.protection.outlook.com [40.107.74.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABFA1179BD
	for <linux-sound@vger.kernel.org>; Tue,  5 Nov 2024 01:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730768408; cv=fail; b=S+VDNlc9fenNiveu6ThmdxVADf1gxD3XgFGb//HzCnV8QhZX3vkTzC7ZNZzjKb0T0MbyuDwjxs2PrWe/bt5qTmMIUUcz9m7b2H7sihzYjLrnKXye7TofKz/RhRKKTMzRqkT2Zr+EbjsGMZObCEjl7hEmgxa4VvU1XxcWCVycS3E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730768408; c=relaxed/simple;
	bh=UzzCe+R3c/lXeHtV7Z938OnhEn32bR1qIH8uhxKPwGU=;
	h=Message-ID:From:Subject:To:Cc:Content-Type:Date:MIME-Version; b=T7EHqjHhtfG4zj/AhbnFBNV7GUxMP3G6O4um7jzP+E8k79A2UMhiMoUVYnKAN7omZZbW+p3r+JJm4dG7Ry1feKAYeXPdTDBKaqYu3IMWFPvjAozzcYwOn4Ns6BJoi/cWS74ytF3IfqLGJBEBVPxUadM9idw/uwpnszW6uR5i3ZM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=hmhXW3Is; arc=fail smtp.client-ip=40.107.74.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="hmhXW3Is"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WagUh8BKIvJEmNwV3ATpglBI3QHjRP8uK/JNHMOCXd0e/a3WK87PZVbd2dIEYVeX1GyML3uXWI0D4rP5qNUge3YD9BUzfrJK3E+T2Ixt2CAhHiUZFwaa6cxT0pooXQhqBuO0CTLJHPIy22X1tQrb4ir50bz79buLWAYx4LRPqcNcnX9hgITOi31jX2RtGh8zyJe5Xg7N4kBSV14z3OQQxlem+d3sSkDlMKRpPwBOxNcgD6AYE4FBsAlRObrJ6zPXmfUDveesvsus1RLSZHw6uSmSdbgdxB6/chth1C1ftO2t69bn8QBgDnwKetGwn8s/68a7cWyhwNxrTdB29BZgZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AcTXS4/JdUj2SRY2NDRZCUDF01XVYZVD3d8kMsUFoFQ=;
 b=A+W8N1SUzP64NxwAMZimpzRApvzAZooLQ8jIpvmV7ceLNNqGn+JPyKOT0HDAX/+Gnb+ypA7d2HhBBUWu5Lyss6PdLsUWrcdCH/iB2IOP69u1qpW2MNlY7jTNQCbzJCIJRVfdFkKsCigqaPFFvd39q/xPkRq6l+BonK1c0PfYcJ2LCcgcakBCdO9L5hRG7HJk5dwXpQNqu/vh4zML+YkFFQAfqhE4nPNSKYaH5h9mjDko6okzFoUMZqhmfMhB/KpBgI5wLbqX8tLrHG2hYszwxgqVQcnAEjQ9PZ+f6TsdyL0Ua80qycTpY2pbVIKpZELVvgSvfQ3vf/XkGZUGg8qtWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AcTXS4/JdUj2SRY2NDRZCUDF01XVYZVD3d8kMsUFoFQ=;
 b=hmhXW3IsoxI7mSPwagDJl/ZaUljHoDKz3eH4P59zp4AEtr+wuaoJZQPw4yIrZADY0k1oBSgvOW4sbkBkTOua8z9YvCfyKkQznECuSuMpetp7RTNDVEJGXd+MlHP9ADmorvJo1WwyHof2pcLz8OO5SFJqA7tFuLITM7GyzrBOJBY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB8126.jpnprd01.prod.outlook.com
 (2603:1096:400:100::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.31; Tue, 5 Nov
 2024 01:00:00 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%6]) with mapi id 15.20.8114.031; Tue, 5 Nov 2024
 01:00:00 +0000
Message-ID: <87ikt2a41c.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2] MAINTAINERS: Generic Sound Card section
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 5 Nov 2024 01:00:00 +0000
X-ClientProxiedBy: TYAPR01CA0085.jpnprd01.prod.outlook.com
 (2603:1096:404:2c::25) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB8126:EE_
X-MS-Office365-Filtering-Correlation-Id: df27e83f-d127-4248-1727-08dcfd352c7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?r4tDgJFI/jKTrwgBi4g2wRW7Z69fTFJnjQX5SdixmEs6cH7sBauo1QT+KrmK?=
 =?us-ascii?Q?MAFtQ4yqZ1bM+E9+M+tJjuX7Z85/2HiJYg+UdcmavtzK24Z246VP6VJIBxHa?=
 =?us-ascii?Q?nqqBRFbyqsV51dbxj/7NQe6Day3ggOkSntfXUW2KPZaXCwTBv89rzaZlm6U1?=
 =?us-ascii?Q?GRedfRkqz90fPmKFuZ9EPqpCPdfITLTrCz2lHm8gtpDq5HKPaqp7WD6/MK2y?=
 =?us-ascii?Q?pR6v9v6R/Ar5q0fWpGnkigo7AwNIYhP/Tg7tbKwrdK0/twpmaYdEeRI+FEQJ?=
 =?us-ascii?Q?Er93Te4cMxQ4eoFf/py40pcES+153rj+cGFUjOXsSNHNZRNh9wHtanDNWTxg?=
 =?us-ascii?Q?BUPHMX/Vb4aH1IbuSSwG9QeLxyiw+/jQ3Ui2A5YxPLXj/uX2cf3L4Lyo1/un?=
 =?us-ascii?Q?DAR3+NLaTRtHcfA+Jtwnwtp+nsrY5wTb9kwbgLFkFpy3Hld9+dmXHIiUvNN6?=
 =?us-ascii?Q?8axT/KFynngNo5nVC+9Y+Tp8K4411tncapfvFgsaGs4xESIELVRZJL1uO1Ct?=
 =?us-ascii?Q?TdO8uBnl0lWq6oiNzM1Aff1gQFIMatgVMcaXwJXm/FdD38AoDXGnQvIFGBya?=
 =?us-ascii?Q?GbE3rA67HLix8b3CUgzWkajwavXXi9WrVMlAIoL5XuQWfRNOY1OZQ6rIsM3l?=
 =?us-ascii?Q?sBi333yq/NYSCx2flbnKJ2Qui4bZ59d6LJpgp1vmbTK7FmhzLmT4MMvW6CLb?=
 =?us-ascii?Q?HAIJEPKfeNJwDHbbs1oIiCvbi0rtrjK/ipCaWXf3SYlruq9ZP7cfE5HLx9dG?=
 =?us-ascii?Q?nu6Pc5/SRFTivHWHpfFP82aW8viK7F9cVb/NGl3GOuRJ2i8Ji2Qdzmx6bZf5?=
 =?us-ascii?Q?KxrVgIorK7wI/Uy6/LC1imK+o84tv4pDS4lWRdS4NQKPrzOlxaA6OT2aCBgI?=
 =?us-ascii?Q?2KGTKn1c6Z5dqvThuUlt4WqK6ChI8Ip0JTCOC40FVPiCkFcdxVEDfIF1MX2O?=
 =?us-ascii?Q?GHncssnfW8AQuV/72t/0N3ckFvxtgMLFhMP7ADLmKeJqWmF+46GEzHEIQY5s?=
 =?us-ascii?Q?eXYNDLayJ0u/LAsvIiNn2hW5f/ldfZkWCCxejK32xz7BKp4GwLfh+1FDmDP0?=
 =?us-ascii?Q?r+5bJSQVVp/LgOXr4OXpIac4b5dD47rxk0XjOqDihuhvQjDGeVk9VM9e+xIb?=
 =?us-ascii?Q?iU9RNZ/vF8zHy81W2r52d4YzNxOlZ5EOBNGveAvI6Xwc8B4bHqMrIHyXz+Js?=
 =?us-ascii?Q?yETRu/JkkgYUMITqVCQG8YkVesDtjTuO5KQmGK0MtGaFPLlzSh7Rno+IXHVq?=
 =?us-ascii?Q?GZRdO6pbFKWaZxzD/ZlrJqGmP03KIlSkXfqE3TAY3n39aHIus47F4U8tLgoG?=
 =?us-ascii?Q?pE+GQEX9nBfZ0vPDEj3l5icF?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2xLpvGGytxNFDOzLwNEj8Euynryz2bhGcUxnM5KQb95Ek+POv6YZU8zxY+3/?=
 =?us-ascii?Q?SaRC6yCS9AzWV7NQ01MTNC42EYYshTyETtvIuyA+ZmXOqmd73l493fKO8MDG?=
 =?us-ascii?Q?4J6035DKnKv+GG/ZM1Q89i6ZZpoNyEMMAjArCSuxcIpPza71QM/NopfieOZC?=
 =?us-ascii?Q?D7ApxCI0aLvOf4TKMtEhUxMRgrgn0hxpVMm8lAmrAVoXf6KbDYQJnKvuyDJr?=
 =?us-ascii?Q?wHR8Ob2VeM5d9elcgVyfH8MSdVwtRTvWkm/5RRGpMurSIJvLLU1kQzLgzIfL?=
 =?us-ascii?Q?ZtBqFgHq0lLgkVIA1tMqdbqP8dwQLY4Y0yIgl6OLS1gEasP/Qs7SyBLaSksz?=
 =?us-ascii?Q?vuAyyEAZu/MbJikK601w37zxtsZMItHUR170tN2EurFsHNJB3U1bZF/bsihf?=
 =?us-ascii?Q?ejkQtnAYOF4KljGyXA2Mc0LhOifznMfLFh3Q4QTZKMgewtcnoJJRwDK6maLC?=
 =?us-ascii?Q?kHmMLn+uCt+aHl2WBzzY951f4eTpMSfGwHHHJCa7GkYeVQZ2CT5VASaPOmyy?=
 =?us-ascii?Q?0GO6YEhxlnKTVHC+mNAK/CaHg9GxV/L4s0JGjZwnvFcbIit/PYDsCOylK6PK?=
 =?us-ascii?Q?qeehKl8iC0DLjIqtnC5lv96o8USJvMRxV3i8GzWiWg2Kp4UOwoGzaOYE8ZQh?=
 =?us-ascii?Q?MF6J2AGuBsPqoJYvZcmF+XTwy2CNiW+jXBs8Ya1gzZ9tWWLf7G3sc/1+7Ktv?=
 =?us-ascii?Q?UObCWpszEZdwF4UuQrB/TZOYWrsg+BR2KeijM3DfUNFl82NiJ9Jh+OglBR6j?=
 =?us-ascii?Q?T/HImu+jaUXuUtWK2mPW1a60keCvVEIcKQbm4L+rYCN5dI3YLzIfI5gMocDi?=
 =?us-ascii?Q?VTRP0Xk9Dv28Ui7fJLsKKGGeL0GT9lWGgW76PQ6FpHM+B9bpYm2/vGycRWRM?=
 =?us-ascii?Q?F4fvYnldI/R4QWLNB7sNxXFEtW/88HoYU7PnN05bihzEyDXxJKrr+kZ4i1tf?=
 =?us-ascii?Q?3/9MQUZO/w8Sg/u8ClN+AyFuS/wYtyKeRLK1wy0Ns3ZWQP+/7UQyxix54LcY?=
 =?us-ascii?Q?nA1xDIautu35Qyyl/VwNIU9vrx0SltFJ+09Y8VKGnW951hulCMr+yMIBVuro?=
 =?us-ascii?Q?V2e0PYbiOkg183/EB5z1z6BQ6EAv27MpC2tt7zFdrXnU4uCFs+zjd5EVPbdp?=
 =?us-ascii?Q?ZDyosg2bFSspCa2LN9ouKxPht0AX0WReW478Bh06GQHFdnzgCKMVZYpxOW4E?=
 =?us-ascii?Q?TGXMXdBnR4EEX1JiBTFuSlghoj559fLfGptMeZt8jPigX188xJsqLucssK2C?=
 =?us-ascii?Q?X4ttTMfc+11ckKbrKn9CzzD8l8bnB+BM4zVScbwc2Whb7nCRY6zPI+PmFeUW?=
 =?us-ascii?Q?5RYMmaR48r/PSDGdIpxtJQ1INNjHBfRYCxGJi/d4vZXerwiUM4V2xTS/CZzg?=
 =?us-ascii?Q?DW+kKiMRunoC0RpcdIAAcu6X0hk4Va8/K8Bamh/yS4jApUQsMeAJK3EvbEfH?=
 =?us-ascii?Q?0Z3SSC+HWuMH3G/yDgWxE53jj1JsDGKWdu6wuaeX1BWLhBRB/p04YNvKz6iU?=
 =?us-ascii?Q?W9g+V8xkKkYuK+VFtwIf9IXDfthabW+SLp6HEvLtJ644eZNVq4xOelWmOWMQ?=
 =?us-ascii?Q?SB5zx+KQ2EG6SruyBwYEunMVUaN3c7SJEvGJata7rdArfOSuTRjlOYUi5QKA?=
 =?us-ascii?Q?WJ5OB3MLrKxg6FAe3CqgWFE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df27e83f-d127-4248-1727-08dcfd352c7e
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2024 01:00:00.4070
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mrHwLChneRqm0LbhRmwEYZ3EdabglpLnl7QnCmtBhqgs1xSbpwI/wYJwe+H83FBPcdjTO5LIhnMAhOesQbQyxGURUiTmMUG4f/2v8K7JzrZCxE25zZhiI3QKC87VtcIu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8126

ALSA SoC Sound has Generic Sound Card (Simple-Card, Audio-Graph-Card,
Audio-Graph-Card2). Adds its Maintainer.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
v1 -> v2
	- 2 weeks past
	- rebase to latest asoc/for-6.13 branch

 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index a870d5798e811..418156bd42f10 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21720,6 +21720,15 @@ S:	Supported
 W:	https://github.com/thesofproject/linux/
 F:	sound/soc/sof/
 
+SOUND - GENERIC SOUND CARD (Simple-Audio-Card, Audio-Graph-Card)
+M:	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
+S:	Supported
+L:	linux-sound@vger.kernel.org
+F:	sound/soc/generic/
+F:	include/sound/simple_card*
+F:	Documentation/devicetree/bindings/sound/simple-card.yaml
+F:	Documentation/devicetree/bindings/sound/audio-graph*.yaml
+
 SOUNDWIRE SUBSYSTEM
 M:	Vinod Koul <vkoul@kernel.org>
 M:	Bard Liao <yung-chuan.liao@linux.intel.com>
-- 
2.43.0

