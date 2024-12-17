Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010051.outbound.protection.outlook.com [52.101.228.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A88EC335C0
	for <linux-sound@vger.kernel.org>; Tue, 17 Dec 2024 01:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734400097; cv=fail; b=gcJnGlVy5fZuRr8k9NWPI2vbJyUGu60lIjWbaHQFBKM0VEathKfgMPiIIoS9wvKPljPi37rdIyhBHX5JixLZLt5g41+O1cwf3XJ4vYXEHm3qBrXYSNtXdj/174as+zhkOHYRS5AOtmgjQ91BxyQlaWL+GiJfIYempspDQog9wJs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734400097; c=relaxed/simple;
	bh=BzV3yUlTEBxAQ+f7+qvWgyfPEZ3xmY/6t1YfBMGiYg4=;
	h=Message-ID:From:Subject:To:Cc:Content-Type:Date:MIME-Version; b=cMq0FVeSfGhSf5V2TImvUKV90ndx5Vkhae9VftEdEW1SWQrvk91WiTbJGiCKwKCvExQTni1H7D42l5CTCeJEq/Hf2g4Fyi14zPbZRvOLoy+GlMuOJnSHL9kaw19oKCQzQm1dpM+qMGnkMvtJ4iYnkmekywbAIqy5QHoj+FSSadE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=a+XKSCPM; arc=fail smtp.client-ip=52.101.228.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="a+XKSCPM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Og1GQGmSBzov/qxrnkgTrxQRKlOjxGBuwGkt/rCOuqyPRm83e7irALuMGmiTzUhpah/bsZtVU5V/WMHfdKqX+f5LFVWGDVhWZiP2do2spXNAgSNMExsXg5v5RKZpWZeqcDNW/qiouS5rYYj7DPDeXqjE6MCb0pc5e2bZqpC36pgrxJtHIiODEtH3brtTvoIKJGpNUayugekrZ4/X1QogdQiWGevqoiuEBmhwuy00zSnvA2WyKd4aJ+6Xq+byS/GhdL8MtRgm4YygKvVb15GgSQnB3Xuc/ayiMdVV67ltTQIeOKjkdju+Mhx7xJuykl+oqdsCFPJFFVToZTDvRgVNZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZcxJPyV4AfYmD9PBLyDxsFQAuysMJyanH3CLxrZSTZ8=;
 b=ZhFTGZLTypAaBcmBi23cDLQ+0+UTcta2RvumO9zY88tiJMO5cd82XXgZTTX5ZyUlDFHS5r5Llke19RsNERCORowUghNv0KDygNGH2innr3u8XcZ5nLpNYerBogrbq+jwzYi8bX942PZkmWgMvY/CW7VOuPPb9vxFpBErMFtHt+9r6SuEbsG1MFzcj+DBKt0dy2yN10CCgEERHyWYNKBZf5pdLzv1dDh1q0Fog3JyxbvYYsfzXRgRdwsquDeJU0McdIzgIj5a2HNiSaVzj16ztjqI9A9zoGCTjkXvu8viZ/IXHncJCRE90L6GiUktt1fTZugWe54Xq+bYfN0PHnQFiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZcxJPyV4AfYmD9PBLyDxsFQAuysMJyanH3CLxrZSTZ8=;
 b=a+XKSCPMzFOdV0XTN1+ODXc3AzxN/2Q+iE/vL6PiYEfNbDVZCkSev/MoV6e/6LgRAkN30JirgBrXwfU/hPsbdMU44J0HbyfzT2nXtszgXGOKFZXEoJR0brC/8W4PrzUKkfluljGeXVqKcBDadn3rFg0vasY6tQz5jV/m2sLpEoE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB9279.jpnprd01.prod.outlook.com
 (2603:1096:400:1a2::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.22; Tue, 17 Dec
 2024 01:48:11 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8251.015; Tue, 17 Dec 2024
 01:48:11 +0000
Message-ID: <8734innkpy.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 0/6] ASoC: extra format on each DAI
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, Stephen Gordon <gordoste@iinet.net.au>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 17 Dec 2024 01:48:11 +0000
X-ClientProxiedBy: TYCP286CA0083.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b3::11) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB9279:EE_
X-MS-Office365-Filtering-Correlation-Id: f8a4ea06-c14b-44f0-5eab-08dd1e3cdd21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tJXPRRwoJL3jHbOGkxzn1ISE2SepOzGZb3TuZpYq6q0C8vzTKG8cxR2WPqi/?=
 =?us-ascii?Q?xnr/k0X60kTGFOdFoHXxg48PmiM7HmCF5gRS+Lg/oQvv8CTWmmqLMHooGuAL?=
 =?us-ascii?Q?mcOscjtvU/EvVDe0z7IW4PxhLxfKiZ7ZARlvATvfITlCi4zsMn2LI1b46PUf?=
 =?us-ascii?Q?mNPBTmnZxbN7RgoMDT5K0WI2/DA/Cd86EH3FPLzlKMAWevQQq5PRpRUreMoP?=
 =?us-ascii?Q?2zNG0qK8YlPeftUfznzsJ2zzvMNZwp0bkHAyH1yAcyZFDxjpm3LU4K6KsXxA?=
 =?us-ascii?Q?vNJb1NpGxxpFmlbLUArS3B65ArN/RRIy1ARoUG3ztLK8yVmkNGByl9FrWmVC?=
 =?us-ascii?Q?udkXVAEjnm7f15rSr+Dol1K/wJhFx6MR8cAvZC4U7QITYFElNPrNyEEJFmSD?=
 =?us-ascii?Q?jLXSSWSwplry/Jl/NjgVa1YYvsG7Xf7wCoc2kyJs23Fj4ym9bgIytJMoqh+Y?=
 =?us-ascii?Q?/9X3S51qh5/gECGkPSYCk8oNt1q0tVM/StqVMq8k+xxxRmYzAYAbZ3pbjH6V?=
 =?us-ascii?Q?Mcwd5PVRYD3iQ4DCbSfAuYkrbhgYzm40Z67fPXw+RzWqarxz20AE3A3vt3QN?=
 =?us-ascii?Q?yuDsjZ4wUsZgYaoXC8bhwYaimwvGk208LJsPBTegJEkyx8vt8e2amk5wZ2CS?=
 =?us-ascii?Q?boQBG3LjymDwUD1JH62pKQyWwLVAcXQVdXjipj5K6I3g2nOkljj4OAGT+dCP?=
 =?us-ascii?Q?+5uKYe3nIb5GuEMPDg/FpHD5KxaaHgPRGkNj3i3OLQ+5pb3eNGDBt1Uxkqew?=
 =?us-ascii?Q?eDcq30oHhmk8+kjczlWHv7A7zypJ3FGZPm0cORLMYA6eLppNOzy07fNvv4LR?=
 =?us-ascii?Q?+B2aL4VyB7qziiQa49lfIcsq/pk1mHk1/zBu16494Td3ovLM/22nv76m9VTh?=
 =?us-ascii?Q?ilqAC144palsl4eYN/c8giRC3834Hjbi7Ti8+htdA1v9EEUKedc6OfT/3KEI?=
 =?us-ascii?Q?1W7cE1aTFm47ol/YQA1hQrjHqWGF2ULqI2urgbWicMJug/+NQjdmY50XvNu3?=
 =?us-ascii?Q?0bN9BcXxOFrCrSbhFDmade4u6hbuXIWShqbmQ7dm7Yu+o3KjF6m+rWYYag+v?=
 =?us-ascii?Q?21EmRQE4kdt1LJBa7rID2TeEUw2MuK/1lsPEaTkh3RkChfXGJLB6aCE2+ypq?=
 =?us-ascii?Q?CwiAVSwUwDiqHcdrfjt0TD5MvD7RWEGsmTgQOoV09omMArjACJPb1EQXkZkR?=
 =?us-ascii?Q?VU2zqZXAfXbHoSr4YdQkF4PmoZgWO2Vnl6irREFmPfDhD3DI/Vq8zNhyU06i?=
 =?us-ascii?Q?YYP5xLfWKGypQ77i+TxyTH69l6e6ed1hYmFLq2h8+pbitheUL2GvT5+SN6Vz?=
 =?us-ascii?Q?uh85fm6gE2HgkwoGQSzFrORHtIDdWW7JPszAO/yxsaBRClBMzCBayNlYVfZp?=
 =?us-ascii?Q?N96g2FMviozGPlOYHC8Vj1xDl6WbZxjzhocfFEzLxzhw11mJvo8hzbok4Sbb?=
 =?us-ascii?Q?xOavF7X2Sq/4CYftB4s6PgJctecgwSF+?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?oHViKMCorK7kvt+HBEdjrWFa5m/cSi216kh0ttlgWcjmWg94D2iVpqYPnOSo?=
 =?us-ascii?Q?b801115sllOmXvZrXWR7VHX6Y5ixMREqobCM/BOaYUHkIuPSHPH5lfv99RV+?=
 =?us-ascii?Q?R6McoqzfGvlN6d8KSkWsHQGEDV+1nSfvGyWjZCgxYuFBjsR/9jsMOAwPhj2i?=
 =?us-ascii?Q?Y4umu5/UPSkWP+G0MDYvGxJKTdThzzmsmm3QyDxPOPExdyPpuC4uAkfEtgke?=
 =?us-ascii?Q?sBJf/FaMUwujMHXHSxcNauvHUFfMCqGXcpKdcmBmD5v5nHfzLzeOWRQCbp9P?=
 =?us-ascii?Q?Z7YzoyKpfhTVwU8q+Ax0eJmHT/CTEG0B27t/lZMJkBBITEx3rzbIlUnjRJXN?=
 =?us-ascii?Q?ighbbUr8yDpCESc8rKkfc8X4A9VNF6UhLech1S6F38pMA62yorY9BfdPHmdw?=
 =?us-ascii?Q?8LYFym7Ot95aQMMDcDfy0FZGry/gVV+X+tuRJUbvPblhgYBe+1OMzoIzV8rO?=
 =?us-ascii?Q?uSeOKTvpaGwB3G0bShW5FpeS+e15pUA48xOQRvR4UZAYmX6TquqLupTYAtY3?=
 =?us-ascii?Q?YOCQjQJa0//JapTr4n/F6O4uU0owpoPsOJhGa+zqMqJ/8bDXx/Zub75IRt3G?=
 =?us-ascii?Q?qO+SqIgq+aNEfQaH/2CCmNAcr53EjhYW4qoBVe/ChBUfrmMZ5209/q+CYewv?=
 =?us-ascii?Q?0ml8ukHSlJ6S2wzwa86r0Nr8drZ/HfcZXoP7RI7f/Xw6ZEg0nFN5RgUY9DOj?=
 =?us-ascii?Q?hfQw/2oJi33dUcEW0QRjv8c0l6CAoK5Crfz9kCjZr4t8MJ0ALCKEnKKULWy4?=
 =?us-ascii?Q?YA399HqaA3PGsWFOIUXniNsIGkNxLwrr6UygoMJFykt7Jb7/J0gCW/d+kAJa?=
 =?us-ascii?Q?68dhCGm+/vFHbfykmOw5XDjsYaXZ2aN1Uk+R6M/bmlHHBeiouAIpba0A+YzC?=
 =?us-ascii?Q?gWEs0ju+HLpS/KJHqxKPd+UrL6s4qt+aM44OKItrug1EtAAp/wZo2/K8qeLx?=
 =?us-ascii?Q?Gs/tY/E0ii3M66QNlr8u8ea0+Lfw2GI8vwv4zzInpVmJxy/N7Xhx0zTNL3Jz?=
 =?us-ascii?Q?Ia6dnBJBdwGK8f0lgDa7BhjSgu9de7fb/+cASiG7v+LqjnbOK9toxEzZReY8?=
 =?us-ascii?Q?HYdkuE1XXB3aABn/0KhQXYwgj2PAMv3bd4BGGfyG17yjuXAIy+m1QR0FFYP6?=
 =?us-ascii?Q?CpkdFwq1YHq9HW/MQfHvotzg3F7mE4CjCzM4m9b0Lg7fQ4TCQzZuCBLt4X2U?=
 =?us-ascii?Q?vH4TZ9dUpc2fJZeU2+oRNQYQbQ5kuACLn28wCH6h4YGgm2Yo0L8Nil7/e8mk?=
 =?us-ascii?Q?nGqd8WJAaCxR2cc3a5bQ0Cpusx98/Wh3Cxx6mjPVyQJu3Ye2sFH7tT3A2GgN?=
 =?us-ascii?Q?D5CEAEu5qKaP8iiWz2D3JWYoDAxR1Uw6fTqbgsOH8Wx0XXF5uxMqErS+jwqn?=
 =?us-ascii?Q?dTd249BYzrv0ZpjldSNKLjqv/tnRO7YJPXlh/6Rl1roQ64N8JMD4XyBX/0a3?=
 =?us-ascii?Q?3OQbgKljXXh3Bssgi4mFb5XLewtthdiUb/0gRf21JXSgCEoFrnsBAJDjjaMU?=
 =?us-ascii?Q?3pTrE5gWwZAKO9pzIRc1tr6gx4e0xbRvVRLPd2TImPPlvuF+WtRJ/K5wQgoi?=
 =?us-ascii?Q?ahSVM2DjEFV1s3OgEa630mZY0cik9KjiTm965hONWtteOdAGYoXuhor1lZws?=
 =?us-ascii?Q?dXrE9c5PYIiPOSx8Dg2pvbs=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8a4ea06-c14b-44f0-5eab-08dd1e3cdd21
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2024 01:48:11.4334
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dQyQq0GZf6brbEy9bs9qID+jXBPgv3S0Ohi4aOPmpvAz6Rd7xWoG5jrlkOUVPnppsZDzj2lvjgHgznjsgWBTh2VOGjmwBnC7lMB0OYuY6weh6vO35fZSWf9FbFjeOPgc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9279


Hi Mark
Cc Stephen

Current clock provider/consumer setting is set by dai_link->dai_fmt, and it
is Codec base on Sound Card driver (= SND_SOC_DAIFMT_CBx_CFx).

Current CPU/Codec drivers are already based on its own base
(= SND_SOC_DAIFMT_Bx_Fx). So, Codec clock setting uses dai_link->dai_fmt
as-is, and CPU side clock setting is created from Codec base setting by
flipping. Because of this, we can't set both CPU/Codec clock consumer for
example.

To solve this issue, this patch-set adds new ext_fmt on each DAI.
It can keep compatible with legacy style.

	1. SND_SOC_DAIFMT_FORMAT_MASK
	2. SND_SOC_DAIFMT_CLOCK
	3. SND_SOC_DAIFMT_INV
	4. SND_SOC_DAIFMT_CLOCK_PROVIDER

	dai_fmt : dai_link->dai_fmt = common settings
	ext_fmt : each DAI settings
    
Legacy
	dai_fmt  includes 1, 2, 3, 4
    
New style
	dai_fmt  includes 1, 2, 3
	ext_fmt  includes 4

Audio-Graph-Card2 will use this new style by this patch-set.
By this patch, its default behavior (= no "clock-master / frame-master"
settings on DT) will be changed, but no drivers are having it.

In case of no DAI has "clock-master / frame-master" settings on DT

Legacy
	CPU  : provider (because flipped from Codec)
	Codec: consumer

New style
	CPU  : consumer
	Codec: consumer

One note is that Simple-Card, Audio-Graph-Card don't implement
this new style to keep compatiblily.

2nd note is that [1/6] - [4/6] are normal patch-set,
[5/6] - [6/6] are [RFC]

Kuninori Morimoto (6):
  ASoC: audio-graph-card2: use __free(device_node) for device node
  ASoC: audio-graph-card: use __free(device_node) for device node
  ASoC: simple-card: use __free(device_node) for device node
  ASoC: soc-core: return 0 if np was NULL on snd_soc_daifmt_parse_clock_provider_raw()
  ASoC: soc-core: Enable to use extra format on each DAI
  ASoC: audio-graph-card2: Use extra format on each DAI

 include/sound/soc.h                   |  11 ++
 sound/soc/generic/audio-graph-card.c  |  48 ++---
 sound/soc/generic/audio-graph-card2.c | 248 ++++++++++----------------
 sound/soc/generic/simple-card.c       |  58 ++----
 sound/soc/soc-core.c                  |  30 +++-
 5 files changed, 167 insertions(+), 228 deletions(-)

-- 
2.43.0

